FROM ubuntu:16.04

MAINTAINER jermi

RUN  apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get update

RUN wget -qO- https://get.haskellstack.org/ | sh

CMD ["echo", "Hello Haskell..8288."]

RUN cp -r ~/ sticky-notes/

RUN cd sticky-notes

RUN stack run

EXPOSE 8188

CMD ["echo", "Hello Haskell..done."]
