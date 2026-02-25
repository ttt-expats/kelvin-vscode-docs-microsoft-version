#!/bin/bash
chown -R abc:abc /home/abc
chown -R abc:abc /kelvin
exec su -s /bin/bash abc -c 'code serve-web \
    --host 0.0.0.0 \
    --port 23888 \
    --without-connection-token \
    --accept-server-license-terms'
