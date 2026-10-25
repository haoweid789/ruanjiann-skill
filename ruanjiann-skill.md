---
name: ruanjiann-skill
description: 软件工程专项技能（ruanjiann-skill v3.0）—— 整合 13 个领域 + GitHub/Gitee 顶尖 SDLC 实践，端到端交付可运行、可测试、可维护、可审计的软件
metadata:
  node_type: memory
  type: user
  version: "3.0"
---

# 软件工程专项技能（ruanjiann-skill v3.0）

**一句话定位**：以助手为首要生产力，从意图捕获到生产运营，端到端交付可运行、可测试、可维护、可审计的软件。13 个输入领域全部并入，外加 GitHub/Gitee 上 cline / agent-md / snodo / ai-sdlc / loopra / agent-skills 等顶尖 SDLC 产品的门禁、记忆、协议、规则与子代理实践。

**Why**：v2 已整合 backend/clickhouse/前端/ui-ux/vercel-react/编码规范/安全审查/TDD/架构/NotebookLM/Obsidian/Superpowers 等 13 个领域，并并入 GitHub 的门禁、记忆、协议与三阶段 SDLC。v3 进一步吸收 Gitee 上 loopra / agent-skills 的精华——子代理角色体系、三态 HITL 审批、slash 命令系统、六阶段技能组织、反合理化验证表、JSONL 会话持久化与 Token 统计、插件化工具热插拔——让交付的软件更贴近工业级标准。

**How to apply**：每新建一个软件构建任务，先按 §I–§II 分阶段派发，再套用 §十二 门禁协议（protocol.yml）与 §十一 持久化记忆；每阶段必须产出可运行的验收物，门禁不通过不合并。

---

## 一、领域映射表（13 → 阶段职责）

| 输入领域 | 归并阶段 | 具体职责与交付物 |
|---|---|---|
| Architecture &Planning | S1 规划与架构 / Inception | 模块划分、技术选型、API 契约、数据流图、部署拓扑、ADR 决策记录 |
| backend-patterns | S2 后端实现 / Construction | 分层/六边形/CQRS/事件驱动、服务拆分、数据访问层、错误处理 |
| clickhouse | S3 数据与分析 | OLAP 表设计、物化视图、埋点/日志/时序查询、SQL 调优 |
| frontend-design | S4 前端交付 / Construction | 设计系统、响应式布局、视觉规范、原型、交互稿 |
| frontend-patterns | S4 前端交付 / Construction | 组件组合、状态管理、自定义 Hook、路由守卫、前端模块边界 |
| ui-ux-pro-max | S4 前端交付 / Construction | 可用性检查、无障碍 (a11y)、移动端优先、动效、UX 埋点 |
| vercel-react-best-practices | S4 前端交付 / Construction | Next.js/React 结构、Server Components、边缘函数、ISR/SSG、Vercel 部署 |
| coding-standards | 贯穿全程 | 命名、目录结构、提交信息、代码审查清单、TS 严格模式、lint |
| security-review | 贯穿全程 + 门禁 | OWASP Top 10、依赖扫描、密钥/环境变量、CSP、输入验证输出转义 |
| tdd-workflow | S5 测试与闭环 | 红绿重构、测试金字塔、单元/集成/契约测试、CI 流水线 |
| NotebookLM Skill | S1 / Inception | 需求文档→任务拆解、会议记录→待办、源文献追踪、知识库索引 |
| Obsidian Skills | S1 / Inception | 双向链接笔记、技术文档库、ADR、知识图谱、项目 Wiki |
| Superpowers | 贯穿全程（元能力） | 元提示工程、多模型路由、协作编排、自愈代码、自动化验证循环 |

---

## 二、端到端交付流程（三阶段 SDLC + 五阶段落地）

借鉴 ai-sdlc（Inception → Construction → Operations）与 snodo（门禁协议），把 v1 的 S1–S5 映射为可执行的三阶段：

### Phase 1: Inception（意图与需求，对应 S1）
回答 WHAT + WHY。Construction 不开始，直到意图清晰。

