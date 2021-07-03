FROM pyenv:1.0

RUN echo "$PATH"

RUN pyenv install 3.5.6
RUN pyenv global 3.5.6
RUN python --version
