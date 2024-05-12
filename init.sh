#!/bin/bash

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

go env -w GOPROXY=https://goproxy.io,direct
go env -w GO111MODULE=on