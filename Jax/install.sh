#!/bin/bash
conda install -n engine conda-forge::datasets conda-forge::peft conda-forge::transformers conda-forge::bitsandbytes conda-forge::jupyterlab -y
conda install -n engine conda-forge::accelerate conda-forge::triton conda-forge::pytorch -y