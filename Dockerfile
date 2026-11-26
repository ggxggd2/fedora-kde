
FROM docker.io/library/fedora:latest

RUN dnf -y update && \
    dnf -y group install "KDE Plasma Workspaces" && \
    dnf -y install \
      xorg-x11-server-Xvfb \
      x11vnc \
      novnc \
      python3-websockify \
      dbus-x11 \
      supervisor \
      procps-ng \
    && dnf clean all

COPY supervisord.conf /etc/supervisord.conf
COPY start-desktop.sh /start-desktop.sh

RUN chmod +x /start-desktop.sh

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
