#!/bin/zsh
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
SRC_SKILLS="$REPO_ROOT/skills"
SRC_RULES="$REPO_ROOT/rules"
DEST_ROOT="${CODEX_HOME:-$HOME/.codex}"
DEST_SKILLS="$DEST_ROOT/skills"
DEST_RULES="$DEST_ROOT/rules"
DRY_RUN=false
VERBOSE=false

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --verbose) VERBOSE=true ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is required but not installed." >&2
  exit 1
fi

mkdir -p "$DEST_SKILLS" "$DEST_RULES"

RSYNC_ARGS=(-a --delete)
$VERBOSE && RSYNC_ARGS+=(-v)
$DRY_RUN && RSYNC_ARGS+=(-n)

echo "Sync direction: repo -> runtime"
echo "Repo root: $REPO_ROOT"
echo "Runtime root: $DEST_ROOT"

for skill_dir in "$SRC_SKILLS"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  if [ "$skill_name" = ".system" ]; then
    echo "Skipping reserved runtime skill: $skill_name"
    continue
  fi
  echo "Syncing skill: $skill_name"
  rsync "${RSYNC_ARGS[@]}" "$skill_dir/" "$DEST_SKILLS/$skill_name/"
done

for rule_file in "$SRC_RULES"/*; do
  [ -f "$rule_file" ] || continue
  rule_name=$(basename "$rule_file")
  echo "Syncing rule: $rule_name"
  rsync "${RSYNC_ARGS[@]}" "$rule_file" "$DEST_RULES/$rule_name"
done

if $DRY_RUN; then
  echo "Dry run complete. No files were changed."
else
  echo "Sync to Codex runtime complete."
fi
