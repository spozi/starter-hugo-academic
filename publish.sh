#!/usr/bin/env bash
set -e

PAGES_REPO="/Users/muhammadsyafiq/Developments/spozi-github"
BASE_URL="https://spozi.github.io/"
MSG="${1:-rebuild site}"

echo "==> Building site..."
./hugo087 --gc --minify -b "$BASE_URL"

echo "==> Syncing to GitHub Pages repo..."
rsync -a --delete --exclude='.git' public/ "$PAGES_REPO/"

echo "==> Committing and pushing..."
cd "$PAGES_REPO"
git add -A
git commit -m "$MSG"
git push origin master

echo "==> Done! Site will be live at $BASE_URL shortly."
