#!/bin/bash
set -e

unset PYTHONPATH
export PYTHONNOUSERSITE=1

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

export PATH="$REPO_DIR/.venv/bin:$PATH"

exec "$REPO_DIR/.venv/bin/python" \
    -m ipykernel_launcher "$@"