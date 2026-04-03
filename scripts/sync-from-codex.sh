#!/bin/zsh
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
DEST_SKILLS="$REPO_ROOT/skills"
DEST_RULES="$REPO_ROOT/rules"
SRC_ROOT="${CODEX_HOME:-$HOME/.codex}"
SRC_SKILLS="$SRC_ROOT/skills"
SRC_RULES="$SRC_ROOT/rules"
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

echo "Sync direction: runtime -> repo"
echo "Runtime root: $SRC_ROOT"
echo "Repo root: $REPO_ROOT"
echo "Use this path mainly for recovery or bootstrap after accidental live edits."

for skill_dir in "$DEST_SKILLS"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  src_dir="$SRC_SKILLS/$skill_name"
  if [ ! -d "$src_dir" ]; then
    echo "Skipping missing runtime skill: $skill_name"
    continue
  fi
  echo "Syncing skill: $skill_name"
  rsync "${RSYNC_ARGS[@]}" "$src_dir/" "$skill_dir/"
done

for rule_file in "$DEST_RULES"/*; do
  [ -f "$rule_file" ] || continue
  rule_name=$(basename "$rule_file")
  src_file="$SRC_RULES/$rule_name"
  if [ ! -f "$src_file" ]; then
    echo "Skipping missing runtime rule: $rule_name"
    continue
  fi
  echo "Syncing rule: $rule_name"
  rsync "${RSYNC_ARGS[@]}" "$src_file" "$rule_file"
done

if $DRY_RUN; then
  echo "Dry run complete. No files were changed."
else
  echo "Sync from Codex runtime complete."
fi
