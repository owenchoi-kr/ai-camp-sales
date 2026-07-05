# Block 6: 소스④ Slack — 이 계정 관련 내부 논의

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 참조: https://claude.ai/settings/connectors
> ```

## EXPLAIN

### 네 번째 소스: 팀이 이 계정을 두고 나눈 이야기

메일·미팅·문서는 다 **상대와의 접점**이었다. 마지막 소스는 결이 다르다 — **우리 팀 내부 논의**다. "이 계정 지원 이슈 있었지", "가격 어디까지 열어주기로 했지", "누가 이 계정 담당이었지". Slack 채널·스레드에 흩어진 이 맥락을 검색해 가져온다.

### 이번 연결 방법: Slack MCP (Connector)

Slack은 claude.ai **커넥터**로 붙는 게 가장 쉽다 (Block 3에서 본 그 커넥터). 연결하면 `/mcp`의 claude.ai 섹션에 `slack`이 보이고, 계정명으로 내부 논의를 검색할 수 있다.

### 내부 논의가 브리핑에 주는 것

내부 논의는 **"우리 쪽 입장과 히스토리"**를 준다 — 팀이 합의한 가격 여지, 과거 이슈·에스컬레이션, 담당자 간 정리된 방향. 콜에 들어가기 전 "우리 편이 이 계정을 어떻게 보고 있는지"를 아는 것이다.

### Plan B: 붙여넣기 모드

Slack 연결이 회사 정책으로 막히면, **관련 스레드를 복사해 붙여넣는다.** 결과는 같다.

## EXECUTE

### Step 1: Slack 사용 여부 확인

```json
AskUserQuestion({
  "questions": [{
    "question": "이 계정 관련 내부 논의를 Slack에서 하시나요?\n\n⚠️ 회사 Slack은 관리자 정책상 외부 앱 연결이 막힐 수 있습니다.",
    "header": "Slack 확인",
    "options": [
      {"label": "네, 커넥터로 연결합니다", "description": "claude.ai 커넥터로 Slack 연결"},
      {"label": "이미 연결돼 있어요", "description": "/mcp에 slack이 보이면 바로 검색"},
      {"label": "회사 정책상 막혀요, 붙여넣기로", "description": "관련 스레드를 복사해 붙여넣어 진행"}
    ],
    "multiSelect": false
  }]
})
```

### Step 2: 연결 확인·테스트

**커넥터인 경우:**
```
1. https://claude.ai/settings/connectors 접속
2. "Slack" 찾아 클릭 → 워크스페이스 로그인 → "허용"
3. /mcp 입력 → claude.ai 섹션에 slack 보이면 성공
4. 테스트: 담당 계정명으로 내부 논의 검색
   mcp__claude_ai_Slack__slack_search_public_and_private(query="{계정명}")
```

**붙여넣기 모드인 경우:**
```
1. 이 계정이 언급된 Slack 스레드를 복사한다
2. Claude 대화창에 붙여넣는다
3. "이 계정에 대해 팀 내부에서 결정된 것·이슈·합의된 입장을 뽑아줘" 요청
```

> ⚠️ 내부 논의에는 동료 실명이 섞인다. **브리핑 문서엔 이니셜/직책으로 바꾸고, 민감한 내부 판단은 요약만 남긴다.**

### Step 3: 스킬 소스 4 채우기

`.claude/skills/my-account-sync/SKILL.md`의 **소스 4: Slack** STUB을 교체한다:

```markdown
### 소스 4: Slack — 이 계정 관련 내부 논의

| 항목 | 값 |
|------|-----|
| 연결 방법 | Slack MCP (Connector) / 붙여넣기 |
| 수집 범위 | 계정명이 언급된 내부 채널·스레드 |

수집 방법:
- mcp__claude_ai_Slack__slack_search_public_and_private(query="{계정명}") 로 내부 논의 검색
- 붙여넣기: 관련 Slack 스레드를 복사해 Claude에 붙여넣는다.

추출할 정보:
- 이 계정에 대한 팀 내부 논의·결정
- 지원·이슈·에스컬레이션 이력
- 담당자 간 합의된 입장 (문서엔 이니셜로)
```

### Step 4: 지금 바로 실행해보기 (소스 4개 — 완성 직전)

같은 담당 계정으로 마지막으로 돌려본다:

```
"{계정명} 계정 싱크해줘"

이제 4소스 전부:
  Gmail(상대와 주고받은 말)
  + Circleback(상대가 콜에서 한 말)
  + Notion(계정 상태·팩트)
  + Slack(우리 팀 내부 입장)
  → 계정을 360도로 보는 히스토리 브리핑
```

> 소스 1개일 때(Block 3)와 지금을 비교해보라. 같은 계정인데 브리핑의 밀도가 완전히 다르다. 이게 "만들면서 배운다"의 결과물이다.

```
스킬 진행 상황:
  소스 1: Gmail       ✅
  소스 2: Circleback  ✅
  소스 3: Notion      ✅
  소스 4: Slack       ✅ 채움! → 4소스 완성
```

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "4개 소스 중 Slack(내부 논의)만 결이 다릅니다. 뭐가 다른가요?",
    "header": "Quiz 6",
    "options": [
      {"label": "유일하게 '우리 팀 내부' 맥락을 준다", "description": "나머지 셋은 상대와의 접점, Slack은 우리 쪽 입장·히스토리"},
      {"label": "유일하게 실시간이다", "description": "실시간 여부가 핵심 차이는 아니다"},
      {"label": "유일하게 붙여넣기가 안 된다", "description": "Slack도 붙여넣기 모드로 대체 가능하다"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. Gmail·Circleback·Notion은 상대와의 접점이고, Slack은 **우리 팀이 이 계정을 어떻게 보는지**를 준다. 네 조각이 다 모여야 계정을 360도로 본다.
