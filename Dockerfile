FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    echo "{products: $PRODUCTS, assets: $ASSETS}" >  /var/www/html/index.html && \
    cat /var/www/html/index.html

USER 1001
