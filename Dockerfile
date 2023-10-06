FROM registry.redhat.io/rhscl/nginx-120-rhel7:1-65

MAINTAINER Sylvain Martin

WORKDIR /

ENV HOME /usr/share/nginx/html

USER 0

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    LEVELS=$(curl demo/levels) && \
    STAGES=$(curl demo/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  $HOME/index.html && \
    cat $HOME/index.html

USER 1001
