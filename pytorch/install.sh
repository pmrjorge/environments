#!/bin/bash
conda create -n engine -c conda-forge python=3.13 langchain langchain-chromadb chromadb langchain-huggingface langgraph --solver libmamba -y
conda install -n engine conda-forge::datasets conda-forge::peft conda-forge::transformers conda-forge::bitsandbytes conda-forge::jupyterlab -y
conda install -n engine conda-forge::accelerate conda-forge::triton conda-forge::pytorch -y
