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

# Check if the command line tools are installed
if command -v qli &> /dev/null; then
  CMD="qli"
elif command -v qasectl &> /dev/null; then
  CMD="qasectl"
else
  echo "Can not found executable qli or qasectl"
  exit 1
fi

# Upload test results to Qase TMS
"$CMD" testops result upload -t "$TOKEN" -p "$PROJECT" --id "$ID" --format "$FORMAT" \
  --path "$RESULT_PATH" --batch "$BATCH" --steps "$STEPS" $DEBUG
