FROM ubuntu:bionic

LABEL maintainer="Mark Lopez <m@silvenga.com>"

RUN set -xe \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
        netcat \
        curl \
        # Server Requirements
        rpm \
        postgresql-contrib \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && curl https://dl.acronis.com/u/AcronisBackup12.5/Release/AcronisBackup_12.5_64-bit.x86_64 -o /opt/installer \
    && chmod +x /opt/installer \
    && /opt/installer -v

COPY rootfs/ /

EXPOSE 9877 7780

CMD [ "/bin/bash", "/opt/start.sh" ]
