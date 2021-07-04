FROM pyenv:1.0

RUN echo "$PATH"

# Python install
RUN pyenv install 2.7.18
RUN pyenv global 2.7.18
RUN python --version

# COPY rsa key from host
RUN mkdir -p "$HOME/.ssh"
COPY id_rsa "$HOME/.ssh"
COPY known_hosts "$HOME/.ssh"

# SET HOME FOLDER
WORKDIR $HOME