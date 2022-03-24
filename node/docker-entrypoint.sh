#!/bin/bash

export SLURM_CPUS_ON_NODE=$(cat /proc/cpuinfo | grep processor | wc -l)
sudo sed -i "s/CPUS/${SLURM_CPUS_ON_NODE}/g" /etc/slurm-llnl/slurm.conf

m=$(lsmem --summary  | grep G | sed -e 's/[[:alpha:]]//g' -e 's/://g' -e 's/ //g')
mem=$(printf "$((1024 * $m))")
sudo sed -i "s/RAM/$mem/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo slurmd -N $SLURM_NODENAME

tail -f /dev/null
