#!/usr/bin/env bash

set -e

EXCLUDE_LIST="(_db|portainer|broker|traefik|prune|logspout|SwarmPort_portainer|SwarmPort_agent|NAME)"

for service in $(docker service ls | egrep -v $EXCLUDE_LIST |
                 awk '{print $2}'); do
  docker service update --force $service
done