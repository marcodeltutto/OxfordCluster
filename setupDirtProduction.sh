#!/bin/bash

#source /cvmfs/fermilab.opensciencegrid.org/products/larsoft/setup
#source /cvmfs/uboone.opensciencegrid.org/products/setup

source /cvmfs/uboone.opensciencegrid.org/products/setup_uboone.sh
echo "Running setup uboonecode v06_26_01_19 -q e10:prof"
setup uboonecode v06_26_01_19 -q e10:prof
echo "Running source uboonecode_v06_26_01_19/localProducts_larsoft_v06_26_01_14_e10_prof/setup"
source /home/deltutto/DirtMCC8Production/uboonecode_v06_26_01_19/localProducts_larsoft_v06_26_01_14_e10_prof/setup
echo "Setting up local products"
mrbslp

#module load root

#setup git
#setup gitflow
#setup mrb
#export MRB_PROJECT=larsoft


