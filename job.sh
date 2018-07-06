#!/bin/bash

#PBS -l cput=01:59:00
#PBS -l walltime=02:59:00

echo
echo "This is job.sh."
echo

N=$genevents

outdir=/data/lar/uboone/prodgenie_numi_nu_uboone/
fcldir=/home/deltutto/NuMIProduction/fcls
fnameprefix="${namebase}_${run}_"
#set intermmediate directory to outdir in order to keep middle stages
#intdir=$outdir
#intdir=$TMPDIR

#cd $TMPDIR
mkdir -p $outdir
source /home/deltutto/NuMIProduction/setupNuMIProduction.sh

larcmd="lar "#--tmpdir $TMPDIR"

set -x #echo on

# GENIE stage
$larcmd -n$N -c $fcldir/prodgenie_numi_nu_cosmic_uboone.fcl -o $outdir/${fnameprefix}gen.root

# G4 stage
$larcmd -n$N -c $fcldir/standard_g4_uboone.fcl -s $outdir/${fnameprefix}gen.root -o $outdir/${fnameprefix}gen_g4.root

# DETSIM stage
$larcmd -n$N -c $fcldir/standard_detsim_uboone.fcl  -s $outdir/${fnameprefix}gen_g4.root -o $outdir/${fnameprefix}gen_g4_detsim.root


#####OUTPUTS#######
# ANA stage
#copytag=""
#$larcmd -n$Nb -c $fcldir/anatree_uboone_cryg4only_${label}.fcl -s $intdir/${fnameprefix}gen_g4_detsim.root -T $outdir/${fnameprefix}${copytag}gen_g4_detsim_ana.root



