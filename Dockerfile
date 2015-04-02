FROM ubuntu
MAINTAINER Neale Swinnerton <neale@mastodonc.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y rsyslog && \
    DEBIAN_FRONTEND=noninteractive apt-get clean -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get autoclean -qq

ADD rsyslogd.conf /etc/rsyslogd.conf

RUN sed -i -e "s/@@@PRIMARY@@@/${PRIMARY_SYSLOG:-primary-syslog}/g" \
           -e "s/@@@SECONDARY@@@/${SECONDARY_SYSLOG:-secondary-syslog}/g" \
           /etc/rsyslogd.conf
