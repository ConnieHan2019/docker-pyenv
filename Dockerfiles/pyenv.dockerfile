FROM ubuntu:18.04

# Change ubuntu mirror(Default -> Kakao)
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# Update Ubuntu
RUN apt update -y
RUN apt upgrade -y

# To install tz-dev without interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install Pyenv package requirement
RUN apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev
RUN apt install -y libreadline-dev libsqlite3-dev wget curl llvm
RUN apt install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev liblzma-dev
RUN apt install -y python-openssl git

# Make DEBIAN_FRONTEND default value
ENV DEBIAN_FRONTEND=interactive

# Set HOME ENV as /root
ENV HOME='/root'

# Install Pyenv
RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

# Configure the environment
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
# Inserting Shims Manually
ENV PATH="$PYENV_ROOT/shims:$PATH"

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.profile
RUN echo 'eval "$(pyenv init --path)"' >> $HOME/.profile

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc
RUN echo 'eval "$(pyenv init --path)"' >> $HOME/.bashrc

WORKDIR $HOME