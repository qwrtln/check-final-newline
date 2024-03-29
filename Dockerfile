FROM alpine:3.19
COPY lint.sh /lint.sh
ENTRYPOINT ["/lint.sh"]
