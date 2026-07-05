---
name: day2
description: AI Camp Sales Day 2 — 내 계정 리서치 스킬(my-account-sync)을 "만들면서" 도구를 연결한다. 빈 뼈대에 소스 5개(Gmail·Circleback·Notion·Slack·Salesforce)를 하나씩 채워 계정명 하나로 히스토리 브리핑이 나오는 내 스킬을 완성한다. 라이브 수업 진행용 + 결석자 self-paced용. "day2", "데이투", "2일차", "Day 2" 요청에 사용.
---

# Day 2: 내 계정 리서치 스킬 만들기

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

두 가지 용도로 쓰인다:
- **라이브 수업(90분)**: 운영진과 함께 진행하며 실습 가이드로 사용
- **결석자 self-paced**: 혼자 `/day2`를 돌리면 Claude가 1:1로 그날 수업을 통째로 진행

> **오늘의 목적지**: 퇴근할 때 여러분 손에 **스킬이 하나** 생긴다.
> 계정명 하나만 넣으면 그 계정과의 과거 히스토리 브리핑이 나오는 `my-account-sync`.
> 도구 연결(MCP)을 따로 외우지 않는다. **이 스킬을 만드는 과정에서** Gmail·Circleback·Notion·Slack·Salesforce가 하나씩 붙는다.

---

## 용어 정리

| 용어 | 설명 |
|------|------|
| **MCP** | Model Context Protocol. AI와 외부 도구를 연결하는 표준. USB-C처럼 여러 서비스를 하나의 규격으로 Claude에 연결 |
| **Connector** | claude.ai에서 클릭 몇 번으로 도구를 연결하는 가장 쉬운 방법 (Slack·Gmail 등) |
| **CLI** | 터미널에 명령어를 입력하는 방식. 오늘은 Gmail을 `gws`라는 사내 CLI로 가져온다 |
| **Plugin** | Skill + MCP를 묶은 패키지. 설치 한 줄이면 도구가 붙는다 |
| **STUB** | 나중에 채울 빈칸. "여기에 나중에 내용이 들어갑니다"라는 표시 |
| **스켈레톤** | STUB만 있는 뼈대. 건물로 치면 철골만 세운 상태 |
| **subagent** | Claude가 다른 Claude를 불러 일을 시키는 것. 여러 소스를 동시에 수집할 때 사용 (Day 1 Block 3-4) |
| **히스토리 브리핑** | 오늘 만들 산출물. 한 계정과의 과거 접점을 콜 프렙용 한 장으로 정리한 문서 |

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다. 위반하면 수업이 망가진다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 개념/기능을 설명한다                                   │
│ 3. references/에서 해당 블록 파일의 EXECUTE 섹션을 읽는다    │
│ 4. "지금 직접 실행해보세요"라고 안내한다                     │
│ 5. ⛔ 여기서 반드시 STOP. 턴을 종료한다.                    │
│                                                          │
│ ❌ 절대 하지 않는 것: 퀴즈 출제, QUIZ 섹션 읽기             │
│ ❌ 절대 하지 않는 것: AskUserQuestion 호출 (Block 3~9 제외) │
│ ❌ 절대 하지 않는 것: "실행해봤나요?" 질문                   │
└──────────────────────────────────────────────────────────┘

  ⬇️ 사용자가 돌아와서 "했어", "완료", "다음" 등을 입력한다

