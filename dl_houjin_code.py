# -*- coding: UTF-8 -*-

# ==========================================================================
# dl_houjin_code.py :
#   Download zipped archives of Houjin-Bangou from the site of authority 
#   and unzip it to extract CSV data.
# 
# Usage:
#   mkdir <arbitrary_path>
#   cd <arbitrary_path>
#   python dl_houjin_code.py
# 
# --------------------------------------------------------------------------
# Copyright (c) 2018 PLUMSIX Co.,Ltd.
# 
# Permission is hereby granted, free of charge, to any person obtaining 
# a copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation 
# the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom 
# the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included 
# in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# ==========================================================================

import os
import sys
import configparser
from glob import glob
from zipfile import ZipFile
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

# パラメータファイルを読み込む
conf_parser = configparser.ConfigParser()
conf_parser.read('conf.ini')

# 初期化パラメータ取得
url_zenken = conf_parser.get('url', 'zenken')
url_sabun = conf_parser.get('url', 'sabun')
xpath_moveto_zenken = conf_parser.get('xpath', 'moveto_zenken')
xpath_moveto_sabun = conf_parser.get('xpath', 'moveto_sabun')
xpath_select_zenken = conf_parser.get('xpath', 'select_zenken')
xpath_select_sabun = conf_parser.get('xpath', 'select_sabun')

# DL したファイルをカレント・ディレクトリへ自動保存
pwd = os.getcwd()
profile = webdriver.FirefoxProfile()
profile.set_preference("browser.download.folderList", 2)
profile.set_preference("browser.download.manager.showWhenStarting", False)
profile.set_preference("browser.download.dir", pwd)
profile.set_preference("browser.helperApps.neverAsk.saveToDisk", "application/octet-stream")

# ブラウザ起動
options = Options()
# options.add_argument('--headless') # GUI を非表示
browser = webdriver.Firefox(options=options, firefox_profile=profile)

# 国税庁　法人番号公表サイト

# ==========================================================
# サイトへ移動／全件データのダウンロード（各都道府県別）
# ==========================================================
browser.get(url_zenken)
print("Downloading HOUJIN_BANGOU zenken files...")
# ページ内移動／サイトからCSV形式・Unicodeファイルをダウンロード
browser.find_element_by_xpath(xpath_moveto_zenken).click()
# アンカー要素を順番にクリックして書庫ファイルを DL
anchors = browser.find_elements_by_xpath(xpath_select_zenken)
for anchor in anchors:
    anchor.click()

# ==========================================================
# サイトへ移動／差分データのダウンロード（全国）
# ==========================================================
browser.get(url_sabun)
print("Downloading HOUJIN_BANGOU sabun files...")
# ページ内移動／サイトからCSV形式・Unicodeファイルをダウンロード
browser.find_element_by_xpath(xpath_moveto_sabun).click()
# アンカー要素を順番にクリックして書庫ファイルを DL
anchors = browser.find_elements_by_xpath(xpath_select_sabun)
for anchor in anchors:
    try:
        anchor.click()
    except:
        break     # 非表示属性の tr 要素がもうない

# ブラウザを閉じる
browser.quit()

print("Unzipping HOUJIN_BANGOU files...")
# 書庫ファイルを解凍して CSV を得る
zip_dir  = "./"
ext_dir = "./"

zip_files = glob(os.path.join(zip_dir, '*.zip'))
for file in zip_files:
    with ZipFile(file) as zip:
        zip.extractall(ext_dir)

print("Erasing HOUJIN_BANGOU files...")
for file in zip_files:
    os.remove(file)

print("Erasing PGP signature files...")
# PGP 署名ファイルの削除
asc_files = glob(os.path.join(zip_dir, '*.asc'))
for file in asc_files:
    os.remove(file)

# ここまでくると CSV だけ残る
print("Completed successfully.")
