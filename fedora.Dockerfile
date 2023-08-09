FROM fedora

RUN dnf -y update && dnf -y install @development-tools libyaml-devel ruby-devel

RUN useradd -m -G wheel -s /bin/bash megatron && \
    mkdir -p /etc/sudoers.d/ && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER megatron

RUN gem install rspec
