# Ubuntu 20.04
FROM ubuntu:focal-20200925 as base

RUN rm -rf /var/cache/* /var/log/* && \
    tar -cf archive.tar --exclude=./sys --exclude=./proc --exclude=./archive.tar . && \
    tar -xf archive.tar -C /tmp && \
    rm archive.tar

FROM scratch

COPY --from=base /tmp /

CMD ["/bin/bash"]
