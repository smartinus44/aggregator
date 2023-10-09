FROM registry.access.redhat.com/ubi8/nginx-120

MAINTAINER Sylvain Martin

# Add application sources
# ADD test-app/nginx.conf "${NGINX_CONF_PATH}"
# ADD test-app/nginx-default-cfg/*.conf "${NGINX_DEFAULT_CONF_PATH}"
# ADD test-app/nginx-cfg/*.conf "${NGINX_CONFIGURATION_PATH}"
# ADD test-app/*.html .

WORKDIR /

ENV SVC consenstest-git:8080
ENV HOME /usr/share/testpage

USER 0

RUN PRODUCTS=$(curl $SVC/products) && \
    ASSETS=$(curl $SVC/assets) && \
    LEVELS=$(curl $SVC/levels) && \
    STAGES=$(curl $SVC/stages) && \
    echo "{products: $PRODUCTS, assets: $ASSETS, levels: $LEVELS, stages: $STAGES}" >  ${HOME}/index.html && \
    chmod -R g=u ${HOME} && chmod -R g=u ${NGINX_APP_ROOT}/src && \
    chown -R nginx:nginx ${HOME} && chown -R 1001:0 ${NGINX_APP_ROOT}/src && \
    ls -alRh ${HOME}

USER 1001


# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"