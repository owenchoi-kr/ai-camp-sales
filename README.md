# AI Camp · Sales (4기)

AB180 Sales 대상 AI Camp. **1주차 라이브 4일(월·수·목·금, 각 90분) + 2주차 개인 프로젝트 + 2주차 금요일 쇼케이스**.

> 이 레포는 [ai-native-camp/camp-2](https://github.com/ai-native-camp/camp-2) (정구봉님 운영 AI Native Camp 2기)를 포크했다.
> **교수법 엔진(day 스킬 · STOP PROTOCOL · 만들면서 배우기)은 camp-2에서, 업무 콘텐츠는 AB180 세일즈의 실제 플레이에서** 가져온다.
> 하네스 6축은 커리큘럼 설계 원리로만 쓰고 참가자에게 직접 가르치지 않는다.

---

## 설계 원칙

1. **체험 먼저, 설명 나중** — 모든 Day는 라이브 데모/실행으로 시작한다.
2. **만들면서 배운다** — 도구 연결을 따로 가르치지 않는다. "내 스킬"을 만드는 과정에서 도구가 연결된다.
3. **0.5 → 1** — 스킬을 0에서 만들게 하지 않는다. 운영진 템플릿을 받아 내 딜 맥락 3요소만 수정한다.
4. **결석해도 따라잡는다** — 각 Day 수업 전체가 `/dayN` 스킬로 존재한다 (STOP PROTOCOL: 설명 → 직접 실행 → 퀴즈). 결석자는 혼자 돌리면 된다.
5. **주인공은 기능이 아니라 딜** — Claude Code 기능 나열 금지. 모든 실습은 참가자의 실제 계정·미팅·아웃리치로 한다.

---

## 2주 흐름

### 1주차 — 라이브 4일 (각 90분: 슬라이드 15~20장 + 실습 60분)

| Day | 주제 | 핵심 실습 | 산출물 |
|-----|------|----------|--------|
| **Day 1 (월)** | 체험 + 내 프로필 | 인트로 3막(세일즈 버전) → **실제 미팅 콜 프렙 라이브 데모** → 핵심 기능 4개(Memory·Skill·MCP·Subagent) → CLAUDE.md 세팅 | 내 계정 리스트·세그먼트·톤을 담은 CLAUDE.md |
| **Day 2 (수)** | 내 계정 리서치 스킬을 "만들면서" 도구 연결 | 빈 뼈대 `my-account-sync`에 소스 4개를 하나씩 채움: ① gws(Gmail 스레드) ② Circleback(미팅노트) ③ Notion(계정 페이지) ④ Slack(내부 논의) | 계정명 하나 넣으면 히스토리 브리핑이 나오는 내 스킬 |
| **Day 3 (목)** | Clarify + 0.5→1 커스터마이징 | 모호하게 시키면 쓰레기가 나온다(Clarify 체험) → 템플릿 택1을 내 딜 맥락으로 수정: **call-prep / battlecard / meeting-followup / draft-outreach** | 내 맥락으로 동작하는 스킬 1개 |
| **Day 4 (금)** | 검증 + 조립 + 프로젝트 스코핑 | **"까다로운 프로스펙트" 페르소나가 내 아웃리치/프렙을 채점** (운영진 시연, Generator≠Evaluator) → 주간 루틴 조립 → 2주차 프로젝트 선택 | 프로젝트 스코핑 1장 |

### 2주차 — 개인 프로젝트 → 금요일 쇼케이스

- [프로젝트 메뉴](docs/project-menu.md)에서 선택하거나 자기 고통점으로 직접 정의. 실제 딜/파이프라인 1개에 적용하는 것이 과제.
- 운영진은 Slack에서 수시 지원 + 중간 체크인 1회.
- **쇼케이스**: before/after 1장 (걸린 시간 → 아낀 시간), 리더 참관.

커리큘럼 실습과 프로젝트 메뉴는 세일즈팀에서 실제 관찰된 반복 수작업 8개에서 나왔다 → [docs/plays-mapping.md](docs/plays-mapping.md)

---

## 폴더 구조

```
ai-camp-sales/
├── README.md                (본 문서)
├── .claude/skills/          camp-2 day 스킬 엔진 — 세일즈 콘텐츠로 블록 교체 예정
│   ├── day1-onboarding/           → Day 1 세일즈 버전으로 재작성
│   ├── day2-mcp-and-context-sync/ → my-account-sync 빌드로 재작성
│   ├── day3-clarify/              → Clarify + 0.5→1로 재작성
│   └── day4-wrap-and-analyze/     → 까다로운 프로스펙트 검증으로 재작성
├── templates/               Day 3 실습용 스킬 템플릿 (call-prep · battlecard · meeting-followup · draft-outreach)
├── docs/
│   ├── plays-mapping.md     관찰된 플레이 8개 → 커리큘럼 매핑
│   └── project-menu.md      2주차 프로젝트 메뉴
└── reference/csm/           CSM 3기 재사용 자산 (슬라이드 아웃라인 4개 · 인트로 3막 · reply-csm 원본)
```

---

## 사전 준비 (참가자)

### Step 0: Claude Code 설치

| 항목 | 조건 |
|------|------|
| **OS** | macOS 10.15+, Windows 10+ (WSL) |
| **계정** | Claude Pro, Max, Teams, Enterprise 중 하나 |

**macOS:**

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

설치가 막히면 [claude.ai](https://claude.ai) 대화창에 "Claude Code 설치하는 방법 알려줘"라고 입력 — 환경에 맞는 단계별 안내를 받을 수 있다.

터미널에서 `claude` 입력 → Claude가 인사하면 성공.

### Step 1: 도구 사전 연동

Circleback · Notion · Slack 중 본인이 자주 쓰는 것 1개 이상 연결 (나머지는 Day 2에서 전체 연결).

### Step 2: 이 레포 받기

```bash
git clone <repo-url> && cd ai-camp-sales && claude
```

Claude Code에서 `/day1` 으로 시작.

---

## 실습 중 막힐 때

| 증상 | 대응 |
|------|------|
| MCP 연결이 안 된다 | 운영진과 5분 사이드 세션. 90%는 claude.ai 재로그인 또는 Claude Code 재시작 |
| 스킬이 이상한 결과를 낸다 | 첫 결과 70%면 정상. 고치지 말고 Day 3까지 들고 오기 |
| 세션에 못 왔다 | `/dayN` 실행 — 그날 수업 전체를 Claude가 1:1로 진행 |
