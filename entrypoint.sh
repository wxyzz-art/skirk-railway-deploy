#!/bin/sh
set -e
if [ ! -f /data/exit.json ] && [ -n "$SKIRK_EXIT_JSON_B64" ]; then
  echo "$SKIRK_EXIT_JSON_B64" | base64 -d > /data/exit.json
fi
exec skirk serve-exit --config /data/exit.json
