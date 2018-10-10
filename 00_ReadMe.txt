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
 �h���C�u C �̃{�����[�� ���x��������܂���B
 �{�����[�� �V���A���ԍ��� 0CFD-95AA �ł�

 C:\Users\developer\downloads\houjin_bangou �̃f�B���N�g��

2018/10/09  16:11     1,188,631,785 00_houjin_bangou.csv
               1 �̃t�@�C��       1,153,991,149 �o�C�g
               0 �̃f�B���N�g��  137,622,818,816 �o�C�g�̋󂫗̈�

rename 00_houjin_bangou.csv 00_houjin_bangou_zenken.csv

C:\Users\developer\downloads\houjin_bangou>adaptor diff_2018*.csv

rename 00_houjin_bangou.csv 00_houjin_bangou_sabun.csv

del diff_2018*.csv *_all_2018*.csv

sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU DIRECT=Y ROWS=500000

C:\Users\developer\downloads\houjin_bangou>sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU DIRECT=Y ROWS=500000

SQL*Loader: Release 11.2.0.2.0 - Production on �� 10�� 9 16:11:48 2018

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����500000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����1000000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����1500000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����2000000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����2500000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����3000000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����3500000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����4000000
�Z�[�u�E�f�[�^�E�|�C���g�ɒB���܂����B - �_�����R�[�h����4500000

���[�h�͊������܂����B - �_�����R�[�h����4664375

sqlldr USERID=HOUJIN/HOUJIN@sm201504-001h_mtu01 control=HOUJIN_BANGOU_VIEW DIRECT=N ROWS=1000 READSIZE=10000000 BINDSIZE=10000000

SQL*Loader: Release 11.2.0.2.0 - Production on �� 10�� 10 11:45:40 2018

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����1000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����2000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����3000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����4000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����5000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����6000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����7000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����8000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����9000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����10000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����11000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����12000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����13000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����14000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����15000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����16000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����17000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����18000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����19000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����20000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����21000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����22000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����23000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����24000
�R�~�b�g�E�|�C���g�ɒB���܂����B - �_�����R�[�h����24359

