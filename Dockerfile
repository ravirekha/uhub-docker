FROM ubuntu:latest

MAINTAINER Ravi kumar G <ravikumar@oncam.com>

#Install Git Curl Wget tar vim vi

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y tar \
    && apt-get install -y curl \
    && apt-get install -y git \
    && apt-get install -y vim \
    && apt-get install -y unzip

# Install dependencies.

RUN apt-get update \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && pip3 install --upgrade pip \
    && apt-get update \
    && apt-get install -y ansible

# Install Terraform

RUN wget --quiet https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip \
    && unzip terraform_0.11.13_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.11.13_linux_amd64.zip
# Filemgr-linux

RUN apt-get install -y nautilus




ENV WGET_HOME=/usr/bin/wget
ENV TAR_HOME=/bin/tar
ENV CURL_HOME=/usr/bin/curl
ENV GIT_HOME=/usr/bin/git
ENV VIM_HOME=/usr/bin/vim
ENV UNZIP_HOME=/usr/bin/unzip
ENV ANSIBLE_HOME=/etc/ansible
ENV PYTHON_HOME=/usr/bin/python
ENV TERRAFORM_HOME=/usr/bin/terraform
ENV NAUTILUS_HOME=/usr/bin/nautilus
