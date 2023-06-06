ARG SPARK_IMAGE=gcr.io/spark-operator/spark:v3.0.0
FROM ${SPARK_IMAGE}

# Add the connector jar needed to access Google Cloud Storage using the Hadoop FileSystem API.
ADD https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar $SPARK_HOME/jars

# Add dependency for hadoop-aws
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.375/aws-java-sdk-bundle-1.11.375.jar $SPARK_HOME/jars
# Add hadoop-aws to access Amazon S3
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar $SPARK_HOME/jars

# Add dependency for hadoop-azure
ADD https://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar $SPARK_HOME/jars
# Add hadoop-azure to access Azure Blob Storage
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar $SPARK_HOME/jars

ENTRYPOINT ["/opt/entrypoint.sh"]
