FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

#* curl jq - required for readyness probe and to download genesis
RUN apt update && \
    apt -y dist-upgrade && \
    apt install -y --no-install-recommends \
        tzdata\
        ca-certificates \
        squid \
        openvpn \
        bridge-utils  \
        supervisor && \
    rm -rf /var/cache/apt/*

RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun

RUN mkdir -p /var/log/supervisor
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 1080 9001

# VOLUME ${APP_PATH}
# CMD ["/usr/bin/supervisord"]