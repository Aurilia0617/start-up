#!/bin/bash

# 手动
# git clone https://github.com/Aurilia0617/PhoenixBuilder.git
# cd ./PhoenixBuilder
# git clone https://github.com/LNSSPsd/phoenixbuilder-depends.git

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

# 检查系统是否已经安装MongoDB
if ! command -v mongod >/dev/null 2>&1; then
  # 如果未安装，则安装MongoDB
  echo "Installing MongoDB..."
  sudo apt-get install gnupg
  curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor
  echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org
else
  # 如果已安装，则输出MongoDB版本信息
  echo "MongoDB is already installed. Version:"
  mongod --version
fi

echo "初始化完成"