# Docker Images

- centos7
- teamcity-agent
- kubernetes
- ruby

# Release

```
$ make kubernetes KUBE_VERSION=v1.14.0-beta.1
$ make ruby-chrome
```

# Analyze

Used https://github.com/wagoodman/dive to check common problems of images.


```shell
$ make ruby-chrome-analyze
```
