---
name: amp-deck
description: 잠재 고객사 맞춤 Amplitude 세일즈덱(원페이지 사이트형 아티팩트)을 만든다. braze-deck의 검증된 gold-standard 구조를 복제하되 Amplitude(프로덕트/행동 분석) 앵글·브랜드로 바꾼다. Amplitude 공식 자료 + AB180 CS Hub 사례만 근거로 쓰고, 없는 수치는 지어내지 않는다. "amp 덱", "amplitude 덱", "앰플리튜드 세일즈덱", "amp 맞춤 덱", "/amp-deck" 요청에 사용.
triggers:
  - "amp 덱"
  - "amplitude 덱"
  - "앰플리튜드 덱"
  - "amplitude 세일즈덱"
  - "amp 맞춤 덱"
  - "amp deck"
---

# Amp Deck — 잠재 고객사 맞춤 Amplitude 세일즈덱 생성기

`braze-deck`의 짝. **검증된 `gold-standard-example.html` 구조/디자인/분량을 그대로 복제**하고,
내용·앵글·브랜드만 **Amplitude(프로덕트·행동 분석)** 로 바꿔 계정별 원페이지 덱을 만든다.

> Amplitude 셀링 포인트(CLAUDE.md): 리텐션·퍼널·유저 여정 분석, 실험(A/B), CDP.
> 제안 상황 = "데이터로 유저 행동을 이해하고 프로덕트/그로스 의사결정을 개선하고 싶다."

## 재료 파일 (braze-deck와 공유)
- 구조 템플릿: `/Users/ab180/.claude/skills/braze-deck/reference/gold-standard-example.html`
  → **이 파일을 복제해 골격/섹션/분량을 그대로 쓰고, 내용을 Amplitude로 교체 + 브랜드 리컬러.**
- 콘텐츠: `/Users/ab180/.claude/skills/braze-deck/reference/content-library.md`
  → **§6 Amplitude 검증 수치 / §7 Amplitude 공개 사례(proof URL) / §8 Amplitude 경쟁 포지셔닝·FAQ / §9 Braze+Amplitude 번들** 만 Amp 덱에 사용.
  - ⚖️ **거버넌스**: `§CUSTOMER-SAFE`만 사용. `⛔ DO-NOT-USE/내부전용`은 절대 넣지 않는다. 정량 수치는 "공개 페이지 확인/verified live"만.

## 브랜드 (Braze 덱과 구분)
- 액센트: **Amplitude 블루**(코발트 계열, 예 `#1C6EEB`/`#2B67F6`)로 gold-standard의 보라(Braze)를 치환.
- favicon: **🔵** (재발행 시 유지)
- `<title>`: `Amplitude × <계정명> — 맞춤 제안`
- description: `<계정명> 맞춤 Amplitude 세일즈덱`

## 표준 섹션 구성 (gold-standard 10섹션을 Amplitude로 매핑)
1. 히어로(계정 앵글: "OO의 데이터로 유저를 이해한다")
2. **"○○에 이렇게"(4단계 맞춤 여정: 계측→분석→인사이트→실험/개선, #fit)**
3. Amplitude 소개 (Analytics + CDP + Experiment)
4. 핵심 특장점 (비개발자 self-serve · 깊은 코호트/퍼널/리텐션 · 행동 데이터 기반 의사결정)
5. 핵심 기능 (퍼널 · 리텐션 · 유저 여정(Pathfinder) · 코호트 · Session Replay · 실험(A/B))
6. **분석을 한눈에(#channels 대응 → 분석 유형 한눈에)**
7. 활용 사례 (content-library §7 proof: 3o3/삼쩜삼, First Car/Mr.Pick, 쏘카플랜 Session Replay 등 업종 맞는 것)
8. 차별점 6
9. **도입 로드맵(#roadmap)**
10. FAQ(§8 기반) + 문의
- 번들이 유효하면(계정이 Braze 보유/검토 중) 차별점↔로드맵 사이에 **"Amplitude+Braze 함께 쓰면"(#bundle, §9 Closed Loop)** 추가(→11섹션). 추가 시 sec↔alt 교차 재정렬.
- 배경은 hero 다음부터 sec ↔ sec alt 교차. 문의(footer) 고정.

## STEP 0 — 계정별 Salesforce Opportunity 조회 (맞춤화 근거)
braze-deck과 동일. `mcp__salesforce__run_soql_query`, `usernameOrAlias="myorg"`, `directory="/Users/ab180/ai-camp-sales"`.
```sql
SELECT Id, Name, StageName, Type, Amount, CloseDate, CreatedDate,
       Product_Line__c, NET_ACV_KRW__c, LeadSource, NextStep, Description,
       Account.Name, Account.Industry, Account.Sales_Group__c, Owner.Name
FROM Opportunity
WHERE Account.Name LIKE '%<계정키워드>%'
ORDER BY CreatedDate DESC
```
- `Account.Industry` → 세그먼트(핀테크·금융 / 커머스·리테일 / 구독앱 / 앱테크) → §7 사례·FAQ 선택.
- `Product_Line__c` → 이미 Amplitude면 심화/확장 앵글, Airbridge/Braze만 있으면 Amp 신규 소개 + (Braze 보유 시) §9 번들 강조.
- Opp 없으면 업종/앵글 한 줄 확인 후 진행.

## 입력받을 것 (계정별)
- 고객사명(필수) / 업종·세그먼트(없으면 계정명으로 추정 후 한 줄 확인) / 미팅 앵글·페인포인트(있으면) / Braze 번들 강조 여부(기본 미포함, 요청 시 §bundle 추가)

## 실행 절차
1. **`artifact-design` 스킬 로드**(발행 전, Artifact 규칙).
2. **복제**: gold-standard-example.html을 스크래치패드에 `amp-deck-<계정슬러그>.html`로 복사.
3. **Amplitude로 교체 + 리컬러**: HERO/여정/기능/사례/FAQ를 위 §매핑대로. Braze 문구·보라를 Amplitude 문구·블루로. 활용 사례는 §7에서 업종 맞는 것, 정량치 없는 사례엔 숫자 붙이지 않기.
4. **가드레일 점검** 후 **Artifact 발행** (favicon 🔵, 계정별 file_path=별도 URL, 같은 계정 수정은 같은 file_path=같은 URL).
5. URL 전달(여러 계정이면 계정↔URL 표).

## 가드레일 (CLAUDE.md 준수 — braze-deck와 동일)
- 경쟁 제품(Mixpanel·GA4·Adobe·Heap·PostHog 등) **폄하 금지.** 우리 강점 중심.
- "무조건·반드시·100% 보장" 등 단정 금지. 가격·조건 확정처럼 말하지 않기("확정 조건 아님" footnote).
- 없는 수치/사례 창작 금지. 정량치는 §CUSTOMER-SAFE 출처 있는 것만. 성과 수치엔 "사례·벤치마크 기준, 실제 결과는 환경에 따라 다름" disclaimer.
- 문의처(footer): 양관승 · kwanseung@ab180.co · +82 10 3863 8947 · www.ab180.co (고정)
- 톤: 따뜻하고 관계 중심.

## 업데이트 로그
- 2026-07-16: v1. braze-deck의 gold-standard/content-library를 공유 재사용해 Amplitude 짝 스킬 신설. deal-watch에서 Amplitude 딜 처리 시 호출.
