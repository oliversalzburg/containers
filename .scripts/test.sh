#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

cd "$(dirname "$0")"

main() {
  set +o errexit
  timeout --signal=SIGTERM 30 "$@"
  if [ $? -eq 124 ]; then
    echo "The command ran for 30 seconds."
    exit 0
  fi
  echo "Failing due to early exit."
  exit 1
}

main "$@"
