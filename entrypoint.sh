#!/bin/bash
chown -R abc:abc /home/abc
chown -R abc:abc /kelvin

# Add mkdocs-serve alias if not already in .bashrc
grep -qxF "alias mkdocs-serve='mkdocs serve --dev-addr 0.0.0.0:8000'" /home/abc/.bashrc || \
    echo "alias mkdocs-serve='mkdocs serve --dev-addr 0.0.0.0:8000'" >> /home/abc/.bashrc

# Add reminder message if not already in .bashrc
grep -qxF "echo '💡 mkdocs-serve → runs mkdocs on 0.0.0.0:8000'" /home/abc/.bashrc || \
    echo "echo '💡 mkdocs-serve → runs mkdocs on 0.0.0.0:8000'" >> /home/abc/.bashrc

exec su -s /bin/bash abc -c 'code serve-web \
    --host 0.0.0.0 \
    --port 23888 \
    --without-connection-token \
    --accept-server-license-terms'
