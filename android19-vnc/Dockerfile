FROM ubuntu:latest

MAINTAINER fuyaode

WORKDIR /opt

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools

RUN apt-get update && \
    apt-get install -y wget redir openjdk-7-jre-headless libc6-i386 lib32stdc++6 && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -qO- "http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz" | tar -zx -C /opt  && \
    echo y | android update sdk --no-ui --all --filter platform-tools --force

# Install dependencies for emulator
RUN echo y | android update sdk --no-ui --all -t `android list sdk --all|grep "SDK Platform Android 4.4.2, API 19"|awk -F'[^0-9]*' '{print $2}'` && \
    echo y | android update sdk --no-ui --all --filter sys-img-armeabi-v7a-android-19 --force && \
    echo y | android update sdk --no-ui --all  --filter sys-img-x86-android-19 --force

RUN echo n | android create avd --force -n "x86" -t android-19 --abi default/x86
RUN echo n | android create avd --force -n "arm" -t android-19 --abi default/armeabi-v7a


# Expose android port
EXPOSE 5555
# VNC port
EXPOSE 5900

# Needed to be able to run VNC - bug of Android SDK
RUN mkdir ${ANDROID_HOME}/tools/keymaps && touch ${ANDROID_HOME}/tools/keymaps/en-us

# Add script
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh
