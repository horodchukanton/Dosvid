FROM ubuntu

RUN apt-get update && apt-get upgrade -yq
RUN apt-get install -yq libdancer2-perl mysql-client libdbi-perl \
 cpanminus libdbix-class-perl libdbd-mysql-perl \
 build-essential starman starlet libplack-perl

RUN cpanm Dancer2::Plugin::Auth::Extensible Dancer2::Plugin::DBIC \
  Dancer2::Plugin::Auth::Extensible::Provider::Database

WORKDIR /usr/Dosvid

CMD ["bash", "docker-startup.sh"]