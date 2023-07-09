#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

ldd --version

# Rust-g needs a special GLIBC version (dubious - dispute), which for some reason doesn't ship on GitHub Actions Ubuntu 22.04??? Let's get it in here.
mkdir -p ~/tmp/glibc
cd ~/tmp/glibc
wget --no-check-certificate "https://ftp.gnu.org/gnu/glibc/glibc-$GLIBC_VERSION.tar.gz"
tar -xvf glibc-$GLIBC_VERSION.tar.gz
cd glibc-$GLIBC_VERSION
mkdir build && cd build
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make&&make install

ldd --version

# Now, this is rust-g specific.
sudo dpkg --add-architecture i386
sudo apt-get update || true
sudo apt-get install libgcc-s1:i386 g++-multilib zlib1g-dev:i386 libssl-dev:i386
sudo apt install -o APT::Immediate-Configure=false libssl1.1:i386

mkdir -p ~/.byond/bin
wget -nv -O ~/.byond/bin/librust_g.so "https://github.com/tgstation/rust-g/releases/download/$RUST_G_VERSION/librust_g.so"
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
