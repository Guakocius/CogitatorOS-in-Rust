#!/usr/bin/env bash
cargo clean
cargo build --target target.json
if ! command -v bootimage >/dev/null 2>&1; then
  cargo install bootimage
fi
cargo bootimage
qemu-system-x86_64 -drive format=raw,file=target/target/debug/bootimage-cogitator_os.bin
