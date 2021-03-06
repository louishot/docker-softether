FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40
ENV VERSION https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.29-9680-rtm/softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
WORKDIR /usr/local/vpnserver


RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install wget gcc make && \
    yum clean all && \
	wget ${VERSION} -O /tmp/softether-vpnserver.tar.gz &&\
    tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
    rm -rf /tmp/softether-vpnserver.tar.gz &&\
    make i_read_and_agree_the_license_agreement &&\
	chmod 755 /usr/local/vpnserver/vpnserver
	
CMD ["/usr/local/vpnserver/vpnserver", "execsvc"]


