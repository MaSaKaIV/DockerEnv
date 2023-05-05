# TODO:Since the size has become quite large at 90MB, let's compress it a bit more.

FROM debian:bullseye-slim

# runtime dependencies
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		netbase \
		tzdata \
        curl \
        sudo \
	; \
	rm -rf /var/lib/apt/lists/*


# Japanese settings
ARG SETLANG="ja_JP"
ENV LANG="${SETLANG}.UTF8"\
    LC_NUMERIC="${SETLANG}.UTF8"\
    LC_TIME="${SETLANG}.UTF8"\
    LC_MONETARY="${SETLANG}.UTF8"\
    LC_PAPER="${SETLANG}.UTF8"\
    LC_MEASUREMENT="${SETLANG}.UTF8"


# Locale settings
RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
    apt-get install -y tzdata &&\
	ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
	dpkg-reconfigure --frontend noninteractive tzdata &&\
    rm -rf /var/lib/apt/lists/*

# User settings
ARG USERNAME=masakai
ARG UID=1000
ARG GID=1000
RUN echo "Build start with USERNAME: $USERNAME UID: $UID GID: $GID" &&\
    groupadd -g ${GID} ${USERNAME} &&\
    useradd -u ${UID} -g ${GID} -m -s /bin/bash ${USERNAME} &&\
    passwd -d ${USERNAME} &&\
    mkdir -p /etc/sudoers.d &&\
    touch /etc/sudoers.d/${USERNAME} &&\
    echo "${USERNAME} ALL=(ALL) ALL" > /etc/sudoers.d/${USERNAME} &&\
    mkdir -p /home/${USERNAME}/.gnupg &&\
    echo 'standard-resolver' > /home/${USERNAME}/.gnupg/dirmngr.conf &&\
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

WORKDIR /home/${USERNAME}
USER ${USERNAME}

CMD ["/bin/bash"]