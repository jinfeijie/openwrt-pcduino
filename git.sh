#! /usr/bin/bash
# 查看物理CPU个数
echo "查看物理CPU个数:"
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
echo "查看每个物理CPU中core的个数(即核数):"
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
echo "查看逻辑CPU的个数:"
cat /proc/cpuinfo| grep "processor"| wc -l

df -lh

free -mh


ls -la


sudo apt update -y 
sudo apt upgrade -y
sudo apt install -y build-essential clang flex g++ gawk gcc-multilib gettext git libncurses5-dev libssl-dev python3-distutils rsync unzip zlib1g-dev file wget

git submodule init
git submodule update
git submodule update --remote

./scripts/feeds update -a

./scripts/feeds install -a

make -j16 V=s

sudo rm -rf .git
sudo rm -rf .github
rm .gitignore
mv img.gitignore .gitignore

echo "OpenWrt for PcDuino3B" > README.md

git init
git remote add origin https://jinfeijie:$GH_TOKEN@github.com/jinfeijie/openwrt-pcduino.git
git config --global user.email "jfjjh@qq.com"
git config --global user.name "jinfeijie bot"
git add .
git commit -m "update"
git checkout -b istore
git push -f origin istore

echo "结束了老铁,666"
