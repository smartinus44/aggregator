FROM registry.access.redhat.com/ubi8/ubi-minimal:8.8-1072

RUN PRODUCTS=$(curl demo/products) && \
    ASSETS=$(curl demo/assets) && \
    echo "{products: $PRODUCTS, assets: $ASSETS}" > data.json