┌─ Phase B (두 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 QUIZ 섹션을 읽는다       │
│ 2. AskUserQuestion으로 퀴즈를 출제한다                     │
│ 3. 정답/오답 피드백을 준다                                 │
│ 4. 다음 블록으로 이동할지 AskUserQuestion으로 묻는다         │
│ 5. ⛔ 다음 블록을 시작하면 다시 Phase A부터.                │
└──────────────────────────────────────────────────────────┘
```

### 핵심 금지 사항 (절대 위반 금지)

1. **Phase A에서 AskUserQuestion을 호출하지 않는다 (Block 3, 4, 5, 6, 7, 8, 9 제외)** — 이 7개 블록은 도구 사용 여부 확인·출력 선택이 필수라 예외
2. **Phase A에서 퀴즈를 내지 않는다** — QUIZ 섹션은 Phase B에서만 읽는다
3. **Phase A에서 "실행해봤나요?"를 묻지 않는다** — 사용자가 먼저 말할 때까지 기다린다
4. **한 턴에 EXPLAIN + QUIZ를 동시에 하지 않는다** — 반드시 2턴으로 나눈다

### 공식 문서 URL 출력 (절대 누락 금지)

각 블록 Phase A 시작 시, 해당 reference 파일 상단의 `> 공식 문서:` URL을 **그대로 출력**한다.

```
📖 공식 문서: [URL]
```

- URL이 여러 개면 전부 출력한다. 요약·생략하지 않는다.
- 참가자가 직접 클릭해서 공식 문서를 볼 수 있어야 한다.

### 정확성 가드레일

Claude Code 기능 질문이 오면 claude-code-guide 에이전트(내장 도구)로 답한다. 내장 답변이 부정확하다고 판단되면, 공식 문서를 `curl`로 파일에 저장한 뒤 Read로 꼼꼼히 읽고 다시 답한다(WebFetch는 요약/손실 위험이 있어 쓰지 않는다). **기능 설명이 불확실하면 지어내지 말고 reference 파일의 설명 범위 안에서만 답한다.**

특히 **`gws` CLI의 정확한 명령·플래그는 지어내지 않는다.** reference에 "운영진 배포 가이드 참조"로 표기된 부분은 그대로 안내하고, 참가자가 사내 배포 가이드에서 실제 명령을 확인하게 한다.

### Phase A 종료 시 필수 문구

Phase A 마지막에는 반드시 아래 문구를 출력하고 Stop한다:

```
---
👆 위 내용을 직접 실행해보세요.
실행이 끝나면 "완료" 또는 "다음"이라고 입력해주세요.
```

이 문구 이후에 어떤 도구 호출(AskUserQuestion 포함)이나 추가 텍스트도 출력하지 않는다.

---

## 블록 구성

| Block | 주제 | 하는 일 |
|-------|------|--------|
| 0 | Recap | Day 1 회고 + 숙제 점검(도구 1개 연결했나) + 오늘 예고 |
| 1 | MCP | MCP 개념 압축 (USB-C 반 페이지) + 연결 방법이 여러 가지라는 것 |
| 2 | 스켈레톤 | `my-account-sync` 빈 뼈대 생성 (STUB 5개) |
| 3 | 소스① Gmail | 이 계정과 주고받은 메일 — gws CLI (Plan B: Gmail 커넥터) |
| 4 | 소스② Circleback | 이 계정과의 지난 미팅노트 — Circleback MCP |
| 5 | 소스③ Notion | 계정 페이지·세일즈 문서 — Notion MCP |
| 6 | 소스④ Slack | 이 계정 관련 내부 논의 — Slack MCP |
| 7 | 소스⑤ Salesforce | 이 계정의 딜/Opportunity — SFDC 웹 붙여넣기(기본) / 연결 시 조회 |
| 8 | 완성 + 실전 | 5소스 병렬 수집 + 출력 포맷 확정 + 실제 담당 계정 1개로 실행 |
| 9 | Wrap | 자가진단 3문항 + Day 3 예고 |

### 점진적 빌드 — STUB 채움 순서

```
Block 2:  [STUB Gmail] [STUB Circleback] [STUB Notion] [STUB Slack] [STUB Salesforce] ← 빈 뼈대
Block 3:  [Gmail]      [STUB]            [STUB]        [STUB]        [STUB]             → 1소스로 실행해보기
Block 4:  [Gmail]      [Circleback]      [STUB]        [STUB]        [STUB]             → 2소스로 실행해보기
Block 5:  [Gmail]      [Circleback]      [Notion]      [STUB]        [STUB]             → 3소스로 실행해보기
Block 6:  [Gmail]      [Circleback]      [Notion]      [Slack]       [STUB]             → 4소스로 실행해보기
Block 7:  [Gmail]      [Circleback]      [Notion]      [Slack]       [Salesforce]       → 5소스로 실행해보기
Block 8:  [완성!] 병렬 수집 + 출력 포맷 확정 + 실전 계정 1개로 히스토리 브리핑
```

> **핵심**: 5개 소스를 한 번에 붙이지 않는다. 블록마다 소스 하나를 채우고 **그 자리에서 my-account-sync를 실행**해, 스킬이 점점 좋아지는 걸 눈으로 확인한다.

---

## 블록 특수 규칙

- **Block 0 (Recap)**: 퀴즈 없음. Phase A에서 Day 1 회고 + 오늘 예고 → Stop. Phase B에서 숙제 점검(AskUserQuestion)만 하고 Block 1로.
- **Block 1 (MCP)**: MCP 개념을 반 페이지로 압축. 연결 방법이 여러 가지(Connector/CLI/Plugin)라는 것만 짚는다. 깊게 파지 않는다 — 오늘의 주인공은 개념이 아니라 스킬이다.
- **Block 2 (스켈레톤)**: Phase A에서 Explore로 프로젝트 탐색 + `templates/my-account-sync.md`를 사용자의 `.claude/skills/my-account-sync/SKILL.md`로 복사해 뼈대 생성 → Stop. Phase B에서 퀴즈.
- **Block 3~7 (소스 채우기)**: 각 블록은 **STUB 하나 채우기가 실습**이다. Phase A에서 (1) AskUserQuestion으로 도구 사용 여부 확인 → (2) 도구 연결·테스트 → (3) 해당 소스 STUB을 실제 내용으로 교체 → (4) **지금까지 채운 소스만으로 my-account-sync를 중간 실행** → Stop. Phase B에서 퀴즈. 도구/권한이 없으면 **Plan B(붙여넣기 모드)**로 채운다. (Block 7 Salesforce는 대부분 SFDC 웹 붙여넣기가 기본 경로다.)
- **Block 8 (완성 + 실전)**: Phase A에서 AskUserQuestion으로 출력 형식 선택 + 실행 흐름/출력 포맷 STUB 완성 + **실제 담당 계정 1개**로 5소스 병렬 수집 실행 → 히스토리 브리핑 확인 → Stop. Phase B에서 종합 퀴즈.
- **Block 9 (Wrap)**: Phase A에서 오늘 정리 → Stop. Phase B에서 자가진단 3문항 연속 + Day 3 예고로 마무리.

### AskUserQuestion 예외 블록

| Block | 이유 |
|-------|------|
| Block 3 | Gmail/gws 사용 여부 확인 (없으면 커넥터·붙여넣기 안내) |
| Block 4 | Circleback 사용 여부 확인 |
| Block 5 | Notion 사용 여부 확인 |
| Block 6 | Slack 사용 여부 확인 (회사 계정 제한 시 대안 안내) |
| Block 7 | Salesforce 수집 방법 확인 (SFDC 웹 붙여넣기 기본 / 연결 / 직접 입력) |
| Block 8 | 출력 형식 선택 (파일 / + Slack / + Notion) |
| Block 9 | 자가진단 3문항 |

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| Block 0 | `references/block0-recap.md` | Day 1 회고 + 숙제 점검 + 오늘 예고 |
| Block 1 | `references/block1-mcp.md` | MCP 개념 압축 (USB-C 반 페이지) |
| Block 2 | `references/block2-skeleton.md` | Explore + my-account-sync 스켈레톤 생성 |
| Block 3 | `references/block3-gmail.md` | 소스① Gmail (gws CLI / Plan B 커넥터) |
| Block 4 | `references/block4-circleback.md` | 소스② Circleback 미팅노트 |
| Block 5 | `references/block5-notion.md` | 소스③ Notion 계정 문서 |
| Block 6 | `references/block6-slack.md` | 소스④ Slack 내부 논의 |
| Block 7 | `references/block7-salesforce.md` | 소스⑤ Salesforce 딜/Opportunity (SFDC 웹 붙여넣기 기본) |
| Block 8 | `references/block8-finalize.md` | 병렬 수집 + 출력 포맷 + 실전 실행 |
| Block 9 | `references/block9-wrap.md` | 자가진단 + Day 3 예고 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다(블록에 따라 일부 생략).

---

## Templates 파일 맵

| 파일 | 용도 |
|------|------|
| `templates/my-account-sync.md` | 참가자가 자기 프로젝트로 복사하는 스켈레톤 스킬 (Gmail·Circleback·Notion·Slack·Salesforce 5 STUB) |

> 참가자는 이 템플릿을 자기 프로젝트의 `.claude/skills/my-account-sync/SKILL.md`로 복사한 뒤,
> Block 3~7에서 STUB을 하나씩 채운다.

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다.
- "다음", "skip", 블록 번호/이름으로 이동한다.
- Block 2에서 만든 스켈레톤의 STUB을 Block 3~7에서 하나씩 채운다. 각 블록에서 도구를 연결한 뒤 해당 소스 섹션을 실제 내용으로 교체하고, **그 자리에서 my-account-sync를 실행해 점점 좋아지는 걸 체감**시킨다.
- 사용자 프로젝트의 `.claude/skills/my-account-sync/` 디렉토리에 스킬을 생성한다.
- 모든 실습은 **참가자의 실제 담당 계정**으로 한다. 단, 고객사·직원 실명은 화면·문서에 남기지 않는다 (도메인·이니셜·"이 계정"으로 지칭).
- 도구/권한이 없는 참가자는 항상 **Plan B(붙여넣기 모드)**로 따라올 수 있다. 연결이 목적이 아니라 "스킬이 동작하는 걸 체험"하는 게 목적이다.
- Explore 에이전트와 subagent 사용이 핵심이므로 적극 활용한다.

---

## 시작

스킬 시작 시 아래 안내와 함께 AskUserQuestion으로 어디서 시작할지 물어본다.

> 오늘은 **여러분의 스킬 하나**를 만들어서 퇴근합니다. 계정명 하나만 넣으면 그 계정과의 과거 히스토리 브리핑이 나오는 `my-account-sync`. 빈 뼈대에 소스 5개를 하나씩 채워가며 완성합니다. 도구 연결은 이 과정에서 자연스럽게 붙습니다.

| Block | 주제 | 내용 |
|-------|------|------|
| 0 | Recap | Day 1 회고 + 숙제 점검 + 오늘 예고 |
| 1 | MCP | MCP가 뭔지 반 페이지로 |
| 2 | 스켈레톤 | my-account-sync 빈 뼈대 만들기 |
| 3~7 | 소스 채우기 | Gmail → Circleback → Notion → Slack → Salesforce 하나씩 |
| 8 | 완성 + 실전 | 담당 계정 1개로 히스토리 브리핑 뽑기 |
| 9 | Wrap | 자가진단 + Day 3 예고 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 2: 내 계정 리서치 스킬 만들기\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (Block 0)", "description": "Day 1 회고부터 순서대로 — 라이브 수업/결석자 권장"},
      {"label": "바로 스킬 만들기 (Block 2)", "description": "MCP 개념 아는 사람 — 스켈레톤 생성부터"},
      {"label": "소스 채우기부터 (Block 3)", "description": "뼈대 있으면 Gmail 소스부터 채우기"},
      {"label": "전체 훑기", "description": "각 블록 한 줄 요약만 먼저 보기"}
    ],
    "multiSelect": false
  }]
})
```

> 시작 블록 선택 후 → 해당 블록의 Phase A부터 진행한다.
> "바로 스킬 만들기"를 골라도, Block 2 도입에서 MCP 개념(Block 1)을 한 문단으로 압축해 먼저 짚어준 뒤 진행한다.
