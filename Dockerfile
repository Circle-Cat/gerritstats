FROM ubuntu:16.04

RUN \
apt update && \
apt install -y curl && \
apt install -y sudo && \
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
sudo apt-get install -y nodejs && \
npm config set registry https://registry.npm.taobao.org && \
apt install -y openjdk-8-jdk && \
apt install -y ssh

ADD * /gerritstats

WORKDIR /gerritstats

RUN cd /gerritstats && ./gradlew assemble

ENTRYPOINT ["/gerritstats/gerrit_entrypoint.sh"]