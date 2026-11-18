#!/usr/bin/env bash
set -euo pipefail

# Publish a skill into the existing public GitHub repository without overwriting existing modules.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHECKOUT="$(mktemp -d)"
trap 'rm -rf "$CHECKOUT"' EXIT
SKILL=".agents/skills/hack-penulisan-akademik"
DOCS="docs/hack-penulisan-akademik"

command -v git >/dev/null || { echo "Git tidak tersedia." >&2; exit 1; }
git clone --depth 1 --branch main "https://github.com/Akbaras14/Skill-hack-skripsi.git" "$CHECKOUT"

# Refuse silent replacements if the target already exists.
[[ ! -e "$CHECKOUT/$SKILL" && ! -e "$CHECKOUT/$DOCS" ]] \
    || { echo "Target sudah ada; hentikan untuk mencegah overwrite." >&2; exit 1; }

mkdir -p "$CHECKOUT/.agents/skills" "$CHECKOUT/docs"
cp -R "$ROOT/$SKILL" "$CHECKOUT/$SKILL"
cp -R "$ROOT/$DOCS" "$CHECKOUT/$DOCS"

# Add a non-destructive entry point to the existing README.
if [[ -f "$CHECKOUT/README.md" ]] && ! grep -q 'docs/hack-penulisan-akademik/README.md' "$CHECKOUT/README.md"; then
  tmp="$(mktemp)"
  printf '> **Skill baru:** [Hack Penulisan Akademik (120 aturan)](docs/hack-penulisan-akademik/README.md)\n> Instal: `npx skills add Akbaras14/Skill-hack-skripsi --skill hack-penulisan-akademik`\n\n' > "$tmp"
  cat "$CHECKOUT/README.md" >> "$tmp"
  mv "$tmp" "$CHECKOUT/README.md"
fi

cd "$CHECKOUT"
git add -- "$SKILL" "$DOCS" README.md
git commit -m "feat: publish academic writing agent skill (120 rules)"
git push origin main
echo "Berhasil: https://github.com/Akbaras14/Skill-hack-skripsi/tree/main/$SKILL"
