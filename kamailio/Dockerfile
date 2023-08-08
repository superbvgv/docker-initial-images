FROM dcrm/base-os

RUN apt-get update && apt-get install -yq gnupg2 wget lsb-release git gcc g++ flex bison libmariadb-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev pkg-config

# then let's get the source. Use the -b flag to get a specific branch
RUN mkdir -p /usr/local/src/kamailio-devel
WORKDIR /usr/local/src/kamailio-devel
RUN git config --global http.sslVerify false && git clone https://github.com/kamailio/kamailio.git kamailio

RUN cd /usr/local/src/kamailio-devel/kamailio && make cfg && make all && make install