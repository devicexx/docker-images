#!/bin/sh
# Emqttd start script
SELF_HOST=$(hostname)
SELF_IP=$(cat /etc/hosts | grep ${SELF_HOST} | awk '{print $1}')

sed -i -e "s/^-name\s*.*@.*/-name emqttd@${SELF_IP}/g" /opt/emqttd/etc/vm.args

/opt/emqttd/bin/emqttd console &

sleep 10

if [ x$EMQTTD_MASTER != x ]
then
    MASTER_HOST=$EMQTTD_MASTER
fi

if [ x$1 != x ]
then
    MASTER_HOST=$1
fi

echo 'emqttd@'${SELF_IP}

if [ x$MASTER_HOST != x ]
then
	MASTER_IP=$(cat /etc/hosts | grep ${MASTER_HOST} | awk '{print $1}')
	if [ x$MASTER_IP = x ]
    then
        MASTER_IP=$MASTER_HOST
    fi
    echo 'cluster slave mode'
    /opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'${MASTER_IP}
    echo 'join emqttd@'${MASTER_IP}

else
	echo 'cluster master mode'
fi

fg