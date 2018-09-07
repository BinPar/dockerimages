FROM ubuntu:18.04

ENV TMP_DIR /tmp
COPY scripts $TMP_DIR

RUN bash $TMP_DIR/init.sh

CMD ["/bin/bash"]
