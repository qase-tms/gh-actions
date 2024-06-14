#!/usr/bin/env bash

set -e

# Required parameters
TOKEN=$1
PROJECT=$2
ID=$3
FORMAT=$4
RESULT_PATH=$5
BATCH=$6
STEPS=$7
VERBOSE=$8

DEBUG=""
if [ "$VERBOSE" == "true" ]; then
    DEBUG="--verbose"
fi

# Upload test results to Qase TMS
qli testops result upload -t "$TOKEN" -p "$PROJECT" --id "$ID" --format "$FORMAT" \
  --path "$RESULT_PATH" --batch "$BATCH" --steps "$STEPS" $DEBUG
