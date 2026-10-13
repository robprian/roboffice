#!/bin/sh
# Decodes the base64-encoded brand assets into their real binary files.
# The PNG/ICO binaries are stored as .b64 text so the rebrand can be pushed
# through text-only transports (GitHub MCP push_files). Run before the build.
set -eu
cd "$(dirname "$0")"
decode() {
  # $1 = .b64 source, $2 = destination
  mkdir -p "$(dirname "$2")"
  base64 -d "$1" > "$2"
  echo "decoded $2"
}
decode roboffice-mark-3d-512.png.b64 ../../public/assets/brand/roboffice-mark-3d-512.png
decode roboffice-icon-96.png.b64 ../../public/assets/brand/roboffice-icon-96.png
decode icon-512.png.b64 ../../public/icon-512.png
decode icon-192.png.b64 ../../public/icon-192.png
decode apple-icon.png.b64 ../../public/apple-icon.png
decode favicon.ico.b64 ../../public/favicon.ico
decode roboffice-mark-3d-512.png.b64 ../../src/app/apple-icon.png
decode favicon.ico.b64 ../../src/app/favicon.ico
