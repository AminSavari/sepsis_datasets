<<<<<<< HEAD
# sepsis_datasets
A collection of sepsis open databases 
=======
# Sepsis Datasets

This repository contains helper tooling to download the datasets from Zenodo.

## Download data

Use the Makefile to download the Zenodo record archive into `data/`:

```bash
make data
```

Notes:
- This repo uses the public Zenodo record: `https://zenodo.org/records/18519059`.
- The Makefile defaults to the public download URL.
- If you ever switch to a private record, pass a tokenized URL at runtime and do **not** commit it to Git.

## Clean downloaded data

```bash
make clean-data
```
>>>>>>> d205238 (Add Zenodo download tooling)
