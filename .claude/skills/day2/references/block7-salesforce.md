# Block 7: 소스⑤ Salesforce — 이 계정의 딜/Opportunity

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 SFDC 웹: 담당 계정 페이지에서 Opportunity·활동 내역 복사 (붙여넣기 = 기본 경로)
> 📖 Salesforce 연결(sf CLI / MCP 커넥터): 운영진 배포 가이드 참조
> ```

## EXPLAIN

### 다섯 번째 소스: 이 계정에 걸린 딜

메일·미팅·문서·내부논의까지 왔다. 세일즈에게 마지막으로 빠질 수 없는 한 조각이 남았다 — **딜 그 자체**다. "이 계정에 열린 Opportunity가 뭐가 있지", "지금 어느 단계고, 금액이 얼마고, Close Date가 언제지", "지난번엔 뭘로 클로즈됐지". 이 정보의 원천이 **Salesforce(SFDC)**다.

Notion이 "우리가 적어둔 노트"라면, Salesforce는 **딜의 시스템 오브 레코드**다 — Stage·Amount·Close Date·Owner가 정형 데이터로 박혀 있는 곳. 콜 프렙에서 "이 계정, 지금 파이프라인상 어디쯤이고 얼마짜리인가"를 주는 유일한 소스다.

### 이번 연결 방법: 대부분은 "SFDC 웹 붙여넣기"가 기본이다

앞 소스들과 결이 다르다. 세일즈 현실에서 **대부분은 SFDC를 웹 화면으로만 쓴다.** CLI나 MCP로 자동 연결된 사람은 소수다. 그래서 이 소스는 **붙여넣기 모드를 기본 경로로** 잡는다.

| 경로 | 방법 | 누구용 |
|------|------|--------|
| **기본 (세일즈 현실)** | SFDC 웹에서 계정 페이지 열어 Opportunity·활동 내역을 복사해 붙여넣기 | 웹으로만 SFDC를 쓰는 대부분 |
| **연결됨** | Salesforce가 연결돼 있으면 계정명으로 Opportunity 자동 조회 | sf CLI / MCP 커넥터가 세팅된 사람 |
| **최소** | 열린 딜 요약(단계·금액·Close Date)을 직접 타이핑 | 위 둘 다 준비 안 된 사람 |

> Claude는 연결 명령(sf CLI 플래그·MCP 도구명)을 **지어내지 않는다.** 자동 연결은 세팅된 환경에서만 동작하고, 정확한 연결법은 운영진 배포 가이드를 따른다. 세팅이 없으면 붙여넣기로 간다 — 결과는 같다.

### 딜 데이터가 브리핑에 주는 것

Salesforce는 **"돈과 단계"**를 준다 — 열린 Opportunity의 Stage·Amount·Close Date, 계정 Owner, 지난 계약 이력. 메일·미팅이 "무슨 대화를 했나", Notion이 "어디쯤 와 있나"라면, SFDC는 "지금 이 딜이 얼마짜리고 언제 닫히나"를 못 박아준다. 콜에 들어가기 전 반드시 확인할 팩트다.

## EXECUTE

### Step 1: Salesforce를 어떻게 가져올지 확인

```json
AskUserQuestion({
  "questions": [{
    "question": "이 계정의 딜(Opportunity)을 어떻게 가져올까요?\n\n⚠️ 대부분의 세일즈는 SFDC를 웹으로만 씁니다. 그러면 붙여넣기가 기본입니다.",
    "header": "Salesforce 확인",
    "options": [
      {"label": "SFDC 웹 붙여넣기로 (기본)", "description": "계정 페이지의 Opportunity·활동 내역을 복사해 붙여넣어 진행"},
      {"label": "Salesforce 연결돼 있어요", "description": "sf CLI/MCP가 세팅됐으면 계정명으로 Opportunity 자동 조회"},
      {"label": "딜 요약을 직접 입력할게요", "description": "열린 딜의 단계·금액·Close Date를 타이핑해서 진행"}
    ],
    "multiSelect": false
  }]
})
```

### Step 2: 선택한 경로로 가져오기·테스트

**SFDC 웹 붙여넣기(기본)인 경우:**
```
1. Salesforce에 로그인해 이 계정(Account) 페이지를 연다
2. Opportunities 섹션 — 열린 딜의 이름·Stage·Amount·Close Date를 복사한다
3. Activity/History 섹션 — 최근 활동(콜·이메일·태스크) 몇 줄을 복사한다
4. Claude 대화창에 붙여넣고 요청:
   "이 계정의 열린 Opportunity(단계·금액·Close Date)와 최근 활동을 정리해줘"
