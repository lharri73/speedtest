FROM ubuntu:18.04

RUN apt update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61 && \
    echo "deb https://ookla.bintray.com/debian bionic main" | tee  /etc/apt/sources.list.d/speedtest.list && \
    apt update && \
    apt install -y \ 
    speedtest \
    cron && \
    rm -rf /var/apt/lists

RUN speedtest --accept-license
COPY src/test.sh opt/test.sh

COPY src/test-cron etc/cron.d/test-cron
RUN chmod +x /opt/test.sh && \
    chmod +x /etc/cron.d/test-cron

RUN crontab /etc/cron.d/test-cron
RUN mkdir /opt/results && \
    touch /opt/results/values.csv

CMD ["cron", "-f"]
