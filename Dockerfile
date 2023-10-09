FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

ENV HOME /usr/share/nginx/html
ENv SVC_NAME consenstest-git

USER 0

RUN PRODUCTS=$(curl $SVC_NAME/products) && \
    ASSETS=$(curl $SVC_NAME/assets) && \
    LEVELS=$(curl $SVC_NAME/levels) && \
    STAGES=$(curl $SVC_NAME/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  $HOME/index.html && \
    cat $HOME/index.html

USER 1001


# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"