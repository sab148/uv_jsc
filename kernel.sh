#!/bin/bash
set -e

unset PYTHONPATH
export PYTHONNOUSERSITE=1

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

exec "$REPO_DIR/.venv/bin/python" \
    -m ipykernel_launcher "$@"