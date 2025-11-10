#!/bin/bash
conda run -n engine pip install jupyterlab matplotlib
conda run -n engine pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.8.0+cu129.html

