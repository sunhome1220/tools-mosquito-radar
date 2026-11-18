#!/bin/sh
# 改版時執行：./bump.sh v1.4.0
# 會同時更新 index.html 裡的 VERSION 和 version.json，頁面開著的人就會看到「有新版本」按鈕。
set -e
[ -n "$1" ] || { echo "用法：./bump.sh v1.4.0"; exit 1; }
sed -i.bak "s/const VERSION = \"[^\"]*\";/const VERSION = \"$1\";/" index.html && rm -f index.html.bak
printf '{ "version": "%s" }\n' "$1" > version.json
echo "版本已改成 $1，記得 commit 並 push。"
