#!/bin/bash
conda install -n engine conda-forge::datasets conda-forge::peft conda-forge::transformers conda-forge::bitsandbytes conda-forge::jupyterlab conda-forge::pandas -y
conda install -n engine conda-forge::accelerate conda-forge::triton -y
conda run -n engine pip install torch torchvision --index-url https://download.pytorch.org/whl/cu129
conda run -n engine pip install dotenv
conda run -n engine pip install "jax[cuda12]"
conda run -n engine pip install "flax[all]"