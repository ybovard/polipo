FROM alpine:latest

RUN apk add --no-cache build-base openssl git texinfo

RUN git clone https://github.com/jech/polipo.git /opt/polipo \
    && cd /opt/polipo \
    && make all

RUN apk del build-base openssl git

COPY polipo.conf /opt/polipo/main.conf

ENTRYPOINT [ "/opt/polipo/polipo" ]
CMD ["-c", "/opt/polipo/main.conf" ]
