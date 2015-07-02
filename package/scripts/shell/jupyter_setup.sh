set -eu

ROOT_DIR=$1
FILES_DIR=$2
SPARK_HOME=$3
JUPYTER_PORT=$4
BASH_PROFILE=$ROOT_DIR/.bashrc

# Copy and configure profile and example notebooks
cp $FILES_DIR/jupyter_notebook_config.py $ROOT_DIR/.jupyter/
sed -i '6s@.*@c.NotebookApp.port = '$JUPYTER_PORT'@' $ROOT_DIR/.jupyter/jupyter_notebook_config.py

# Copy & configure kernels
#cp -R $FILES_DIR/kernels $ROOT_DIR/.ipython/
# Set params for Scala kernel
#sed -i '5s@.*@"'$SPARK_HOME'/bin/spark-submit",@' $ROOT_DIR/.ipython/kernels/scala/kernel.json
#sed -i '8s@.*@"'$ROOT_DIR'/.ipython/kernels/scala/ispark-core-assembly-0.2.0-SNAPSHOT.jar",@' $ROOT_DIR/.ipython/kernels/scala/kernel.json

# Set up bashrc for ipython user
echo "export HADOOP_HOME=/usr/hdp/current/hadoop-client" > $BASH_PROFILE
echo "export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk.x86_64"  >> $BASH_PROFILE
echo "export YARN_CONF_DIR=/etc/hadoop/conf" >> $BASH_PROFILE
echo "export HADOOP_CONF_DIR=/etc/hadoop/conf" >> $BASH_PROFILE
echo "export PATH=$PATH:/usr/local/bin" >> $BASH_PROFILE
echo "export SPARK_HOME=$SPARK_HOME/" >> $BASH_PROFILE
echo 'export PYSPARK_PYTHON="/usr/local/bin/python3.5"' >> $BASH_PROFILE
echo 'export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH' >> $BASH_PROFILE
