# 快速开始示例（ruanjiann-skill v4.0）

本示例演示如何在一个新项目中启用 `ruanjiann-skill` v4.0，并派发第一个构建任务，走完 Inception → Construction → Operations 三阶段与门禁流程。

## 步骤 1：安装技能（一次性）

```bash
cd /d/111/android/1111/ruanjiann-skill-install
bash install.sh   # 或 .\install.ps1（PowerShell）
```

技能文件会被复制到 ZCode 记忆目录，并在 `MEMORY.md` 追加索引。

## 步骤 2：复制项目骨架到新项目

```bash
mkdir -p /d/111/android/1111/my-app
cp -r /d/111/android/1111/ruanjiann-skill-install/template/* /d/111/android/1111/my-app/
cd /d/111/android/1111/my-app
```

## 步骤 3：编辑项目级规则与上下文

- `AGENT.md` / `CLAUDE.md` / `.clinerules`：填写技术栈、编码规范、架构约束、安全审查要求
- `protocol.yml`：按项目实际工具链调整验证器命令
- `CONTEXT.md`：填写技术栈、约束、已知坑

## 步骤 4：Phase 1 Inception（意图与需求）

向助手发出指令：

```
角色：软件工程专项执行器
任务：为「我的应用」完成 Phase 1 Inception
阶段：Inception / S1
输入领域：Architecture &Planning / NotebookLM Skill / Obsidian Skills / Superpowers
输出要求：
1. 产出 intent.md、requirements.md（带 REQ-IDs）、units/UNIT-*.md、risk-register.md；
2. 架构决策写入 docs/architecture.md，笔记写入 obsidian/，记忆写入 memory/；
3. 所有输出附带提示词摘要与验证命令；
4. 通过 Inception EXIT 门禁（audit.md 记录人类批准）。
```

Inception EXIT 门禁通过后，才进入 Construction。

## 步骤 5：Phase 2 Construction（以 Bolt 微迭代构建）

对每个单元重复：

```
角色：软件工程专项执行器
任务：为 UNIT-001 执行 Bolt-01
阶段：Construction / S2–S4
输入领域：backend-patterns / frontend-* / clickhouse / coding-standards / security-review / tdd-workflow
输出要求：
1. 先生成测试（TDD 红绿），再生成实现代码；
2. 产出 construction/unit-001/design.md、bolt-01-plan.md、bolt-01-summary.md；
3. 走门禁：plan → implement → review → security → test → judge；
4. 失败路由到 fixer，修复后重跑后续门禁；
5. UNIT COMPLETE 门禁通过后，audit.md 记录。
```

Human-in-the-loop：每次编辑以 diff 呈现，人类审阅后批准；checkpoints 记录所有变更，可回滚。

## 步骤 6：Phase 3 Operations（生产运营）

```
角色：软件工程专项执行器
任务：完成 Phase 3 Operations
阶段：Operations / S5
输出要求：
1. 产出 operations/deployment-plan.md、operations/runbooks/、operations/observability.md；
2. 部署方案可回滚；
3. PRODUCTION READY 门禁通过，audit.md 记录。
```

## 步骤 7：验收质量门（v4.0）

对照 `ruanjiann-skill.md` §二十一 验收质量门，全部打勾后方可合并。关键项：
- [ ] AGENT.md / CLAUDE.md / .clinerules 存在
- [ ] intent.md / requirements.md / units/ 存在，Inception 门禁通过
- [ ] Golden Thread 完整：Intent → Requirements → Units → Code → Tests → Deployment
- [ ] audit.md 为 hash-chained 审计日志
- [ ] memory/ 记忆目录完整
- [ ] 通过 plan → implement → review → security → test → judge 全套门禁
