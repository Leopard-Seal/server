#!/bin/bash

: <<'HEADER'
author: rxxuzi
license: MIT
version: 1.0
description: This script installs Node.js and NPM, and sets up the necessary environment variables.
HEADER

echo "hello!"

# 色の設定
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# JDKのバージョンとダウンロードURL
JDK_VERSION="21"
JDK_URL="https://download.oracle.com/java/$JDK_VERSION/latest/jdk-21_linux-x64_bin.tar.gz"


# インストール先のディレクトリ
INSTALL_DIR="$HOME/server/java/jdk-$JDK_VERSION"

# ダウンロードと展開
echo "Downloading JDK $JDK_VERSION..."
mkdir -p "$INSTALL_DIR"
wget -O jdk.tar.gz "$JDK_URL"
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to download JDK $JDK_VERSION. Exiting...${NC}"
    exit 1
fi

tar -zxvf jdk.tar.gz -C "$INSTALL_DIR" --strip-components=1
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to extract JDK $JDK_VERSION. Exiting...${NC}"
    exit 1
fi

# .bashrcへのPATHとJAVA_HOMEの設定
echo "Configuring .bashrc..."
echo "export JAVA_HOME=$INSTALL_DIR" >> "$HOME/.bashrc"
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> "$HOME/.bashrc"

# 確認メッセージ
echo -e "${GREEN}JDK $JDK_VERSION has been installed and configured successfully.${NC}"
echo -e "${GREEN}Please run 'source ~/.bashrc' to apply the changes.${NC}"
