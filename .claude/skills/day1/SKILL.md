---
name: day1
description: AI Camp Sales Day 1 — 체험 + 내 프로필(CLAUDE.md) 세팅. Claude와 대화하면서 Claude Code를 익힌다. 라이브 수업 진행용 + 결석자 self-paced용. "day1", "데이원", "첫날", "1일차", "Day 1" 요청에 사용.
---

# Day 1: 체험 + 내 프로필

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

두 가지 용도로 쓰인다:
- **라이브 수업(90분)**: 운영진과 함께 진행하며 실습 가이드로 사용
- **결석자 self-paced**: 혼자 `/day1`을 돌리면 Claude가 1:1로 그날 수업을 통째로 진행

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다. 위반하면 수업이 망가진다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 기능/개념을 설명한다                                   │
│ 3. references/에서 해당 블록 파일의 EXECUTE 섹션을 읽는다    │
│ 4. "지금 직접 실행해보세요"라고 안내한다                     │
│ 5. ⛔ 여기서 반드시 STOP. 턴을 종료한다.                    │
│                                                          │
│ ❌ 절대 하지 않는 것: 퀴즈 출제, QUIZ 섹션 읽기             │
│ ❌ 절대 하지 않는 것: AskUserQuestion 호출                  │
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

1. **Phase A에서 AskUserQuestion을 호출하지 않는다** — 설명 + 실행 안내 후 바로 Stop
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

### Phase A 종료 시 필수 문구

Phase A 마지막에는 반드시 아래 문구를 출력하고 Stop한다:

```
---
👆 위 내용을 직접 실행해보세요.
실행이 끝나면 "완료" 또는 "다음"이라고 입력해주세요.
```

이 문구 이후에 어떤 도구 호출(AskUserQuestion 포함)이나 추가 텍스트도 출력하지 않는다.

### 블록 특수 규칙

- **Block 0 (Setup)**: 퀴즈 없음. Phase A에서 설명+실행 안내 → Stop. Phase B에서 완료 확인만.
- **Block 1 (Experience)**: Phase A에서 콜 프렙 데모 안내 → Stop. Phase B에서 체험 소감 확인(정답 없음).
- **Block 2 (Why)**: 인트로 3막. Phase A에서 3막을 이야기로 풀고 "잠시 곱씹어보라" 안내 → Stop. Phase B에서 소감 reflection(정답 없음) → 다음 블록.
- **Block 3-1 ~ 3-4 (What)**: 4개 기능 각각이 독립 블록. 각각 Phase A(설명+실행) → Phase B(퀴즈).
- **Block 4 (CLAUDE.md)**: **인터뷰 블록**. Phase A에서 CLAUDE.md 개념 설명 + 인터뷰할 4가지 안내 → "준비되면 '시작'이라고 입력" → Stop. Phase B에서 인터뷰를 진행하고 **실제 `CLAUDE.md` 파일로 저장**한다. (AskUserQuestion과 자유서술을 섞어 대화형으로 진행 — 이 블록만 Phase B에서 도구를 적극 사용한다.)
- **Block 5 (Wrap)**: Phase A에서 오늘 정리(4기능 관계 + 산출물 확인) → Stop. Phase B에서 자가진단 퀴즈 3문항 연속 → 숙제 + Day 2 예고로 마무리.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| Block 0 | `references/block0-setup.md` | 첫 실행 확인 |
| Block 1 | `references/block1-experience.md` | 실제 미팅 콜 프렙 라이브 체험 |
| Block 2 | `references/block2-why.md` | 왜 지금 AI인가 (인트로 3막) |
| Block 3-1 | `references/block3-1-memory.md` | Memory / CLAUDE.md |
| Block 3-2 | `references/block3-2-skill.md` | Skill |
| Block 3-3 | `references/block3-3-mcp.md` | MCP |
| Block 3-4 | `references/block3-4-subagent.md` | Subagent |
| Block 4 | `references/block4-claudemd.md` | 내 CLAUDE.md 세팅 (오늘 산출물) |
| Block 5 | `references/block5-wrap.md` | 자가진단 + 숙제 + Day 2 예고 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다(블록에 따라 일부 생략).

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다.
- "다음", "skip", 블록 번호/이름으로 이동한다.
- Block 3은 3-1(Memory) → 3-2(Skill) → 3-3(MCP) → 3-4(Subagent) 순서로 이어진다.
- Block 3-4가 끝나면 "Claude Code에는 Hook·Plugin·Agent Teams 같은 기능이 더 있지만, 오늘은 이 4개만. 나머지는 캠프 뒤쪽 Day에서 만난다"를 한 줄로 안내하고 Block 4로 넘어간다.
- 오늘의 목적지는 **Block 4에서 내 CLAUDE.md 파일을 실제로 만드는 것**이다. 앞 블록들은 여기로 가기 위한 체험과 재료다.

---

## 시작

스킬 시작 시 아래 안내와 함께 AskUserQuestion으로 어디서 시작할지 물어본다.

> 오늘은 두 가지를 합니다. ① 앞으로 4일 뒤 여러분 손에 쥐어질 도구를 **먼저 체험**하고, ② 그 도구가 여러분처럼 일하게 만드는 **첫 기본값(CLAUDE.md)**을 오늘 만들어 갑니다.

| Block | 주제 | 내용 |
|-------|------|------|
| 0 | Setup | Claude Code 첫 실행 확인 |
| 1 | Experience | 실제 미팅으로 콜 프렙 브리핑 즉석 생성 |
| 2 | Why | 왜 지금 AI인가 (인트로 3막) |
| 3 | What | 핵심 기능 4개 (Memory·Skill·MCP·Subagent) |
| 4 | CLAUDE.md | 오늘의 산출물 — 내 프로필 만들기 |
| 5 | Wrap | 자가진단 + 숙제 + Day 2 예고 |

```json
AskUserQuestion({
  "questions": [{
    "question": "어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (Block 0)", "description": "Setup부터 순서대로 — 라이브 수업/결석자 권장"},
      {"label": "체험부터 (Block 1)", "description": "설치 끝났으면 콜 프렙 체험부터"},
      {"label": "바로 CLAUDE.md (Block 4)", "description": "앞 내용 아는 사람 — 오늘 산출물만 빠르게"},
      {"label": "전체 훑기", "description": "각 블록 한 줄 요약만 먼저 보기"}
    ],
    "multiSelect": false
  }]
})
```

> 시작 블록 선택 후 → 해당 블록의 Phase A부터 진행한다.
> "바로 CLAUDE.md"를 골라도, Block 4 도입에서 Memory 개념(Block 3-1)을 한 문단으로 압축해 먼저 짚어준 뒤 진행한다.
