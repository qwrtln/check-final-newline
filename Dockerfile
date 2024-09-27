FROM alpine/git:2.45.2
COPY lint.sh /lint.sh
ENTRYPOINT ["/lint.sh"]
