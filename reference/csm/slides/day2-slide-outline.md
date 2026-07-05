---
title: Day 2 — 내 도구를 연결하기 (MCP)
subtitle: MCP = Context Bridge
style: warm-neutral
axes: [2-context, 3-plan-light]
duration_min: 120
slides: 52
source: Notion 3기 스펙 (https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a)
---

# Day 2 · Slide Outline (v1 · Notion 스펙 정합)

> **SSOT 정렬**: Notion 3기 스펙의 Block 0–4 골격에 오프닝·마무리를 감싼다. 축 2(맥락)를 본격, 축 3(계획)은 Day 3 예고로 살짝.
>
> **스타일**: Warm Neutral · 크림(#f5ede2) + 테라코타(#c56a4a) · rounded sans — Day 1과 동일
>
> **톤 원칙**:
> - 개념 슬라이드 = `정의 + 왜 중요 + CSM 예시` 3단 구조. 단편 문장 X, 근거 포함.
> - 장식 이모지(🔌🚀✨), 장식 화살표(↓↻→), 드롭섀도, 그라디언트 배경, 숫자 폭격, "본격", "이어짐" **금지**.
> - 제목은 Notion 커리큘럼 용어 그대로. "도구맵", "연결" 같은 한 단어 코드네임 X.
> - 터미널/코드 mock 재활용. `<br>` + 문장 다듬기로 orphan 방지.

---

## 오프닝 (12분 · 4장) · S01–S04

### S01 · Cover
- template: cover (Day 1과 동일 레이아웃, 우측 terra 카드)
- eyebrow: `Day 2`
- headline: **내 도구를 연결하기**
- sub: `MCP = Context Bridge`
- right card (terra): 오늘의 축 — 2 맥락 (+ 3 계획 살짝)
- script: "어제는 '우리 팀이 처음' 문제를 CLAUDE.md로 해결했다. 오늘은 '지금 이 순간의 맥락'이 AI 손에 닿게 만든다."

### S02 · 어제 돌아보기 · 오늘의 축
- template: 2-col (어제 한 일 / 오늘 한 일)
- eyebrow: `Day 1 → Day 2`
- headline: **어제 고정값, 오늘 살아있는 값**
- intro: Day 1에서 "잘 안 바뀌는 맥락"을 CLAUDE.md에 박았다. 오늘은 "지금 이 순간만 참인 맥락"을 AI가 직접 읽게 만든다.
- left (cream): Day 1 · 축 1 구조 — 담당 고객·톤·금지어 고정. AI 기본값이 팀 수준에 맞춰짐.
- right (terra · 오늘): Day 2 · 축 2 맥락 — SFDC 미팅 노트·Slack 스레드·Notion 페이지를 **지금 바로 AI가** 읽는다.
- closing: 구조 위에 맥락이 얹히면 복리의 방향이 생긴다.

### S03 · 오늘 밤 과제 점검 · 15분
- template: checklist card (3-row)
- eyebrow: `어제 과제 · 15분`
- headline: **MCP 1개 연결했는가 — 지금 손 들기**
- intro: 오늘 120분 중 앞 15분은 어제 과제 점검이다. 연결 완료·부분 완료·막힌 사람으로 나눈다.
- 3-row (각 판정 + 대응):
  - 연결 완료 — `/mcp` 실행 후 서버 이름이 보인다. 다음 블록 준비.
  - 부분 완료 — OAuth 창은 열렸으나 토큰 확인 못 함. 운영진과 5분.
  - 막힘 — claude.ai 접속 권한·Gmail 계정 권한 이슈. 짝꿍 환경 붙여 같이 해결.
- foot: 실패가 부끄러운 게 아니라 **시도 안 한 게 데이터 없음**. 오늘 안에 전원 1개 연결까지.

### S04 · 오늘 120분 구조
- template: 7-row block list (블록·시간·산출물)
- eyebrow: `오늘 구조`
- headline: **블록 7개 · 산출물 1개 · 한 번에 쌓는다**
- rows:
  - B1 · 15분 · 맥락의 힘 — 같은 질문 다른 맥락 체감
  - B2 · 15분 · CSM 도구 맵 — 6개 도구가 담는 맥락의 종류
  - B3 · 20분 · MCP 딥다이브 — 개념 + 연결 3가지 방식
  - B4 · 25분 · MCP 연결 실습 — 핵심 도구 1~2개 직접
  - B5 · 20분 · Context Sync — 고객사 X 통합 요약
  - B6 · 10분 · 스킬 맛보기 — CLAUDE.md + MCP 위에서 다시
  - B7 · 15분 · Git/Github — push·commit·pull·merge·PR
- foot: 산출물 = CSM 실무 도구 MCP 1개 이상 연결 + 1개 통합 요약

---

## B1 · 맥락의 힘 (15분 · 5장) · S05–S09

### S05 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 1`
- headline: **맥락의 힘 — 같은 질문, 다른 맥락**
- sub: "같은 말"을 두 고객에게 써보면 왜 맥락이 정답을 바꾸는지 손에 잡힌다.

### S06 · 동일 프롬프트 · 다른 기대값 (STEP 1/4)
- template: 2-col contrast (맥락 없음 상태)
- eyebrow: `프롬프트 실험`
- headline: **"고객사 리캡 메일 초안 써줘" — 맥락 없이 던지면?**
- intro: 동일 프롬프트를 먼저 본다. 맥락이 없을 때 AI가 어떤 기본값으로 답하는가.
- body: 단일 질문 박스 제시 — `"최근 미팅 기준 리캡 메일 써줘"`
- 2-col:
  - 왼쪽 (cream): 프롬프트만 — 고객 이름·계약 구조·지난 달 논의 전부 없음
  - 오른쪽 (placeholder · 얇게): 결과 = 일반 SaaS 리캡 템플릿. 모든 고객 공용.
- closing: 결과가 "쓸만해 보여도 내 것 같지 않다"는 감각. Day 1 B2의 그 느낌.

### S07 · 고객 A — 엔터프라이즈 장기 계약 (STEP 2/4)
- template: 2-col (맥락 · 기대 답변)
- eyebrow: `고객 A · 맥락`
- headline: **같은 질문 + 고객 A 맥락 = 어떤 답이 나와야 하나**
- intro: 이제 같은 프롬프트에 **맥락을 한 장** 얹는다. 고객 A가 누구인지 AI가 알면 답이 바뀐다.
- left (cream): **고객 A 맥락**
  - 연 단위 엔터프라이즈 라이선스 · 분기 QBR 다음 주
  - 지난 미팅 = 트래킹 오차 이슈 재확인 + 리포트 커스터마이즈 요청
  - 톤 = 담당자가 임원 회람 가능성 고려, 짧고 따뜻
- right (terra): **기대 답변의 모양**
  - 인사 짧게 + 지난 이슈(오차) 처리 현황 먼저
  - QBR 다음 주 리마인드 + 어젠다 1줄
  - 다음 액션 1개 (오차 재측정 결과 공유 일자)

### S08 · 고객 B — 스타트업 초기 온보딩 (STEP 3/4)
- template: 2-col (맥락 · 기대 답변)
- eyebrow: `고객 B · 맥락`
- headline: **같은 질문 + 고객 B 맥락 = 완전히 다른 답**
- intro: 동일 프롬프트를 **다른 맥락** 위에서 돌리면, "같은 스킬이 완전히 다른 결과"를 낸다.
- left (cream): **고객 B 맥락**
  - 월 계약 스타트업 · 온보딩 3주차
  - 지난 미팅 = 이벤트 심기 가이드 + SDK 버전 이슈
  - 톤 = 실무자 개발자 대상, 기술 용어 OK
- right (terra): **기대 답변의 모양**
  - 인사 가볍게 + 이벤트 심기 진행 상황 체크
  - SDK 버전 이슈 재발 방지 3줄
  - 다음 액션 = 온보딩 4주차 기준 활성 이벤트 3개 확정

### S09 · 맥락이 바꾸는 건 정답 (STEP 4/4)
- template: concept closing (terra accent)
- eyebrow: `결론`
- headline: **같은 스킬 + 다른 맥락 = 다른 정답**
- body: 고객 A와 B는 같은 스킬을 호출했지만 답이 완전히 달라야 한다. AI 능력의 문제가 아니라 **AI가 무엇을 읽을 수 있는가**의 문제.
- 3-line insight:
  - 정답은 프롬프트에 있지 않다 — **맥락에 있다**
  - 맥락은 CLAUDE.md에도 있지만 대부분 **도구 안**에 있다
  - SFDC·Slack·Notion·Gmail을 AI가 직접 읽게 하려면 — 다음 블록 **MCP**

---

## B2 · CSM 도구 맵 (15분 · 5장) · S10–S14

### S10 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 2`
- headline: **CSM 도구 맵 — 6개 도구가 담는 맥락의 종류**
- sub: 도구는 많지만 각자 담는 맥락이 다르다. 무엇을 어디서 꺼내야 하는지부터.

### S11 · CSM 도구 6개 · 한눈에
- template: 6-card grid (2x3)
- eyebrow: `지형도`
- headline: **CSM 일상을 6개 도구가 나눠 담고 있다**
- intro: 한 명의 CSM이 하루에 만지는 도구 6개. 각자 다른 종류의 맥락을 담는다.
- 6 cards (한 줄 정의 + 담는 맥락):
  - **Salesforce** · 고객 기록·파이프라인 — 계약 단계·담당 영업·OPP 상태
  - **Plain** · 문의·티켓 — 들어온 질문·답변 히스토리·우선순위
  - **Notion** · 미팅 노트·문서 — 합의사항·로드맵·내부 운영 자료
  - **Gmail** · 커뮤니케이션 — 고객 메일 스레드·첨부·시간순 기록
  - **Sheets** · 리포트·대시보드 — 지표·수치·주기 집계
  - **Slack** · 실시간 협업 — 오늘의 맥락·빠른 결정·내부 논의
- foot: 이 중 어느 하나도 전부가 아니다. **합쳐야** 고객이 보인다.

### S12 · 도구별 맥락의 성격 (STEP 1/2)
- template: 2-col table (시간 축 · 변화 속도)
- eyebrow: `성격`
- headline: **어떤 맥락은 고정, 어떤 맥락은 5분 단위로 바뀐다**
- intro: 도구를 "담는 맥락의 변화 속도"로 구분하면 MCP로 무엇을 먼저 연결할지 감이 잡힌다.
- left column (cream) · 느린 맥락 (주/월 단위):
  - **Salesforce** — 계약·OPP 단계
  - **Notion** — 로드맵·운영 문서
- right column (terra) · 빠른 맥락 (일/시간 단위):
  - **Slack** — 오늘의 결정
  - **Gmail** — 방금 온 메일
  - **Plain** — 새 문의
- closing: **빠른 맥락**이 CLAUDE.md에 안 담기는 이유 — 매번 바뀌니까. 그래서 MCP가 필요하다.

### S13 · 도구별 담당 질문 (STEP 2/2)
- template: 5-row list (질문 → 도구)
- eyebrow: `질문 매핑`
- headline: **CSM이 하루에 떠올리는 질문 · 어디서 답이 나오나**
- rows (실무 질문 + 담당 도구 1~2개):
  - "이 고객 계약 언제 끝나?" → **Salesforce**
  - "지난 문의 뭐였지?" → **Plain** + Gmail
  - "QBR 언제 잡혔지? 어젠다 뭐야?" → **Notion** + Gmail
  - "팀에서 이 고객 관련 오늘 무슨 결정 났지?" → **Slack**
  - "이번 달 활성 이벤트 추이?" → **Sheets**
- foot: AI가 이 질문에 답하려면 각 도구에 **직접 닿아야** 한다. 그걸 가능하게 하는 게 MCP.

### S14 · 왜 "도구 맵"부터 그려야 하는가
- template: 3-reason card (terra accent)
- eyebrow: `순서`
- headline: **MCP를 아무거나 연결하지 않는다**
- 3 reasons:
  1. **우선순위** — 내 업무에서 질문 빈도가 높은 도구 먼저. Plain·Gmail·Slack부터.
  2. **시간 비용** — MCP 연결은 1개당 5분~15분. 전부 연결하면 120분 중 절반을 쓴다.
  3. **신호 관리** — 너무 많으면 AI가 "어디서 읽을지" 혼동. 3개 안쪽으로 시작.
- closing: 오늘 실습 범위는 **핵심 1~2개**. 나머지는 2주 프로젝트 중 자연스럽게 확장.

---

## B3 · MCP 딥다이브 (20분 · 7장) · S15–S21

### S15 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 3`
- headline: **MCP란 무엇인가 — 개념 + 연결 방식**
- sub: USB-C 비유 한 번, 그리고 claude.ai·local·remote 세 가지 연결 방식.

### S16 · MCP 한 줄 정의
- template: concept card (정의 + 왜 중요 + CSM 예시)
- eyebrow: `개념`
- headline: **MCP = AI와 도구를 잇는 표준 포트**
- 정의: MCP(Model Context Protocol)는 Anthropic이 만든 **AI ↔ 외부 도구 연결 표준**. 어떤 AI든, 어떤 도구든 이 포트를 지원하면 연결된다.
- 왜 중요: 예전엔 AI마다·도구마다 별도 연동이 필요했다. MCP 이후 한 번 만든 서버를 **여러 AI가 재사용**한다.
- CSM 예시: claude.ai에서 Gmail MCP를 켜면 "지난 주 고객 A 메일 요약해줘"가 진짜로 읽어서 답한다.

### S17 · USB-C 비유 — 표준 포트의 가치
- template: analogy card (before/after)
- eyebrow: `비유`
- headline: **핸드폰마다 다른 충전기에서 → USB-C 하나로**
- intro: MCP가 왜 등장했는지는 USB-C 이전 상황과 닮았다.
- left (cream) · Before · 도구별 별도 연동:
  - 도구 A는 A 전용 API 연동 코드
  - 도구 B는 B 전용 SDK
  - 새 AI가 나오면 전부 다시 연동
- right (terra) · After · MCP 표준:
  - 도구가 MCP 서버 1개 제공
  - 어떤 AI든 그 서버에 "꽂으면" 됨
  - AI가 바뀌어도 재연동 X
- closing: "표준의 승자 독식"이 이미 일어나고 있다. 지금 Gmail·Notion·Slack 공식 MCP가 다 있다.

### S18 · 연결 방식 3가지 · 개요 (STEP 1/3)
- template: 3-col overview
- eyebrow: `연결 방식 · 개요`
- headline: **MCP 연결은 3가지 방식으로 나뉜다**
- intro: 세 방식은 "어디서 도구를 돌리는가"가 다르다. 비개발자는 대부분 1번이면 충분하다.
- 3 cols (번호 + 한 줄 + 대상):
  1. **claude.ai 웹 UI** (OAuth) — 클릭 몇 번. 비개발자 기본값.
  2. **로컬 stdio 서버** — 내 컴퓨터에서 도구를 돌린다. 개발자용.
  3. **원격 HTTP/SSE** — 회사가 자체 호스팅. 기업용.
- foot: 우리는 **1번 claude.ai 웹 방식**으로 실습한다. 나머지 2·3번은 맥락만.

### S19 · claude.ai 웹 방식 (STEP 2/3)
- template: 4-step flow (클릭 순서)
- eyebrow: `방식 1 · claude.ai OAuth`
- headline: **비개발자 기본값 — 클릭 4번으로 끝난다**
- intro: claude.ai에 로그인한 상태에서 Settings 메뉴로 가면 Integrations 탭이 있다. 거기서 직접 연결한다.
- 4 steps:
  1. **claude.ai → Settings → Integrations** — 연결 가능한 도구 목록 확인
  2. **도구 선택 (예: Gmail) → Connect** — OAuth 창 팝업
  3. **Google 계정으로 로그인 + 권한 승인** — 읽기·쓰기 범위 확인
  4. **`/mcp` 명령 실행** — Claude Code·웹 세션에서 연결된 서버 목록 확인
- note: 이 방식은 세션별로 동작. 팀 공유는 안 되고 개인 계정 단위.

### S20 · 로컬 stdio · 원격 HTTP 방식 (STEP 3/3)
- template: 2-col (각 방식의 조건)
- eyebrow: `방식 2·3 · 개념만`
- headline: **로컬/원격 방식 — 맥락만 짚고 넘어간다**
- intro: 비개발자가 오늘 쓸 일은 거의 없지만, 팀 단위 확장에서 등장할 수 있어 **이름만 기억**.
- left (cream) · 로컬 stdio:
  - 내 컴퓨터에서 node·python 스크립트로 MCP 서버를 띄운다
  - `.claude.json`에 서버 경로·명령 등록
  - 장점: 커스텀 도구 연결 가능 · 단점: 설치·유지보수 필요
- right (cream) · 원격 HTTP/SSE:
  - 회사가 MCP 서버를 사내 URL에 호스팅
  - 팀원들이 URL만으로 연결
  - 장점: 팀 공유 용이 · 단점: 운영팀 필요
- closing: 3기 실습은 1번만. 2·3번은 2주 프로젝트에서 도전하고 싶은 사람 선택.

### S21 · 권한 · 토큰 · 보안 최소 3가지
- template: 3-row warning card
- eyebrow: `실습 전 · 반드시 읽기`
- headline: **MCP 연결은 "AI에게 계정 권한을 준다"는 뜻**
- intro: Gmail MCP를 켜면 AI가 내 메일을 읽을 수 있다. 연결 전에 3가지만 확인.
- 3 rows (항목 + 설명):
  1. **권한 범위** — 읽기만인지 쓰기(보내기)까지인지 OAuth 창에서 확인. 필요 이상 주지 말 것.
  2. **토큰 저장 위치** — claude.ai는 Anthropic 서버에 암호화 저장. 로컬 방식은 내 `.claude.json`.
  3. **해제 방법** — Settings에서 즉시 disconnect. 의심스러우면 바로.
- foot: 보안 사고의 90%는 "연결했다는 걸 잊어서". 정기적으로 `/mcp` 리스트 점검.

---

## B4 · MCP 연결 실습 (25분 · 7장) · S22–S28

### S22 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 4 · 실습 25분`
- headline: **MCP 연결 실습 — 1~2개 직접**
- sub: 손으로 먼저. 결과는 다음 블록에서 관찰.

### S23 · 실습 선택지 · 3개 중 1~2개
- template: 3-card option
- eyebrow: `선택`
- headline: **오늘 연결할 MCP 고르기**
- intro: 세 가지 중 본인 업무 빈도 높은 걸로 1개 필수 + 1개 선택. 짝꿍과 다른 걸로 맞추면 실습 커버리지가 넓어진다.
- 3 cards (도구 + 난이도 + 용도):
  - **Gmail MCP** (난이도 낮음) — "지난 주 고객 A 메일 요약" · 읽기만으로 충분
  - **Notion MCP** (난이도 낮음) — "미팅 노트 페이지 본문 가져와" · 페이지 권한 범위 주의
  - **Slack MCP** (난이도 중간) — "이 채널 최근 24시간 요약" · 워크스페이스 어드민 승인 필요할 수 있음
- foot: 권한 문제 막히면 **Notion이 가장 빠르게 끝난다**. 막히면 즉시 전환.

### S24 · Gmail MCP 연결 · 순서 (command guide)
- template: 4-step command
- eyebrow: `실습 · Gmail`
- headline: **Gmail MCP — claude.ai에서 4번 클릭**
- steps (각 한 줄 설명):
  - `claude.ai 로그인` · 본인 계정 확인
  - `Settings → Integrations → Gmail` · Connect 버튼
  - `Google 계정 권한 승인` · 읽기 권한 먼저, 쓰기는 건너뜀
  - `Claude Code 세션에서 /mcp` · `gmail` 서버 이름 보이면 성공
- note: 첫 연결 후 Claude Code 재시작 필요할 수 있음. 안 보이면 세션 끄고 다시.

### S25 · Notion MCP 연결 · 순서 (command guide)
- template: 4-step command
- eyebrow: `실습 · Notion`
- headline: **Notion MCP — 페이지 범위 먼저 정한다**
- steps:
  - `claude.ai → Settings → Integrations → Notion` · Connect
  - `Notion OAuth 창에서 워크스페이스 선택` · 본인 workspace 맞는지 확인
  - `페이지 범위 선택` · 전체 vs 선택 페이지. **선택 권장**
  - `/mcp` 확인 후 간단 테스트 — "내 최근 페이지 목록 줘"
- note: 전체 권한 주면 편하지만 보안 위험. CSM 업무 관련 페이지만 골라주기.

### S26 · Slack MCP 연결 · 순서 (command guide)
- template: 4-step command (terra accent · 난이도 표시)
- eyebrow: `실습 · Slack (선택)`
- headline: **Slack MCP — 어드민 승인 여부 먼저 확인**
- steps:
  - `워크스페이스 어드민이 Slack App 허용했는지 확인` — 막히면 건너뛰고 Notion
  - `claude.ai → Settings → Integrations → Slack` · Connect
  - `권한 승인 · 채널 범위 선택` — 내가 참여한 채널만 권장
  - `/mcp` 확인 + 테스트 — "이 채널 최근 메시지 5개 요약"
- note: 회사 Slack 정책상 막힐 수 있음. 막히면 Notion·Gmail로 대체.

### S27 · 연결 확인 · `/mcp` 실행
- template: terminal mock (좌) + 해석 카드 (우)
- eyebrow: `검증`
- headline: **`/mcp`가 보여줘야 할 것**
- left (terminal · 1a1410 bg):
  - `> claude`
  - `(You) /mcp`
  - `(Claude) Connected MCP servers:`
  - `  • gmail (status: active)`
  - `  • notion (status: active, scope: 12 pages)`
- right (terra card · 해석):
  - **active** — 연결 유지 중
  - **scope** — 내가 승인한 범위. 0이면 권한 재설정 필요
  - 서버 이름이 비었다면? 연결 실패. 다시.
- closing: 이 화면을 짝꿍과 비교. 같으면 다음 블록 준비 완료.

### S28 · 막혔을 때 · 3가지 전형 (troubleshooting)
- template: 3-row problem/solution
- eyebrow: `Troubleshooting`
- headline: **이 3가지 중 하나면 바로 해결된다**
- rows (증상 · 원인 · 해결):
  - `/mcp가 서버를 못 찾음` · Claude Code 재시작 안 함 · 세션 끄고 다시 열기
  - `OAuth 창이 안 뜸` · 팝업 차단 · 브라우저 팝업 허용 후 재시도
  - `권한 승인 후에도 scope 0` · Google Workspace 관리자 정책 제한 · 운영진에게 공유, 계정 관리자 승인 요청
- foot: 15분 안에 안 되면 **다른 도구로 전환**. 오늘 산출물은 "1개 연결"이지 특정 도구 아님.

---

## B5 · Context Sync (20분 · 6장) · S29–S34

### S29 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 5`
- headline: **Context Sync — 고객사 X 맥락 통합 수집**
- sub: 방금 연결한 MCP를 묶어서 "고객 한 명의 전체 맥락"을 AI가 읽게.

### S30 · 왜 "통합 수집"인가
- template: concept card (정의 + 왜 중요 + CSM 예시)
- eyebrow: `개념`
- headline: **한 도구만으로는 고객이 안 보인다**
- 정의: Context Sync = 하나의 질문을 **여러 MCP가 병렬로 읽어 합친 답**. "고객 A 현재 상황"을 물으면 SFDC + Slack + Notion이 각자 자기 조각을 준다.
- 왜 중요: 한 도구만 본 답은 반쪽. SFDC만 보면 "계약 상태"만, Slack만 보면 "오늘 분위기"만 안다.
- CSM 예시: "고객 A QBR 준비 요약"을 요청하면 SFDC 계약 단계 + Notion 지난 QBR 노트 + Slack 이번 주 논의가 한 답으로 합쳐진다.

### S31 · 고객사 X 선정 · 1명 (실습 시작)
- template: mission card
- eyebrow: `실습 · 2분`
- headline: **실습용 고객사 1개 고르기**
- body:
  - 지금 담당 중이고 **지난 2주 내 접점**이 있었던 고객 1명
  - 너무 민감한 고객 X (발표 공유 부담)
  - 맥락이 **SFDC·Slack·Notion 중 최소 2곳**에 있어야 함
- foot: 못 고르겠으면 운영진이 샘플 제공. 고른 뒤 짝꿍에게 이름만 알려주기.

### S32 · 통합 프롬프트 · 템플릿
- template: code block + 해설
- eyebrow: `프롬프트`
- headline: **한 번에 묶어서 물어보는 법**
- intro: MCP가 여러 개 연결되어 있으면 AI가 알아서 각 도구를 호출한다. 프롬프트는 "어느 도구를 쓰라"가 아니라 **"무엇을 모아라"**.
- code (cream block, SF Mono):
  ```
  고객사 X QBR 준비에 필요한 맥락을
  SFDC · Notion · Slack에서 모아줘.
  - SFDC: 계약 단계·최근 OPP 상태
  - Notion: 지난 QBR 노트 핵심 3줄
  - Slack: 이번 주 이 고객 관련 논의
  한 페이지로 통합 요약.
  ```
- 해설:
  - 도구 이름을 **명시**하면 AI가 그 MCP를 우선 호출
  - 각 도구에 기대하는 내용을 한 줄씩 줘야 품질 예측 가능
  - "한 페이지 요약"이 합치는 틀

### S33 · 실행 · 결과 관찰 (15분)
- template: output inspection (Day 1 S12 패턴)
- eyebrow: `실습 · 15분`
- headline: **나온 요약을 그대로 읽고 메모**
- intro: 고치지 말고 읽는다. 관찰 포인트 3가지만 체크.
- 3 points (관찰 항목 + 가능한 패턴):
  - **누락** — 어느 도구의 어떤 정보가 비었나? 권한 문제인가 프롬프트 문제인가?
  - **중복** — 같은 이야기가 두 도구에서 온 경우 AI가 한 번으로 합쳤나, 두 번 반복했나?
  - **맥락 깊이** — 표면 요약 vs 의사결정에 쓸만한 수준. 2주 전 논의까지 이어지는가?
- note: 첫 시도는 70%만 쓸만하면 정상. 프롬프트 다듬는 것은 2주 프로젝트.

### S34 · 짝꿍 공유 · 3분
- template: pair exercise (Day 1 S22 패턴)
- eyebrow: `공유 · 3분`
- headline: **짝꿍에게 통합 요약 한 번 읽어주기**
- 질문 3개:
  1. "이 요약을 받고 QBR 미팅 들어갈 수 있겠다 싶나?"
  2. "어느 도구 정보가 **제일 가치 있어** 보였나?"
  3. "어떤 맥락이 빠져서 **허전**했나?"
- 관점: 완성도 평가 X. "진짜 업무에 쓸 만한가" 체감.

---

## B6 · 스킬 맛보기 (10분 · 4장) · S35–S38

### S35 · 섹션 오프너
- template: section divider (cream bleed · 짧게)
- eyebrow: `Block 6`
- headline: **스킬 맛보기 — CLAUDE.md + MCP 위에서 다시**
- sub: Day 1에 받은 공용 스킬, 오늘 바뀐 상태에서 돌리면 결과가 어떻게 달라지나.

### S36 · Day 1에서 돌렸던 그 스킬, 한 번 더
- template: command repeat (Day 1 S25 패턴)
- eyebrow: `재실행`
- headline: **같은 스킬 · 같은 명령 · 바뀐 기본값**
- body:
  - Day 1 B2에서 돌렸던 리캡 메일 스킬
  - 이번에는 CLAUDE.md + 방금 연결한 MCP 위에서
  - 같은 고객사 X로 같은 명령
- 변수 3개:
  - CLAUDE.md — 담당 고객·톤·금지어 고정
  - MCP — SFDC·Notion·Slack 직접 읽기
  - 고객사 X — 방금 Context Sync 돌린 그 고객
- note: 결과 나오면 **Day 1 결과와 나란히** 비교.

### S37 · 3단 비교 · Day 1 / 어제 밤 / 지금
- template: 3-col stages (Day 1 S28 패턴)
- eyebrow: `관찰 · 진화`
- headline: **같은 스킬이 어떻게 진화했나**
- intro: 어제부터 오늘까지 3단계로 맥락이 두꺼워졌다. 스킬은 그대로, 기본값만 바뀜.
- Stage 1 · Day 1 B2 (cream) · 맥락 0:
  - 일반 SaaS 템플릿
  - 우리 팀 톤·금지어 무시
  - 고객 구체 정보 전무
- Stage 2 · Day 1 B4 (half-terra) · CLAUDE.md만:
  - 우리 팀 톤 반영됨
  - 금지어 회피
  - 고객은 여전히 일반론
- Stage 3 · Day 2 지금 (full terra) · CLAUDE.md + MCP:
  - 톤·금지어 유지
  - 고객사 X의 **구체 상황** 반영 (SFDC·Slack·Notion에서 읽음)
  - "이 고객 전용" 답
- closing: 스킬을 고친 적 없다. **맥락의 두께**가 품질을 결정한다.

### S38 · Day 3 예고 — "계획·검증"의 답답함
- template: block closing (Day 1 S23 패턴)
- eyebrow: `왜 Day 3`
- headline: **지금까지 답답하지 않았나?**
- body: 축 2 맥락은 깔렸다. 그러나 여전히
  - "이거 진짜 잘 된 건가?" (검증 없음)
  - "내가 원한 게 이거 맞나?" (계획 없음)
- pivot:
  - **오늘의 감각**: 맥락이 얹히니 결과는 좋아졌다
  - **내일의 질문** (terra): "이제 AI에게 **무엇을 시킬지부터** 같이 정해야겠다"
- foot: 이 답답함이 Day 3 첫 15분의 주제. 해소 X, 증폭 → Clarify·Deep Interview.

---

## B7 · Git / Github (15분 · 6장) · S39–S44

### S39 · 섹션 오프너
- template: section divider (terra full bleed)
- eyebrow: `Block 7`
- headline: **Git / Github — 내 것을 팀에게 넘기는 법**
- sub: push·commit·pull·merge·PR. 비개발자 맞춤 최소 세트.

### S40 · 왜 CSM이 Git을 써야 하나
- template: 3-reason card (Day 1 S08 패턴)
- eyebrow: `이유`
- headline: **"내 CLAUDE.md·스킬을 팀이 쓰게 하려면"**
- 3 reasons:
  1. **버전 관리** — 3개월 전 CLAUDE.md로 돌아가보기 · "이 스킬 왜 바뀌었지?" 추적
  2. **공유** — 내가 만든 스킬을 팀이 즉시 `clone`. 이메일·Slack 붙여넣기 X
  3. **기여** — 팀원이 내 스킬을 **개선해서 PR로 돌려줌**. 복리의 단위가 팀이 됨
- closing: 코드 작성 목적 아님. **텍스트 파일을 팀 단위로 관리하는 것**.

### S41 · 5가지 명령어 · 한 눈에
- template: 5-row command map
- eyebrow: `최소 세트`
- headline: **이 5개면 오늘은 충분하다**
- rows (명령어 · 한 줄 정의 · 언제 쓰나):
  - `git clone` · 남의 repo 내 로컬에 복제 · 공용 스킬 받을 때
  - `git pull` · 최신으로 갱신 · 팀이 수정한 걸 내 로컬에 반영
  - `git commit` · 변경사항을 "스냅샷" · 오늘 내가 한 작업 박제
  - `git push` · 내 커밋을 Github에 올림 · 팀이 볼 수 있게
  - `PR (Pull Request)` · 내 변경을 팀 repo에 "합쳐줘" 요청 · 리뷰 후 merge
- foot: 나머지 명령어(branch·rebase 등)는 2주 프로젝트에서 자연스레.

### S42 · 실습 흐름 (STEP 1/2)
- template: flow diagram (4-step)
- eyebrow: `흐름 · 개인 → 팀`
- headline: **내 수정을 팀에 공유하는 5단계**
- 5 steps:
  1. `git clone <팀 repo>` — 처음 한 번
  2. 파일 수정 (예: 내 CLAUDE.md 섹션 추가)
  3. `git commit -m "feat: 담당 고객 B 맥락 추가"`
  4. `git push` — Github에 올림
  5. **Github 웹에서 PR 생성** → 팀장 리뷰 → merge
- note: 3번 커밋 메시지는 `<type>: <설명>` 형식. `feat`·`fix`·`docs`·`refactor` 중 선택.

### S43 · PR · Merge 개념 (STEP 2/2)
- template: 2-col (PR 상태 + 역할)
- eyebrow: `PR`
- headline: **PR = "내 수정을 합쳐줘"라는 쪽지**
- intro: PR은 Github 웹에서 만든다. 터미널에서 만들 수도 있지만 오늘은 웹 UI.
- left (cream) · PR이 담는 것:
  - 무엇이 바뀌었나 (diff 자동 생성)
  - 왜 바꿨나 (설명 작성)
  - 누가 리뷰할지 (리뷰어 지정)
- right (terra) · Merge까지 가는 길:
  - 리뷰어가 코멘트 달기
  - 수정 요청 있으면 같은 브랜치에 또 커밋
  - 승인되면 merge — 팀 repo에 반영 완료
- foot: 코드가 아니라 **CLAUDE.md 문단 추가**라도 같은 흐름.

### S44 · 오늘 밤 숙제 · PR 1개
- template: homework card (Day 1 S29 패턴)
- eyebrow: `오늘 밤 과제 · 30분`
- headline: **PR 1개 올려보기 — 팀 repo에 내 CLAUDE.md 한 섹션**
- 과제:
  - 운영진이 준비한 팀 repo `clone`
  - 내 Day 1 CLAUDE.md에서 **담당 고객 섹션 하나** 떼어 팀 repo의 `members/<내이름>.md`에 추가
  - commit → push → PR 생성
  - 짝꿍 리뷰어로 지정
- foot: Day 3 첫 15분에 PR 상태 공유. 막히면 저녁에 운영진 Slack.

---

## 마무리 (5분 · 3장) · S45–S47

### S45 · 축 2 자가진단 · 5가지 질문
- template: 5-row mini-card (Day 1 S30 패턴)
- eyebrow: `자가진단 · 내 맥락이 살아있나`
- headline: **오늘 연결한 MCP, 지금 점검**
- intro: 연결했는지 X. **쓸 수 있는 상태**인지 점검.
- 5 질문:
  1. `/mcp`가 최소 1개 **active** 서버를 보여주는가? — 판정: 이름이 보이고 status active면 O.
  2. 통합 요약이 **최소 2개 도구**의 정보를 섞었는가? — 판정: "Notion에서는..., Slack에서는..." 식으로 출처 섞이면 O.
  3. 어떤 맥락이 **빠졌는지** 말로 설명 가능한가? — 판정: "SFDC 쪽 OPP 단계가 안 왔다" 정도 식별 가능하면 O.
  4. CLAUDE.md + MCP 조합이 **Day 1 단독 결과보다** 나아졌는가? — 판정: Stage 1 vs Stage 3 비교로 판단.
  5. 오늘 PR 숙제 흐름 중 **내가 막히는 지점**을 안다면? — 판정: "clone·commit·push·PR 중 어디가 헷갈리는지" 이름 붙일 수 있으면 O.
- foot: 3개 이상 O면 **축 2 0.5판 합격**. 나머지는 2주 프로젝트에서.

### S46 · Day 3 미리보기 + 오늘 밤 준비
- template: 2-col preview (Day 1 S29 패턴)
- eyebrow: `내일 준비물`
- headline: **Day 3 · 고통점 해결 스킬 + 오늘 밤 PR 1개**
- intro: 내일은 "계획(축 3)"과 "실행(축 4)"을 같이 본다. 오늘 느낀 답답함이 재료.
- Day 3 미리보기 (cream):
  - 축 3 · 계획 — Deep Interview 스킬로 문제 스펙화
  - 축 4 · 실행 — 템플릿 커스터마이징 (0.5 → 1)
  - 산출물: 동작하는 스킬 1개
- 오늘 밤 준비 (terra, 30분 이내):
  - PR 1개 올리기 (담당 고객 섹션 추가)
  - Day 3 재료 메모: "내일 스킬로 만들고 싶은 반복 업무 1개"
- closing: Day 3는 답답함 증폭 → 해소. 오늘의 감각을 그대로 가져오기.

### S47 · 마무리 클로징
- template: center-aligned wrap (Day 1 S31 패턴)
- headline: **오늘 120분 수고하셨습니다**
- message: **연결된 MCP 1개**와 **고객사 X의 통합 요약 한 장**을 가지고 내일 Day 3에서 만나요.
- sign-off: AB180 AI Camp · Day 3 → Deep Interview + 스킬 제작
