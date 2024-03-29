FROM alpine:3.19
RUN apk add --no-cache git
COPY lint.sh /lint.sh
ENTRYPOINT ["/lint.sh"]
