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

echo $SLUG

# Create the environment by running the Qase CLI
qli testops env create -t "$TOKEN" -p "$PROJECT" --title "$TITLE" --slug "$SLUG" \
 --description "$DESCRIPTION" --host "$HOST" $DEBUG


# Get the slug of the created environment and write it to the output
ENV_SLUG=$(< qase.env grep QASE_ENVIRONMENT | cut -d'=' -f2)
echo "id=$ENV_SLUG" >> "$GITHUB_OUTPUT"
