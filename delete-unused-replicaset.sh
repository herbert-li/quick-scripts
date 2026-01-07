#!/bin/bash

oc get rs -A --no-headers \
| awk '$3==0 && $4==0 && $5==0 {print $1, $2}' \
| while read ns name; do
    echo "Deleting $ns/$name"
    oc delete rs "$name" -n "$ns"
  done
