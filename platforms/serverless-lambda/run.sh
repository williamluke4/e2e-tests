#!/bin/sh

set -eux

yarn install


yarn tsc

serverless deploy --region "$AWS_DEFAULT_REGION"
