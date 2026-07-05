# Block 8: 완성 + 실전 — 병렬 수집 + 출력 포맷 + 담당 계정 1개 실행

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/sub-agents
> ```

## EXPLAIN

### 소스 5개는 다 채웠다. 이제 엔진과 출력을 완성한다

Block 3~7에서 소스 5개를 하나씩 채우며 매번 실행해봤다. 그런데 지금까지는 소스를 **하나씩 순서대로** 수집했다. Block 8에서 두 가지를 완성한다:
1. **병렬 수집** — 5소스를 동시에 (더 빠르게)
2. **출력 포맷** — 브리핑을 어디에 내보낼지

### 병렬 수집 — Day 1 Block 3-4에서 본 그 subagent

Day 1에서 **subagent**(Claude가 다른 Claude를 불러 일을 시키는 것)를 배웠다. 여기서 쓴다.

**카페로 비유해볼게요.** 점심에 손님 5팀이 몰렸다.
- **직원 1명 (순차):** 한 명이 Gmail 받고 → 미팅 찾고 → Notion 열고 → Slack 검색 → Salesforce 조회. 5팀에 50초.
- **직원 5명 (병렬):** 한 명은 Gmail, 한 명은 Circleback, 한 명은 Notion, 한 명은 Slack, 한 명은 Salesforce. 동시에. 10초.

```
❌ 순차:  Gmail → Circleback → Notion → Slack → Salesforce   (느림)
✅ 병렬:  Gmail      ─┐
         Circleback  │
         Notion      ├── subagent 5명 동시에!
         Slack       │
         Salesforce ─┘
```

> 일부 소스가 연결 안 됐어도 괜찮다. **연결된 소스만으로 수집이 돈다.** 붙여넣기 모드로 채운 참가자는 subagent 대신 붙여넣은 내용으로 통합된다.

### 출력 포맷 — 브리핑을 어디로

| 옵션 | 설명 | 필요 조건 |
|------|------|----------|
| **Markdown 파일** (기본) | `accounts/{계정명}/` 폴더에 .md 저장 | 없음 (항상 가능) |
| **+ Slack 전송** | 담당 채널이나 나에게 DM으로 요약 | Slack MCP |
| **+ Notion 페이지** | 계정 DB에 브리핑 페이지 생성 | Notion MCP |

Markdown은 항상 포함하고, 필요하면 Slack/Notion을 더한다.

## EXECUTE

### Step 1: 출력 형식 선택

```json
AskUserQuestion({
  "questions": [{
    "question": "히스토리 브리핑을 어떤 형식으로 내보낼까요?\n\nMarkdown 파일은 기본으로 항상 포함됩니다.",
    "header": "출력 형식",
    "options": [
      {"label": "Markdown 파일만", "description": "accounts/{계정명}/ 폴더에 .md 저장 (가장 간단)"},
      {"label": "Markdown + Slack 전송", "description": "파일 저장 + 담당 채널/DM으로 요약 발송"},
      {"label": "Markdown + Notion 페이지", "description": "파일 저장 + Notion 계정 DB에 페이지 생성"},
      {"label": "Markdown + Slack + Notion", "description": "세 곳 모두에 출력"}
    ],
    "multiSelect": false
  }]
})
```

### Step 2: 실행 흐름 STUB 완성

`.claude/skills/my-account-sync/SKILL.md`의 **실행 흐름** STUB을 소스별 Agent 호출로 채운다:

```
각 소스 수집은 subagent(Agent 도구)로 병렬 실행한다.
(아래는 Claude가 자동으로 실행합니다. 여러분이 입력할 필요 없습니다.)

Agent(description="Gmail 수집", prompt="{계정명} 도메인의 최근 6개월 메일에서 마지막 접점·미회신·약속을 뽑아라", subagent_type="general-purpose")
Agent(description="Circleback 수집", prompt="{계정명}이 나온 지난 미팅에서 논의 핵심·약속·상대 우려를 뽑아라", subagent_type="general-purpose")
Agent(description="Notion 수집", prompt="{계정명} 페이지에서 플랜·계약·단계·다음 스텝을 뽑아라", subagent_type="general-purpose")
Agent(description="Slack 수집", prompt="{계정명} 관련 내부 논의에서 결정·이슈·합의된 입장을 뽑아라", subagent_type="general-purpose")
Agent(description="Salesforce 수집", prompt="{계정명}의 열린 Opportunity(단계·금액·Close Date)·최근 활동·담당자를 뽑아라", subagent_type="general-purpose")

→ 5개를 동시에 호출 (병렬 실행)
→ 연결 안 된 소스는 건너뛰고, 붙여넣은 내용이 있으면 그것으로 대체
```

### Step 3: 출력 포맷 STUB 완성

선택한 형식에 맞게 **출력 포맷** STUB을 채운다. 기본 브리핑 골격:

```
# {계정명} 히스토리 브리핑 ({날짜})

## 한 줄 요약
(이 계정과 우리의 현재 관계를 한 줄로)

## 최근 접점 타임라인
- [날짜] [소스] 무슨 일이 있었나

## 지난 미팅에서 나온 것
- 논의 핵심 / 우리·상대의 약속 (액션 아이템)

## 딜 현황 (Salesforce)
- 열린 Opportunity: 단계·금액·Close Date
- 담당자 / 지난 계약 이력

