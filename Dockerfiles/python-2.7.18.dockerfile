FROM pyenv:1.0

RUN echo "$PATH"

RUN pyenv install 2.7.18
RUN pyenv global 2.7.18
RUN python --version
