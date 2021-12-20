FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed bash ; \
useradd builder -m -u 1001; \
mkdir /build ; \
chown -R builder: /build

COPY entrypoint.sh /entrypoint.sh

WORKDIR /build

ENTRYPOINT ["/entrypoint.sh"]
