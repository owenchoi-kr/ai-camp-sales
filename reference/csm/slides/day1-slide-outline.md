---
title: Day 1 — 내 CSM 맥락을 구조화하기
subtitle: CLAUDE.md = Context Design
style: warm-neutral
axes: [1-structure, 2-context-light]
duration_min: 120
slides: 31
source: Notion 3기 스펙 (https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a)
---

# Day 1 · Slide Outline (v2 · Notion 스펙 정합)

> **SSOT 정렬**: Notion 3기 스펙의 Block 0–4 골격을 그대로. "왜"는 3막을 각 블록에 분산.
>
> **스타일**: Warm Neutral · 크림(#f5ede2) + 테라코타(#c56a4a) · rounded sans
>
> **톤 원칙**:
> - 개념 슬라이드 = `정의 + 왜 중요 + CSM 예시` 3단 구조. 단편 문장 X, 근거 포함.
> - 장식 이모지(🚕🚄), 장식 화살표(↓↻→), 드롭섀도, 그라디언트 배경, 숫자 폭격, FOMO, 기업 로고 **금지**.
> - 제목은 Notion 커리큘럼 용어 그대로. "뼈대 깔기" 같은 내부 코드네임 X.

---

## 오프닝 (12분 · 4장) · S01–S04

### S01 · Cover
- template: cover
- eyebrow: `Day 1`
- headline: **내 CSM 맥락을 구조화하기**
- sub: `CLAUDE.md = Context Design`
- right card (terra): 오늘의 축 — 1 구조 / 2 맥락(살짝)
- script: "오늘 120분의 목적 — AI가 매번 '우리 팀이 처음'인 상태를 '기본값을 아는 상태'로 바꾼다."

### S02 · 하네스 6축 한눈에
- template: 6-row list (정의 중심, 이번 주 실습 포인트 포함)
- eyebrow: `프레임`
- headline: **AI와 함께 일하는 6단계 사이클**
- intro: "질문 하나 던지기"가 아니라 이 6단계를 반복해야 AI가 내 일처럼 일한다. 캠프 4일은 이걸 몸으로 익힌다.
- items (번호 + 정의 + 이번 주 포인트):
  1. **구조** · AI가 내 업무를 "어디서·어떤 규칙으로" 이해할 뼈대 · CLAUDE.md·폴더·rules (terra · 오늘)
  2. **맥락** · 지금 작업에 필요한 변하는 정보 · MCP·외부 데이터 (terra · 오늘 살짝)
  3. **계획** · 무엇을·어떤 순서로·왜 · Clarify·Ouroboros
  4. **실행** · 짠 계획대로 스킬·Subagent 호출
  5. **검증** · 만든 사람(AI)이 아닌 다른 관점으로 · Generator ≠ Evaluator
  6. **개선** · 검증 결과를 rules·스킬로 되먹임 · Build→Use→Notice→Fix

### S03 · 4일 × 6축 로드맵
- template: 4-row table (Day · 중심 축 · 의도)
- eyebrow: `로드맵`
- headline: **4일 동안 어떻게 쌓이는가**
- rows:
  - Day 1 · CLAUDE.md · 축 1 + 2(살짝) · 뼈대 깔기 (terra — 오늘)
  - Day 2 · MCP · 축 2 · 도구로 맥락 확장
  - Day 3 · Skill · 축 3 + 4 · 템플릿 커스터마이징
  - Day 4 · System · 축 5 + 6 · 검증 + 개선
- foot: Day 1–2는 "계획·검증 없는" 답답함을 **의도적으로** 겪는다 → Day 3 첫 15분에 그 답답함이 "왜 계획이 먼저냐"로 연결

### S04 · 오늘의 축 (1 구조 + 2 맥락 살짝)
- template: 2-card focus (정의 + CSM 예시)
- eyebrow: `오늘`
- headline: **오늘 두 축을 같이 깐다 — 1 구조, 2 맥락(살짝)**
- card 1 (terra · 메인):
  - 축 1 · 구조
  - 정의: AI가 내 업무를 이해할 뼈대
  - CSM 예시: 담당 고객 리스트·톤앤매너·금지어를 CLAUDE.md에 박아 메일 초안마다 다시 설명 안 해도 됨
- card 2:
  - 축 2 · 맥락 (살짝)
  - 정의: 변하는 정보를 AI가 접근하게 연결
  - Day 2 예고: MCP로 Salesforce 미팅 노트 직접 읽게

---

## B1 · 왜 지금 AI인가 (15분 · 4장) · S05–S08

### S05 · 섹션 오프너
- template: section divider
- eyebrow: `Block 1`
- headline: **왜 지금 AI인가**
- sub: CSM 업무 구조가 이미 "사람 혼자로는 무리"라는 이야기

### S06 · CSM 과부하 — 동시 15개 고객
- template: numbered breakdown (문제의 구조)
- eyebrow: `문제의 구조`
- headline: **CSM은 왜 과부하인가**
- intro: CSM 한 명이 동시에 **15개 고객**을 담당한다. 각 고객마다 서로 다른 3가지 스레드가 동시에 돌고 있다.
- 3-block:
  1. **리캡** · 최근 미팅 내용·합의사항·다음 스텝을 고객마다 기억한다
  2. **문의** · Slack·Plain·이메일로 들어오는 질문을 고객별 맥락 위에서 답변한다
  3. **맥락 유지** · 지난 달 논의·내부 팀 변경·고객사 내부 구조 업데이트까지 추적한다
- closing: 15 × 3 = **동시에 유지해야 하는 45개의 상태**. 놓치는 게 당연한 구조.

### S07 · 택시 vs KTX — AI는 셋업 후 복리 도구
- template: 2-col compare (도형 없이, 구조 설명)
- eyebrow: `왜 써야`
- headline: **왜 "지금 AI"가 구조적 답인가**
- intro: 이 과부하를 사람 손으로 해결하는 접근(택시)과 구조를 한 번 깔고 AI에게 위임하는 접근(KTX)은 완전히 다른 경제학이다.
- 2-col:
  - **택시 모델 (지금까지)** · 즉시 출발하지만 구간마다 다시 설명·결제·대기 · 고객이 늘수록 비용이 곱셈으로 증가
  - **KTX 모델 (AI)** (terra) · 티켓·이동 같은 셋업 있음. 대신 한 번 타면 논스톱 · 고객이 늘어도 셋업은 한 번
- closing: "AI가 빠르다"가 아니라 **"셋업 후 한계비용이 낮다"**가 정확한 표현.

### S08 · 리더가 먼저 확신해야 하는 이유
- template: short statement + 2 reasons
- eyebrow: `왜 리더 먼저`
- headline: **이 감각은 팀원에게 "설명"으로 전달되지 않는다**
- reasons:
  1. 리더가 "이 업무는 AI가 15분에 끝낸다"를 모르면, 팀원이 그 일을 4시간에 끝내도 **칭찬만 할 수 있다**. 상한선을 아는 사람이 리더여야 한다.
  2. 팀원이 "이건 AI로 될까요?" 물을 때, 리더의 답이 "해봐"가 아니라 **"그건 이렇게 짜면 돼"**여야 조직 재설계가 시작된다.
- foot (작게): 4일차 마무리 질문 예고 — "이건 내가 해야?" → "이건 AI가 왜 안 하지?"

---

## B2 · 첫 실행 체험 (20분 · 5장) · S09–S13

### S09 · 섹션 오프너
- template: section divider
- eyebrow: `Block 2`
- headline: **첫 실행 체험 — git으로 스킬 받아서 돌려보기**
- sub: 개념을 먼저 세우지 않는다. 오늘 손으로 먼저 만진다.

### S10 · 이번 블록에서 할 것 — 3단계
- template: 3-step (번호 + 설명)
- eyebrow: `단계`
- headline: **20분 안에 해볼 3가지**
- steps:
  1. `git clone` · 운영진이 준비한 공용 스킬 repo를 내 로컬로 가져온다
  2. Claude Code에서 그 스킬을 호출한다 (리캡 메일 초안 생성)
  3. **맥락 안 준 상태**에서 나온 결과를 그대로 본다 — 고치지 말고 관찰만
- note: 결과가 70%만 쓸 만해도 정상. 핵심은 "맥락 없을 때의 기본값"을 눈으로 보는 것.

### S11 · 실습 1 — git clone & 첫 호출
- template: command guide
- eyebrow: `실습 1`
- headline: **스킬 받아오기**
- steps (각 한 줄 설명 포함):
  - `git clone <repo-url>` · 공용 repo를 내 로컬에 가져옴
  - `cd <repo>` · 해당 폴더로 이동 (Claude Code는 현재 폴더 기준 동작)
  - `claude` · Claude Code 세션 시작
  - `"리캡 메일 초안 써줘 — 고객사: 샘플 A"` · 스킬 호출
- note: 한 단계라도 막히면 짝꿍 손 들기. 운영진 지원.

### S12 · 실습 2 — 결과 그대로 읽기
- template: output inspection
- eyebrow: `실습 2`
- headline: **생성된 초안을 그대로 본다 · 고치지 않는다**
- 예상되는 결과 유형 (3포인트):
  - 인사 → 요약 → 다음 스텝 — **일반 SaaS 리캡 구조**
  - 우리 팀 용어·톤·금지어 반영 안 됨
  - 담당 고객 과거 맥락 전무 — 모든 게 "일반 고객"용 템플릿
- 관찰 포인트: 각자 내적 판단 — "이거 내가 그냥 보내도 될까?"

### S13 · 관찰 → "디버깅 마인드셋"
- template: two-reaction contrast
- eyebrow: `왜 배워야 (1/2)`
- headline: **같은 결과 앞에서 갈리는 두 반응**
- left (일반): "역시 AI는 일반 템플릿까지야" — 여기서 멈춘다
- right (terra · AI-Native): "내가 맥락을 안 줬네 — 뼈대부터 깔자" — 다음 블록으로
- closing: 엔지니어는 에러 앞에서 "이 언어 안 되네"라고 하지 않는다. **디버깅한다.** AI 결과물도 동일하게 다룬다.

---

## B3 · CLAUDE.md 설계 (45분 · 10장) · S14–S23

### S14 · 섹션 오프너
- template: section divider (terra)
- eyebrow: `Block 3`
- headline: **CLAUDE.md 설계 — 매번 처음을 없앤다**
- sub: 축 1 구조를 깊이. 30분 실습 + 짝꿍 공유 포함.

### S15 · 왜 CLAUDE.md인가
- template: concept card (정의 + 왜 중요 + CSM 예시)
- eyebrow: `개념`
- headline: **AI가 매번 "우리 팀이 처음"인 문제**
- 정의: CLAUDE.md = Claude Code가 **매 세션마다 자동으로 읽는** 고정 문서. 프로젝트 루트에 두면 모든 대화의 첫 맥락이 된다.
- 왜 중요: 매번 맥락을 붙여넣으면 복리가 없다. 한 번 박으면 **그 날 이후 모든 대화가 기본값 위에서 시작된다.**
- CSM 예시: 담당 고객 리스트·팀 용어·고객 대응 톤·금지어 한 세트가 CLAUDE.md에 있으면, 리캡 메일 요청 때마다 "고객 A는 엔터프라이즈, 톤은 짧고 따뜻하게..." 설명 안 해도 됨.

### S16 · /init 으로 초안 받기
- template: command callout
- eyebrow: `실습 · 자동 초안`
- headline: **빈 종이 앞에 앉지 않는다**
- body: Claude Code의 `/init` 명령이 하는 일
  - 내 repo 구조·README·주요 파일을 스캔
  - 그걸 바탕으로 초안 CLAUDE.md 자동 생성
  - "기본값이 어떻게 생겼나" 먼저 본 뒤 내 손으로 다듬는다
- 주의: `/init` 결과는 **출발점**. 이대로 두고 쓰겠다는 의미 아님. 다음 슬라이드부터 채운다.

### S17 · CLAUDE.md 표준 구조 — 오늘 채울 6섹션
- template: section map (1-line 설명)
- eyebrow: `템플릿`
- headline: **오늘 채울 섹션**
- sections:
  - **우리 팀** · 팀 역할·주요 목표·반복되는 업무
  - **담당 고객** · 대표 유형 (엔터프라이즈/SMB/스타트업)·계약 구조·주요 이슈
  - **톤앤매너** · 고객 앞 언어·내부 소통 언어
  - **금지어** · "반드시" "100% 보장" 같은 약속 단정·내부 용어 외부 노출
  - **워크플로우** · 리캡 메일·문의 응답·주간 미팅 준비 등 주기 반복 업무
  - **도구** · Salesforce, Plain, Notion, Gmail, Slack

### S18 · 커스터마이징 ① — 담당 고객 맥락
- template: structured example (블록 예시)
- eyebrow: `커스터마이징 1/3`
- headline: **담당 고객 맥락을 AI 기본값으로**
- 정의: "지금 이 고객이 누구인지"를 매 대화에서 다시 설명하지 않아도 되도록 고정
- 작성 예시 (코드 블록):
  ```
  ## 담당 고객
  - 대표 유형: 국내 엔터프라이즈 모바일 앱 마케팅 팀
  - 계약 구조: 연 단위 라이선스 + 분기 QBR
  - 주요 이슈: 이벤트 트래킹 오차·리포트 커스터마이즈·B2B 온보딩 지연
  ```
- 효과: "고객 A 리캡 메일"만 해도 AI가 "연 라이선스·분기 QBR 다음 주"를 **자동으로 고려해서** 초안을 쓴다.

### S19 · 커스터마이징 ② — 톤앤매너
- template: do/don't 표 (밀도 있는 텍스트)
- eyebrow: `커스터마이징 2/3`
- headline: **"내 톤"을 AI 기본값으로**
- 정의: 같은 정보라도 **누가 쓴 것처럼 보여야 하는지**가 CSM 메일의 절반을 차지한다
- DO / DON'T:
  - DO · 짧고 따뜻하게 / 다음 액션을 항상 마지막 줄에 / 우리 팀 내부 용어 그대로
  - DON'T · 형식적 영문 번역투 / "We are excited to announce..." 마케팅 과장 / 고객 앞에서 엔지니어링 변명
- closing: 톤은 쓰다 보면 **제일 눈에 띄는 차이**. 여기서 바로 "AI가 나처럼 쓰네" 감각이 생긴다.

### S20 · 커스터마이징 ③ — 금지어
- template: forbidden list with reasons
- eyebrow: `커스터마이징 3/3`
- headline: **"이 표현은 절대 쓰지 마"를 미리 말해둔다**
- 정의: AI가 기본값으로 쓰는 관용구 중 **우리 팀 컨텍스트에서 문제가 되는 것**을 차단
- 예시 (각 이유 포함):
  - "반드시" / "100% 보장" · 약속 단정. 고객 기대치 과도하게 형성 → 이후 분쟁 위험
  - "저희 개발팀이 일정상..." · 이슈 톤. 고객 앞 내부 변명은 신뢰 깎는다
  - "churn risk" 같은 내부 용어 · 외부 노출 시 불쾌감 유발 가능
- closing: 금지어는 **AI가 오히려 우리보다 잘 지킨다** (피로가 없기 때문).

### S21 · 개인 실습 (30분)
- template: mission card
- eyebrow: `실습 · 30분`
- headline: **30분 · 내 CLAUDE.md 0.5판 만들기**
- 필수 3건:
  1. `담당 고객` 섹션 3줄 이상
  2. `톤앤매너` DO 2건 / DON'T 2건
  3. `금지어` 3건 이상
- 보너스 2건:
  - `워크플로우` — 주간 반복 업무 한 줄
  - `도구` — 자주 쓰는 CSM 도구 3개 + 간단 역할
- 지원: 막히면 손 들기. 짝꿍과 같이 봐도 OK. 완벽 X — **0.5판** 목표.

### S22 · 짝꿍 공유 (10분)
- template: pair exercise
- eyebrow: `공유 · 10분`
- headline: **짝꿍과 서로 CLAUDE.md 읽기**
- 질문 3개 (짝꿍이 각자에게 한 줄씩):
  1. "이 CLAUDE.md 읽고 당신의 업무가 구체적으로 떠오르나?"
  2. "금지어 중 하나는 왜 쓰지 말라는 건지 이해되나?"
  3. "내가 추가하면 좋을 것 같은 섹션 한 개?"
- 관점: O/X 채점 아님. **"이 CLAUDE.md를 읽고 AI가 당신처럼 쓸 수 있을까?"**

### S23 · 질문 뒤집기 — "AI가 왜 안 하고 있지?"
- template: block closing + pivot
- eyebrow: `왜 리더`
- headline: **방금 만든 CLAUDE.md를 보고 나서**
- pivot:
  - **보통의 질문**: "이건 내가 해야 하는 거 아닌가?"
  - **뒤집힌 질문 (terra)**: "이건 AI가 왜 안 하고 있지?"
- body: 방금 30분 동안 당신은 AI가 당신처럼 일할 수 있는 **기본값을 깔았다**. 남은 질문은 "무엇까지 넘길 수 있는가"다.
- foot: 4일 캠프의 저변 질문. 퇴근 후·내일 밤 계속 떠오르기를.

---

## B4 · 문제해결 집중 (20분 · 5장) · S24–S28

> **방향 가정**: A) 내 CLAUDE.md로 B2 스킬 재실행 → before/after 체감. B안(자유 pain 시도)으로 전환 원하면 알려주세요.

