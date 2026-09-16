#!/usr/bin/env bash
# Installe les agents metiers FR dans ~/.claude/agents/
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/agents"
DEST="${CLAUDE_AGENTS_DIR:-$HOME/.claude/agents}"

[ -d "$SRC" ] || { echo "Erreur : dossier agents/ introuvable." >&2; exit 1; }

mkdir -p "$DEST"

installed=0
skipped=0
while IFS= read -r f; do
  name="$(basename "$f")"
  if [ -e "$DEST/$name" ] && ! cmp -s "$f" "$DEST/$name"; then
    if [ "${FORCE:-0}" != "1" ]; then
      echo "  existe deja, ignore : $name  (FORCE=1 pour ecraser)"
      skipped=$((skipped + 1))
      continue
    fi
  fi
  cp "$f" "$DEST/$name"
  installed=$((installed + 1))
done < <(find "$SRC" -name '*.md' | sort)

echo
echo "$installed agent(s) installe(s) dans $DEST"
[ "$skipped" -gt 0 ] && echo "$skipped ignore(s), deja present(s) avec un contenu different"
echo
echo "Redemarrez votre agent pour qu'il les charge."
