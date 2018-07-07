#!/bin/bash

echo
echo "This is job_gen_g4_detsim.sh."
echo

cd $TMPDIR
source /home/deltutto/DirtMCC8Production/setupDirtProduction.sh
ups active

echo
echo "******************** GEN STAGE 1"
echo

lar -n $genevents -c $fcls/prodgenie_bnb_dirt_nu_uboone_corsika_stage1_oxford.fcl -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1.root

echo
echo "******************** GEN STAGE 2"
echo

lar -n $genevents -c $fcls/prodgenie_bnb_dirt_nu_uboone_corsika_stage2_oxford.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4.root
rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1.root

#echo
#echo "******************** G4 STAGE"
#echo

#lar -n $genevents -c $fcls/standard_g4_uboone.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4.root
#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2.root

echo
echo "******************** DETSIM STAGE"
echo

lar -n $genevents -c $fcls/standard_detsim_uboone.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim.root
#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4.root

echo
echo "This is the end of job_gen_g4_detsim.sh."
echo
