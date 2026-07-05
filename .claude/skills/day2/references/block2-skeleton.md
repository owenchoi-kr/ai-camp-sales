# Block 2: my-account-sync 스켈레톤 생성

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/skills
> ```

## EXPLAIN

### 오늘 만들 스킬: my-account-sync

Day 1 Block 3-2에서 **스킬(Skill)** 을 배웠다. "반복하는 업무를 한 번 저장하면 다음부터 한 줄로 실행하는 업무 레시피." 오늘은 이 스킬을 **직접 만든다.**

만들 스킬은 `my-account-sync`:

```
입력:  계정명 하나 (회사명 또는 @도메인)
        ↓
       Gmail · Circleback · Notion · Slack 4소스에서 이 계정 접점 수집
        ↓
출력:  콜 프렙용 히스토리 브리핑 한 장
```

### 0에서 만들지 않는다 — 뼈대를 받아서 채운다

빈 화면에서 스킬을 짜는 게 아니다. 운영진이 만든 **템플릿(뼈대)**을 복사한다. 이 뼈대에는 소스 4개가 **STUB**(빈칸)으로 들어 있다. 오늘은 이 STUB을 블록마다 하나씩 채운다.

```
Block 2 (지금):  [STUB Gmail] [STUB Circleback] [STUB Notion] [STUB Slack] ← 빈 뼈대
Block 3:         [Gmail]      [STUB]            [STUB]        [STUB]        ← 소스1 채움
Block 4:         [Gmail]      [Circleback]      [STUB]        [STUB]        ← 소스2 채움
Block 5:         [Gmail]      [Circleback]      [Notion]      [STUB]        ← 소스3 채움
Block 6:         [Gmail]      [Circleback]      [Notion]      [Slack]       ← 소스4 채움
Block 7:         [완성!] 병렬 수집 → 실전 계정으로 히스토리 브리핑
```

### Explore 에이전트로 먼저 훑기

스킬을 만들기 전에, 내 프로젝트에 뭐가 있는지 먼저 본다. **Explore 에이전트**는 폴더·파일을 빠르게 훑는 **읽기 전용** subagent다. 요리 전에 냉장고 여는 것과 같다 — 뭐가 있는지 알아야 빠진 재료를 안다.

## EXECUTE

### Step 1: Explore로 프로젝트 훑기

> 아래는 Claude가 자동으로 실행합니다. 여러분이 입력할 필요 없습니다.

```
Claude가 수행:
  Agent(
    description="프로젝트 구조 탐색",
    prompt="프로젝트 루트에서 다음을 확인하라:
      1. 전체 폴더 구조 (최대 2단계)
      2. .claude/ 디렉토리 내용, 기존 스킬 목록
      3. CLAUDE.md 존재 여부 (Day 1 산출물)
      4. 이미 연결된 MCP 설정 흔적 (.mcp.json 등)",
    subagent_type="Explore"
  )
```

탐색 결과를 공유한다:
- Day 1에 만든 CLAUDE.md가 있는지 (담당 계정 맥락 → 브리핑 품질에 직결)
- 이미 연결된 도구가 있는지 (숙제로 연결한 것)

### Step 2: 스켈레톤 스킬 파일 생성

`templates/my-account-sync.md`를 읽고, 사용자 프로젝트에 `.claude/skills/my-account-sync/SKILL.md`를 생성한다.

생성 규칙:
1. 템플릿을 **그대로** 복사한다 (소스 4개 STUB 포함)
2. Explore에서 CLAUDE.md를 찾았으면, description을 참가자 담당 세그먼트에 맞게 한 줄 다듬는다
3. 숙제로 이미 연결한 도구가 있으면 해당 소스 코멘트에 "숙제로 연결됨" 메모

### Step 3: 생성 결과 확인

```
.claude/skills/my-account-sync/SKILL.md 생성 완료!

구조:
  📌 소스 1: Gmail       [STUB - Block 3에서 gws CLI로 연결]
  📌 소스 2: Circleback  [STUB - Block 4에서 MCP로 연결]
  📌 소스 3: Notion      [STUB - Block 5에서 MCP로 연결]
  📌 소스 4: Slack       [STUB - Block 6에서 MCP로 연결]
  📌 실행 흐름           [STUB - Block 7에서 완성]
  📌 출력 포맷           [STUB - Block 7에서 완성]

다음 블록(Block 3)부터 STUB을 하나씩 채우고, 채울 때마다 실행해봅니다!
```

> 지금은 빈 뼈대다. Block 3부터 소스를 하나씩 채우고, 채운 소스만으로 바로 실행해 스킬이 점점 좋아지는 걸 확인한다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "오늘 my-account-sync를 만드는 방식은?",
    "header": "Quiz 2",
    "options": [
      {"label": "빈 화면에서 스킬을 처음부터 짠다", "description": "0에서 만들지 않는다 — 운영진 템플릿(뼈대)을 받아서 채운다"},
      {"label": "뼈대를 받아 STUB을 블록마다 하나씩 채운다", "description": "소스 하나 채울 때마다 실행해 점점 좋아지는 걸 확인"},
      {"label": "4개 소스를 한 번에 다 연결하고 끝낸다", "description": "한 번에 붙이지 않는다 — 하나씩 붙이며 체감하는 게 핵심"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번. 뼈대(STUB 4개)를 복사해두고, Block 3~6에서 하나씩 채운다. 채울 때마다 실행해보는 게 오늘의 핵심 리듬이다.
