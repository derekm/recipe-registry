#!/bin/bash
# Install b12x into the upstream vllm-openai image, which imports it for the
# b12x linear/MoE backends but does not ship it. Every dependency (torch,
# nvidia-cutlass-dsl 4.8.0, cuda-python, apache-tvm-ffi) is already in the
# pinned image, so --no-deps installs exactly one hash-checked wheel.
#
# `vllm download-kernels` from the model card is not needed: it would install
# flashinfer-jit-cache==0.7.0.post1+cu130, which the image already carries
# (including the sm121a split).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
python3 -m pip install --no-deps --require-hashes --disable-pip-version-check -r requirements.txt
python3 -c 'import b12x'
