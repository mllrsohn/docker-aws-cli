FROM alpine:3.6
ENV AWSCLI_VERSION "1.16.58"
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==${AWSCLI_VERSION} s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
