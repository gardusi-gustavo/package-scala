#!/usr/bin/env bash
set -euo pipefail
ROOT="${CI_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"
cd "$ROOT"
"$ROOT/infra/scripts/ci/validate-repo.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/check-size.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/validate-local-issues.sh" --root "$ROOT"
if command -v mvn >/dev/null 2>&1; then
  mvn -q test
elif [[ "${CI:-}" == "true" || "${GITHUB_ACTIONS:-}" == "true" ]]; then
  echo "maven is required in CI" >&2
  exit 1
else
  echo "maven not installed; structural checks only"
fi
