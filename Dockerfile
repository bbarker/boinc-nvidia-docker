FROM nvidia/cuda:8.0-cudnn7-runtime-ubuntu16.04

ARG nixuser
ENV ENVSDIR /nixenv/$nixuser
ENV HOME /home/$nixuser
ENV HOME_TEMPLATE /template/$nixuser
WORKDIR $ENVSDIR

MAINTAINER Brandon Barker <brandon.barker@gmail.com>

RUN echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null && \
  apt-get update -y && \
  apt-get install -y --no-install-recommends bzip2 software-properties-common \
    ca-certificates wget && \
  add-apt-repository ppa:gridcoin/gridcoin-stable && apt-get update -y && \
  apt-get clean

RUN apt-get install -y --no-install-recommends boinc-client boinc-manager gridcoinresearchd && \
  apt-get clean

CMD gridcoinresearchd



