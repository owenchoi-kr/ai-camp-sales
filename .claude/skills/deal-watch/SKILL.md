---
name: deal-watch
description: '#deal-allocation-kr(신규 옵티 알람 채널)을 스캔해 아직 처리 안 한 Amplitude·Braze 딜을 찾아, 딜별로 ①미팅 전 역샌(계정 리서치) + ②맞춤 세일즈덱을 만들고, 결과를 해당 딜 스레드(또는 검증 중엔 내 DM)에 올린다. 처리한 Opportunity ID를 상태 파일에 기록해 중복 방지. 클라우드 스케줄(routine)로 승격해 반자동 운영. "딜와치", "새 딜 확인", "deal-allocation 스캔", "신규 딜 역샌", "/deal-watch" 요청에 사용.'
triggers:
  - "딜와치"
  - "deal watch"
  - "새 딜 확인"
  - "신규 딜 확인"
  - "deal-allocation 스캔"
  - "신규 딜 역샌"
---

# Deal Watch — 신규 딜 미팅 전 자동화 러너

`#deal-allocation-kr`에 BDR 봇이 올리는 신규 미팅(Opportunity) 알람을 스캔해서,
**아직 처리 안 한 Amplitude·Braze 딜**마다 아래를 자동으로 수행한다.

1. **미팅 전 역샌(계정 리서치)** — `my-account-sync`로 과거 접점 브리핑
2. **맞춤 세일즈덱** — Braze면 `braze-deck`, Amplitude면 `amp-deck`으로 계정 맞춤 덱 아티팩트 게시
3. **스레드 게시** — 해당 봇 메시지 스레드에 리서치 요약 + 덱 링크를 답글로 게시

처리한 Opportunity ID를 상태 파일에 남겨 **같은 딜을 두 번 처리하지 않는다.**

> **역할 맥락**: 양관승(리셀링→2026 4분기 신규 세일즈) 팀의 신규 딜 인에이블먼트 도구.
> 담당 제품은 **Amplitude·Braze 두 개뿐**이므로 그 외 제품(Airbridge·RevenueCat 등)은 건너뛴다.

---

## 채널 / 봇 정보 (고정)

- 채널: **#deal-allocation-kr** = `C01HES9VCLB`
- 알람 봇: **BDR - Deal Allocation BOT** = bot_id `B01A0H5CYNS`
- 상태 파일: `/Users/ab180/ai-camp-sales/deal-watch/processed-opps.json`
- 실행자 DM(검증/알림용): 양관승 Slack user_id → 첫 실행 시 `slack_search_users(query="양관승")` 또는 `kwanseung@ab180.co`로 확인해 상태 파일 `owner_dm`에 캐시.

### 봇 메시지 포맷 (파싱 대상)

봇 메시지 본문은 아래 골격이다. 굵은 필드만 파싱하면 된다.

```
안녕하세요, 신규 미팅 정보 공유드립니다.
<Basic>
> • Company : {회사명(국문/영문 병기 가능)}
> • Company info : MAU {n}, Revenue/Investment {n}억원
> • App Name : {앱}
> • Product : {Airbridge|Amplitude|Braze|RevenueCat}      ← 필터 기준
> • Owner : <@{slack_uid}|{이름}>                          ← 담당자
<Meeting>
> • Preferred date : {일정}
> • Meeting Type : {대면|화상}
> • Agenda : {안건}
<Currnet Situation>
- {계정 배경 불릿들}                                        ← 앵글/페인포인트 힌트
Link : <{SF Opportunity URL}>                              ← opp ID 추출원
```

- **opp ID**: `Link`의 SF URL `.../Opportunity/{ID}/view`에서 `{ID}`(006으로 시작) 추출. **이게 중복 판별 키.**
- **Product**: `Amplitude` 또는 `Braze`만 처리 대상. 그 외는 skip(상태에 `skipped`로 기록해 재검토 안 함).

---

## 실행 절차

### STEP 1 — 상태 로드
`processed-opps.json`을 읽는다. 없으면 아래 스켈레톤으로 생성:
```json
{ "mode": "validate", "owner_dm": null, "processed": {}, "last_scan_ts": null }
```
- `mode`: `"validate"`(결과를 owner DM으로) 또는 `"live"`(결과를 딜 스레드에 게시). **기본 validate.** live 승격은 사용자가 명시적으로 요청할 때만 바꾼다.
- `processed`: `{ "<oppId>": {"company","product","status","deck_url","ts","handled_at"} }`

### STEP 2 — 채널 스캔
`slack_read_channel(channel_id="C01HES9VCLB", limit=50)` (필요 시 `oldest=last_scan_ts`로 증분).
- bot_id `B01A0H5CYNS`의 "신규 미팅 정보" 메시지만 추린다.
- 각 메시지 파싱 → `{company, product, owner, agenda, situation, oppId, message_ts}`.

### STEP 3 — 필터
다음만 **처리 대상**:
- `product ∈ {Amplitude, Braze}`
- `oppId`가 `processed`에 **없음** (이미 처리/skip한 건 제외)

Amp/Braze 아닌 건은 `processed[oppId] = {status:"skipped_product"}`로 기록만.

처리 대상이 0건이면 "새로 처리할 Amp/Braze 딜 없음" 보고하고 종료.

### STEP 4 — 딜별 처리 (여러 건이면 계정별 병렬 서브에이전트)
각 대상 딜에 대해:

