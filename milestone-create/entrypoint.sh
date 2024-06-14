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

# Create the milestone by running the Qase CLI
qli testops milestone create -t "$TOKEN" -p "$PROJECT" --title "$TITLE" --description "$DESCRIPTION" --status "$STATUS" \
 --due-date "$DUE_DATE" $DEBUG


# Get the ID of the created milestone and write it to the output
MS_ID=$(< qase.env grep QASE_MILESTONE | cut -d'=' -f2)
echo "id=$MS_ID" >> "$GITHUB_OUTPUT"
