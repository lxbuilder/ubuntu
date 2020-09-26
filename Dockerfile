# Ubuntu 20.04
FROM ubuntu:focal-20200925 as base

RUN rm -rf /var/cache/* /var/log/* && \
    tar -cf archive2.tar --exclude=./sys --exclude=./proc --exclude=./archive2.tar . && \
    tar -xf archive2.tar -C /tmp

FROM scratch

COPY --from=base /tmp /

CMD ["/bin/bash"]
