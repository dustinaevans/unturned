FROM ubuntu
LABEL maintainer="jesperbagge@gmail.com"

ENV UNTURNED_REPO /unturned
ENV STEAMCMD_REPO /steamcmd
ENV STEAM_USER anonymous
ENV STEAM_PWD ""

RUN mkdir -p ${STEAMCMD_REPO} ${UNTURNED_REPO}

ADD scripts ${STEAMCMD_REPO}

RUN apt-get update && apt-get install -y \
    apt-utils \
    #cron \
    ca-certificates \
    lib32gcc1 \
    unzip \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl \
    wget \
    #screen \
    #tmux \
    libmono-cil-dev \
    mono-runtime \
 && apt-get clean


RUN curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_REPO} -zx


CMD ${STEAMCMD_REPO}/scripts/update.sh
