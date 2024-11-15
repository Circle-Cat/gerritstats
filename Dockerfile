FROM ubuntu:16.04

RUN \
apt update && \
apt install -y curl && \
apt install -y sudo && \
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
sudo apt-get install -y nodejs && \
apt install -y openjdk-8-jdk && \
apt install -y ssh

RUN mkdir ~/.ssh && echo "StrictHostKeyChecking no" > ~/.ssh/config

COPY config /gerritstats/config
COPY GerritCommon /gerritstats/GerritCommon
COPY GerritDownloader /gerritstats/GerritDownloader
COPY GerritStats /gerritstats/GerritStats
COPY gradle /gerritstats/gradle
COPY build.gradle /gerritstats/
COPY gerrit_downloader.sh /gerritstats/
COPY gerrit_entrypoint.sh /gerritstats/
COPY gerrit_stats.sh /gerritstats/
COPY gradle.properties /gerritstats/
COPY gradlew /gerritstats/
COPY LICENSE.md /gerritstats/
COPY settings.gradle /gerritstats/

WORKDIR /gerritstats

RUN ./gradlew assemble

ENTRYPOINT ["./gerrit_entrypoint.sh"]
