FROM node:8

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    bison \
    build-essential \
    git \
    curl \
    libffi-dev \
    libgdbm-dev \
    libncurses5-dev \
    libreadline-dev \
    libreadline-dev \
    libssl-dev \
    libyaml-dev \
    sshpass \
    vim \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

## install rubyenv, ruby and a few gems to automated tests
RUN (curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -) || true \
 && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
 && echo 'eval "$(rbenv init -)"' >> ~/.bashrc \
 && . ~/.bashrc \
 && rbenv install --verbose 2.4.2 \
 && rbenv global 2.4.2 \
 && ruby -v \
 && gem install bundler \
 && gem install rspec \
 && gem install cucumber \
 && gem install chromedriver-helper

ENTRYPOINT [ "/bin/bash" ]