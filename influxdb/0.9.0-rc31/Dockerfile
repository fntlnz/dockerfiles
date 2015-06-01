# InfluxDB
# @version 0.9.0-rc31
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos7

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

#Prerequisites
RUN yum install git mercurial make bison wget tar gcc glibc-devel -y

WORKDIR /tmp
RUN wget -nv -O - https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar zx

ENV GOPATH /usr/local/go
ENV GOROOT /tmp/go
RUN mkdir -p /usr/local/go/src/github.com/influxdb
WORKDIR /usr/local/go/src/github.com/influxdb
RUN git clone https://github.com/influxdb/influxdb
WORKDIR influxdb
RUN git checkout tags/v0.9.0-rc31

RUN /tmp/go/bin/go get -u -f ./...
RUN /tmp/go/bin/go build ./...
RUN /tmp/go/bin/go install ./...

WORKDIR /

RUN ln -s /usr/local/go/bin/* /usr/local/bin

# Cleaning
RUN yum remove git mercurial make bison gcc glibc-devel wget tar -y
RUN rm -Rf /tmp/go

EXPOSE 8083
EXPOSE 8086
EXPOSE 8084

ENTRYPOINT ["influxd"]
