# Block 1: MCP 개념 (반 페이지)

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> 📖 MCP 소개: https://modelcontextprotocol.io/introduction
> ```

## EXPLAIN

### MCP = AI의 USB-C

오늘 스킬을 만들려면 Gmail·미팅노트·Notion·Slack·Salesforce에서 이 계정 접점을 Claude로 가져와야 한다. 이걸 가능하게 하는 게 **MCP**다. (앞 네 개는 MCP로 붙고, Salesforce는 대부분 화면을 복사해 붙여넣는다 — 그것도 하나의 방법이다.)

**MCP = Model Context Protocol.** AI와 외부 도구를 잇는 **표준 규격**이다.

```
USB-C 하나로 충전기·모니터·외장하드를 다 꽂듯,
MCP 하나로 Gmail·Circleback·Notion·Slack을 Claude에 꽂는다.
```

Claude가 각 서비스의 언어를 따로 배울 필요 없이, MCP라는 공용어로 소통한다. 딱 이만큼만 알면 오늘 수업은 충분하다.

### 연결 방법은 여러 가지 — 오늘 다 만난다

같은 MCP라도, 도구를 꽂는 **방법**은 여러 가지다. 오늘 소스를 채우면서 자연스럽게 만난다:

| 방법 | 어떤 느낌 | 오늘 어디서 |
|------|----------|------------|
| **CLI** | 터미널 명령어로 가져오기 (사내 `gws`) | Block 3 — Gmail |
| **Connector** | claude.ai에서 클릭 몇 번 (Slack·Gmail) | Block 3 Plan B, Block 6 — Slack |
| **MCP 서버 / Plugin** | 서버 주소나 패키지로 연결 | Block 4·5 — Circleback·Notion |
| **붙여넣기** | 연결 없이 화면 내용을 복사해 붙여넣기 | Block 7 — Salesforce (모든 소스의 안전망) |

> 지금 이 넷을 외울 필요 없다. **"방법이 여러 가지구나"** 정도만 알고 가면 된다.
> 블록마다 "이번엔 이 방법으로 붙인다"고 그때그때 안내한다. 오늘의 주인공은 연결 방법이 아니라 **여러분이 만들 스킬**이다.

### 연결됐는지 확인하는 법: `/mcp`

지금 내 Claude Code에 뭐가 연결돼 있는지는 `/mcp` 한 줄로 본다. 오늘 내내 이 명령으로 확인한다.

## EXECUTE

터미널에 입력해서 지금 상태를 확인해보자:

```
/mcp
```

> `/mcp`를 입력하면 지금 연결된 도구 목록이 나온다.
> - 어젯밤 숙제로 연결한 게 있으면 여기 보인다.
> - 아직 아무것도 없어도 괜찮다. 오늘 블록마다 하나씩 붙인다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "MCP를 한 마디로 하면?",
    "header": "Quiz 1",
    "options": [
      {"label": "AI와 외부 도구를 잇는 표준 연결 규격", "description": "USB-C처럼 여러 도구를 하나의 규격으로 Claude에 연결"},
      {"label": "Claude를 더 똑똑하게 만드는 업그레이드", "description": "MCP는 성능이 아니라 '연결'의 문제를 푼다"},
      {"label": "콜 프렙 문서 양식", "description": "MCP는 도구 연결 프로토콜. 문서 양식이 아니다"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번.
피드백: "맞습니다. MCP = 표준 연결 규격. 오늘은 이 규격으로 Gmail·Circleback·Notion·Slack을 하나씩 꽂고, Salesforce는 붙여넣기로 가져오면서, 그 위에서 도는 내 스킬을 만듭니다."
