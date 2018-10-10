cd /d %UserProfile%\downloads\houjin_bangou

nmake EXE="adaptor.exe" OBJS="adaptor.obj" CPPFLAGS="/nologo /EHsc /Zi /O2"

C:\Users\developer\downloads\houjin_bangou>nmake EXE="adaptor.exe" OBJS="adaptor.obj" CPPFLAGS="/nologo /EHsc /Zi /O2"

Microsoft(R) Program Maintenance Utility Version 14.00.24210.0
Copyright (C) Microsoft Corporation.  All rights reserved.

        cl /nologo /EHsc /Zi /O2 /c adaptor.cpp
adaptor.cpp
        cl -Feadaptor.exe adaptor.obj setargv.obj /link /DEBUG /PDB:adaptor.pdb
Microsoft(R) C/C++ Optimizing Compiler Version 19.00.24215.1 for x86
Copyright (C) Microsoft Corporation.  All rights reserved.

Microsoft (R) Incremental Linker Version 14.00.24215.1
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:adaptor.exe
/DEBUG
/PDB:adaptor.pdb
adaptor.obj
setargv.obj

C:\Users\developer\downloads\houjin_bangou>adaptor *_all_2018*.csv
01_hokkaido_all_20180928.csv... 197400 lines.
02_aomori_all_20180928.csv... 34124 lines.
03_iwate_all_20180928.csv... 29990 lines.
04_miyagi_all_20180928.csv... 69864 lines.
05_akita_all_20180928.csv... 27377 lines.
06_yamagata_all_20180928.csv... 30312 lines.
07_fukushima_all_20180928.csv... 64909 lines.
08_ibaraki_all_20180928.csv... 79567 lines.
09_tochigi_all_20180928.csv... 65499 lines.
10_gunma_all_20180928.csv... 66273 lines.
11_saitama_all_20180928.csv... 215259 lines.
12_chiba_all_20180928.csv... 186821 lines.
13_tokyo_all_20180928.csv... 1023774 lines.
14_kanagawa_all_20180928.csv... 300179 lines.
15_niigata_all_20180928.csv... 67781 lines.
16_toyama_all_20180928.csv... 31677 lines.
17_ishikawa_all_20180928.csv... 38029 lines.
18_fukui_all_20180928.csv... 27147 lines.
19_yamanashi_all_20180928.csv... 30288 lines.
20_nagano_all_20180928.csv... 69905 lines.
21_gifu_all_20180928.csv... 62557 lines.
22_shizuoka_all_20180928.csv... 108619 lines.
23_aichi_all_20180928.csv... 230622 lines.
24_mie_all_20180928.csv... 47468 lines.
25_shiga_all_20180928.csv... 35748 lines.
26_kyoto_all_20180928.csv... 91879 lines.
27_osaka_all_20180928.csv... 373681 lines.
28_hyogo_all_20180928.csv... 165988 lines.
29_nara_all_20180928.csv... 33473 lines.
30_wakayama_all_20180928.csv... 26718 lines.
31_tottori_all_20180928.csv... 17533 lines.
32_shimane_all_20180928.csv... 20378 lines.
33_okayama_all_20180928.csv... 62868 lines.
34_hiroshima_all_20180928.csv... 96723 lines.
35_yamaguchi_all_20180928.csv... 37346 lines.
36_tokushima_all_20180928.csv... 27296 lines.
37_kagawa_all_20180928.csv... 34387 lines.
38_ehime_all_20180928.csv... 45984 lines.
39_kochi_all_20180928.csv... 22907 lines.
40_fukuoka_all_20180928.csv... 170037 lines.
41_saga_all_20180928.csv... 20970 lines.
42_nagasaki_all_20180928.csv... 36719 lines.
43_kumamoto_all_20180928.csv... 59571 lines.
44_oita_all_20180928.csv... 41147 lines.
45_miyazaki_all_20180928.csv... 33246 lines.
46_kagoshima_all_20180928.csv... 50279 lines.
47_okinawa_all_20180928.csv... 46977 lines.
99_kokugai_all_20180928.csv... 7079 lines.

