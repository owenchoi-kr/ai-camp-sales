# Block 4: 소스② Circleback — 이 계정과의 지난 미팅노트

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 참조: https://code.claude.com/docs/ko/mcp
> 📖 Circleback: https://circleback.ai
> ```

## EXPLAIN

### 두 번째 소스: 지난 미팅에서 뭐라고 했더라

메일 다음으로 자주 뒤지는 게 **미팅노트**다. "지난 콜에서 상대가 뭘 걱정했지", "우리가 뭘 약속했지", "액션 아이템이 뭐였지". **Circleback**은 미팅을 자동 기록·요약해주는 도구다. 여기서 이 계정이 나온 미팅을 검색해 가져온다.

### 이번 연결 방법: MCP 서버

Gmail은 CLI/커넥터로 붙였다. Circleback은 **MCP 서버**로 붙는다. 이미 연결돼 있으면 `/mcp`에 `circleback`이 보인다. 없으면 커넥터/서버 등록으로 붙인다 (운영진 안내).

> 소스마다 연결 방법이 조금씩 다른 걸 느끼고 있는가? 이게 Block 1에서 말한 "방법이 여러 가지"다.

### 미팅노트가 브리핑에 주는 것

미팅노트는 다른 소스가 못 주는 걸 준다 — **상대의 말과 약속**. 메일은 텍스트지만, 미팅노트에는 "누가 무엇을 우려했고, 무엇을 하기로 했는지"가 들어 있다. 콜 프렙의 핵심 재료다.

### Plan B: 붙여넣기 모드

Circleback을 안 쓰거나 연결이 안 되면, **미팅노트 텍스트를 복사해 붙여넣는다.** 결과는 같다.

## EXECUTE

### Step 1: Circleback 사용 여부 확인

```json
AskUserQuestion({
  "questions": [{
    "question": "Circleback(미팅노트)을 사용하시나요?",
    "header": "Circleback 확인",
    "options": [
      {"label": "네, 연결돼 있어요", "description": "/mcp에 circleback이 보이면 바로 검색"},
      {"label": "쓰는데 연결은 안 했어요", "description": "커넥터/서버 등록으로 연결합니다 (운영진 안내)"},
      {"label": "안 써요, 붙여넣기로", "description": "미팅노트 텍스트를 복사해 붙여넣어 진행"}
    ],
    "multiSelect": false
  }]
})
```

### Step 2: 연결 확인·테스트

**MCP인 경우:**
```
1. /mcp 입력 → circleback 섹션 확인
2. 테스트: 실제 담당 계정명으로 미팅 검색
   mcp__circleback__SearchMeetings(query="{계정명}")
3. 지난 미팅 목록이 나오면 성공
```

**붙여넣기 모드인 경우:**
```
1. 이 계정과의 지난 미팅노트를 복사한다
2. Claude 대화창에 붙여넣는다
3. "이 미팅에서 논의 핵심·우리 약속·상대 우려·액션 아이템을 뽑아줘" 요청
```

> ⚠️ 미팅노트에는 참석자 실명이 들어 있다. **브리핑 문서로 옮길 땐 이니셜/직책으로 바꾼다.**

### Step 3: 스킬 소스 2 채우기

`.claude/skills/my-account-sync/SKILL.md`의 **소스 2: Circleback** STUB을 교체한다:

```markdown
### 소스 2: Circleback — 이 계정과의 지난 미팅노트

| 항목 | 값 |
|------|-----|
| 연결 방법 | Circleback MCP / 붙여넣기 |
| 수집 범위 | 이 계정이 언급된 지난 미팅 전체 |

수집 방법:
- mcp__circleback__SearchMeetings(query="{계정명}") 로 미팅 검색
- mcp__circleback__ReadMeetings 또는 SearchTranscripts 로 상세 내용
- mcp__circleback__SearchActionItems(query="{계정명}") 로 액션 아이템
- 붙여넣기: 미팅노트 텍스트를 복사해 Claude에 붙여넣는다.

추출할 정보:
- 지난 미팅에서 논의된 핵심
- 우리가 약속한 것 / 상대가 약속한 것 (액션 아이템)
- 상대의 우려·반대·질문
- 담당자·의사결정자 언급 (문서엔 이니셜로)
```

### Step 4: 지금 바로 실행해보기 (소스 2개)

같은 담당 계정으로 다시 돌려본다:

```
"{계정명} 계정 싱크해줘"

이제 Gmail + Circleback 2소스가 채워졌으므로:
  → 메일 접점 + 지난 미팅의 약속/우려가 함께 나온다
  → Block 3의 브리핑보다 한 겹 두꺼워진 걸 확인한다
```

> 메일만 있을 때와 비교해보라. "상대가 무엇을 걱정했고 우리가 무엇을 약속했는지"가 붙으면서 브리핑이 확 살아난다.

```
스킬 진행 상황:
  소스 1: Gmail       ✅
  소스 2: Circleback  ✅ 채움!
  소스 3: Notion      [STUB]
  소스 4: Slack       [STUB]
  소스 5: Salesforce  [STUB]
```

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "미팅노트(Circleback)가 콜 프렙에 주는 고유한 가치는?",
    "header": "Quiz 4",
    "options": [
      {"label": "상대의 말·우려·약속(액션 아이템)을 담는다", "description": "메일·문서가 못 주는 '상대가 무엇을 말했나'를 준다"},
      {"label": "계정의 계약 금액을 계산해준다", "description": "그건 Notion 등 문서 소스의 몫"},
      {"label": "이메일을 대신 보내준다", "description": "미팅노트는 발송 도구가 아니다"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. 미팅노트의 힘은 **상대의 말과 약속**을 담는다는 것이다. 그래서 콜 프렙에서 "지난번 약속이 지켜졌나"를 점검하는 핵심 재료가 된다.
