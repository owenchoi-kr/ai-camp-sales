# Block 3-2: Skill

> 핵심 기능 4개 중 두 번째. 지금 이 `/day1`도 Skill이다.

## EXPLAIN

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/skills
> ```

| 항목 | 내용 |
|------|------|
| 근본 원리 | **점진적 로딩(Progressive Disclosure)** — CLAUDE.md는 항상 전부 읽히지만, Skill은 필요할 때만 꺼내 읽힌다. 컨텍스트 윈도우는 유한하니 필요한 순간에 필요한 지식만 로딩 |
| 비유 | 업무 레시피 — 반복 업무를 한 번 저장하면 다음부터 한 줄로 실행 |
| 세일즈 예시 | "이 계정 히스토리 브리핑", "미팅 팔로업 초안", "경쟁사 배틀카드" — 매번 설명하던 걸 한 줄로 |

```
CLAUDE.md ━━━━━━━━━━━━━━━━━━ 항상 로딩 (매 세션)
Skill A   ─ ─ ─ ─ ┐
Skill B   ─ ─ ─ ─ ─ ─ ─ ┐   필요할 때만 로딩
                  ▼          ▼
             "/call-prep"  자동 매칭
```

### Skill 폴더 구조

```
my-skill/
├── SKILL.md          # 필수: 스킬 본체. 메타데이터 + 지시사항
├── references/       # 선택: 참고 문서, 교안
└── scripts/          # 선택: 실행 코드
```

- `SKILL.md`만 있으면 스킬이 된다. 지금 이 `/day1` 온보딩도 `SKILL.md` + `references/` 구조다.
- **Day 2~3에서 여러분은 자기 스킬(`my-account-sync`, `call-prep`)을 직접 만든다.** 오늘은 "이게 뭔지"만.

## EXECUTE

Skill이 어떻게 동작하는지 직접 체험한다. 아래를 입력하라고 안내한다:

```
/day1-test-skill
```

> 이 테스트 스킬을 실행하면 축하 메시지가 나온다. `/day1-test-skill` 입력 → Claude가 그 스킬의 SKILL.md를 찾아 읽고 → 지시대로 출력. 이게 Skill의 원리다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "Skill은 CLAUDE.md와 달리 어떻게 로드되나요?",
    "header": "Quiz 3-2",
    "options": [
      {"label": "필요할 때만 점진적으로 로드된다", "description": "호출하거나 자동 매칭될 때만 올라옴"},
      {"label": "CLAUDE.md처럼 매번 전부 로드된다", "description": "그러면 컨텍스트가 금방 찬다"},
      {"label": "한 번 로드하면 영구 저장된다", "description": "세션 끝나면 사라짐"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번. CLAUDE.md는 매 세션 전부 로드되지만, Skill은 **점진적 로딩** — 필요할 때만 꺼내 읽힌다.
