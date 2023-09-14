# CoRNErS
Containerisation of Revised NEMO-ERSEM Employing Singularity (CoRNErS)

- basis for these scripts come from NOC-MSM/CoNeS and pmlmodelling/NEMO-container
- changes for recent model verions from J Mak NEMO notes
- ERSEM pr version from myself; base version from pmlmodelling/ersem

---

Repo containing instruction for creating a [singularity container](https://sylabs.io/guides/3.5/user-guide/introduction.html) for NEMO-ERSEM. The setup is based heavily apon the [CoNES repo](https://github.com/NOC-MSM/CoNES) .

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
4. next steps could include: 
    1. ship containers to HPC
    2. get input data from SETTE
    3. look into XIOS settings to organize wished model output
    4. run

---
**NOTE**

Make sure that when you build the `sif` files, you have bound the the correct folders to your container.

---
