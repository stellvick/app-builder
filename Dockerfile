FROM openjdk:17-jdk-slim

RUN apt-get update && apt-get install -y \
    git curl unzip wget nodejs npm bash \
    && npm install -g yarn expo-cli eas-cli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
RUN mkdir -p /workspace /output

ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools

COPY build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

CMD ["bash"]
