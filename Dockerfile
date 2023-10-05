FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1072

RUN $PRODUCT = (curl demo/products) && \
    $ASSETS = (curl demo/assets) && \
    echo {products: $PRODUCT, assets: $ASSETS} > data.json
