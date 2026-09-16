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

Adding packages

To add a new dependency:

uv add scikit-learn

This updates both:

pyproject.toml
uv.lock

Commit the changes:

git add pyproject.toml uv.lock
git commit -m "Add scikit-learn"
git push

Other users can then update their environment with:

git pull
./install.sh my-kernel

Updating the environment

After pulling changes from the repository:

git pull
./install.sh my-kernel

The local .venv will be synchronized with the committed uv.lock.

Removing a kernel

To remove a kernel named my-kernel:

rm -rf ~/.local/share/jupyter/kernels/my-kernel

To also remove the local Python environment:

rm -rf .venv

You can recreate it later by running:

./install.sh my-kernel

Troubleshooting

Check that the environment works

Run:

.venv/bin/python -c "import sys, zmq, ipykernel; print(sys.executable); print(zmq.__file__); print(ipykernel.__file__)"

The output should point to files inside:

.venv/

Check the generated kernelspec

For a kernel named my-kernel:

cat ~/.local/share/jupyter/kernels/my-kernel/kernel.json

The argv entry should point to the kernel.sh file inside your cloned repository.

Test the kernel launcher

You can also test:

./kernel.sh

If the kernel starts without a Python traceback, the environment is working.

Kernel keeps loading in Jupyter-JSC

Restart the complete Jupyter-JSC session after installing or changing the kernel.

The kernel launcher clears:

PYTHONPATH

and sets:

PYTHONNOUSERSITE=1

to avoid mixing the Python packages provided by Jupyter-JSC with the packages installed in the local uv environment.