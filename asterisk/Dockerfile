FROM rnd/base-os

ENV ASTERISK_VERSION 18.11.2
ENV DEBIAN_FRONTEND noninteractive
ARG ASTERISK_VERSION=18.11.2

WORKDIR /tmp

COPY scripts/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY scripts/setup-config.sh build/setup-config.sh
RUN build/setup-config.sh

COPY scripts/build.sh build/build.sh
RUN build/build.sh

COPY scripts/cleanup.sh build/cleanup.sh
RUN build/cleanup.sh

WORKDIR /

ENTRYPOINT ["asterisk", "-c"]