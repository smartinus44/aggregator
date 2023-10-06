FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

ENV HOME /usr/share/nginx/html

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    LEVELS=$(curl demo/levels) && \
    STAGES=$(curl demo/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  $HOME/index.html && \
    cat $HOME/index.html

USER 1001