## 열려 있는 것 · 다음 액션
- [ ] 답장 필요한 메일
- [ ] 이행 안 된 약속 / 미해결 질문

## 콜 들어가기 전 체크
- 지난번 약속이 지켜졌나
- 이번 콜의 목표 한 줄
```

Slack 포함 시 추가: `mcp__claude_ai_Slack__slack_send_message(channel="{채널}", content="{요약}")`
Notion 포함 시 추가: Notion MCP로 계정 DB에 새 페이지 생성

### Step 4: 실전 — 담당 계정 1개로 실행

**오늘의 결승선이다.** 실제 담당 계정 하나를 골라 완성된 스킬을 돌린다.

```
Claude에게: "{실제 담당 계정명} 계정 싱크해줘"

Claude가 5개 subagent를 동시에 호출:
  [Gmail 수집] 진행 중...
  [Circleback 수집] 진행 중...
  [Notion 수집] 진행 중...
  [Slack 수집] 진행 중...
  [Salesforce 수집] 진행 중...
```

### Step 5: 결과 확인 + 리포트

```
싱크 완료 — {계정명}

수집 결과:
  Gmail: ✅ 성공 (스레드 8개)
  Circleback: ✅ 성공 (미팅 3개)
  Notion: ✅ 성공 (페이지 2개)
  Slack: ❌ 실패 (원인: 커넥터 미연결) → 붙여넣기로 대체 가능
  Salesforce: ✅ 성공 (열린 Opportunity 1개, 붙여넣기)

성공: 4/5 소스
→ accounts/{계정명}/{날짜}-briefing.md 저장 완료
```

> **성공한 소스만으로도 충분하다.** 5개 중 3~4개만 돼도 히스토리 브리핑의 가치를 충분히 느낀다. 나머지는 나중에 연결하면 자동으로 붙는다.
> 실패한 소스는 원인을 짚고 재시도/붙여넣기를 안내한다.

### Step 6: 결승선 확인 — "진짜 나오나?"

브리핑을 열어 함께 확인한다:
- 계정명 하나만 넣었는데 **콜에 들고 갈 브리핑**이 나왔는가?
- "지난번 약속", "다음 액션", "딜 현황", "이번 콜 목표"가 채워졌는가?

```
축하합니다 — 여러분의 스킬 my-account-sync가 완성됐습니다!

오늘 만든 것:
  ✅ 계정명 하나 → 5소스 자동 수집 → 히스토리 브리핑 한 장
  ✅ 병렬 수집 (subagent로 동시에)
  ✅ 점진적 빌드 (STUB → 하나씩 채우며 실행)

이제 콜 잡히면 "이 계정 싱크해줘" 한 마디면 됩니다.
```

## QUIZ

> Block 8은 종합 퀴즈를 낸다. 사용자가 돌아오면 "오늘의 결승선까지 왔습니다! 마지막으로 오늘을 정리하는 퀴즈입니다."라고 안내한 뒤 순서대로 출제한다.

### Quiz 8-1: 병렬 수집

```json
AskUserQuestion({
  "questions": [{
    "question": "5소스를 subagent로 '병렬' 수집하는 이유는?",
    "header": "Quiz 8-1",
    "options": [
      {"label": "여러 소스를 동시에 모아 시간을 아낀다", "description": "직원 5명이 각자 맡아 동시에 처리"},
      {"label": "하나가 실패하면 전체가 멈추게 하려고", "description": "반대다 — 독립 실행이라 한 소스 실패가 나머지에 영향 없다"},
      {"label": "데이터를 더 정확하게 만든다", "description": "정확도는 병렬/순차와 무관"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. 병렬 수집은 5소스를 **동시에** 모아 시간을 아낀다. 게다가 독립 실행이라 한 소스가 실패해도 나머지는 그대로 나온다.

### Quiz 8-2: 부분 성공

```json
AskUserQuestion({
  "questions": [{
    "question": "5소스 중 Slack만 연결이 안 됐습니다. 오늘 실습은?",
    "header": "Quiz 8-2",
    "options": [
      {"label": "실패다, 5개 다 돼야 한다", "description": "아니다 — 성공한 소스만으로도 브리핑이 나온다"},
      {"label": "성공한 4소스로 브리핑이 나온다", "description": "나머지는 나중에 붙이면 자동으로 채워진다"},
      {"label": "처음부터 다시 해야 한다", "description": "다시 할 필요 없다"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번. 성공한 소스만으로도 충분하다. Slack은 나중에 커넥터로 붙이거나 붙여넣기로 대체하면 된다.

### Quiz 8-3: 오늘 만든 것

```json
AskUserQuestion({
  "questions": [{
    "question": "오늘 만든 my-account-sync가 하는 일을 한 문장으로?",
    "header": "Quiz 8-3",
    "options": [
      {"label": "계정명 하나로 5소스에서 접점을 모아 콜 프렙 브리핑을 만든다", "description": "Gmail·Circleback·Notion·Slack·Salesforce → 히스토리 브리핑 한 장"},
      {"label": "이메일을 대신 써서 보낸다", "description": "그건 Day 3의 draft-outreach 영역"},
      {"label": "계정에 점수를 매겨 우선순위를 정한다", "description": "오늘 만든 건 리서치/브리핑 스킬"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. my-account-sync는 **계정명 하나 → 5소스 수집 → 콜 프렙용 히스토리 브리핑**이다. 이게 오늘의 산출물이다.
