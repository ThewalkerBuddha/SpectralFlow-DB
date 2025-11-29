# SpectralFlow-DB

## FSL Workflow for MRI Analysis

### Dataset

This workflow uses the [OpenNeuro ds000102 dataset](https://github.com/OpenNeuroDatasets/ds000102).

Clone locally for testing:
```bash
git clone https://github.com/OpenNeuroDatasets/ds000102.git data/ds000102
```

### Workflow

The workflow automatically installs FSL, clones the dataset, and runs brain extraction on sub-01 T1 MRI data using FSL BET.

Manual run:
```bash
bash scripts/fsl_preprocess.sh
```



# SpectralFlow-DB
Practice implementations &amp; tutorials for quantitative MRI and MR spectroscopy (MRS/MRSI/CEST) using public datasets.

spectraflow-practice
A beginner-friendly, fully commented playground for learning quantitative MRI and MR spectroscopy by re-implementing state-of-the-art methods on open datasets.
Currently includes:

Single-voxel MRS processing & quantification (basis simulation, HSVD, LCModel-style fitting)
MRSI reconstruction and metabolite mapping
CEST / APT evaluation pipelines (Lorentzian fitting, MTRasym, AREX, deep learning baselines)
Multi-parametric mapping (VFA T1, MP2RAGE, ME-SE T2, MTsat)
Hands-on notebooks with Big GABA, SLAK, Leeds CEST, and other public datasets
