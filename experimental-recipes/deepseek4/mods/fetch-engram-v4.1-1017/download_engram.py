#!/usr/bin/env python3
"""Fetch the two 1017 Engram shards used by the two-Spark EXL3 recipe."""

import os
from huggingface_hub import snapshot_download

snapshot_download(
    repo_id="deepseek-ai/DeepSeek-V4.1-Flash-1017",
    revision="1bae0e1088993b9b82de08f59de5be5a34e42170",
    allow_patterns=[
        "model-00047-of-00048.safetensors",
        "model-00048-of-00048.safetensors",
        "model.safetensors.index.json",
        "config.json",
    ],
    local_dir=os.environ["DSV41_ENGRAM_DIR"],
)
