# Block 3: 소스① Gmail — 이 계정과 주고받은 메일

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 참조: https://code.claude.com/docs/ko/mcp
> 📖 gws CLI: 사내 배포 가이드 참조 (운영진 안내)
> ```

## EXPLAIN

### 첫 번째 소스: 이 계정과 주고받은 메일

콜 들어가기 전에 제일 먼저 뒤지는 게 뭔가? **메일함**이다. "지난번에 뭐라고 답했더라", "내가 답장 안 한 게 있었나". 이걸 자동으로 긁어오는 게 소스 1이다.

### 오늘의 연결 방법: gws CLI (사내 도구)

Gmail은 사내 **`gws` CLI**로 가져오는 게 기본 경로다. 터미널에서 명령어로 내 Gmail 스레드를 검색하는 방식이다 (Day 1에 배운 CLI).

계정 도메인으로 최근 메일을 검색한다. `q`는 Gmail 검색창에서 쓰는 문법 그대로다:

```
gws gmail users messages list --params '{"userId":"me","q":"from:{도메인} OR to:{도메인}","maxResults":20}'
```

메일 하나의 본문까지 보려면 위에서 나온 `id`로:

```
gws gmail users messages get --params '{"userId":"me","id":"{메시지ID}"}'
```

> `{도메인}`은 계정 이메일 도메인(예: `company.com`)으로 바꾼다.
> 검색 옵션을 더 좁히려면 `gws schema gmail.users.messages.list`로 `q` 문법을 확인한다.
> Claude는 명령을 지어내지 않는다 — 위 명령이 안 되면 아래 Plan B로 간다.

### 연결이 안 되면? — 3단 안전망

| 경로 | 방법 | 누구용 |
|------|------|--------|
| **기본** | gws CLI로 검색 | 사내 gws 세팅된 사람 |
| **Plan B** | claude.ai Gmail **커넥터**(MCP) — 클릭 연결 | gws 없는 사람 |
| **붙여넣기 모드** | 메일 스레드를 복사해 Claude에 붙여넣기 | 위 둘 다 안 되는 사람 |

> 셋 중 뭘로 하든 결과는 같다: **이 계정과의 메일 접점이 스킬에 들어온다.** 연결이 목적이 아니라 스킬이 동작하는 게 목적이다.

## EXECUTE

### Step 1: 어떤 경로로 갈지 확인

```json
AskUserQuestion({
  "questions": [{
    "question": "Gmail을 어떻게 연결할까요?",
    "header": "Gmail 연결",
    "options": [
      {"label": "gws CLI 됩니다", "description": "사내 gws로 Gmail 스레드 검색 (기본 경로)"},
      {"label": "gws 없어요, 커넥터로", "description": "claude.ai Gmail 커넥터로 연결 (Plan B)"},
      {"label": "둘 다 어려워요, 붙여넣기로", "description": "메일 스레드를 복사해 붙여넣어 진행"}
    ],
    "multiSelect": false
  }]
})
```

### Step 2: 선택한 경로로 연결·테스트

**gws CLI인 경우:**
```
1. 위 EXPLAIN의 gws gmail users messages list 명령을 복사한다
2. {도메인}을 테스트 계정 도메인(예: company.com)으로 바꿔 실행한다
3. 메시지 id 목록이 나오면 성공. 본문은 messages get으로 확인한다
```

**커넥터(Plan B)인 경우:**
```
1. https://claude.ai/settings/connectors 접속
2. "Gmail" 찾아 클릭 → 로그인 → "허용"
3. /mcp 입력 → claude.ai 섹션에 Gmail 보이면 성공
4. 테스트: mcp__claude_ai_Gmail__search_threads(query="from:@{도메인}")
```

**붙여넣기 모드인 경우:**
```
1. 이 계정과 주고받은 메일 스레드 1~2개를 복사한다
2. Claude 대화창에 붙여넣는다
3. "이 계정 메일에서 마지막 접점·약속·미회신을 뽑아줘"라고 요청
```

> ⚠️ 회사 계정 정책상 외부 앱 연결(커넥터)이 막힐 수 있다. 그럴 땐 gws 또는 붙여넣기 모드로 간다.
> ⚠️ **화면·문서에 고객 실명은 남기지 않는다.** 도메인·이니셜·"이 계정"으로 지칭한다.

### Step 3: 스킬 소스 1 채우기

`.claude/skills/my-account-sync/SKILL.md`의 **소스 1: Gmail** STUB을 실제 내용으로 교체한다:

```markdown
### 소스 1: Gmail — 이 계정과 주고받은 메일

| 항목 | 값 |
|------|-----|
| 연결 방법 | gws CLI (기본) / Gmail 커넥터 (Plan B) / 붙여넣기 |
| 수집 범위 | 최근 6개월, 계정 도메인 기준 |

수집 방법:
- 기본(gws CLI): gws로 계정 도메인이 포함된 Gmail 스레드를 검색한다.
  (정확한 명령·플래그는 운영진 배포 가이드 참조 — 지어내지 않는다)
- Plan B(커넥터): mcp__claude_ai_Gmail__search_threads(query="from:@{도메인} OR to:@{도메인}")
- 붙여넣기: 관련 메일 스레드를 복사해 Claude에 붙여넣는다.

추출할 정보:
- 마지막으로 주고받은 내용과 날짜
- 내가 답장 안 한 메일 / 상대가 답장 안 한 메일
- 약속·다음 스텝이 적힌 메일
- 논의 중인 안건·가격·일정
```

### Step 4: 지금 바로 실행해보기 (소스 1개)

**여기가 오늘의 핵심 리듬이다.** 소스 하나를 채웠으니 바로 돌려본다.

```
실제 담당 계정 하나를 골라 Claude에 요청:
  "{계정명} 계정 싱크해줘"  (또는 "my-account-sync 실행")

지금은 Gmail 소스 하나만 채워졌으므로:
  → 메일 접점만으로 미니 브리핑이 나온다
  → "마지막 메일 언제였고, 내가 답장 안 한 게 뭐고, 다음 스텝이 뭐였는지"
```

> 아직 미팅·문서·내부논의는 비어 있다. 그래도 **메일만으로 이미 쓸 만한 요약**이 나온다.
> Block 4~6에서 소스를 하나씩 더하면 이 브리핑이 점점 두꺼워진다. 그 변화를 직접 느끼는 게 목적이다.

```
스킬 진행 상황:
  소스 1: Gmail       ✅ 채움!
  소스 2: Circleback  [STUB]
  소스 3: Notion      [STUB]
  소스 4: Slack       [STUB]
  소스 5: Salesforce  [STUB]
```

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "Gmail 연결이 회사 정책으로 막히거나 gws가 없을 때, 오늘 실습을 못 하나요?",
    "header": "Quiz 3",
    "options": [
      {"label": "네, 연결 안 되면 못 합니다", "description": "아니다 — 붙여넣기 모드로 똑같이 따라올 수 있다"},
      {"label": "아니요, 붙여넣기 모드로 진행할 수 있다", "description": "메일 스레드를 복사해 붙여넣으면 결과는 같다"},
      {"label": "gws가 유일한 방법이다", "description": "gws·커넥터·붙여넣기 3단 안전망이 있다"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번. 연결이 목적이 아니라 **스킬이 동작하는 걸 체험**하는 게 목적이다. gws·커넥터·붙여넣기 어느 경로든 결과는 같다.
