# ai-camp-sales — Codex 이식판

원본 [`owenchoi-kr/ai-camp-sales`](https://github.com/owenchoi-kr/ai-camp-sales) 의 **세일즈 워크플로우 4종**을 OpenAI **Codex CLI** 에서 그대로 돌도록 이식한 것.

콜 프렙 · 아웃리치 · 미팅 팔로업 · 배틀카드 — 원본 스킬의 로직·가드레일을 유지하고, 실행 환경만 Claude Code → Codex 로 바꿨다.

## 왜 이식이 쉬웠나

Codex는 2026년 들어 **Skills** 기능을 도입했고, 이게 Claude Code 스킬과 포맷이 거의 같다. 그래서 4개 워크플로우는 "재작성"이 아니라 **환경 매핑**으로 끝난다.

| 요소 | Claude Code (원본) | Codex (이식판) |
|------|--------------------|----------------|
| 스킬 파일 | `SKILL.md` (name/description frontmatter) | **동일** `SKILL.md` |
| 스킬 위치 | `.claude/skills/<name>/` | `.agents/skills/<name>/` (repo·부모 탐색) 또는 `~/.agents/skills/` |
| 호출 방식 | description 자동 매칭 | description 자동 매칭 **+** `$name` 명시 / `/skills` |
| 프로젝트 컨텍스트 | `CLAUDE.md` | **`AGENTS.md`** (자동 로드) |
| 외부 연동 | Claude 커넥터 (Gmail/Notion/Slack…) | `~/.codex/config.toml` 의 `[mcp_servers.*]` |
| progressive disclosure | 있음 | 있음 (name/description만 먼저 로드) |

**원본에서 옮기지 않은 것**: `day1~4` 캠프 스킬, `session-analyzer`, `history-insight` 등. 이들은 Claude Code 기능(메모리·훅·플러그인·서브에이전트)을 **가르치는** 교육 스캐폴드라 Codex로 옮길 실익이 없다. 실제 업무 자동화의 알맹이는 이 4개다.

## 설치

```bash
# 0) 이 리포를 clone 하면 루트 .agents/skills/ 를 codex 가 자동 인식합니다.
git clone https://github.com/owenchoi-kr/ai-camp-sales.git
cd ai-camp-sales
codex            # repo 루트에서 실행하면 4개 스킬 바로 로드 (별도 설치 불필요)

# 1) (선택) 다른 프로젝트/전역에서도 쓰기
codex/install.sh --global          # ~/.agents/skills/ 로 복사
codex/install.sh /path/to/project  # 특정 프로젝트로 복사

# 2) 컨텍스트 채우기
#   AGENTS.md 의 {{ }} 값을 내 딜 맥락으로 수정 (안 채워도 '모드 1'로 동작)

# 3) (선택) MCP 연결 — '모드 3' 자동 조회/draft
#   codex/config.toml.example → ~/.codex/config.toml 에 병합
```

## 사용

```bash
codex                 # 이 디렉토리에서 실행 (AGENTS.md 자동 로드)

/skills               # 설치된 스킬 확인
$call-prep            # 명시 호출
# 또는 그냥 자연어로:  "Acme 갱신 미팅 콜프렙 해줘"  → 자동 호출
```

4개 스킬:

| 스킬 | 하는 일 | 자동 호출 키워드 |
|------|---------|------------------|
| `call-prep` | 미팅 전 콜 프렙 브리핑 (목표·히스토리·예상반론·오프닝·다음스텝) | 콜프렙, 미팅 준비, call prep |
| `draft-outreach` | 콜드/웜 아웃리치 메일 2버전 (+Gmail draft) | 아웃리치, 콜드메일, outreach |
| `meeting-followup` | 미팅노트 → 액션아이템·CRM 제안·팔로업 메일(국/영) | 팔로업, 액션아이템, follow-up |
| `battlecard` | 경쟁 MMP 이관 설득 배틀카드 | 배틀카드, 이관 설득, battlecard |

## 동작 모드 (공통 설계)

각 스킬은 붙어있는 맥락에 따라 스스로 깊이를 조절한다 — MCP가 없어도 **깨지지 않고** 낮은 모드로 돈다.

- **모드 1** — AGENTS.md 없음 → 입력 정보만으로 일반 프레임
- **모드 2** — AGENTS.md 있음 → 내 세그먼트·톤·스테이지·금지어 반영
- **모드 3** — AGENTS.md + MCP → 자동 조회(히스토리·사례) · Gmail draft 저장

## 안전 (원본 가드레일 그대로 유지)

- 메일은 **draft까지만** — 자동 발송 금지, 발송은 사람이
- 사실 주장엔 출처(URL) 또는 `[가설]` 라벨 — 거짓 레퍼런스 방지
- 고객 실명·개인정보는 입력 그대로만, 지어내지 않음
- 경쟁사 비방 표현 생성 금지 (사실 기반 비교만)

## 검증 상태

- 4개 `SKILL.md` frontmatter/구조는 Codex Skills 스펙(`name`+`description`, `.agents/skills/`)에 맞춰 작성됨.
- **미검증**: 실제 `codex` CLI 로 로드·자동호출·MCP draft 저장까지의 end-to-end 실행은 이 환경에서 돌려보지 못함. 실기기에서 `codex` 실행 후 `/skills` 로 로드 확인 필요.
- MCP 서버 패키지명/도구명은 예시 — 각 서버 버전에 따라 다를 수 있음.
