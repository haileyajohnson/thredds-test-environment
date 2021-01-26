#!/usr/bin/bash
set -ex

# Must match what is in bootstrap-common.sh.
ANSIBLE_CONFIG_DIR=/ansible_config

# Check that we are root, and if not, use sudo to run commands.
SUDO_CMD=""
if [ "$EUID" -ne 0 ]; then
    SUDO_CMD="sudo"
fi

# Remove ansible.
${SUDO_CMD} apt remove --yes ansible

# Remove custom ansible config.
${SUDO_CMD} rm -rf ${ANSIBLE_CONFIG_DIR}

# Remove dangling dependencies.
${SUDO_CMD} apt autoremove --purge --yes

# Clear out the apt cache.
${SUDO_CMD} apt-get clean --yes
