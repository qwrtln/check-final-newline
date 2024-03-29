FROM alpine/git:2.43.0
COPY lint.sh /lint.sh
ENTRYPOINT ["/lint.sh"]