### S24 · 섹션 오프너
- template: section divider
- eyebrow: `Block 4`
- headline: **같은 스킬, 맥락 한 장 차이**
- sub: B2에서 본 결과 vs 지금 내 CLAUDE.md를 얹은 결과를 나란히 본다.

### S25 · 다시 실행 — 같은 스킬, 다른 기본값
- template: command repeat
- eyebrow: `실습`
- headline: **B2에서 돌렸던 그 명령, 한 번 더**
- body:
  - 지금은 프로젝트 루트에 내 CLAUDE.md가 있다
  - 같은 세션에서 **동일한** "고객사 샘플 A 리캡 메일 초안" 요청
  - 결과를 메모로 남기기 (2분)
- note: 같은 명령·같은 스킬. 바뀐 건 오직 **기본값 한 장**.

### S26 · before/after 대조
- template: side-by-side checklist
- eyebrow: `관찰`
- headline: **무엇이 달라졌나**
- 관찰 포인트:
  - 톤이 내 방식으로 바뀌었는가?
  - 금지어가 실제로 빠졌는가?
  - 고객 맥락(엔터프라이즈·QBR 등)이 반영되었는가?
  - 여전히 고쳐야 할 부분은?
- 체감 포인트: 이 차이가 "내가 30분 동안 한 일"의 결과다.

