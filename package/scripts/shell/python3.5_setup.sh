set -eu

FILES_DIR=$1

# Abort if python2.7 already installed
if [ -e /usr/local/bin/python3.5 ]; then
  echo "Python3.5 already installed. Exiting."
  exit 0
fi

export PATH=$PATH:/usr/local/bin

tar -xzf $FILES_DIR/Python-3.5.3.tgz
echo "Installing Python-3.5.3.."
cd Python-3.5.3
make altinstall

# Install Jupyter
echo "Installing Jupyter"
pip3.5 install -r $FILES_DIR/requirements.txt
