#!/bin/bash

export SLURM_CPUS_ON_NODE=$(cat /proc/cpuinfo | grep processor | wc -l)
sudo sed -i "s/CPUS/${SLURM_CPUS_ON_NODE}/g" /etc/slurm-llnl/slurm.conf

m=$(grep MemTotal /proc/meminfo | sed -E 's/(.*) (.*) (.*)/\2/')
mem=$(printf "$(($m / 1024))")
sudo sed -i "s/RAM/$mem/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

tail -f /dev/null
