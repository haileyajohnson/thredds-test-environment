#!/usr/bin/bash
set -e

while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo '...waiting for cloud-init to finish...'; sleep 1; done
