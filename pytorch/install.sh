#!/bin/bash
conda run -n engine pip install jupyterlab matplotlib
conda run -n engine pip install torch torchvision --index-url https://download.pytorch.org/whl/cu130



