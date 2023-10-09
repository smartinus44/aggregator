FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

WORKDIR /

ENV HOME /usr/share/testpage
ENv SVC consenstest-git:8080

USER 0

RUN PRODUCTS=$(curl $SVC/products) && \
    ASSETS=$(curl $SVC/assets) && \
    LEVELS=$(curl $SVC/levels) && \
    STAGES=$(curl $SVC/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  $HOME/index.html && \
    cat $HOME/index.html && \
    chmod -R 0755 $HOME && \
    chown -R www-data:www-data $HOME

USER 1001


# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"