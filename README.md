# oujin_bangou

## What is this?
A set of programs and parameter files necessary for the National Tax Administration Agency,  
a Japanese government agency, to download data of "corporate number" released on a monthly basis  
from the authority's site, apply processing, load it into the Oracle Database table is.

## What is the value of using this?
It is free from manual work using the browser for downloading. 
Just repeat the seven commands, you will be able to get the latest corporate number table on the DB.

## Tell me how to use.

### Do it before you start using this.
1. Prepare a Windows machine.
1. Install the Firefox browser on it.
1. Install Python 3 language processor.
  * pip install --upgrade pip
  * pip install selenium
1. Install Mozilla GeckoDriver.
1. Add place of python.exe and GeckoDriver into PATH variable.
1. git clone https://github.com/plumsix/houjin_bangou.git
1. cd /d path/to/houjin_bangou
1. nmake EXE="adaptor.exe" OBJS="adaptor.obj" CPPFLAGS="/nologo /EHsc /Zi /O2"
1. sqlplus user/passwd@alias @HOUJIN_BANGOU.sql

### Do it when you want to refresh.
1. python dl_houjin_code.py
1. adaptor *_all_????????.csv
1. rename 00_houjin_bangou.csv 00_houjin_bangou_zenken.csv
1. adaptor diff_????????.csv
1. rename 00_houjin_bangou.csv 00_houjin_bangou_sabun.csv
1. sqlldr USERID=user/passwd@alias control=HOUJIN_BANGOU DIRECT=Y ROWS=500000
1. sqlldr USERID=user/passwd@alias control=HOUJIN_BANGOU_VIEW DIRECT=N ROWS=1000 READSIZE=10000000 BINDSIZE=10000000