### S27 · 맥락의 두께 — 복리의 시작점
- template: concept + CSM example
- eyebrow: `왜 배워야 (2/2)`
- headline: **오늘의 차이 × 내일 × 모레 = 복리**
- 정의: 한 번의 차이는 작다. 하지만 **다음 리캡·다음 미팅·다음 문의 응답이 모두 이 기본값 위에서 시작한다.**
- CSM 예시 (단계적):
  - 처음: AI 초안의 70%만 쓸만해 직접 고침
  - 리캡 3번, 5번, 10번 쌓임: "보내도 되겠다"만 판단하는 수준
  - 고객 A 맥락 축적: 다음 문의 응답에도 자동 반영
- closing: "6개월 뒤 시작"은 6개월 시간 손해가 아니라 **맥락 두께의 복리 차이**.

### S28 · 좋은 CLAUDE.md는 어떤 모양인가 (3-stage progression)
- template: 3-col stages
- eyebrow: `내일 · 모레 · 6개월 뒤`
- headline: **오늘 만든 건 0.5판 — 좋은 CLAUDE.md는 이렇게 진화한다**
- intro: 오늘 채운 건 입문자용 기본값. 실전 CLAUDE.md는 시간이 갈수록 모양이 달라진다.
- Stage 1 · 오늘: 톤·금지어·담당 고객 등 잘 안 바뀌는 맥락. 완벽 X, 0.5판 목표.
- Stage 2 · 2주 뒤: 실무 중 발견되는 반복 패턴 추가, 워크플로우 한 줄 정리, 팀 repo 공유.
- Stage 3 · 3개월 뒤: 200줄 넘으면 `.claude/rules/` + Skill 분리, 도메인·의사결정·아키텍처 `docs/`로 외화, CLAUDE.md는 지도 역할. `/context` · claude-mem 활용.
- closing: 기준은 "반복 설명이 얼마나 사라졌는가" · "팀이 얼마나 함께 편집 가능한가".

