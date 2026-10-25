# 项目级规则 (AGENT.md) — 单一事实来源

本文件是本项目所有编码代理（Claude Code / Codex / Cursor / Windsurf / Cline）的单一事实来源。生成代码前必须先阅读并遵守。

## 一、项目身份
- 项目名：<待填写>
- 技术栈：<待填写>
- 部署目标：<待填写>
- 数据层：ClickHouse（OLAP）

## 二、编码规范（coding-standards）
- 命名：<待填写>
- 目录结构：见本项目 `template/` 与 `src/` 布局
- TypeScript：严格模式，禁止 `any`（除非有合理注释）
- 提交信息：`<type>(<scope>): <subject>`，type ∈ {feat, fix, docs, test, refactor, chore, security}
- lint：每次提交前必须通过 `npm run lint`（前端）与 `golangci-lint` / `flake8`（后端，视语言而定）

## 三、架构约束（Architecture &Planning）
- 分层：表现层 → 应用层 → 领域层 → 基础设施层（六边形）
- 数据访问：通过 Repository 接口，禁止在 Handler 中直接写 SQL
- API 契约：`docs/api-contract.yaml` 为单一事实来源，变更须同步更新
- 信任边界：所有外部输入均视为不可信，进入系统前做允许列表校验

## 四、安全审查（security-review）
- 无硬编码密钥，全部使用环境变量（见 `.env.example`）
- SQL 参数化查询，禁止字符串拼接
- 文件上传：后缀允许列表 + 重命名 + 非执行目录 + MIME 校验
- 输出转义：HTML 转义防止 XSS，JSON 序列化安全
- CSP 配置：见 `vercel.json` / 前端配置
- 敏感字不落日志

## 五、测试要求（tdd-workflow）
- TDD 红绿重构：优先生成测试（红），再生成实现（绿），最后重构
- 测试金字塔：单元测试 > 集成测试 > 契约测试
- 每个 bolt 必须有对应测试，CI 全绿才能合并

## 六、ClickHouse 规范（clickhouse）
- OLAP 表设计：主键与排序键显式定义，物化视图用于聚合
- 导入/导出 SQL 须可重复执行（幂等）
- 聚合查询须在可接受延迟内返回正确结果

## 七、前端规范（frontend / vercel-react）
- 项目结构：Next.js/React，Server Components 优先
- 路由：App Router，路由守卫显式定义
- 状态管理：自定义 Hook 层，全局状态最小化
- 部署：Vercel，ISR/SSG 按页面配置，性能预算见 `vercel.json`

## 八、门禁流程（protocol.yml）
每次变更必须通过：plan → implement → review → security → test → judge
任一阶段失败，路由到 fixer，附带精确问题描述，修复后重跑后续门禁。

## 九、记忆持久化（memory/）
- `memory/plan.md`：当前执行计划
- `memory/progress.md`：进度与已完成节点
- `memory/verify.md`：验证结果与证据
- `memory/gotchas.md`：已知坑与避坑指南
- 记忆文件不被安装脚本覆盖，跨会话持久化

## 十、人类职责边界
- 助手执行：代码生成、测试编写、文档撰写、计划提案、研究分析
- 人类决策：需求范围、架构选型、安全控制、Go/No-Go 批准、风险接受、门禁最终裁定

## 十一、子代理角色体系（借鉴 loopra）

五种子代理角色，每个拥有独立推理上下文，不可继续派生，通过 `sub_agent` 工具派生，支持共享上下文协作，可独立配置工具范围和超时控制：

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

## 十二、三态 HITL 审批模式（借鉴 loopra）

| 模式 | 行为 | 适用场景 |
|---|---|---|
| free | 跳过工具审批及项目边界检查，工具参数校验仍生效 | 纯探索、内部工具、低风险 |
| approval | 只读工具和普通项目内操作自动放行，其余转人工审批 | 一般业务功能开发 |
| auto | 先应用 approval 规则，再由校验模型审核剩余调用，失败则转人工 | 高自动化需求、受监管系统 |

审核链在检测到项目外文件写入或命令目标时会要求人工确认，校验模型无法放行。

## 十三、Slash 命令系统（借鉴 agent-skills）

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

## 十四、会话持久化（sessions/，借鉴 loopra）

- `sessions/<session-id>.jsonl`：JSONL 格式会话持久化
- 自动摘要折叠，Token 用量统计
- 跨会话不遗失，避免助手上下文遗忘导致与已有代码矛盾

## 十五、项目不变量与规范驱动（SDD）

- 项目级不变量见 `constitution.md`（SDD 第一步建立，变更须人类批准并记入 `audit.md`）
- 新功能走规范驱动：先写 spec 再派生 plan/tasks，代码是规范的投影（详见 `ruanjiann-skill.md` §十八）
- 上下文纪律：上下文是有限注意力预算，最小高信号优先，长文先落盘再摘要（§十九）
- 非确定性产出须有评测：能力评测通过 + 回归基线冻结（§二十）
- 本文件对应 agents.md 开放标准；monorepo 可分层嵌套 AGENTS.md，就近者优先，单文件 ≤32 KiB

---

> 规则分两层：advisory（判断/规划/风格/流程，由代理自觉遵循）与 enforceable（类型检查/测试/lint/状态更新/视觉证据，通过 hooks / CI 强制执行）。凡可能被遗忘或粉饰的，都从散文移至可检查的 artifact。
