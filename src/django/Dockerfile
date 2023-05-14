FROM masakai54/python-conda:latest

ARG USERNAME=masakai
USER ${USERNAME}

ARG ENV_YML="pm.yml"
ARG ENV_NAME="pm"

COPY etc/${ENV_YML} /home/${USERNAME}/${ENV_YML}

RUN sudo apt-get update &&\
    sudo apt-get install -y gcc default-libmysqlclient-dev &&\
    sudo apt-get install -y default-mysql-client

RUN conda env create -n ${ENV_NAME} -f ${ENV_YML}

# SHELL ["/usr/bin/zsh", "-c"]
RUN conda init zsh &&\
    sudo rm pm.yml

ENV PATH="/home/masakai/.conda/envs/${ENV_NAME}/bin:${PATH}"

SHELL ["/usr/bin/zsh", "-c"]
CMD ["/usr/bin/zsh"]