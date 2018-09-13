FROM binpar/dockerimages:base

ENV TMP_DIR /tmp
COPY scripts $TMP_DIR

RUN sh $TMP_DIR/init.sh

CMD ["/bin/sh"]
