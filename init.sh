#!/bin/bash

# Check readline is installed
if ! dpkg -s readline-common libreadline-dev >/dev/null 2>&1; then
  echo 'readline库未安装，尝试进行安装'
  sudo apt update
  sudo apt install -y readline-common libreadline-dev
else
  echo 'readline库已安装'
fi

# 检查系统是否已经安装Go语言环境
if ! command -v go >/dev/null 2>&1; then
  # 如果未安装，则安装Go语言环境
  echo "Installing Go..."
  sudo snap install go --classic
else
  # 如果已安装，则输出Go语言版本信息
  echo "Go is already installed. Version:"
  go version
fi