| 步骤 | 交付物 | 验收 |
|---|---|---|
| Capture Intent | `intent.md` | 问题、愿景、成功标准、约束均有明确表述 |
| Elaborate Requirements | `requirements.md`（带 REQ-IDs） | v1/v2/out of scope 已划分 |
| Unit Decomposition | `units/UNIT-001.md ...`（DDD bounded contexts） | 可并行交付，每个单元有验收标准 |
| Risk Assessment | `risk-register.md` | 风险 + 缓解 + 负责人 |
| **Gate: INCEPTION EXIT** | `audit.md` 记录 | 人类批准，所有单元已定义 |

### Phase 2: Construction（如何构建，对应 S2–S4）
以 **Bolts**（小时/天级微迭代，而非 Sprint 周）为单位构建。

| 步骤 | 交付物 | 验收 |
|---|---|---|
| Design per Unit | `construction/unit-NNN/design.md` | 架构与数据模型，无与其他单元冲突 |
| Plan Bolt | `bolt-NN-plan.md`（2–3 任务/bolt） | 每个 bolt 可独立验证 |
| Execute Bolt | 代码 + diff（human-in-the-loop 审阅） | lint/类型检查通过 |
| Validate | 测试 + 手工验证 | 所有 acceptance criteria 满足 |
| **Gate: UNIT COMPLETE** | `audit.md` 记录 | 测试全绿，人类批准 |

**Bolts 特性**：每个 bolt 包含 plan → execute → validate → human-approve，失败返回 fixer 重跑，不跳过验证。

### Phase 3: Operations（生产运营，对应 S5 + 部署）
| 步骤 | 交付物 | 验收 |
|---|---|---|
| Deployment Plan | `operations/deployment-plan.md` | 可部署、可回滚 |
| Runbooks | `operations/runbooks/` | 故障/扩容/维护手册 |
| Observability | `operations/observability.md` | 日志/指标/告警/链路追踪 |
| **Gate: PRODUCTION READY** | `audit.md` 记录 | 可部署 + 可观测 + 可回滚 |

---

## 三、Golden Thread（可追溯线）

每个 artifact 必须可追溯：

```
Intent (intent.md)
  └── Requirements (requirements.md, REQ-IDs)
        └── Units (units/UNIT-*.md)
              └── Design (construction/unit-*/design.md)
                    └── Bolts (bolt-*-plan.md)
                          └── Code + Tests + Verification
                                └── Deployment + Operations
```

任意环节断链即判定为不可交付。生成的每一段代码都必须能回溯到对应的 bolt 和 REQ-ID。

---

## 四、Adaptive Depth（按风险调整严格度）

| 深度 | 适用场景 | 门禁要求 |
|---|---|---|
| Minimal | 简单 Bug 修复、内部工具 | 自测 + 人类快速审阅 |
| Standard | 一般业务功能 | TDD 测试 + security-review + CI 全绿 |
| Comprehensive | 核心支付/安全/受监管系统 | 全套门禁 + 形式化验证 + 第三方审计 + hash-chained audit log |

---

## 五、子代理角色体系（借鉴 loopra）

Loopra 原生提供五种子代理角色，每个拥有独立推理上下文，不可继续派生，通过 `sub_agent` 工具派生，支持共享上下文协作，可独立配置工具范围和超时控制。

| 角色 | 职责 | 权限 | 对应阶段 |
|---|---|---|---|
| explore | 项目探索与调研 | 只读 | Inception / S1 |
| implement | 功能实现 | 可写入 | Construction / S2–S4 |
| test | 测试编写与执行 | 可写入 | Construction / S5 |
| review | 代码审查 | 只读 | 门禁 review |
| plan | 计划制定 | 只读 | Inception / 门禁 plan |

额外专家角色（借鉴 agent-skills）：
- **code-reviewer**：五维代码评审，合并前必过
- **test-engineer**：测试金字塔，红绿重构
- **security-auditor**：OWASP Top 10 防御，依赖扫描
- **web-performance-auditor**：Web 性能审计，Lighthouse 指标

---

## 六、Slash 命令系统（借鉴 agent-skills）

八个核心 slash commands，映射开发生命周期：

| 命令 | 用途 | 对应阶段 |
|---|---|---|
| `/spec` | 编写 PRD / 需求规格，规范先于代码 | Inception |
| `/plan` | 制定实施计划，拆分 Bolts | Inception → Construction |
| `/build` | 生成功能实现代码 | Construction |
| `/test` | 编写与执行测试，TDD 红绿 | Construction |
| `/review` | 代码评审与结构化裁定 | 门禁 review |
| `/ship` | 部署发布与上线 | Operations |
| `/webperf` | Web 性能审计 | Operations |
| `/code-simplify` | 代码简化与重构 | Construction |

