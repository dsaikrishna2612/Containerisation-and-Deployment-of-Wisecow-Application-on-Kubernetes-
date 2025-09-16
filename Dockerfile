FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y git fortune-mod cowsay curl && \
    git clone https://github.com/dsaikrishna2612/wisecow.git /opt/wisecow && \
    chmod +x /opt/wisecow/wisecow.sh

EXPOSE 4499
CMD ["/opt/wisecow/wisecow.sh"]
