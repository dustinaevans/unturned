FROM debian:jessie-slim
LABEL maintainer="jesperbagge@gmail.com"

# Define environment variables
ENV UNTURNED_REPO /gameserver
ENV STEAM_USER anonymous
ENV STEAM_PWD ""

# Install necessary tools to run SteamCMD and Unturned
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    lib32stdc++6 \
    mono-runtime libmono2.0-cil \
    libc6 libgl1-mesa-glx libxcursor1 libxrandr2 \
    libc6-dev-i386 libgcc-4.8-dev \
    curl \
    unzip \
    wget
RUN apt-get install steamcmd

RUN steamcmd +login anonymous +app_update 1110390 +quit

# Open ports to the container
EXPOSE 27016/udp
EXPOSE 27017/udp

# Mount serverfolder for persistence
VOLUME $UNTURNED_REPO/Servers/$INSTANCE_NAME

# Download SteamCMD and Unturned
CMD "sh /root/.steam/steamapps/common/U3DS/ExampleServer.sh"
