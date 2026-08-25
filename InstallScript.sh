#!/data/data/com.termux/files/usr/bin/sh

set -e

echo "The installation is starting..."

echo "-----installing tar and termux-api. please wait....."

pkg install  tar termux-api -y > /dev/null 2>&1

echo "----tar successfully installed-----"

echo "-----installing filebrowser-----"


wget -q "https://github.com/filebrowser/filebrowser/releases/download/v2.63.23/linux-arm64-filebrowser.tar.gz" 

echo "Download Completed"

echo "Extracting filebrowser and changing permissions"

tar -xf linux-arm64-filebrowser.tar.gz 
chmod +x filebrowser > /dev/null 2>&1
rm linux-arm64-filebrowser.tar.gz > /dev/null 2>&1

echo "Installation complete. please follow the rest of the guide."
