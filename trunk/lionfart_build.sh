#!/bin/bash
#
# chmod +x lionfart_build.sh
#
# This script will get latest site from github, then stop
# apache and jboss and restart.
#

SRC_DIR="/usr/src/lf"

service apache2 stop
service jbossas7 stop

if [ ! -d "/usr/src/lf" ]; then
    echo "Creating /usr/src/lf dir"
    mkdir /usr/src/lf
fi


#Initially get the repo.
#git clone https://github.com/zoroloco/lionfart.git /usr/src/lionfart

cd $SRC_DIR

#git pull
#always override on pull
git fetch origin master
git reset --hard FETCH_HEAD
git clean -df

cd $SRC_DIR/trunk

rm -rf $SRC_DIR/trunk/.metadata

mvn clean install -DskipTests -U -P ci

echo "Now deploying EAR file and standalone.xml files."

rm -f /usr/jboss/standalone/deployments/*.ear

cp $SRC_DIR/trunk/standalone.xml /usr/jboss/standalone/configuration/

cp -R $SRC_DIR/trunk/LionFartEar/target/*.ear /usr/jboss/standalone/deployments/

service jbossas7 start
service apache2 start