```

**연결된 경우:**
```
1. Salesforce가 연결돼 있으면 계정명으로 Opportunity를 조회한다
   (정확한 조회 명령·도구명은 운영진 배포 가이드 참조 — 지어내지 않는다)
2. 열린 Opportunity 목록(Stage·Amount·Close Date)이 나오면 성공
```

**직접 입력인 경우:**
```
1. 지금 머릿속에 있는 열린 딜을 한두 줄로 적는다
   예: "Growth 업그레이드 논의 중 / Stage: Proposal / 약 $X / Close 예상 이번 분기"
2. Claude에 입력하면 그 요약이 브리핑의 딜 섹션으로 들어간다
```

> ⚠️ **금액·계약 정보는 민감하다.** 브리핑 문서엔 필요한 만큼만 남기고, 고객사·담당자 실명은 도메인·이니셜로 바꾼다.

### Step 3: 스킬 소스 5 채우기

`.claude/skills/my-account-sync/SKILL.md`의 **소스 5: Salesforce** STUB을 교체한다:

```markdown
### 소스 5: Salesforce — 이 계정의 딜/Opportunity

| 항목 | 값 |
|------|-----|
| 연결 방법 | SFDC 웹 붙여넣기 (기본) / Salesforce 연결 (세팅된 경우) / 직접 입력 |
| 수집 범위 | 이 계정의 열린 Opportunity·최근 활동·계약 이력 |

수집 방법:
- 기본(붙여넣기): SFDC 계정 페이지의 Opportunity·활동 내역을 복사해 Claude에 붙여넣는다.
- 연결됨: Salesforce가 연결돼 있으면 계정명으로 Opportunity를 조회한다.
  (정확한 조회 명령·도구명은 운영진 배포 가이드 참조 — 지어내지 않는다)
- 직접 입력: 열린 딜의 단계·금액·Close Date를 타이핑한다.

추출할 정보:
- 열린 Opportunity (단계 Stage·금액·Close Date)
- 최근 활동 (콜·이메일·태스크 로그)
- 계정 담당자 (Owner)
- 계약 이력 (지난 클로즈·갱신 시점)
```

### Step 4: 지금 바로 실행해보기 (소스 5개 — 완성!)

같은 담당 계정으로 마지막으로 돌려본다:

```
"{계정명} 계정 싱크해줘"

이제 5소스 전부:
  Gmail(상대와 주고받은 말)
  + Circleback(상대가 콜에서 한 말)
  + Notion(계정 상태·팩트)
  + Slack(우리 팀 내부 입장)
  + Salesforce(딜의 단계·금액·Close Date)
  → 계정을 360도로 보는 히스토리 브리핑
```

> 소스 1개일 때(Block 3)와 지금을 비교해보라. 같은 계정인데 브리핑의 밀도가 완전히 다르다. 특히 Salesforce가 붙으면 "이 계정, 지금 얼마짜리 딜이 어느 단계에 걸려 있나"가 한 줄로 잡힌다. 이게 "만들면서 배운다"의 결과물이다.

```
스킬 진행 상황:
  소스 1: Gmail       ✅
  소스 2: Circleback  ✅
  소스 3: Notion      ✅
  소스 4: Slack       ✅
  소스 5: Salesforce  ✅ 채움! → 5소스 완성
```

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "5개 소스 중 Salesforce가 브리핑에 주는 고유한 조각은?",
    "header": "Quiz 7",
    "options": [
      {"label": "열린 딜의 단계·금액·Close Date (파이프라인 팩트)", "description": "메일·미팅·문서가 못 주는 '딜의 시스템 오브 레코드'"},
      {"label": "상대가 콜에서 한 말", "description": "그건 Circleback(미팅노트)의 몫"},
      {"label": "우리 팀 내부의 합의된 입장", "description": "그건 Slack(내부 논의)의 몫"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. Salesforce는 **딜의 단계·금액·Close Date**를 준다 — CRM에 정형 데이터로 박힌 파이프라인 팩트다. 세일즈에게 콜 프렙의 마지막 한 조각이다.
