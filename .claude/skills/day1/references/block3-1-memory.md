# Block 3-1: Memory / CLAUDE.md

> 핵심 기능 4개 중 첫 번째. 오늘의 산출물(Block 4)이 바로 이 CLAUDE.md다. 여기서 개념을 잡는다.

## EXPLAIN

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/memory
> ```

Claude의 기억은 두 가지다. **내가 쓰는 지시문(CLAUDE.md)** 과 **Claude가 스스로 적는 메모(Auto Memory)**.

### 1. CLAUDE.md — 내가 쓰는 지시문

| 항목 | 내용 |
|------|------|
| 근본 원리 | Claude가 매 대화를 시작할 때 **가장 먼저 자동으로 읽는** 고정 지시문. AI의 휘발성 기억을 영구 기억으로 만든다 |
| 비유 | 팀 위키 — 매번 설명 안 해도 되는 규칙서 |
| 세일즈 예시 | "담당 계정은 국내 커머스·핀테크 위주", "아웃리치 톤은 짧고 담백하게", "확정 안 된 할인은 언급 금지" |

```
세션 시작
  │
  ▼
┌─────────────┐     ┌──────────────┐
│ CLAUDE.md   │────▶│ 자동으로 읽힘 │────▶ Claude가 내 딜 맥락을 아는 상태로 시작
│ (내 지시문)  │     └──────────────┘
└─────────────┘
```

한 번 박아두면, Block 1에서 봤던 그 밋밋한 콜 프렙이 **"내 담당 세그먼트·내 톤"** 위에서 시작된다.

### 2. Auto Memory — Claude가 스스로 적는 메모

| 항목 | 내용 |
|------|------|
| 근본 원리 | Claude가 일하면서 발견한 패턴·선호를 **스스로 기록**하고, 다음 세션에서 자동으로 이어 읽는다 |
| 비유 | 업무 수첩 — Claude가 일하며 적어두는 자기 노트 |
| CLAUDE.md와 차이 | CLAUDE.md는 **내가** 주는 규칙. Auto Memory는 **Claude가** 스스로 적는 메모 |

- 기본으로 켜져 있다 (따로 설정 불필요). `/memory`로 확인·토글.
- "이건 기억해둬" 하고 직접 지시해도 된다.

## EXECUTE

3가지를 순서대로 해보라고 안내한다:

**1. `/memory` — 지금 뭐가 있나 확인**

```
/memory
```

> CLAUDE.md와 Auto Memory 파일을 확인·편집할 수 있다.

**2. Auto Memory 직접 체험**

```
나는 국내 커머스·핀테크 계정을 담당하는 세일즈야. 이거 기억해둬.
```

> Claude가 메모에 기록하는 걸 확인한다. `/memory`로 저장된 내용을 열어볼 수 있다.

**3. (미리보기) 오늘 만들 것**

> 오늘 Block 4에서 이 CLAUDE.md를 제대로 채운다. 지금은 "이런 게 있다"만 알면 된다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "CLAUDE.md와 Auto Memory의 차이는?",
    "header": "Quiz 3-1",
    "options": [
      {"label": "CLAUDE.md는 내가 쓰고, Auto Memory는 Claude가 쓴다", "description": "작성 주체가 다르다"},
      {"label": "같은 파일이다", "description": "이름만 다른 같은 기능"},
      {"label": "Auto Memory는 한 번만 읽힌다", "description": "매 세션 읽히는지 여부"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. CLAUDE.md는 **내가 Claude에게 주는 지시문**, Auto Memory는 **Claude가 스스로 적는 메모**. 둘 다 매 세션 시작 시 자동으로 읽힌다.
