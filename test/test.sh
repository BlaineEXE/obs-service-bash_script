#!/usr/bin/env bash

trap 'exit_trap' EXIT
function exit_trap () {
  if [ $? -ne 0 ]; then
    # Print failure message on any nonzero exit
    cat <<EOF

    TEST DID NOT PASS!

EOF
  fi
}

error () { echo "bash_script $1"; exit 1; }
set -x

# Test that the expected script is called
output="$(./bash_script --script "test/test-script.sh")"
if [[ ! "${output}" == "test-script.sh executed successfully" ]]; then
  error "did not execute test-script.sh"
fi

# Test that the expected script is
if ! ./bash_script --script "test/test-script.sh" ; then
  error "called test-script.sh, but it still returned error"
fi

if ./bash_script --script "test/this-script-does-not-exist.sh" ; then
  error "did not fail for nonexistent file"
fi

if ./bash_script ; then
  error "did not fail with no --script input"
fi

set +x
cat <<EOF

    TESTS SUCCESSFUL!

EOF
