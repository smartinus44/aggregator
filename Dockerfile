FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin <symartin@redhat.com>

ENV SVC consenstest-git:8080
ENV HOME /usr/share/nginx/html

USER 0

RUN PRODUCTS=$(curl $SVC/products) && \
    ASSETS=$(curl $SVC/assets) && \
    LEVELS=$(curl $SVC/levels) && \
    STAGES=$(curl $SVC/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  ${HOME}/index.html && \
    chgrp -R 0 ${HOME} && \
    chmod -R g=u ${HOME}

USER 1001

# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"