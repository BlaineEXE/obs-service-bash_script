#!/usr/bin/env bash

if shellcheck bash_script; then
  cat <<EOF

    LINT PASSED!

EOF
else
  cat <<EOF

    LINT FAILED!

EOF
fi
