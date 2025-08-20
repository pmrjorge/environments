#!/bin/bash
git clone https://github.com/jax-ml/jax
cd jax
conda run -n engine python build/build.py build --wheels=jaxlib,jax-cuda-plugin,jax-cuda-pjrt
conda run -n engine pip install dist/*.whl
cd ..
rm -rf jax

