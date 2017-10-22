#!/usr/bin/env sh

set -e

touch /response

statusCode=$(curl \
    --silent \
    --output \
    /response \
    --write-out "%{http_code}" \
    -X POST "${startUrl}" \
    -d @/startData \
    --header "Content-Type: application/json")

if test "$statusCode" -ne 202; then
echo "$(cat /response)"
exit 1
fi
cat /response > /instanceId