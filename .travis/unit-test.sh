#!/bin/bash

set -e
errors=0

# Run unit tests
python chimera_align/chimera_align_test.py || {
    echo "'python python/chimera_align/chimera_align_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E chimera_align/*.py || {
    echo 'pylint -E chimera_align/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
