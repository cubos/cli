FROM node:22-alpine

RUN npm i -g ejs-cli ts-node typescript @cubos/kube-templates @types/node@~24 firebase-tools && npm cache clean --force

RUN apk add --update docker libc6-compat libssl3 git nano openssh python3 py3-pip py3-cffi py3-cryptography findutils gettext bash jq ca-certificates moreutils curl ruby docker-cli openssl aws-cli php php-phar php-mbstring && \
    pip install --upgrade pip --break-system-packages && \
    apk add --virtual build-deps gcc libffi-dev python3-dev linux-headers musl-dev openssl-dev && \
    pip install s3cmd yq --break-system-packages && \
    apk del build-deps && \
    rm -rf /var/cache/apk/*

COPY --from=composer:2.6 /usr/bin/composer /usr/local/bin/composer

ENV CLOUDSDK_INSTALL_DIR /usr/local/gcloud/
ARG CLOUD_SDK_VERSION=479.0.0
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && /google-cloud-sdk/install.sh --additional-components kubectl --path-update true --usage-reporting false
ENV PATH $PATH:/google-cloud-sdk/bin

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

WORKDIR /

COPY kubectl/* /bin/
COPY docker/* /bin/
COPY sites/deploy /bin/deploy_site
COPY sites/undeploy /bin/undeploy_site
COPY s3/s3cfg_from_env /bin/
COPY helm/upload_chart /bin/
COPY gcs/gsutil_auth_from_env /bin/

COPY scripts/ /bin/
COPY gcs/boto.ini /root/.boto
