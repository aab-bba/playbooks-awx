FROM quay.io/ansible/awx-ee:24.6.1

USER root

# Equivalente de apt-get en RHEL-based
RUN dnf -y update && \
    dnf -y install \
      wget \
      gnupg2 \
      tar \
      unzip \
      java-11-openjdk \
      which \
      glibc-langpack-en \
      gcc \
      kernel-devel \
      make && \
    dnf clean all

RUN python3 -m pip install --upgrade pip

# PyMySQL para acceso a MySQL
RUN pip install PyMySQL passlib

USER 1000
