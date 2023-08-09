FROM archlinux

RUN pacman --noconfirm -Suy && pacman --noconfirm -S base-devel ruby

RUN useradd -m -G wheel -s /bin/bash guest && \
    mkdir -p /etc/sudoers.d/ && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER guest

# This is needed only on archlinux, nowhere else
RUN echo 'export PATH="$PATH:$(gem env path | sed '\''s@[^:]\+@&/bin@g'\'')"' >> "$HOME/.bashrc"

RUN gem install rspec

