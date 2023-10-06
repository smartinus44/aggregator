FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    echo "{products: $PRODUCTS, assets: $ASSETS}" > /wwwdata/html/index.html && \
    ls -lZ cat /wwwdata/html/index.html

USER 1001
