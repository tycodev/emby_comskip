FROM linuxserver/emby:version-4.8.10.0
ARG ComSkipperVersion=2.1.0.0
RUN apt update && apt -y upgrade && apt install -y comskip unzip

RUN mkdir /comskip \
    && cd /comskip \
    && curl -JLO https://github.com/BillOatmanWork/Emby.ComSkipper/releases/download/v$ComSkipperVersion/ComSkipper.$ComSkipperVersion.zip \
    && unzip ComSkipper.$ComSkipperVersion.zip \
    && mv *.dll /app/emby/system/plugins/ \
    && cd / \
    && rm -rf comskip

COPY comskip.ini /
COPY comskip.sh /
