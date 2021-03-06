#!/bin/bash

echo
echo "This is job_reco1_reco2.sh."
echo

cd $TMPDIR
source /home/deltutto/DirtMCC8Production/setupDirtProduction.sh

echo
echo "******************** RECO1 STAGE"
echo

lar -n $genevents -c $fcls/reco_uboone_mcc8_driver_stage1.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1.root
rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim.root

echo
echo "******************** RECO2 STAGE"
echo

lar -n $genevents -c $fcls/reco_uboone_mcc8_driver_stage2.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2.root
rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1.root

echo
echo "******************** CCINC STAGE"
echo

lar -n $genevents -c $fcls/run_ubxsec_mc_bnbcosmic.fcl -s $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2.root -o $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2_ubxsec.root
rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2.root
cp ./ubxsec_output_mc_bnbcosmic.root $outdir/ubxsec_output_mc_bnbcosmic_${run}.root

echo
echo "This is the end of job_reco1_reco2.sh."
echo