Completed successfully. Total: 4664375 lines are comverted.
All conversion results have been consolidated into 00_houjin_bangou.csv

C:\Users\developer\downloads\houjin_bangou>dir 00_houjin_bangou.csv
 ドライブ C のボリューム ラベルがありません。
 ボリューム シリアル番号は 0CFD-95AA です

 C:\Users\developer\downloads\houjin_bangou のディレクトリ

2018/10/09  16:11     1,188,631,785 00_houjin_bangou.csv
               1 個のファイル       1,153,991,149 バイト
               0 個のディレクトリ  137,622,818,816 バイトの空き領域

rename 00_houjin_bangou.csv 00_houjin_bangou_zenken.csv

C:\Users\developer\downloads\houjin_bangou>adaptor diff_2018*.csv

rename 00_houjin_bangou.csv 00_houjin_bangou_sabun.csv

del diff_2018*.csv *_all_2018*.csv

sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU DIRECT=Y ROWS=500000

C:\Users\developer\downloads\houjin_bangou>sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU DIRECT=Y ROWS=500000

SQL*Loader: Release 11.2.0.2.0 - Production on 火 10月 9 16:11:48 2018

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

セーブ・データ・ポイントに達しました。 - 論理レコード件数500000
セーブ・データ・ポイントに達しました。 - 論理レコード件数1000000
セーブ・データ・ポイントに達しました。 - 論理レコード件数1500000
セーブ・データ・ポイントに達しました。 - 論理レコード件数2000000
セーブ・データ・ポイントに達しました。 - 論理レコード件数2500000
セーブ・データ・ポイントに達しました。 - 論理レコード件数3000000
セーブ・データ・ポイントに達しました。 - 論理レコード件数3500000
セーブ・データ・ポイントに達しました。 - 論理レコード件数4000000
セーブ・データ・ポイントに達しました。 - 論理レコード件数4500000

ロードは完了しました。 - 論理レコード件数4664375

sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU_VIEW DIRECT=N ROWS=1000 READSIZE=10000000 BINDSIZE=10000000

SQL*Loader: Release 11.2.0.2.0 - Production on 水 10月 10 11:45:40 2018

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

コミット・ポイントに達しました。 - 論理レコード件数1000
コミット・ポイントに達しました。 - 論理レコード件数2000
コミット・ポイントに達しました。 - 論理レコード件数3000
コミット・ポイントに達しました。 - 論理レコード件数4000
コミット・ポイントに達しました。 - 論理レコード件数5000
コミット・ポイントに達しました。 - 論理レコード件数6000
コミット・ポイントに達しました。 - 論理レコード件数7000
コミット・ポイントに達しました。 - 論理レコード件数8000
コミット・ポイントに達しました。 - 論理レコード件数9000
コミット・ポイントに達しました。 - 論理レコード件数10000
コミット・ポイントに達しました。 - 論理レコード件数11000
コミット・ポイントに達しました。 - 論理レコード件数12000
コミット・ポイントに達しました。 - 論理レコード件数13000
コミット・ポイントに達しました。 - 論理レコード件数14000
コミット・ポイントに達しました。 - 論理レコード件数15000
コミット・ポイントに達しました。 - 論理レコード件数16000
コミット・ポイントに達しました。 - 論理レコード件数17000
コミット・ポイントに達しました。 - 論理レコード件数18000
コミット・ポイントに達しました。 - 論理レコード件数19000
コミット・ポイントに達しました。 - 論理レコード件数20000
コミット・ポイントに達しました。 - 論理レコード件数21000
コミット・ポイントに達しました。 - 論理レコード件数22000
コミット・ポイントに達しました。 - 論理レコード件数23000
コミット・ポイントに達しました。 - 論理レコード件数24000
コミット・ポイントに達しました。 - 論理レコード件数24359

