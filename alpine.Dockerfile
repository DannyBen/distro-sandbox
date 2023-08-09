FROM alpine

RUN apk --no-cache add sudo ruby-dev build-base ruby

RUN adduser -D -G wheel -s /bin/bash megatron && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

USER megatron

RUN sudo gem install rspec