**(a) 미팅 전 역샌** — `my-account-sync` 스킬을 `company`로 실행.
- 5개 소스(Gmail·Circleback·Notion·Slack·Salesforce) 중 붙은 것만. 실패 소스는 표시.
- 산출: 한 줄 요약 / 최근 접점 타임라인 / 지난 약속·다음 액션 / 콜 전 체크.
- `Currnet Situation`·`Agenda`를 앵글 힌트로 함께 넘긴다.

**(b) 맞춤 덱** — product에 따라:
- `Braze` → `braze-deck` 스킬 (favicon 🟣)
- `Amplitude` → `amp-deck` 스킬 (favicon 🔵)
- 입력: company, 업종/세그먼트(SF `Account.Industry`로 추정), 앵글(Agenda+Situation).
- **이미 덱이 있는 계정 확인**: braze-deck 메모리/기존 아티팩트에 같은 계정 덱이 있으면 새로 만들지 말고 그 URL 재사용(MGS2026에서 만든 15개 등). 상태 파일이나 `Artifact action:"list"`로 조회.
- 산출: 게시된 아티팩트 URL.

**(c) 스레드 게시물 작성** — 아래 템플릿. `mode`에 따라 대상만 다르다.
- `mode=="live"` → `slack_send_message(channel_id="C01HES9VCLB", thread_ts=message_ts, ...)` **초안 게시 전 반드시 STEP 5 가드 통과.**
- `mode=="validate"` → `slack_send_message(channel_id="<owner_dm>", ...)` (스레드 아님, DM으로 요약+링크만).

```
📋 {회사명} · {제품} 신규 딜 미팅 전 준비 (자동)

한 줄 요약: {역샌 한 줄 요약}

지난 접점
{타임라인 3~5줄, 없으면 "이전 접점 기록 없음(신규 계정)"}

미팅 앵글
- 안건: {Agenda}
- 상황: {Situation 핵심 1~2줄}
- 추천 스토리: {제품 기반 한 줄, 예: Amp면 "데이터로 유저 행동 이해→그로스 의사결정", Braze면 "세그먼트별 적시 메시징으로 리텐션·전환"}

🎯 맞춤 피칭 덱: {deck_url}

(자동 생성 · 확정 조건 아님 · 사용 전 검토 권장)
```

### STEP 5 — 게시 전 가드레일 (live 모드 필수)
공용 채널에 오발송하면 되돌리기 어렵다. **live 게시 전 아래를 모두 확인**:
- [ ] 덱 아티팩트가 실제로 게시됐고 URL이 열린다(생성 실패 시 게시 보류, DM으로 사용자에게 알림).
- [ ] 역샌·덱에 **없는 수치/약속 단정("무조건·반드시·100% 보장")·확정 가격** 없음 (CLAUDE.md 금지어).
- [ ] 경쟁 제품 폄하 표현 없음.
- [ ] thread_ts가 **정확히 그 딜의 봇 메시지**인지 재확인(엉뚱한 스레드 방지).
- 최초 live 전환 후 **첫 1~2건은 사용자에게 한 번 확인**받고 게시(안정화).

### STEP 6 — 상태 갱신
처리한 각 oppId를 `processed`에 기록(status: `posted` 또는 `dm_sent`, deck_url, handled_at). `last_scan_ts`를 최신 메시지 ts로 갱신. 파일 저장.

### STEP 7 — 보고
사용자에게 이번 실행 요약: 스캔 n건 / 신규 대상 m건 / 처리 결과(계정·제품·덱URL·게시위치) 표.

---

## 트리거(발동) 방식 — 현실

Slack은 Claude를 직접 깨우지 못한다. "자동"은 둘 중 하나:

- **클라우드 스케줄(routine, 권장)** — `schedule` 스킬로 크론 등록(예: 평일 09:00·13:00·18:00). 세션 없이 이 러너를 실행.
  - ⚠️ **커넥터 주의**: Slack·Salesforce·Notion 등은 claude.ai 커넥터(MCP)라, 헤드리스/크론 환경에서 인증이 **안 붙을 수 있다.** 스케줄 등록 후 **첫 자동 실행이 실제로 채널을 읽고 게시하는지 반드시 검증**한다. 안 되면 `/loop` 또는 수동 실행으로 폴백.
- **`/loop`** — 세션 켜둔 동안 N분마다 폴링(세션 종료 시 멈춤).
- **수동** — "새 딜 확인해줘"로 온디맨드 실행.

## 가드레일 (CLAUDE.md 준수)
- 담당 제품은 **Amplitude·Braze만.** 그 외 제품 딜은 처리하지 않는다.
- 없는 수치/사례 창작 금지, 단정·확정 표현 금지, 경쟁사 폄하 금지 (덱·역샌·스레드 문구 전부).
- 공용 채널 게시는 mode=live에서만, STEP 5 가드 통과 후. 기본은 validate(DM).
- 문의처·톤은 각 덱 스킬의 가드레일을 따른다(따뜻하고 관계 중심).

## 업데이트 로그
- 2026-07-16: v1. #deal-allocation-kr 파서 + Amp/Braze 필터 + my-account-sync/braze-deck/amp-deck 오케스트레이션 + 처리이력 상태파일 + validate/live 모드. 검증은 validate(DM)로 시작, 안정화 후 live+스케줄 승격.
