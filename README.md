Jupyter-JSC uv Kernel

This repository provides a Python 3.12 Jupyter kernel for Jupyter-JSC using uv. The Python environment is created locally inside the cloned repository as:
```
.venv/
```

Installation
First load uv:
```
module load uv
```

Clone the repository:

git clone https://github.com/sab148/uv_jsc.git
cd uv_jsc

Then install the kernel and specify the name that you want to pass:

./install.sh kernel-name "kernel name"

For example:

./install.sh kernel-scicoco "kernel scicoco"
