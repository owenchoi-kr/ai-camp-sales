# Block 5: Wrap — 자가진단 + 숙제 + Day 2 예고

> 오늘을 정리하고, 오늘 밤 숙제를 안내하고, 내일을 예고한다.

## EXPLAIN (Phase A)

오늘 한 걸 한 화면으로 되짚는다.

**오늘 만난 핵심 기능 4개와 그 관계:**

```
CLAUDE.md (Memory) ── 매 세션 자동으로 읽히는 "내 기본값"  ← 오늘 만든 것
      │
Skill ───────────── 반복 업무를 한 줄로 (Day 2~3에 직접 만듦)
      │
MCP ─────────────── 외부 도구(Circleback·Notion·Slack) 연결 (Day 2 주인공)
      │
Subagent ────────── 여러 소스를 병렬로 수집 (계정 리서치 스킬의 엔진)
```

**오늘의 산출물:** 내 담당 계정·톤·금지어·반복 작업을 담은 `CLAUDE.md` 한 장. 이제 이 파일이 앞으로 모든 대화의 출발점이 된다. Block 1에서 봤던 밋밋한 콜 프렙과, 이 기본값을 얹은 콜 프렙은 다르다.

Phase A 종료 문구:

```
---
👆 오늘 정리를 확인했으면 "다음"이라고 입력해주세요.
자가진단 퀴즈 3개와 오늘 밤 숙제를 안내합니다.
```

여기서 Stop한다.

## QUIZ (Phase B) — 자가진단 3문항 연속

사용자가 돌아오면 3문항을 **연속으로** 출제한다. 정답을 맞히는 시험이 아니라, 오늘 만든 게 살아있는지 점검하는 자가진단이다. 각 문항에 짧은 피드백을 준다.

### 자가진단 1

```json
AskUserQuestion({
  "questions": [{
    "question": "내 CLAUDE.md의 '담당 계정' 섹션, 읽으면 내 업무가 구체적으로 떠오르나요?",
    "header": "자가진단 1/3",
    "options": [
      {"label": "구체적이다", "description": "'커머스 엔터프라이즈·어트리뷰션 이슈'처럼 손에 잡힘"},
      {"label": "아직 추상적이다", "description": "'엔터프라이즈'만 있고 맥락이 얇다 → 2주차에 보강"}
    ],
    "multiSelect": false
  }]
})
```

> 피드백: "엔터프라이즈/SMB"만 있으면 0.5판. "연 계약·분기 QBR·트래킹 오차"처럼 구체 이슈가 붙으면 AI가 훨씬 잘 쓴다.

### 자가진단 2

```json
AskUserQuestion({
  "questions": [{
    "question": "금지어에 '왜 쓰면 안 되는지' 이유가 붙어 있나요?",
    "header": "자가진단 2/3",
    "options": [
      {"label": "이유가 붙어 있다", "description": "AI가 일관되게 지킨다"},
      {"label": "단어만 나열했다", "description": "이유를 붙이면 응용 상황에서도 지킨다"}
    ],
    "multiSelect": false
  }]
})
```

> 피드백: "확정 안 된 할인 언급 금지 — 나중에 분쟁 위험"처럼 이유가 있으면, AI가 비슷한 새 상황에서도 알아서 피한다.

### 자가진단 3

```json
AskUserQuestion({
  "questions": [{
    "question": "오늘 배운 4개 중 'Day 2의 주인공'은 무엇일까요?",
    "header": "자가진단 3/3",
    "options": [
      {"label": "MCP — 외부 도구 연결", "description": "정답. 내일은 도구를 꽂아 맥락을 채운다"},
      {"label": "Subagent", "description": "엔진이긴 하지만 내일의 주인공은 아님"},
      {"label": "Skill", "description": "Day 2~3에 직접 만들지만, 내일 첫 재료는 MCP"}
    ],
    "multiSelect": false
  }]
})
```

> 피드백: MCP. 내일은 CLAUDE.md 위에 Circleback·Notion·Slack을 연결해 콜 프렙의 빈 맥락을 채운다.

### 마무리 — 숙제 + Day 2 예고

3문항이 끝나면 아래를 안내하고 오늘을 닫는다:

```
🎒 오늘 밤 숙제 (30분 이내)

Circleback · Notion · Slack 중 자주 쓰는 것 1개를 MCP로 연결해 오세요.
- claude.ai 웹 또는 Claude Code에서 연결
- 연결됐는지: Claude Code에서 /mcp 입력 → 목록에 뜨면 성공
- 딱 1개면 됩니다. 나머지는 내일 다 같이 연결해요.

📅 Day 2 예고

내일은 계정명 하나만 넣으면 히스토리 브리핑이 나오는 "여러분의 스킬"을 만듭니다.
오늘 만든 CLAUDE.md 위에, 오늘 밤 연결한 도구를 얹으면 — Block 1에서 비어 있던 그 맥락이 채워집니다.

오늘 수고하셨습니다. 내일 Day 2에서 만나요.
```

> 숙제를 못 해와도 괜찮다고 덧붙인다 — Day 2 첫 15분이 연결 점검 시간이다. 시도해보는 게 핵심.
