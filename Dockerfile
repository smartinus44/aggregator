FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

ENV HOME /usr/share/nginx/html

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    echo "{products: $PRODUCTS, assets: $ASSETS}" >  ${HOME}/index.html && \
    cat ${HOME}/index.html

USER 1001
