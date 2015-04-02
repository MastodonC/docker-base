FROM ubuntu
MAINTAINER Neale Swinnerton <neale@mastodonc.com>

RUN apt-get update -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y rsyslog && \
    apt-get clean -qq && \
    apt-get autoclean -qq

ADD rsyslogd.conf /etc/rsyslogd.conf

RUN sed -i -e "s/@@@PRIMARY@@@/${PRIMARY_SYSLOG:-primary-syslog}/g" \
           -e "s/@@@SECONDARY@@@/${SECONDARY_SYSLOG:-secondary-syslog}/g" \
           /etc/rsyslogd.conf
