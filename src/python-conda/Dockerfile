FROM masakai54/sheldon:latest

ENV PYTHON_VERSION 3.8.16

ARG USERNAME=masakai
WORKDIR /home/${USERNAME}
USER ${USERNAME}

# Download and install Miniconda
RUN mkdir ~/tmp/ &&\
	curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/tmp/miniconda.sh &&\
	chmod 777 ~/tmp/miniconda.sh
RUN zsh -ic "sudo ~/tmp/miniconda.sh -b -p /opt/conda" &&\
    rm ~/tmp/miniconda.sh

# Add conda to PATH
ENV PATH="/opt/conda/bin:${PATH}"

CMD ["/usr/bin/zsh"]
