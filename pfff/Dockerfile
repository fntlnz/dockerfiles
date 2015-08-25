FROM centos:centos7
MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

WORKDIR /tmp

RUN yum install gtk2-devel atk-devel pango-devel cairo-devel swi-prolog ncurses-devel binutils-gold git -y
RUN yum install wget unzip patch make gcc m4 -y
RUN yum install ocaml-camlp4 ocaml-camlp4-devel -y
RUN git clone https://github.com/facebook/pfff.git --depth=1

WORKDIR pfff
RUN ./configure
RUN make depend
RUN yum install php -y
RUN make -j
RUN make opt
RUN make install

WORKDIR /
