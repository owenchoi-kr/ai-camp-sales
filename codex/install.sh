#!/usr/bin/env bash
# ai-camp-sales → Codex 스킬 설치기
#
# 참고: 이 리포는 clone 하면 루트 `.agents/skills/` 를 codex 가 자동 인식합니다.
#       repo 루트에서 `codex` 를 실행하면 아래 install 없이도 4개 스킬이 바로 로드됩니다.
#       이 스크립트는 "다른 프로젝트에서도 쓰고 싶을 때" 전역 설치용입니다.
#
# 사용법:
#   codex/install.sh --global   # ~/.agents/skills/ 로 복사 (모든 프로젝트에서 사용)
#   codex/install.sh <경로>     # 지정 프로젝트의 .agents/skills/ 로 복사
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/.agents/skills"

case "${1:-}" in
  --global) DEST="$HOME/.agents/skills" ;;
  "")       echo "루트 .agents/skills 는 codex 가 자동 인식합니다. 전역 설치는 --global 사용."; exit 0 ;;
  *)        DEST="$1/.agents/skills" ;;
esac

mkdir -p "$DEST"
cp -R "$SRC/." "$DEST/"
echo "✅ 설치 완료 → $DEST"
echo "   스킬: call-prep · draft-outreach · meeting-followup · battlecard"
echo "   다음: AGENTS.md 로 {{ }} 채우기 · (선택) codex/config.toml.example → ~/.codex/config.toml"
