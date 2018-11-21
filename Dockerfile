FROM alpine:3.6
ENV AWSCLI_VERSION "1.16.58"
ENV KUBE_LATEST_VERSION="v1.12.2"
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        curl \
        mailcap \
        && \
    pip install --upgrade awscli==${AWSCLI_VERSION} s3cmd python-magic && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl  && \
    chmod +x /usr/local/bin/kubectl  && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
