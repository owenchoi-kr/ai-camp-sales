# Block 5: 소스③ Notion — 계정 페이지·세일즈 문서

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 참조: https://code.claude.com/docs/ko/mcp
> 📖 Notion MCP: https://developers.notion.com
> ```

## EXPLAIN

### 세 번째 소스: 계정에 대해 우리가 적어둔 것

메일(주고받은 말)과 미팅노트(구두 논의) 다음은, **우리가 정리해둔 문서**다. 계정 페이지, 딜 노트, QBR 자료, 계약·플랜 정보. 세일즈 조직은 보통 이걸 **Notion**에 쌓는다. 여기서 이 계정 문서를 검색해 가져온다.

### 이번 연결 방법: Notion MCP

Notion도 **MCP**로 붙는다. 이미 연결돼 있으면 `/mcp`에 `notion`이 보인다. 연결 후 계정명으로 검색하면 관련 페이지가 나온다.

### 문서 소스가 브리핑에 주는 것

문서는 **"팩트와 상태"**를 준다 — 플랜, 계약 규모, 세일즈 단계, 다음 스텝. 메일·미팅이 "무슨 대화를 했나"라면, 문서는 "이 계정이 지금 어디쯤 와 있나"를 준다. 브리핑의 뼈대가 되는 정보다.

### Plan B: 붙여넣기 모드

Notion을 안 쓰거나 연결이 안 되면, **계정 페이지 내용을 복사해 붙여넣는다.** 결과는 같다.

## EXECUTE

### Step 1: Notion 사용 여부 확인

```json
AskUserQuestion({
  "questions": [{
    "question": "계정 정보를 Notion에 정리해두시나요?",
    "header": "Notion 확인",
    "options": [
      {"label": "네, 연결돼 있어요", "description": "/mcp에 notion이 보이면 바로 검색"},
      {"label": "쓰는데 연결은 안 했어요", "description": "커넥터/서버 등록으로 연결합니다"},
      {"label": "Notion 대신 다른 데 정리해요", "description": "그 문서를 복사해 붙여넣기로 진행"}
    ],
    "multiSelect": false
  }]
})
```

> 계정 문서를 Notion이 아니라 스프레드시트·Salesforce 등 다른 데 두는 참가자는 **붙여넣기 모드**로 그 내용을 가져오면 된다.

### Step 2: 연결 확인·테스트

**MCP인 경우:**
```
1. /mcp 입력 → notion 섹션 확인
2. 테스트: 담당 계정명으로 페이지 검색
   mcp__notion__notion-search(query="{계정명}")
3. 계정 페이지·문서가 나오면 성공
   상세는 mcp__notion__notion-fetch(id) 로 열어본다
```

**붙여넣기 모드인 경우:**
```
1. 이 계정의 페이지/딜 노트 내용을 복사한다
2. Claude 대화창에 붙여넣는다
3. "이 계정의 플랜·계약 규모·세일즈 단계·다음 스텝을 정리해줘" 요청
```

### Step 3: 스킬 소스 3 채우기

`.claude/skills/my-account-sync/SKILL.md`의 **소스 3: Notion** STUB을 교체한다:

```markdown
### 소스 3: Notion — 계정 페이지·세일즈 문서

| 항목 | 값 |
|------|-----|
| 연결 방법 | Notion MCP / 붙여넣기 |
| 수집 범위 | 계정명이 들어간 페이지·문서 |

수집 방법:
- mcp__notion__notion-search(query="{계정명}") 로 계정 페이지·문서 검색
- mcp__notion__notion-fetch(id) 로 페이지 상세
- 붙여넣기: 계정 페이지 내용을 복사해 Claude에 붙여넣는다.

추출할 정보:
- 계정 기본 정보 (플랜·계약·규모)
- 세일즈 단계 / 다음 스텝
- 과거 기록된 특이사항
```

### Step 4: 지금 바로 실행해보기 (소스 3개)

같은 담당 계정으로 또 돌려본다:

```
"{계정명} 계정 싱크해줘"

이제 Gmail + Circleback + Notion 3소스:
  → 대화 접점(메일) + 구두 논의(미팅) + 팩트/상태(문서)가 한 장에
  → "이 계정이 지금 어느 단계고, 무슨 약속이 걸려 있고, 다음 스텝이 뭔지"가 잡힌다
```

> 3소스가 모이면 브리핑이 "쓸 만한 요약"에서 "콜에 그대로 들고 갈 수 있는 준비물"로 바뀐다.

```
스킬 진행 상황:
  소스 1: Gmail       ✅
  소스 2: Circleback  ✅
  소스 3: Notion      ✅ 채움!
  소스 4: Slack       [STUB]
```

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "문서 소스(Notion)가 브리핑에 주로 채워주는 정보는?",
    "header": "Quiz 5",
    "options": [
      {"label": "플랜·계약 규모·세일즈 단계 같은 '상태와 팩트'", "description": "이 계정이 지금 어디쯤 와 있는지의 뼈대"},
      {"label": "상대가 콜에서 한 말", "description": "그건 미팅노트(Circleback)의 몫"},
      {"label": "내가 답장 안 한 메일", "description": "그건 Gmail 소스의 몫"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. 문서는 "이 계정이 지금 어디쯤 와 있나"(플랜·계약·단계·다음 스텝)를 준다. 소스마다 브리핑에 채우는 조각이 다르다는 걸 느끼는 게 오늘의 포인트다.
