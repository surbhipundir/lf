#!/bin/bash
#
# chmod +x lionfart_build.sh
#
# This script will get latest site from github, then stop
# apache and jboss and restart.
#

SRC_DIR="/usr/src/lf"
JBOSS_DIR="/usr/local/jboss7"

service apache2 stop
service jboss stop

echo "Creating source directory(if needed)"
if [ ! -d "/usr/src/lf" ]; then
    echo "Creating /usr/src/lf dir"
    mkdir /usr/src/lf
fi

cd $SRC_DIR

#Initially get the repo.
#git clone https://github.com/zoroloco/lf.git /usr/src/lf

#git pull
#always override on pull
echo "Grabbing latest source code from GIT Repo  @https://github.com/zoroloco/lf.git"
git fetch origin master
git reset --hard FETCH_HEAD
git clean -df

cd $SRC_DIR/trunk/lionfart

#echo "Deleting .metadata directory(if needed)"
#rm -rf $SRC_DIR/trunk/.metadata

echo "Now doing a maven install(may take a couple minutes...)"
#mvn clean install -DskipTests -U -P ci
mvn install package

#echo "Now copying over latest standalone.xml to jboss dir"
#cp $SRC_DIR/trunk/standalone.xml /usr/jboss/standalone/configuration/

#echo "Now copying over latest settings.xml to user .m2 dir so maven can work"
#cp $SRC_DIR/trunk/.m2/settings.xml /root/.m2/

echo "Now deploying JAR/WAR/EAR file(s) to JBOSS_HOME"
rm -rf $SRC_DIR/trunk/lionfart/target/*
rm -f $JBOSS_DIR/standalone/deployments/lionfart.war
touch $JBOSS_DIR/standalone/deployments/lionfart.war.dodeploy

chown jboss $JBOSS_DIR/standalone/deployments/lionfart.war.dodeploy
chgrp jboss $JBOSS_DIR/standalone/deployments/lionfart.war.dodeploy

cp -R $SRC_DIR/trunk/lionfart/target/lionfart.war $JBOSS_DIR/standalone/deployments

echo "Now lets start up jboss and apache again and hope this all works!"
service jboss start
service apache2 start
