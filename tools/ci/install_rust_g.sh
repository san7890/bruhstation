#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

sudo dpkg --add-architecture i386
sudo apt update || true
sudo apt install -o APT::Immediate-Configure=false libssl1.1:i386 libgcc-s1:i386

mkdir -p ~/.byond/bin
wget -nv -O ~/.byond/bin/librust_g.so "https://github.com/tgstation/rust-g/releases/download/$RUST_G_VERSION/librust_g.so"
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
