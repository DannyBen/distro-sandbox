FROM ubuntu

RUN apt -y update && \
    apt -y install sudo build-essential ruby-dev libyaml-dev

RUN adduser --disabled-password --gecos "" guest && \
    mkdir -p /etc/sudoers.d/ && \
    usermod -aG sudo guest && \
    echo "%sudo  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd

USER guest

RUN sudo gem install rspec
