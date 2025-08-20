#!/bin/bash
git clone https://github.com/pytorch/pytorch
cd pytorch
git submodule sync
git submodule update --init --recursive
conda install -n engine cmake ninja -y
conda run -n engine pip install -r requirements.txt
conda run -n engine pip install mkl-static mkl-include
conda run -n engine .ci/docker/common/install_magma_conda.sh 13.0
conda run -n engine make triton
conda run -n engine export CMAKE_PREFIX_PATH="${CONDA_PREFIX:-'$(dirname $(which conda))/../'}:${CMAKE_PREFIX_PATH}"
conda run -n engine python -m pip install --no-build-isolation -v -e .
cd ..
rm -rf pytorch
git clone https://github.com/pytorch/TensorRT.git
cd TensorRT
conda run -n engine export BAZEL_VERSION=$(cat ${PWD}/.bazelversion)
mkdir bazel
cd bazel
curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-dist.zip
unzip bazel-$BAZEL_VERSION-dist.zip
conda run -n engine bash ./compile.sh
cp output/bazel /usr/local/bin/
conda run -n engine pip install --pre .
cd ../..
rm -rf TensorRT


