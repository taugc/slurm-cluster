FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
    apt install -y sudo && \
    apt install -y systemctl && apt install -y nano && \
    apt install -y openssh-server && apt install -y munge && \
    apt install -y vim && apt install -y build-essential && \ 
    apt install -y git && apt install -y mariadb-server && apt install -y wget && \
    apt install -y iputils-ping 

RUN useradd -m slurm -s /usr/bin/bash -d /home/slurm &&  \
    echo "slurm:slurm" | chpasswd && adduser slurm sudo && \
    echo "slurm     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG DEBIAN_FRONTEND=noninteractive

RUN apt install slurmd slurm-client -y
RUN apt install sudo -y && apt install python3.9 python3-pip -y

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

EXPOSE 6817 6818 6819  

RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
