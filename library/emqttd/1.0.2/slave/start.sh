#!/bin/sh
export PATH=$PATH:/opt/emqttd/bin
sed -i -e "s/^-name\s*.*@.*/-name emqttd@`hostname`/g" /opt/emqttd/etc/vm.args
/opt/emqttd/bin/emqttd start
sleep 10
/opt/emqttd/bin/emqttd_ctl cluster join 'emqttd@'$EMQTTD_MASTER
tail -f /opt/emqttd/log/*