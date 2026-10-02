#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=gcc-15 \
    -DCMAKE_CXX_COMPILER=g++-15 \
    -DCMAKE_CUDA_COMPILER=/usr/local/cuda/bin/nvcc \
    -DCMAKE_CUDA_HOST_COMPILER=g++-15 \
    -DGGML_CUDA=ON \
    -DGGML_CCACHE=ON \
    -DGGML_LTO=ON \
    -DCMAKE_INSTALL_PREFIX=/usr/local

cmake --build build -j "$(nproc)"
