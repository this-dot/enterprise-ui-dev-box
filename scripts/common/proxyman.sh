#!/bin/sh

cd /tmp/

VERSON=master

curl https://codeload.github.com/this-dot/ProxyMan/tar.gz/master | tar xvz
sudo mv /tmp/ProxyMan-master /usr/local/src/proxyman

sudo tee /usr/local/bin/proxyman > /dev/null << EOL
#!/bin/sh

cd /usr/local/src/proxyman
./main.sh
EOL

sudo chmod +x /usr/local/bin/proxyman