# Block 3-3: MCP

> 핵심 기능 4개 중 세 번째. Day 2의 주인공이다. 오늘은 "이게 뭔지"만.

## EXPLAIN

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> ```

| 항목 | 내용 |
|------|------|
| 근본 원리 | **툴 콜링(Tool Calling)** — AI가 텍스트만 만드는 게 아니라 "이 함수를 이 값으로 호출해"라는 구조화된 요청을 보낸다. MCP는 이 툴 콜링을 외부 서비스까지 확장하는 오픈 표준 |
| 비유 | 외부 도구 플러그 — Slack, Notion, Circleback 등을 Claude에 꽂는 표준 규격 |
| 세일즈 예시 | "이 계정 지난 미팅 노트 읽어줘"(Circleback), "이 고객 노션 페이지 가져와"(Notion), "내부에서 이 딜 논의된 스레드 찾아줘"(Slack) |

```
Claude ──── "이 계정 미팅 노트 읽어줘"
  │
  ▼ 툴 콜링
┌──────────┐   MCP 프로토콜   ┌────────────┐
│ Claude   │ ◀════════════▶ │ Circleback │
│ Code     │   표준 규격      │ Notion/Slack│
└──────────┘                 └────────────┘
  내 컴퓨터                    외부 서비스
```

Block 1에서 콜 프렙 맥락이 비어 있던 이유가 이거다. **아직 아무 도구도 안 꽂혀 있었다.** MCP를 연결하면 Claude가 Circleback 미팅 노트·Notion 계정 페이지·Slack 논의를 직접 읽어서 브리핑에 채운다. 그게 Day 2에 만드는 것이다.

## EXECUTE

Claude에게 직접 물어보라고 안내한다:

```
MCP가 뭔지 쉽게 설명해줘. 세일즈가 쓸 만한 MCP 서버 예시 3개도 알려줘 (Circleback, Notion, Slack 같은 것)
```

> 오늘 밤 숙제(Block 5)로 이 중 1개를 미리 연결해 온다. 그러면 Day 2 90분을 전부 실습에 쓸 수 있다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "MCP를 한 마디로 말하면?",
    "header": "Quiz 3-3",
    "options": [
      {"label": "Claude와 외부 도구를 연결하는 표준 프로토콜", "description": "Circleback·Notion·Slack을 플러그처럼 꽂는 것"},
      {"label": "Claude의 내장 기능", "description": "MCP는 외부 연결이지 내장이 아님"},
      {"label": "프로그래밍 언어", "description": "도구 연결 프로토콜임"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번.
