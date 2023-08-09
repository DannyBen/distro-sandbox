FROM ubuntu

RUN apt -y update && \
    apt -y install sudo build-essential ruby-dev libyaml-dev

RUN adduser --disabled-password --gecos "" megatron && \
    mkdir -p /etc/sudoers.d/ && \
    usermod -aG sudo megatron && \
    echo "%sudo  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd

USER megatron

RUN sudo gem install rspec