使用方式：在助手交互中直接调用对应命令，每个命令产出可验证的 artifact。

---

## 七、三态 HITL 审批模式（借鉴 loopra）

门禁不是建议，而是结构化强制执行。Human-in-the-Loop 提供三种审批模式：

| 模式 | 行为 | 适用场景 |
|---|---|---|
| free | 跳过工具审批及项目边界检查，工具参数校验仍生效 | 纯探索、内部工具、低风险 |
| approval | 只读工具和普通项目内操作自动放行，其余转人工审批 | 一般业务功能开发 |
| auto | 先应用 approval 规则，再由校验模型审核剩余调用，失败则转人工 | 高自动化需求、受监管系统 |

审核链在检测到项目外文件写入或命令目标时会要求人工确认，校验模型无法放行。

执行流程：
```
plan → implement → review → security → test → judge
            ↑          │         │        │      │
            └──────────┴── fix ──┴────────┴──────┘
```

- **signed validation token**：变更须通过验证签名后才能进入下一阶段。
- **blocker**：单一阻塞项可中止执行，不可被投票推翻。
- **hash-chained audit log**：每条治理决策写入 `audit.md`，不可删除、不可修改，形成审计链。
- **worktree 隔离**：每个任务在独立 git worktree 分支运行，人类 merge 前工作目录保持 untouched。
- **fixer 回环**：任一阶段失败，路由到 fixer 附带精确问题描述，修复后重跑后续门禁。

---

## 八、人机职责分离

| 助手执行（Execution） | 人类决策（Decisions） |
|---|---|
| 代码生成、测试编写、文档撰写、计划提案、研究分析、 artifact 创建 | 需求范围、架构选型、安全控制、Go/No-Go 批准、风险接受、门禁最终裁定 |

人类始终对结果负责。助手做重活，人类做判断。

---

## 九、可直接复用的项目骨架（在 template/）

```
software-project/
├── AGENT.md              # 项目级规则（单一事实来源，供代理阅读）
├── CLAUDE.md             # Claude Code 入口（@AGENT.md）
├── .clinerules           # Cline 项目规则（coding standards / architecture / deployment）
├── protocol.yml          # 门禁协议（modes / validators / policy，snodo 风格）
├── CONTEXT.md            # 技术栈、约束、已知坑（供新会话恢复上下文）
├── intent.md             # Inception：意图
├── requirements.md       # Inception：需求 (REQ-IDs)
├── units/                # Inception：单元分解 (UNIT-001.md ...)
├── risk-register.md      # Inception：风险登记
├── construction/         # Construction：按单元/bolts 组织
│   └── unit-001/
│       ├── design.md
│       ├── bolt-01-plan.md
│       └── bolt-01-summary.md
├── operations/           # Operations：部署/运维/观测
│   ├── deployment-plan.md
│   ├── runbooks/
│   └── observability.md
├── src/
│   ├── backend/          # backend-patterns + coding-standards
│   └── frontend/         # frontend-* + vercel-react-best-practices
├── sql/clickhouse/       # OLAP 建表与查询模板
├── tests/                # tdd-workflow：单元/集成/契约
├── ci/pipeline.yml       # 安全回归 + 测试流水线
├── vercel.json           # Vercel 部署配置
├── obsidian/             # 双向链接笔记库
├── memory/               # 持久化记忆（agent-md / loopra 风格）
│   ├── agents.md         # 代理角色与职责记录
│   ├── plan.md           # 当前执行计划与阶段
│   ├── progress.md       # 进度与已完成节点
│   ├── verify.md         # 验证结果与证据
│   └── gotchas.md        # 已知坑与避坑指南
├── sessions/             # JSONL 会话持久化（loopra 风格）
│   └── <session-id>.jsonl
├── audit.md              # hash-chained 审计日志（snodo 风格）
└── verification-report.md # S5 最终验收报告
```

**记忆层增强（loopra 风格）**：
- JSONL 会话持久化，自动摘要折叠，Token 用量统计
- 跨会话不遗失，避免助手上下文遗忘导致与已有代码矛盾

---

