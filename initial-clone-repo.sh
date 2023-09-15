#! /usr/bin/bash

### old nemo
# git clone git@gitlab.ecosystem-modelling.pml.ac.uk:gle/nemo404.git nemo

### xios rewritten to get new version
### also divided nemo and xios .zip files
svn co http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS2/trunk xios2
zip -r xios2.zip xios2
rm -rf xios2

git clone --branch 4.2.0 https://forge.nemo-ocean.eu/nemo/nemo.git nemo
zip -r nemo_420.zip nemo
rm -rf nemo
