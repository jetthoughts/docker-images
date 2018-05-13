#!/bin/sh

set -x
set -e

CONFIG=/storj/config.json
DATA=/storj/data
LOGS=/storj/logs

if [ ! -f "$CONFIG" ]; then
  STORGSHARE_ARGS="--storj $STORJ_PAYMENT_ADDRESS --maxtunnels 10 --noedit --size 10GB --storage $DATA --logdir $LOGS -o $CONFIG"

  if [ -n "$STORJ_NETWORK_PRIVATE_KEY" ]; then
    STORGSHARE_ARGS="$STORGSHARE_ARGS --key $STORJ_NETWORK_PRIVATE_KEY"
  fi
  storjshare create $STORGSHARE_ARGS
fi

mkdir -p $DATA $LOGS

storjshare daemon

storjshare status

storjshare start -c $CONFIG

storjshare status

while true; do sleep 10000; done
