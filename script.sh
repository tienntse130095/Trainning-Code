export JAVA_HOME=/usr/lib/jvm/jdk_11
export PATH=$PATH:$JAVA_HOME/bin
NEXUS_BASE_URL=http://192.168.12.131:8081/repository/nhat-tien-releases/com/training/cicd/lam-nhat-tien/1.0
APACHE_TOMCAT=/opt/tomcat
PASSWD_USER=Avata123
REPO=lam-nhat-tien.war
NAME=$1


echo "Start download repo from nexus ..."
echo $PASSWD_USER | sudo -S -k wget -O $APACHE_TOMCAT/webapps/$REPO $NEXUS_BASE_URL/lam-nhat-tien-1.0.war
echo $PASSWD_USER | sudo -S -k chown -R tomcat:tomcat $APACHE_TOMCAT/webapps/$REPO
echo $PASSWD_USER | sudo -S -k systemctl restart tomcat

if echo $PASSWD_USER | sudo -S -k [ -f "$APACHE_TOMCAT/webapps/$REPO" ]; then
        echo "$REPO have been download successful. Your web site have been deploy by $NAME"
else
        echo "Can not download file $REPO. Please check your connection to  maven repository"
fi