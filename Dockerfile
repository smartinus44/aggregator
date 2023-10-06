FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1072

MAINTAINER Sylvain Martin

WORKDIR /

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    echo "{products: $PRODUCTS, assets: $ASSETS}" > /tmp/data.json

USER 1000