# Block 0: Setup

> Claude Code 설치는 README의 사전 준비(Step 0)에서 이미 끝낸 상태다.
> 이 블록은 첫 실행이 제대로 됐는지만 확인하고 다음으로 넘어간다. 퀴즈 없음.

## EXPLAIN

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/setup
> 📖 빠른 시작: https://code.claude.com/docs/ko/quickstart
> ```

### 지금 이 화면이 Claude Code다

여러분은 지금 터미널에서 `claude`를 실행해 이 대화를 하고 있다. 이게 Claude Code다. 버튼도 메뉴도 없이, 그냥 말로 시킨다. 오늘 하루 이 대화창 하나로 다 한다.

### 첫 실행 체크 (3가지)

| 확인 | 방법 |
|------|------|
| 로그인 됐나 | Anthropic 계정 로그인 + Claude 구독(Pro/Max/Teams/Enterprise) 연결 확인 |
| 이 레포 안에서 실행 중인가 | `ai-camp-sales` 폴더에서 `claude`를 켰는지 확인 (Claude Code는 현재 폴더 기준으로 동작) |
| 배우기 좋은 모드인가 | `/config` → Output style → **Explanatory** 선택 (왜 그렇게 했는지 설명을 같이 해준다) |

### 막히면

- 설치·로그인이 막히면 [claude.ai](https://claude.ai) 대화창에 "Claude Code 설치하는 방법 알려줘"라고 입력하면 환경에 맞는 단계별 안내를 받는다.
- 라이브 수업이면 짝꿍한테 손 들기 → 운영진 5분 사이드 세션. 90%는 재로그인 또는 재시작으로 해결된다.

> 에디터(Cursor/VSCode 등)는 오늘 없어도 된다. 터미널의 이 대화창만으로 충분하다.

## EXECUTE

순서대로 실행하라고 안내한다:

1. `/config` → Output style → **Explanatory** 설정
2. 첫 대화: `안녕, 나는 [이름]이고 세일즈야. 나한테 인사해줘`
3. 확인용 한 마디: `지금 내가 어느 폴더에서 너를 실행하고 있어?` → `ai-camp-sales`가 나오면 정상

## QUIZ

> Block 0은 퀴즈 대신 완료 확인만 한다.

```json
AskUserQuestion({
  "questions": [{
    "question": "첫 실행까지 확인됐나요?",
    "header": "Setup 확인",
    "options": [
      {"label": "모두 완료!", "description": "Block 1로 이동"},
      {"label": "아직 진행 중", "description": "조금 더 시간이 필요함"},
      {"label": "트러블슈팅 필요", "description": "설치/로그인/폴더에 문제 발생"}
    ],
    "multiSelect": false
  }]
})
```