## 十、项目级规则文件（AGENT.md / .clinerules / CLAUDE.md）

借鉴 Cline 的 `.clinerules` 与 agent-md 的 `AGENT.md` 单一事实来源。每个项目必须包含：

- `AGENT.md`：项目级规则总入口，供所有编码代理（Claude Code / Codex / Cursor / Windsurf / Cline）阅读。
- `CLAUDE.md`：Claude Code 专用入口，通过 `@AGENT.md` 引用。
- `.clinerules`：Cline 专用，涵盖 coding standards、架构约束、部署流程、测试要求。
- 规则分为两层：
  - **advisory（建议层）**：判断、规划、风格、流程，由代理自觉遵循。
  - **enforceable（可执行层）**：类型检查、测试、lint、状态更新、视觉证据，通过 hooks / CI 强制执行。

> 原则：凡可能被遗忘或粉饰的，都从散文移至可检查的 artifact。

---

## 十一、持久化记忆（memory/ 目录，agent-md 风格）

| 文件 | 用途 |
|---|---|
| `memory/agents.md` | 代理角色与职责记录 |
| `memory/plan.md` | 当前执行计划与阶段 |
| `memory/progress.md` | 进度与已完成节点 |
| `memory/verify.md` | 验证结果与证据 |
| `memory/gotchas.md` | 已知坑与避坑指南 |

记忆文件不被安装脚本覆盖，跨会话持久化。

---

## 十二、门禁协议（protocol.yml，snodo 风格）

门禁不是建议，而是结构化强制执行：

`protocol.yml` 声明：
- **modes**：流程各阶段，每阶段明确工具集。
- **validators**：必须同意才能进入下一阶段的检查项（lint / 测试 / 安全扫描 / 类型检查）。
- **policy**：验证器不一致时的处理策略。

执行特征（与 §七 HITL 结合）：
- signed validation token / blocker / hash-chained audit log / worktree 隔离 / fixer 回环。

---

## 十三、Human-in-the-Loop（Plan / Act 模式，Cline 风格）

- **Plan 模式**：助手探索代码库、提问澄清、制定策略；人类对齐后进入 Act。
- **Act 模式**：助手执行文件编辑与终端命令；每次编辑以 diff 呈现，人类可审阅、修改、回滚；所有变更通过 checkpoints 记录，可轻松撤销。
- **auto-approve 可选**：开启后助手自主运行；关闭时每步需人类批准。

---

## 十四、MCP 多客户端接入

门禁与记忆可通过 MCP 接入多个客户端：Claude Code、Claude Desktop、Cursor、Gemini CLI、GitHub Copilot、Codex 家族。安装脚本可注册各客户端的 MCP 配置（`~/.claude.json`、`~/.cursor/mcp.json`、`~/.codex/config.toml` 等）。

---

## 十五、GitHub/Gitee 参考与外部实践（v3.0 已并入）

| 来源 | 平台 | 核心价值 | 已并入章节 |
|---|---|---|---|
| cline/cline | GitHub | 跨 IDE 自主编码代理；`.clinerules` 项目规则；Plan/Act 模式；checkpoints 可回滚；human-in-the-loop | §十 项目级规则、§十三 Human-in-the-loop、§十四 MCP 接入 |
| iamfakeguru/agent-md | GitHub | AGENT.md 单一事实来源；持久化记忆；hooks/artifacts 可执行层；deterministic verification | §十 项目级规则、§十一 持久化记忆 |
| snodo-dev/snodo | GitHub | SDLC 协议引擎；protocol.yml；signed token；不可推翻的 blocker；hash-chained audit log | §九 门禁协议、§七 HITL、§十四 MCP 接入 |
| wico216/ai-sdlc | GitHub | 三阶段 SDLC；Bolts 替代 Sprints；Golden Thread；Adaptive Depth；人机职责分离 | §II 三阶段流程、§三 Golden Thread、§四 Adaptive Depth、§八 职责分离 |
| aiagentflow / AutoMaintainer | GitHub | plan→implement→review→security→test→judge 门禁；5-Agent 分工；自修复循环 | §七 门禁协议、§八 职责分离 |
| dontriskit/awesome-ai-software-engineering | GitHub | 规范先于代码、活文档、CONTEXT.md、PRD 模板 | §三 Golden Thread、§十六 规范先行 |
| ezdemo/loopra | Gitee | 五种子代理角色（explore/implement/test/review/plan）；三态 HITL（free/approval/auto）；JSONL 会话持久化、自动摘要、Token 统计；插件化工具热插拔 | §五 子代理角色、§七 三态 HITL、§九 记忆层增强 |
| jxkjzx/agent-skills | Gitee | 八个 slash commands（/spec/plan/build/test/review/ship/webperf/code-simplify）；24 技能六阶段；四个专家角色；反合理化表 | §六 Slash 命令、§五 专家角色、§十四 反合理化验证 |

