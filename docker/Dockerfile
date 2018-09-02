FROM ubuntu

ENTRYPOINT "/bin/bash"
STOPSIGNAL 2

RUN apt-get update && apt-get upgrade -yq
RUN apt-get install -yq libdancer2-perl mysql-client libdbi-perl
RUN apt-get install -yq cpanminus libdbix-class-perl libdbd-mysql-perl
RUN apt-get install -yq build-essential

RUN cpanm Dancer2::Plugin::Auth::Extensible Dancer2::Plugin::DBIC
RUN cpanm Dancer2::Plugin::Auth::Extensible::Provider::Database

RUN apt-get install -yq starman starlet libplack-perl

VOLUME /usr/Dosvid:/usr/Dosvid
EXPOSE 5000:3000

WORKDIR /usr/Dosvid
CMD ["bash", "-c", "perl bin/app.pl"]