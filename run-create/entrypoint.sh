#!/usr/bin/env bash

set -e

# Required parameters
TOKEN=$1
PROJECT=$2
TITLE=$3
DESCRIPTION=$4
ENVIRONMENT=$5
MILESTONE=$6
PLAN=$7
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

# Create the test run by running the Qase CLI
"$CMD" testops run create -t "$TOKEN" -p "$PROJECT" --title "$TITLE" --description "$DESCRIPTION" \
  --environment "$ENVIRONMENT" --milestone "$MILESTONE" --plan "$PLAN" $DEBUG


# Get the ID of the created test run and write it to the output
RUN_ID=$(< qase.env grep QASE_TESTOPS_RUN_ID | cut -d'=' -f2)
echo "ID = $RUN_ID"
echo "id=$RUN_ID" >> "$GITHUB_OUTPUT"
