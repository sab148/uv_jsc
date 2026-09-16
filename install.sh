#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

KERNEL_NAME="${1:-uv-python312}"
KERNEL_DISPLAY_NAME="${2:-$KERNEL_NAME}"
KERNEL_DIR="$HOME/.local/share/jupyter/kernels/$KERNEL_NAME"

cd "$REPO_DIR"

echo "Creating/syncing uv environment..."
uv sync --frozen

echo "Making kernel launcher executable..."
chmod +x "$REPO_DIR/kernel.sh"

echo "Installing Jupyter kernelspec..."
mkdir -p "$KERNEL_DIR"

cat > "$KERNEL_DIR/kernel.json" <<EOF
{
  "argv": [
    "$REPO_DIR/kernel.sh",
    "-f",
    "{connection_file}"
  ],
  "display_name": "$KERNEL_DISPLAY_NAME",
  "language": "python"
}
EOF

echo
echo "Installation complete."
echo "Kernel name: $KERNEL_NAME"
echo "Display name: $KERNEL_DISPLAY_NAME"
echo
echo "Restart Jupyter-JSC and select:"
echo "  $KERNEL_DISPLAY_NAME"