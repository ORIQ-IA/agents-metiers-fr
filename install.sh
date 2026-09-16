#!/usr/bin/env bash
# Installe les agents metiers FR dans ~/.claude/agents/
#
# Avec Claude Code, preferez le marketplace de plugins :
#   /plugin marketplace add ORIQ-IA/agents-metiers-fr
#   /plugin install agents-secteurs-fr@oriq
#
# Ce script sert aux autres outils et a l'installation manuelle.
#
# Usage :
#   ./install.sh                 tous les agents
#   ./install.sh secteurs        seulement les 12 agents sectoriels
#   ./install.sh fonctions transverses   plusieurs groupes
#   FORCE=1 ./install.sh         ecrase les fichiers existants
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_AGENTS_DIR:-$HOME/.claude/agents}"

if [ "$#" -eq 0 ]; then
  groupes=(secteurs fonctions transverses)
else
  groupes=("$@")
fi

dirs=()
for g in "${groupes[@]}"; do
  d="$ROOT/plugins/agents-$g-fr/agents"
  [ -d "$d" ] || { echo "Groupe inconnu : $g (attendu : secteurs, fonctions, transverses)" >&2; exit 1; }
  dirs+=("$d")
done

mkdir -p "$DEST"

installed=0
skipped=0
while IFS= read -r f; do
  name="$(basename "$f")"
  if [ -e "$DEST/$name" ] && ! cmp -s "$f" "$DEST/$name" && [ "${FORCE:-0}" != "1" ]; then
    echo "  existe deja, ignore : $name  (FORCE=1 pour ecraser)"
    skipped=$((skipped + 1))
    continue
  fi
  cp "$f" "$DEST/$name"
  installed=$((installed + 1))
done < <(find "${dirs[@]}" -name '*.md' | sort)

echo
echo "$installed agent(s) installe(s) dans $DEST"
[ "$skipped" -gt 0 ] && echo "$skipped ignore(s), deja present(s) avec un contenu different"
echo
echo "Redemarrez votre agent pour qu'il les charge."
