#!/bin/bash

# 定义目录和文件名称
SOURCE_DIR="lib"
TARGET_DIR="target_for_llm"
ARCHIVE_NAME="lib.tar.gz"

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
  echo "源目录 $SOURCE_DIR 不存在"
  exit 1
fi

# 创建目标目录如果不存在
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi

# 打包lib目录下的所有文件
tar -czvf "$ARCHIVE_NAME" "$SOURCE_DIR"

# 移动压缩包到目标目录
mv "$ARCHIVE_NAME" "$TARGET_DIR"

echo "打包完成并已移动到 $TARGET_DIR 目录下"