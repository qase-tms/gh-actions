#!/usr/bin/env bash

set -e

# Required parameters
TOKEN=$1
PROJECT=$2
ID=$3
VERBOSE=$4

DEBUG=""
if [ "$VERBOSE" == "true" ]; then
    DEBUG="--verbose"
fi

# Complete the test run using the TestOps CLI
qli testops run complete -t "$TOKEN" -p "$PROJECT" --id "$ID" $DEBUG

# Get the ID of the completed test run and write it to the output
echo "id=$ID" >> "$GITHUB_OUTPUT"
