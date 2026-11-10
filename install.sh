#!/bin/bash
# Instalador do Vistoria Mac. No terminal do Mac:
#   curl -fsSL https://raw.githubusercontent.com/vianx7/macbook-checker/main/install.sh | bash
set -e
BASE="${MBC_BASE:-https://raw.githubusercontent.com/vianx7/macbook-checker/main}"
DIR="${TMPDIR:-/tmp}/macbook-checker"

mkdir -p "$DIR"
echo "⬇️  Baixando o Vistoria Mac..."
curl -fsSL "$BASE/index.html" -o "$DIR/index.html"
curl -fsSL "$BASE/check.sh"   -o "$DIR/check.sh"
curl -fsSL "$BASE/server.pl"  -o "$DIR/server.pl"
chmod +x "$DIR/check.sh"

# </dev/tty: quando vem de "curl | bash", o stdin é o próprio script
exec bash "$DIR/check.sh" </dev/tty
