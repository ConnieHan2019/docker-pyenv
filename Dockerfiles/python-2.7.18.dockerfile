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

# Remove Window CRLF to LF
RUN sed -i.bak 's/\r$//' "$HOME/.ssh/id_rsa"
RUN sed -i.bak 's/\r$//' "$HOME/.ssh/known_hosts"

# SET PROJECT NAME
ENV PROJ="docker-pyenv"

# COPY my test project from github
RUN git clone https://github.com/wonjaek36/docker-pyenv.git "$PROJ"

# SET HOME FOLDER
WORKDIR "$HOME/$PROJ"

# Install pip
# RUN python -m pip install -r requirements.txt
