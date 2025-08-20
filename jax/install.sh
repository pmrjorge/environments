#!/bin/bash
conda install -n engine conda-forge::datasets conda-forge::peft conda-forge::transformers conda-forge::bitsandbytes conda-forge::jupyterlab conda-forge::pandas -y
conda install -n engine conda-forge::accelerate conda-forge::triton -y
conda install -n engine nvidia::nccl -y