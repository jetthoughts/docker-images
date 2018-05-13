# Storj Share Daemon

Run daemon to share the space https://github.com/storj/storjshare-daemon

# Build

```shell
$ docker build -t miry/storjshare .
```

# Run

```shell
$ docker run -v $(pwd)/storj:/storj -t miry/storjshare create --storj $STORJ_PAYMENT_ADDRESS --key $STORJ_NETWORK_PRIVATE_KEY --maxtunnels 10 --noedit --size 10GB --storage /storj/data --logdir /storj/logs -o /storj/config.json
$ docker run -v $(pwd)/storj:/storj -P -t miry/storjshare daemon -F
$ docker run -v $(pwd)/storj:/storj -P -t miry/storjshare start --config /storj/config.json
$ docker run -v $(pwd)/storj:/storj -P -t miry/storjshare status
```
