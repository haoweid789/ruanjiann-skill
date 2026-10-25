# ruanjiann-skill 安装包（v3.0）

软件工程专项技能（ruanjiann-skill）v3.0 的可安装发行版。整合 13 个领域 + GitHub/Gitee 顶尖 SDLC 产品的门禁、记忆、协议、规则与子代理实践，端到端交付可运行、可测试、可维护、可审计的软件。

## 目录结构

```
ruanjiann-skill-install/
├── ruanjiann-skill.md        # 核心技能文件（v3.0，280+ 行）
├── README.md                 # 本说明文件
├── install.sh                # Git Bash / Linux 一键安装脚本
├── install.ps1               # PowerShell 一键安装脚本
├── config/skill-config.json  # ZCode 技能注册配置
├── template/                 # 可直接复制到新项目的项目骨架（v3.0）
│   ├── AGENT.md              # 项目级规则（单一事实来源）
│   ├── CLAUDE.md             # Claude Code 入口
│   ├── .clinerules           # Cline 项目规则
│   ├── protocol.yml          # 门禁协议（modes/validators/policy）
│   ├── CONTEXT.md            # 项目上下文模板
│   ├── intent.md             # Inception：意图模板
│   ├── requirements.md       # Inception：需求模板 (REQ-IDs)
│   ├── risk-register.md      # Inception：风险登记模板
│   ├── units/                # Inception：单元分解目录 (UNIT-001.md ...)
│   ├── docs/                 # architecture.md / api-contract.yaml / security-checklist.md / ui-spec.md
│   ├── construction/         # Construction：按单元/bolts 组织
│   ├── operations/           # Operations：部署/运维/观测
│   ├── src/                  # 后端 / 前端目录占位
│   ├── sql/clickhouse/       # OLAP 建表与查询模板占位
│   ├── tests/                # 测试目录占位
│   ├── ci/pipeline.yml       # CI 流水线模板
│   ├── vercel.json           # Vercel 部署配置模板
│   ├── obsidian/             # 笔记库目录占位
│   ├── memory/               # 持久化记忆（agents/plan/progress/verify/gotchas.md）
│   ├── sessions/             # JSONL 会话持久化（loopra 风格）
│   ├── audit.md              # hash-chained 审计日志模板
│   └── verification-report.md # S5 最终验收报告模板
└── examples/quick-start.md   # 快速开始示例
```

## 快速安装

### 方式 A：Git Bash（推荐）

```bash
# 进入安装包目录
cd /d/111/android/1111/ruanjiann-skill-install

# 运行安装脚本（将技能注册到 ZCode 记忆目录，并复制项目骨架模板）
bash install.sh
```

### 方式 B：PowerShell（Windows）

```powershell
# 进入安装包目录
cd D:\111\android\1111\ruanjiann-skill-install

# 运行安装脚本
.\install.ps1
```

## 启用技能

安装完成后，技能文件会被复制到 ZCode 记忆目录：

```
C:\Users\qw123\.zcode\cli\memories\projects\1111-ee346761cdb384c0\memory\ruanjiann-skill.md
```

并在 `MEMORY.md` 中追加索引条目，下次会话自动加载。

## 在新项目中使用

1. 创建新项目目录，复制 `template/` 下的所有内容进去：
   ```bash
   cp -r /d/111/android/1111/ruanjiann-skill-install/template/* /path/to/your-project/
   ```

2. 根据项目实际情况编辑：
   - `AGENT.md` / `CLAUDE.md` / `.clinerules` — 项目级规则（单一事实来源）
   - `protocol.yml` — 门禁协议（modes/validators/policy）
   - `intent.md` / `requirements.md` / `units/` — Inception 阶段产出
   - `docs/architecture.md` / `docs/api-contract.yaml` — 架构与契约
   - `CONTEXT.md` — 技术栈、约束、已知坑

3. 按 `ruanjiann-skill.md` 中的调用模板与三阶段流程派发构建任务，逐阶段通过门禁流程（§十二 protocol.yml）交付。

4. 每阶段产出必须可运行验收（`curl` 接口、`npm run build`、`clickhouse-query` 等），门禁不通过不合并。

## 示例

查看 `examples/quick-start.md`，了解如何在一个新项目中启动第一个构建任务。

## v3.0 新增特性（Gitee 精华并入）

| 特性 | 来源 | 说明 |
|---|---|---|
| 子代理角色体系 | loopra (Gitee) | explore/implement/test/review/plan 五角色，独立上下文，不可继续派生 |
| 三态 HITL 审批 | loopra (Gitee) | free / approval / auto 三种审批模式，平衡自动化与人工干预 |
| Slash 命令系统 | agent-skills (Gitee) | /spec /plan /build /test /review /ship /webperf /code-simplify 八命令 |
| 六阶段技能组织 | agent-skills (Gitee) | Define → Plan → Build → Verify → Review → Ship |
| 专家角色扩展 | agent-skills (Gitee) | code-reviewer / test-engineer / security-auditor / web-performance-auditor |
| 反合理化验证表 | agent-skills (Gitee) | 表格化强制验证，替代参考散文 |
| JSONL 会话持久化 | loopra (Gitee) | sessions/ 目录，自动摘要折叠、Token 用量统计 |
| 插件化工具热插拔 | loopra (Gitee) | 工具运行时管理，支持外置插件 |

## v3.0 整合的外部实践

| 来源 | 平台 | 核心价值 |
|---|---|---|
| cline/cline | GitHub | 跨 IDE 自主编码代理；`.clinerules`；Plan/Act 模式；checkpoints 可回滚 |
| iamfakeguru/agent-md | GitHub | AGENT.md 单一事实来源；持久化记忆；可执行层 |
| snodo-dev/snodo | GitHub | protocol.yml 门禁协议；signed token；blocker；hash-chained audit log |
| wico216/ai-sdlc | GitHub | 三阶段 SDLC；Bolts；Golden Thread；Adaptive Depth |
| aiagentflow / AutoMaintainer | GitHub | plan→implement→review→security→test→judge 门禁；5-Agent 分工；自修复循环 |
| dontriskit/awesome-ai-software-engineering | GitHub | 规范先于代码、活文档、CONTEXT.md |
| ezdemo/loopra | Gitee | 子代理角色；三态 HITL；JSONL 会话；插件化工具 |
| jxkjzx/agent-skills | Gitee | slash commands；24 技能六阶段；专家角色；反合理化表 |

## 版本

- 技能名：ruanjiann-skill
- 版本：v3.0
- 整合领域：13 个（backend / clickhouse / 前端设计与模式 / ui-ux / vercel-react / 编码规范 / 安全审查 / TDD / 架构规划 / NotebookLM / Obsidian / Superpowers / Architecture &Planning）
- 外部实践并入：cline、agent-md、snodo、ai-sdlc、aiagentflow、AutoMaintainer、awesome-ai-software-engineering（GitHub）；loopra、agent-skills（Gitee）
