#!/bin/sh
# Emqttd start script
HOSTNAME = `hostname`
IP_ADDR = `cat /etc/hosts | grep $HOSTNAME | awk '{print $1}'`
sed -i -e "s/^-name\s*.*@.*/-name emqttd@$IP_ADDR/g" /opt/emqttd/etc/vm.args

/opt/emqttd/bin/emqttd start

sleep 10

if [ x$1 != x ]
then
    export EMQTTD_MASTER=$1
fi

echo 'emqttd@'$HOSTNAME

if [ x$EMQTTD_MASTER != x ]
then
    echo 'cluster slave mode'
    /opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'$EMQTTD_MASTER
    echo 'join emqttd@'$EMQTTD_MASTER
else
	echo 'cluster master mode'
fi

tail -f /opt/emqttd/log/*