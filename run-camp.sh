#!/bin/bash
# AI Camp 격리 실행 — 개인 전역 설정과 분리된 깨끗한 환경에서 캠프를 돈다.
#
# --bare 가 개인 ~/.claude 의 CLAUDE.md·hooks·플러그인·auto-memory·매크로를 전부 스킵한다.
# --add-dir . 로 이 레포의 .claude/skills(day1~day4)만 로드한다.
# → 참가자가 겪는 것과 똑같은, 개인 설정이 안 섞인 환경에서 리허설/진행할 수 있다.
cd "$(dirname "$0")"
exec claude --bare --add-dir . "$@"
