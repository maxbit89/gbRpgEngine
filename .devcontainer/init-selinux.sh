#!/usr/bin/env bash

PROJECT_DIR="${PWD}"

if command -v selinuxenabled >/dev/null 2>&1 && selinuxenabled; then
    echo "SELinux detected. Ensuring correct context..."
    sudo semanage fcontext -a -t container_file_t "${PROJECT_DIR}(/.*)?" 2>/dev/null || true
    sudo restorecon -Rv "${PROJECT_DIR}"
else
    echo "SELinux not enabled. Skipping."
fi
