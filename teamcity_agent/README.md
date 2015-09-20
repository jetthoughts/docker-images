```bash
docker build -t jetthoughts/teamcity-agent .
docker run  -v <path_to_boot2docker_dir>:/docker -v /tmp/teamcity_agent:/root -e DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY -e DOCKER_CERT_PATH="/docker" -e DOCKER_HOST=$DOCKER_HOST  -e TEAMCITY_SERVER=https://ci.jetthoughts.com -h agent_hostname -ti jetthoughts/teamcity-agent:latest
```