---

## 마무리 (8분 · 3장) · S29–S31

### S29 · Day 2 미리보기 + 오늘 밤 MCP 과제
- template: 2-col (cream preview + terra homework)
- eyebrow: `내일 준비물`
- headline: **Day 2 · MCP로 맥락 확장 · 오늘 밤 미리 연결**
- intro: 내일은 CLAUDE.md 위에 MCP(변하는 정보)를 얹는다. 미리 연결하면 내일 120분 전부 실습.
- Day 2 미리보기 (cream):
  - 축 2 · 맥락 — SFDC·Slack·Notion 직접 연결
  - 핵심 블록: 맥락의 힘, CSM 도구 맵, MCP 연결 실습 1~2개, Context Sync
  - 산출물: CSM 실무 도구 MCP 1개 이상 연결 완료
- 오늘 밤 과제 (terra, 30분 이내):
  - claude.ai 웹에서 Gmail 또는 Notion MCP 1개 연결
  - Claude Code 세션에서 `/mcp` 입력 · 확인
  - 준비물: SFDC 계정 권한 · Plain 접근 확인
- closing: Day 2 첫 15분 = 과제 점검 + 실패 사례 공유. 시도하는 게 핵심.

### S30 · 축 1 자가진단 — 5가지 질문
- template: 5-row mini-card (번호 + 질문 + 판정 기준)
- eyebrow: `자가진단 · 내 CLAUDE.md가 살아있나`
- headline: **오늘 깐 CLAUDE.md, 지금 점검**
- intro: 채웠는지 X. 쓸 수 있는 상태인지 점검.
- 5 질문:
  1. `담당 고객` 섹션에서 고객 유형이 떠오르는가? — 판정: "엔터프라이즈/SMB" X. "연 라이선스·분기 QBR·트래킹 오차" O.
  2. 톤 DO/DON'T가 내 실제 메일 스타일을 반영하는가? — 판정: 최근 메일 3건에서 꺼낼 수 있으면 O.
  3. 금지어에 "왜 쓰지 말라"는 이유가 붙어 있는가? — 판정: 이유 있으면 일관되게 지킨다.
  4. 짝꿍이 CLAUDE.md만 읽고 내 업무를 떠올릴 수 있는가? — 판정: "추상적/구체적 X" 피드백이면 0.5판 아직.
  5. 오늘 정의한 문제(5단 템플릿)가 이 위에서 풀릴 만한가? — 판정: 문제 이름만 주고 AI가 맥락·톤·금지어 자동 반영하면 O.
- foot: 3개 이상 O면 0.5판 합격. 나머지는 2주 프로젝트에서 채운다.

### S31 · 마무리 클로징
- template: center-aligned wrap
- headline: **오늘 120분 수고하셨습니다**
- message: **다섯 문장으로 정의한 문제**와 **한 장의 기본값**을 가지고 내일 Day 2에서 만나요.
- sign-off: AB180 AI Camp · Day 2 → MCP 연결 실습
