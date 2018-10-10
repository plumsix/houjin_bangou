/*
==========================================================================
adapter.cpp : CSV format converter

Insert n digits row-length fields at the each row-head 
and add comma at the each row-tail.
Used to load a string data that contains the "LF".

Usage:
adaptor <src_file>...

How to build:
nmake EXE="adaptor.exe" OBJS="adaptor.obj" CPPFLAGS="/nologo /EHsc /Zi /O2"
--------------------------------------------------------------------------
Copyright (c) 2018 PLUMSIX Co.,Ltd.

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the "Software"), 
to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom 
the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
==========================================================================
*/

#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <algorithm>

#define OUTPUT_FILE_NAME "00_houjin_bangou.csv"
#define LENGTH_DIGIT      10  /* same as 'n' in the "VAR n" parameter option.  */
#define ENCLOSURE        '"'
#define LEN_BUF           8192
#define LF_LEN            2    // CR+LF

class cUnit
{
private:
	std::ifstream ifs; // a input stream for the original data.
	std::ofstream ofn; // a output stream for the converted data.
	int64_t iLines;
public:
	cUnit(const char *fn_src, const char* fn_dst)
		: ifs(fn_src)
		, ofn(fn_dst, std::ios_base::app)
		, iLines(0)
	{}
	void vConvert() 
	{
		// 0 is an enclosing character unnecessary data type,
		// 1 is a data type that requires an enclosing character.
		static int iEnc[] =
	    //0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
		{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
		static char *szFmt[2] =
			{ "%s"        // iEnc[0] ... number.
			, "\"%s\""    // iEnc[1] ... varchar2, char, date.
			};
		static char szSrc[LEN_BUF];  // a buffer for the original data.
		static char szDst[LEN_BUF];  // a buffer for the converted data.
		static char szData[LEN_BUF]; // The value clipped from CSV, the enclosing character has been removed.
		while ( ifs.getline(szSrc, sizeof(szSrc)) )
		{
			int32_t iCols = 0; // Current column position. Start from 0.
			const std::streamsize iLen = ifs.gcount();
			std::streamsize i = 0  // current index of szSrc
				          , o = 0; // current index of szDst
			szDst[0] = {0};
			while (i < iLen)
			{
				if (szSrc[i] == ENCLOSURE)
				{
					++i;
					std::streamsize bgn = i;
					while (szSrc[i] != ENCLOSURE) ++i;
					std::streamsize iData = i - bgn;
					::strncpy(szData, &szSrc[bgn], iData);
					szData[iData] = 0;
					++i;
				}
				else if (szSrc[i] != ',')
				{
					std::streamsize bgn = i;
					while (szSrc[i] && szSrc[i] != ',') ++i;
					std::streamsize iData = i - bgn;
					::strncpy(szData, &szSrc[bgn], iData);
					szData[iData] = 0;
				}
				else
				{
					// When commas are consecutive (column value is null).
					szData[0] = 0;
				}
				if (iCols) { szDst[o++] = ',';}
				o += sprintf(&szDst[o], szFmt[iEnc[iCols]], szData);
				++iCols;
				++i;
			}
			ofn << std::setw(LENGTH_DIGIT) << ::strlen(szDst) + LF_LEN << szDst << std::endl;
			++iLines;
		}
	}
	int64_t iGetNumLines() const
	{
		return iLines;
	}
};

int main(int argc, char** argv)
{
	if (argc < 2)
	{
		std::cout << "Usage:"
			<< std::endl
			<< "\tadaptor <src_file>..."
			<< std::endl
			<< "\tYou can use wildcard characters in part or all of src_file."
			<< std::endl;
		return 1;
	}

	int64_t iTotal = 0;
	std::for_each(
		&argv[1], &argv[argc]
		, [&](const char *fn)
		{
			static std::ofstream ofn(OUTPUT_FILE_NAME, std::ios_base::trunc);
			std::cout << fn << "... ";
			cUnit oUnit(fn, OUTPUT_FILE_NAME);
			oUnit.vConvert();
			std::cout << oUnit.iGetNumLines() << " lines." << std::endl;
			iTotal += oUnit.iGetNumLines();
		}
	);

	std::cout
		<< std::endl
		<< "Completed successfully. Total: " << iTotal << " lines are comverted."
		<< std::endl
		<< "All conversion results have been consolidated into "
		<< OUTPUT_FILE_NAME
		<< std::endl;

	return 0;
}
