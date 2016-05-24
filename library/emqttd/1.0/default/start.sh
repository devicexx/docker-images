#!/bin/sh
# Emqttd start script
SELF_HOST=$(hostname)
SELF_IP=$(cat /etc/hosts | grep ${SELF_HOST} | awk '{print $1}')
MASTER_IP=$(cat /etc/hosts | grep ${EMQTTD_MASTER_NAME} | awk '{print $1}')

sed -i -e "s/^-name\s*.*@.*/-name emqttd@${SELF_IP}/g" /opt/emqttd/etc/vm.args

/opt/emqttd/bin/emqttd start

# wait and ensure emqttd status is running
while [ x$(/opt/emqttd/bin/emqttd_ctl status |grep 'is running'|awk '{print $1}') = x ]
do  
    sleep 1
    echo '['$(date -u +"%Y-%m-%dT%H:%M:%SZ")']:waiting emqttd'
done

echo '['$(date -u +"%Y-%m-%dT%H:%M:%SZ")']:emqttd start'

if [ x$EMQTTD_MASTER_HOST != x ]
then
    MASTER_HOST=$EMQTTD_MASTER_HOST
    echo 'use master host'${MASTER_HOST}
fi

if [ x$1 != x ]
then
    MASTER_HOST=$1
    echo 'use master host'${MASTER_HOST}
fi

echo 'emqttd@'${SELF_IP}

if [ x$MASTER_HOST != x ]
then
    MASTER_IP=$(cat /etc/hosts | grep ${MASTER_HOST} | awk '{print $1}')
    if [ x$MASTER_IP = x ]
    then
        MASTER_IP=$MASTER_HOST
        echo 'local network not have master host'${MASTER_HOST}
    fi
    echo 'cluster slave mode'
    /opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'${MASTER_IP}
    echo 'join emqttd@'${MASTER_IP}

else
    if [ x$MASTER_IP != x ] && [ $MASTER_IP != $SELF_IP ]
    then
        echo 'cluster slave mode'
        /opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'${MASTER_IP}
        echo 'join emqttd@'${MASTER_IP}
    else
        echo 'cluster master mode'
    fi
fi

echo '['$(date -u +"%Y-%m-%dT%H:%M:%SZ")']:emqttd running'
while [ x$(/opt/emqttd/bin/emqttd_ctl status |grep 'is running'|awk '{print $1}') != x ]
do  
    sleep 10
    echo '['$(date -u +"%Y-%m-%dT%H:%M:%SZ")']:emqttd running'
done

tail $(ls /opt/emqttd/log/*)

echo '['$(date -u +"%Y-%m-%dT%H:%M:%SZ")']:emqttd stop'