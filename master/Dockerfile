FROM ubuntu:20.04

RUN apt update -y && \ 
    apt install -y nano && \
    apt install -y openssh-server && apt install -y munge && \
    apt install -y vim && apt install -y build-essential && \ 
    apt install -y git && apt install -y mariadb-server && apt install -y wget && \
    apt install -y systemctl && apt install -y iputils-ping

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y slurmd slurm-client slurmctld
RUN apt install -y sudo python3.9 python3-pip 

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
    echo "admin:admin" | chpasswd && adduser admin sudo && \
    echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

RUN apt install -y libopenmpi-dev
RUN pip3 install mpi4py

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

EXPOSE 6817 6818 6819 3306 

# WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
