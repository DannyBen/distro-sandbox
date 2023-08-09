FROM fedora

RUN dnf -y update && dnf -y install @development-tools libyaml-devel ruby-devel

RUN useradd -m -G wheel -s /bin/bash guest && \
    mkdir -p /etc/sudoers.d/ && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER guest

RUN gem install rspec
