echo "started install Dependencies"

export DEBIAN_FRONTEND=noninteractive

export ANDROID_SDK="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export ANDROID_HOME="/opt/android-sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/:$PATH"
export PATH="$ANDROID_HOME/emulator/:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="$ANDROID_SDK:$PATH"
export PATH="$PATH:/usr/local/flutter/bin"

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    wget \
    curl \
    make \
    git \
    zlib1g-dev \
    libssl-dev \
    gperf \
    cmake \
    clang \
    libc++-dev \
    libc++abi-dev \
    php-cli \
    g++ \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    xz-utils \
    unzip \
    xvfb \
    openjdk-11-jdk 

mkdir -p /opt/android-sdk/cmdline-tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O /tmp/tools.zip
unzip -q /tmp/tools.zip -d /opt/android-sdk/cmdline-tools
sudo cp -rf /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest
echo "export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin" >> ~/.bashrc

echo "export ANDROID_SDK=/opt/android-sdk" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=/opt/android-sdk" >> ~/.bashrc
echo "export ANDROID_HOME=/opt/android-sdk" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/cmdline-tools/latest/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/emulator/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_HOME/platform-tools/:$PATH" >> ~/.bashrc
echo "export PATH=$ANDROID_SDK:$PATH" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/flutter/bin" >> ~/.bashrc

yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --update
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "platforms;android-30"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "patcher;v4"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.2"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager "ndk;21.3.6528147"
yes "y" | /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses 