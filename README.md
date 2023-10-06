# CoRNErS
Containerization of Revised NEMO-ERSEM Employing Singularity (CoRNErS)

The aim is to build a shippable container of a physical ocean model ([NEMO](https://www.nemo-ocean.eu/)) coupled with a biogeochemical model ([ERSEM](https://ersem.readthedocs.io/en/latest/model_info/index.html)). Ideally, only input data ([SeTTe](https://gws-access.jasmin.ac.uk/public/nemo/sette_inputs/)) and output specification ([XIOS](https://github.com/pmlmodelling/NEMO4.0-FABM/wiki/Using-XIOS)) are needed to start a full-fledged ocean circulation model (preferably on **any** HPC you get your hands on). 

- the basis for these scripts comes from [NOC-MSM/CoNeS](https://github.com/NOC-MSM/CoNES) and [pmlmodelling/NEMO-container](https://github.com/pmlmodelling/NEMO-container)
- changes for recent model versions from [J Mak NEMO notes](https://nemo-related.readthedocs.io/en/latest/compilation_notes/nemo42.html)
- [ERSEM PR version](https://git.tu-berlin.de/t0ad/ersem_pr/) from [myself](https://www.researchgate.net/profile/Carsten-Lackner); base version from [pmlmodelling/ersem](https://github.com/pmlmodelling/ersem)

---

Repo containing instructions for creating a [singularity container](https://sylabs.io/guides/3.5/user-guide/introduction.html) for NEMO-ERSEM. The setup is based heavily on the [CoNES repo](https://github.com/NOC-MSM/CoNES).

## Setup

To create a singularity container, please follow the steps below:

1. Install [Docker](https://docs.docker.com/get-docker/) on host system and create `singularity` executable with `alias singularity='docker run --privileged -it --rm --mount type=bind,source=${PWD},target=/home/singularity quay.io/singularity/singularity:v3.7.3-slim'`
    - I hard-coded the alias into the ~/.bashrc file on my WSL
2. Clone and compress `NEMO-ERSEM` and `XIOS` folders, this can be done via `bash initial-clone-repo.sh`.
3. Run singularity build commands
    1. Run `singularity build /home/singularity/baseOS.sif /home/singularity/baseOS.def`
    2. Run `singularity build /home/singularity/fabm.sif   /home/singularity/fabm.def`
    3. Run `singularity build /home/singularity/xios.sif   /home/singularity/xios.def`
    4. Run `singularity build /home/singularity/nemo.sif   /home/singularity/nemo.def`
4. The next steps could include: 
    1. ship containers to HPC
    2. get input data from SETTE
    3. look into XIOS settings to organize the desired model output
    4. run

---
**NOTE**

Make sure that when you build the `sif` files, you have bound the correct folders to your container.

---
