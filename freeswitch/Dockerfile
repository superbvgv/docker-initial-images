FROM dcrm/base-os

RUN apt-get update && apt-get install -yq gnupg2 wget lsb-release make gcc pkg-config
RUN wget --no-check-certificate -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -

RUN echo "deb http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list && \
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list && \
apt-get update

# Install dependencies required for the build
RUN apt-get build-dep freeswitch -y --force-yes
  
# then let's get the source. Use the -b flag to get a specific branch
RUN cd /usr/src/ && \
git config --global http.sslVerify false && \
git clone https://github.com/signalwire/freeswitch.git -bv1.10 freeswitch

WORKDIR /usr/src/

# Because we're in a branch that will go through many rebases, it's
# better to set this one, or you'll get CONFLICTS when pulling (update).
RUN cd freeswitch && \
git config pull.rebase true && \
./bootstrap.sh -j && \
./configure && \
make && \
make install

WORKDIR /usr/src/freeswitch/

RUN apt-get install ca-certificates
COPY certs/ /usr/local/share/ca-certificates/ 

RUN update-ca-certificates  && \
make sounds-install && \
make moh-install

EXPOSE 8021/tcp
EXPOSE 5060/tcp 5060/udp 5080/tcp 5080/udp
EXPOSE 5061/tcp 5061/udp 5081/tcp 5081/udp
EXPOSE 7443/tcp
EXPOSE 5070/udp 5070/tcp
EXPOSE 64535-65535/udp
EXPOSE 16384-32768/udp

# SHELL       ["/bin/bash"]
# HEALTHCHECK --interval=15s --timeout=5s \
#    CMD  fs_cli -x status | grep -q ^UP || exit 1

# /usr/local/freeswitch/bin
# https://new.linphone.org/technical-corner/linphone?qt-technical_corner=2#qt-technical_corner

# CMD ["/usr/local/freeswitch/bin/freeswitch", "-nonat", "-nf", "-nc"]
CMD ["/usr/local/freeswitch/bin/freeswitch", "-nc"]