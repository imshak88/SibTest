FROM ubuntu:16.04
MAINTAINER Jack Black "jack.black@example.com"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools nginx
RUN useradd -ms /bin/bash sib
RUN rm -f /etc/nginx/fastcgi.conf /etc/nginx/fastcgi_params && \
    rm -f /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/snakeoil.conf
COPY sib-photos.jpg.txt /home/sib/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
