#!/bin/sh

set -x
set -e

storjshare create --storj $STORJ_PAYMENT_ADDRESS --key $STORJ_NETWORK_PRIVATE_KEY --maxtunnels 10 \
                  --noedit --size 10GB --storage /storj/data --logdir /storj/logs -o /storj/config.json

storjshare daemon

storjshare start -c /storj/config.json

storjshare status
