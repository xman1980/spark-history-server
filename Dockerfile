ARG SPARK_IMAGE=datamechanics/spark:3.1.2-latest
FROM ${SPARK_IMAGE}
USER root


RUN groupadd -g 185 spark && \
    useradd -u 185 -g 185 spark

USER 185

ENTRYPOINT ["/opt/entrypoint.sh"]
