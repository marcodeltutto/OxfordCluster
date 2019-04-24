#!/bin/bash

echo
echo "This is job_mcc8_gen_ana.sh."
echo

cd $TMPDIR
source /home/deltutto/DirtMCC8Production/setupDirtProduction.sh
ups active

echo
echo "******************** GEN STAGE 1"
echo

lar -n $genevents -c $fcls/prodgenie_bnb_nu_cosmic_uboone_oxford.fcl -o ./prodgenie_bnb_nu_cosmic_uboone_${run}_gen.root

#echo
#echo "******************** GEN STAGE 2"
#echo

#lar -n $genevents -c $fcls/prodgenie_bnb_dirt_nu_uboone_corsika_stage2_oxford.fcl -s ./prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1.root -o ./prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4.root
#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1.root

ls -ltr

du -h ./prodgenie_bnb_nu_cosmic_uboone_${run}_gen.root

echo
echo "******************** ANA STAGE"
echo

lar -n $genevents -c $fcls/standard_ana_uboone.fcl -s ./prodgenie_bnb_nu_cosmic_uboone_${run}_gen.root -o ./prodgenie_bnb_nu_cosmic_uboone_${run}_gen_ana.root
#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1.root

#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2.root
cp ./ana_hist.root $outdir/ana_hist_${run}.root
#rm $outdir/prodgenie_bnb_nu_cosmic_dirt_uboone_${run}_gen1_gen2_g4_detsim_reco1_reco2_ubxsec.root

echo
echo "This is the end of job_mcc8_gen_ana.sh."
echo
