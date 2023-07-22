#!/bin/bash

cd /root/PhoenixBuilder
make clean
export GOPROXY=https://mirrors.aliyun.com/goproxy/
make

if [ -f "/root/PhoenixBuilder/build/phoenixbuilder" ]; then
  screen_name1=$"main"
  screen -S $screen_name1 -X quit
  screen -dmS $screen_name1
  screen -x -S $screen_name1 -p 0 -X stuff "cd /root/PhoenixBuilder"
  screen -x -S $screen_name1 -p 0 -X stuff $'\n'
  screen -x -S $screen_name1 -p 0 -X stuff "while true; do ./build/phoenixbuilder -c 19052532 --no-readline; sleep 1; done"
  screen -x -S $screen_name1 -p 0 -X stuff $'\n'
  # sleep 5
  # screen_name2=$"sub"
  # screen -S $screen_name2 -X quit
  # screen -dmS $screen_name2
  # screen -x -S $screen_name2 -p 0 -X stuff "cd /root/PhoenixBuilder"
  # screen -x -S $screen_name2 -p 0 -X stuff $'\n'
  # screen -x -S $screen_name2 -p 0 -X stuff "while true; do ./build/phoenixbuilder -c 24391107 -p 110111; sleep 20; done"
  # screen -x -S $screen_name2 -p 0 -X stuff $'\n'
  screen -r $screen_name1
else
  echo "ERROR: /root/PhoenixBuilder/build/phoenixbuilder not found."
  exit 1
fi
