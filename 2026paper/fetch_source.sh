#!/usr/bin/env bash
set -euo pipefail

# fetch_source.sh
# Usage: run from a machine with git + rsync installed. This script clones
# the upstream repo and copies the Journal-of-the-American-Chemical-Society-Skills
# subtree into the local repo under path 2026paper/

SRC_REPO="https://github.com/brycewang-stanford/Awesome-Journal-Skills.git"
SRC_SUBDIR="Journal-of-the-American-Chemical-Society-Skills"
DEST_DIR="2026paper"
WORKDIR=$(mktemp -d)

echo "Cloning ${SRC_REPO} into ${WORKDIR}..."
git clone --depth 1 "${SRC_REPO}" "${WORKDIR}/src"

echo "Copying ${SRC_SUBDIR} -> ${DEST_DIR} (preserving structure)..."
mkdir -p "${DEST_DIR}"
rsync -av --delete "${WORKDIR}/src/${SRC_SUBDIR}/" "${DEST_DIR}/"

echo "Cleaning up..."
rm -rf "${WORKDIR}"

echo "Done. Files copied to ${DEST_DIR}/"

# Note: this script runs locally; to persist changes to GitHub, commit and push.
