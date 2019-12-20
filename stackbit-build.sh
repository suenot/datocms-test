#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dfcb2008d389c001a834a22/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dfcb2008d389c001a834a22
curl -s -X POST https://api.stackbit.com/project/5dfcb2008d389c001a834a22/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dfcb2008d389c001a834a22/webhook/build/publish > /dev/null
