#!/bin/sh
# Emqttd start script
sed -i -e "s/^-name\s*.*@.*/-name emqttd@`hostname`/g" /opt/emqttd/etc/vm.args

/opt/emqttd/bin/emqttd start

sleep 10

if [ x$1 != x ]
then
    export EMQTTD_MASTER=$1
fi

echo "emqttd@`hostname`"

if [ x$EMQTTD_MASTER != x ]
then
    echo 'cluster slave mode'
    /opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'$EMQTTD_MASTER
    echo 'join emqttd@'$EMQTTD_MASTER
else
then
	echo 'cluster master mode'
fi

tail -f /opt/emqttd/log/*