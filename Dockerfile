ARG BASE_IMAGE="debian:latest"

FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      python3 sudo bash ca-certificates iproute2 \
      python3-apt aptitude rsync && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd ansible && useradd -m -g ansible ansible
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ansible
