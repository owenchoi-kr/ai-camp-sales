# AI Camp · Sales

세일즈를 위한 AI Camp. Claude Code로 내 업무(콜 프렙 · 계정 리서치 · 아웃리치 · 팔로업)를 직접 자동화한다.
**1주차 라이브 4일(월·수·목·금, 각 90분) + 2주차 개인 프로젝트 + 금요일 쇼케이스.**

---

# 🚀 참가자: 여기서 시작

**세 가지만 하면 됩니다. 10분이면 끝나요.**

### 1. Claude Code 설치

macOS / Linux:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

설치가 막히면 [claude.ai](https://claude.ai) 대화창에 "Claude Code 설치하는 방법 알려줘"라고 입력하면 환경에 맞게 안내해 줍니다. 터미널에서 `claude` 입력 → Claude가 인사하면 성공.

> 계정은 Claude Pro · Max · Team · Enterprise 중 하나가 필요합니다.

### 2. 이 캠프 받기

```bash
git clone https://github.com/owenchoi-kr/ai-camp-sales.git
cd ai-camp-sales
claude
```

### 3. `/day1` 로 시작

Claude Code 안에서 `/day1` 을 입력하면 그날 수업이 시작됩니다. 매일 `/day1` → `/day2` → `/day3` → `/day4`.

> **수업에 못 왔어도 괜찮아요.** `/dayN` 을 혼자 돌리면 그날 수업 전체를 Claude가 1:1로 진행합니다.

### 📊 발표자료 (온라인)

수업에서 쓰는 슬라이드는 여기서 볼 수 있어요 → **https://claude.ai/code/artifact/00cd1f76-bef7-4527-9bda-116ad5f70d45**

### 막힐 때

| 증상 | 대응 |
|------|------|
| 도구(MCP) 연결이 안 된다 | 90%는 claude.ai 재로그인 또는 Claude Code 재시작. 안 되면 운영진에게 |
| 스킬 결과가 이상하다 | 첫 결과 70%면 정상. 고치지 말고 다음 Day까지 들고 오기 |
| 수업에 못 왔다 | `/dayN` 실행 — 그날 수업 전체를 Claude가 진행 |

---
---

# 🎓 운영자 전용

> 아래는 캠프를 **진행·준비하는 사람**을 위한 자료입니다. 참가자는 위 섹션까지만 보면 됩니다.

## 강의 준비 자료

- 📋 **강의 준비 자료집 (온라인, 탭·인쇄)**: https://claude.ai/code/artifact/abd350bb-28f6-448a-b1f2-e2d65c31d0dd
- 🎬 **운영 플레이북**: [docs/facilitation-guide.md](docs/facilitation-guide.md) — 2주 타임라인, 세션 진행법, 과제-슬라이드 정합성
- **Day별 블록 대본**: [day1](docs/day1-facilitator.md) · [day2](docs/day2-facilitator.md) · [day3](docs/day3-facilitator.md) · [day4](docs/day4-facilitator.md) — 블록마다 시간·강사 멘트·참가자 행동·STOP·막히는 곳·슬라이드
- **팩트체크·개선 루프**: [fact-check-6.md](docs/fact-check-6.md) · [improve-loop.md](docs/improve-loop.md)

## 격리 실행 (리허설·테스트용)

캠프를 직접 돌려볼 때, **개인 전역 설정(`~/.claude`의 CLAUDE.md·hooks·플러그인·매크로)과 섞이지 않는** 깨끗한 환경으로 실행한다:

```bash
./run-camp.sh
```

`--bare`가 개인 설정을 전부 스킵하고 이 레포의 `.claude/skills`(day1~4)만 로드하므로, **참가자가 겪는 것과 똑같은 환경**에서 리허설할 수 있다. (그냥 `claude`로 열면 운영자 개인 CLAUDE.md·hooks가 캠프 스킬과 섞인다.)

## 설계 원칙

1. **체험 먼저, 설명 나중** — 모든 Day는 라이브 데모/실행으로 시작한다.
2. **만들면서 배운다** — 도구 연결을 따로 가르치지 않는다. "내 스킬"을 만드는 과정에서 도구가 연결된다.
3. **0.5 → 1** — 스킬을 0에서 만들게 하지 않는다. 운영진 템플릿을 받아 내 딜 맥락 3요소만 수정한다.
4. **결석해도 따라잡는다** — 각 Day 수업 전체가 `/dayN` 스킬로 존재한다 (STOP PROTOCOL: 설명 → 직접 실행 → 퀴즈).
5. **주인공은 기능이 아니라 딜** — Claude Code 기능 나열 금지. 모든 실습은 참가자의 실제 계정·미팅·아웃리치로 한다.

> 이 레포는 [ai-native-camp/camp-2](https://github.com/ai-native-camp/camp-2)(정구봉님 AI Native Camp 2기)를 포크했다. 교수법 엔진은 camp-2에서, 업무 콘텐츠는 AB180 세일즈의 실제 플레이에서 가져왔다. 하네스 6축은 설계 원리로만 쓰고 참가자에게 직접 가르치지 않는다.

## 2주 흐름 상세

### 1주차 — 라이브 4일 (각 90분)

| Day | 주제 | 핵심 실습 | 산출물 |
|-----|------|----------|--------|
| **Day 1 (월)** | 체험 + 내 프로필 | 인트로 → 실제 미팅 콜 프렙 라이브 데모 → 핵심 기능 4개 → CLAUDE.md 세팅 | 내 계정·세그먼트·톤을 담은 CLAUDE.md |
| **Day 2 (수)** | 내 리서치 스킬을 "만들면서" 도구 연결 | 빈 뼈대 `my-account-sync`에 소스 5개 채움: Gmail · Circleback · Notion · Slack · Salesforce | 계정명 하나로 히스토리 브리핑이 나오는 스킬 |
| **Day 3 (목)** | Clarify + 0.5→1 커스터마이징 | Clarify 체험 → 템플릿 택1(call-prep / battlecard / meeting-followup / draft-outreach)을 내 딜 맥락으로 | 내 맥락으로 동작하는 스킬 1개 |
| **Day 4 (금)** | 검증 + 조립 + 스코핑 | 팩트체크·의사결정 로그 강의 → 까다로운 프로스펙트 검증 → 주간 루틴 조립 → 2주차 프로젝트 | 프로젝트 계획 1장 |

### 2주차 — 개인 프로젝트 → 금요일 쇼케이스

- [프로젝트 메뉴](docs/project-menu.md)에서 선택하거나 자기 고통점으로 정의. 실제 딜 1개에 적용.
- 수요일 중간 체크인 + 금요일 쇼케이스(before/after 1장, 리더 참관).
- 커리큘럼·프로젝트는 세일즈 조직에서 흔히 반복되는 수작업 예시 8개에서 나왔다 → [plays-mapping](docs/plays-mapping.md)

## 폴더 구조

```
ai-camp-sales/
├── README.md                (본 문서)
├── run-camp.sh              격리 실행 launcher (운영자 리허설용)
├── .claude/skills/          day1~4 인터랙티브 수업 스킬
├── templates/               Day 3 실습용 스킬 템플릿 4종
├── slides/                  발표 슬라이드 (kickoff · day1~4 · tips) + artifact-deck.html
├── docs/                    운영 플레이북 · Day별 대본 · 팩트체크 · 프로젝트 메뉴 · 플레이 매핑
└── reference/csm/           CSM 3기 재사용 자산
```
