FROM ubuntu:20.04

ENV TZ=America/Sao_Paulo
ARG DEBIAN_FRONTEND=noninteractive
ARG UID=1044
ARG GID=1044
RUN apt update -y && \ 
    apt install -y tzdata && \
    apt install -y sudo && \
    apt install -y nano && \
    apt install -y openssh-server && apt install -y munge && \
    apt install -y vim && apt install -y build-essential && \ 
    apt install -y git && apt install -y mariadb-server && apt install -y wget && \
    apt install -y systemctl && apt install -y iputils-ping

RUN groupadd -g $GID -o slurm
RUN useradd -m -u $UID -g $GID -s /usr/bin/bash -d /home/slurm slurm && \
    echo "slurm:slurm" | chpasswd && adduser slurm sudo && \
    echo "slurm     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

ARG DEBIAN_FRONTEND=noninteractive

RUN apt install -y slurmd slurm-client slurmctld
RUN apt install -y sudo python3.9 python3-pip 

RUN apt install -y libopenmpi-dev
RUN pip3 install mpi4py

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

EXPOSE 6817 6818 6819 3306 

# WORKDIR /home/slurm

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]