#!/bin/bash

if [ "$FULLTEXTSEARCH_ENABLED" != yes ] && [ -f "/mnt/ncdata/fts-test.done" ]; then
    # Basically sleep for forever if fulltextsearch is not enabled OR failed startup testing
    sleep inf
fi
while ! nc -z "$NC_DOMAIN" 443; do
    sleep 5
done
sleep 10
echo "Activating fulltextsearch indexer..."
php /var/www/html/occ fulltextsearch:live -q
sleep inf
