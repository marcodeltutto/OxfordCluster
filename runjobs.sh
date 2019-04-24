#!/bin/bash

echo "Running runjobs.sh" 

logpath=/data/t2k/lar/deltutto/logs/
mkdir -p $logpath
outdir=/data/t2k/lar/deltutto/prodgenie_bnb_nu_cosmic_dirt_uboone_MCC8_onlyincryo/
#outdir=/data/t2k/lar/deltutto/prodgenie_bnb_nu_cosmic_uboone_MCC8_2/
mkdir -p $outdir
fcls=/home/deltutto/DirtMCC8Production/fcls/

nstart=0
nend=2999
genevents=50000

DoSubmitSimulation() {
  namebase="prodgenie_bnb_nu_cosmic_dirt_uboone_sim"

  rm $logpath/*simstage*
  
  for i in $(seq -f "%05g" $nstart $nend)
  do
    elog=$logpath/e_${namebase}_simstage_${i}.txt
    olog=$logpath/o_${namebase}_simstage_${i}.txt
    echo
    echo Submitting job n. $i.
    echo
    echo  qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_g4_detsim.sh
    echo
    qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_g4_detsim.sh
    echo
  done   
}

DoSubmitReconstruction() {
  namebase="prodgenie_bnb_nu_cosmic_dirt_uboone_reco"

  rm $logpath/*recostage*

  for i in $(seq -f "%05g" $nstart $nend)
  do
    elog=$logpath/e_${namebase}_recostage_${i}.txt
    olog=$logpath/o_${namebase}_recostage_${i}.txt
    echo
    echo Submitting job n. $i.
    echo
    echo  qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_reco1_reco2.sh
    echo
    qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_reco1_reco2.sh
    echo
  done
}


DoSubmitAll() {
  namebase="prodgenie_bnb_nu_cosmic_dirt_uboone_all"

  rm $logpath/*all*

  for i in $(seq -f "%05g" $nstart $nend)
  do
    elog=$logpath/e_${namebase}_all_${i}.txt
    olog=$logpath/o_${namebase}_all_${i}.txt
    echo
    echo Submitting job n. $i.
    echo
    echo  qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_g4_detsim_reco1_reco2_ana.sh
    echo
    qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_g4_detsim_reco1_reco2_ana.sh
    echo
  done
}

DoSubmitInCryo() {
  namebase="prodgenie_bnb_nu_cosmic_dirt_uboone_incryo"

  rm $logpath/*incryo*

  for i in $(seq -f "%05g" $nstart $nend)
  do
    elog=$logpath/e_${namebase}_incryo_${i}.txt
    olog=$logpath/o_${namebase}_incryo_${i}.txt
    echo
    echo Submitting job n. $i.
    echo
    echo  qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_ana.sh
    echo
    qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_gen_ana.sh
    echo
  done
}

DoSubmitDefault() {
  namebase="prodgenie_bnb_nu_cosmic_uboone"

  rm $logpath/*default*

  for i in $(seq -f "%05g" $nstart $nend)
  do
    elog=$logpath/e_${namebase}_default_${i}.txt
    olog=$logpath/o_${namebase}_default_${i}.txt
    echo
    echo Submitting job n. $i.
    echo
    echo  qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_mcc8_gen_ana.sh
    echo
    qsub -l cput=11:00:00 -l walltime=11:00:00 -o $olog -e $elog -v run=$i,namebase=$namebase,genevents=$genevents,outdir=$outdir,fcls=$fcls job_mcc8_gen_ana.sh
    echo
  done
}