---

## 十六、规范先行与活文档（awesome-ai-software-engineering 风格）

1. **规范先于代码**：写任何实现代码前，先写 PRD / 架构决策 / API 契约 / intent.md。
2. **助手作为协作者而非替代**：助手执行执行层，人类聚焦架构与边界决策。
3. **活文档**：`docs/` 与代码同步，API 变更即同步更新契约，避免文档腐化。
4. **迭代精炼**：建立 prompt 库与 CONTEXT.md，记录有效提示词，持续改进生成质量。
5. **CONTEXT.md**：项目根目录维护上下文文件，记录技术栈、约束、已知坑。

---

## 十七、反合理化验证表（借鉴 agent-skills）

每个技能使用验证门禁与反合理化表，而非仅靠参考散文。质量门禁中必须包含可检查的表格项，例如：

| 检查项 | 验证命令 | 预期结果 | 实际结果 | 状态 |
|---|---|---|---|---|
| 类型检查 | `tsc --noEmit` | 无错误 | <待填写> | <通过/失败> |
| 单元测试 | `npm test` | 全绿 | <待填写> | <通过/失败> |
| 安全扫描 | `<scan-cmd>` | 无 critical | <待填写> | <通过/失败> |
| 依赖扫描 | `<dep-scan-cmd>` | 无高危漏洞 | <待填写> | <通过/失败> |

凡可被遗忘或粉饰的，都移入此表强制验证。

---

## 十八、验收质量门（v3.0，全部通过才算任务完成）

- [ ] AGENT.md / CLAUDE.md / .clinerules 存在，作为单一事实来源
- [ ] intent.md / requirements.md / units/ 存在，Inception 门禁通过
- [ ] 架构与 API 契约文档存在且可被双方直接使用
- [ ] 后端服务可本地启动，关键接口 `curl` 可验证，无硬编码密钥
- [ ] ClickHouse 建表脚本可重复执行，聚合查询返回正确结果
- [ ] 前端 `npm run build` 成功，Vercel 预览环境可访问，核心页面 Lighthouse 达标
- [ ] UI/UX 通过可用性与无障碍自查（键盘导航、对比度、移动端）
- [ ] security-review 清单无未处理高危项，依赖扫描无高危漏洞
- [ ] 通过 plan → implement → review → security → test → judge 全套门禁（protocol.yml）
- [ ] 每个 bolt 都有 plan → execute → validate → human-approve 记录
- [ ] Golden Thread 完整：Intent → Requirements → Units → Design → Code → Tests → Deployment
- [ ] audit.md 为 hash-chained 审计日志，无缺失条目
- [ ] TDD 测试全绿，CI 流水线可从零复现
- [ ] memory/ 记忆目录完整（agents/plan/progress/verify/gotchas.md）
- [ ] sessions/ JSONL 会话持久化，自动摘要与 Token 统计可用
- [ ] 项目根目录存在 CONTEXT.md，记录技术栈、约束、已知坑
- [ ] 部署方案可回滚，Operations 门禁 (PRODUCTION READY) 通过
- [ ] 三态 HITL 审批模式已配置（free/approval/auto 之一）
- [ ] 反合理化验证表全部填写并通过

---

## 十九、与现有记忆关联

- [[junshi-kb-design]] — KB 组装器/管理层/prompt v2 设计，可作为本技能的知识库基础设施
- [[junshi-app-state]] — 「继续」App 状态与欠账，本技能生成的软件若涉及该 App 可复用其状态模型
- [[user-workflow-preferences]] — 用户协作习惯：贴回原话=开工、空模板按实况补全标假设、设计先行、事实修正优先
- [[junshi-build-env]] — 构建环境命令，本技能的构建/部署阶段可直接复用
