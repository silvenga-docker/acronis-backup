FROM ubuntu:16.04

LABEL maintainer="Mark Lopez <m@silvenga.com>"

RUN set -xe \
    && DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        rpm \
        wget \
    && rm -r /var/lib/apt/lists/* \
    && wget https://dl.acronis.com/u/AcronisBackup12.5/Release/AcronisBackup_12.5_64-bit.x86_64 -O installer \
    && chmod +x ./installer \
    && ./installer -v \
    && ./installer \
        --auto \
        --skip-prereq-check \
        --skip-svc-start \
        --web-server-port=9877 \
        --ams-tcp-port=7780 \
        --id=AcronisCentralizedManagementServer \
        --language=en \
        --debug \
    && rm installer

COPY rootfs/ /

EXPOSE 9877 7780

CMD [ "/bin/bash", "/init.sh" ]