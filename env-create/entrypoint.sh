#!/usr/bin/env bash

set -e

# Required parameters
TOKEN=$1
PROJECT=$2
TITLE=$3
SLUG=$4
DESCRIPTION=$5
HOST=$6
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

# Create the environment by running the Qase CLI
"$CMD" testops env create -t "$TOKEN" -p "$PROJECT" --title "$TITLE" --slug "$SLUG" \
 --description "$DESCRIPTION" --host "$HOST" $DEBUG

# Get the slug of the created environment and write it to the output
ENV_SLUG=$(< qase.env grep QASE_ENVIRONMENT | cut -d'=' -f2)
echo "id=$ENV_SLUG" >> "$GITHUB_OUTPUT"
