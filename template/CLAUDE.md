# Claude Code 入口 (CLAUDE.md)

本文件是 Claude Code 在本项目中的入口，通过 `@AGENT.md` 引用项目级单一事实来源。

```
@AGENT.md
```

Claude Code 在本项目中应遵循：
1. 先读取 `AGENT.md` 了解项目身份、编码规范、架构约束、安全审查、测试要求、门禁流程。
2. 按 `ruanjiann-skill.md` 的三阶段流程（Inception → Construction → Operations）与五阶段落地（S1–S5）派发任务。
3. 每次变更走 `protocol.yml` 门禁：plan → implement → review → security → test → judge，失败路由到 fixer。
4. 代码生成前优先生成测试（TDD 红绿循环）。
5. 架构决策写入 `docs/architecture.md`，笔记写入 `obsidian/`，记忆写入 `memory/`。
6. 所有输出附带提示词摘要与验证命令。
