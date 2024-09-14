#!/bin/bash

# 检查是否提供了 commit message
if [ -z "$1" ]; then
  echo "请提供一个 commit message."
  exit 1
fi

# 添加所有更改
echo "正在添加更改..."
git add .

# 提交更改
echo "正在提交更改..."
git commit -m "$1"

# 推送到远程仓库
echo "正在推送到远程仓库..."
git push

# 使用 rsync 同步文件 (修改路径为你实际使用的)
echo "正在同步文件..."
rsync -avz -e "ssh -p 233" docs/ wordpress@207.148.26.133:/var/www/liuyandong.com/html/books/

# 完成
echo "操作完成！"

