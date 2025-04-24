#!/usr/bin/env bash

set -e

# Required parameters
TOKEN=$1
PROJECT=$2
TITLE=$3
DESCRIPTION=$4
STATUS=$5
DUE_DATE=$6
VERBOSE=$7

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

# Create the milestone by running the Qase CLI
"$CMD" testops milestone create -t "$TOKEN" -p "$PROJECT" --title "$TITLE" --description "$DESCRIPTION" --status "$STATUS" \
 --due-date "$DUE_DATE" $DEBUG

# Get the ID of the created milestone and write it to the output
MS_ID=$(< qase.env grep QASE_MILESTONE | cut -d'=' -f2)
echo "id=$MS_ID" >> "$GITHUB_OUTPUT"
