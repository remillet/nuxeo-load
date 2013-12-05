#!/usr/bin/env bash
set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

# change the default password and don't commit to revision control
NUXEO_ADMIN_PASS=${NUXEO_ADMIN_PASS="Administrator"}

api_get() {
  echo "$1:"
  curl --basic -u "Administrator:$NUXEO_ADMIN_PASS" "http://localhost:8080/nuxeo/site/fileImporter/$1"
  echo ""
}

