FROM alekzonder/puppeteer:latest
LABEL name="node-chrome"

ENV METEORD_DIR /opt/app

COPY scripts $METEORD_DIR

RUN bash $METEORD_DIR/init.sh

EXPOSE 80

ENTRYPOINT [ "bash", "${METEORD_DIR}/run_app.sh" ]