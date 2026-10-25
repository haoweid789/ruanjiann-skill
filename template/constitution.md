# 项目宪法 (constitution.md) — SDD 项目不变量

一次性建立、跨所有 feature 生效的最高规则（spec-kit 六阶段第一步）。具体执行规范见 `AGENT.md`，原则冲突时以本文件为准并同步修订 AGENT.md。本文件变更必须经人类批准并记入 `audit.md`。

## 一、质量原则
- <待填写：如「测试先行」「公共接口必须先有契约」「禁止静默失败」>

## 二、技术边界
- 允许的技术栈：<待填写>
- 明确禁止的依赖 / 模式：<待填写>

## 三、安全红线
- 无硬编码密钥，全部环境变量（见 `.env.example`）
- 外部输入允许列表校验；SQL 参数化；输出转义
- 敏感字不落日志（细则见 `docs/security-checklist.md`）

## 四、验收定义（Definition of Done）
- 每个 bolt：lint / 类型检查 / 测试全绿 + 人类批准
- 每个 feature：验收质量门（`ruanjiann-skill.md` §二十一）全部通过

## 五、变更规则
- 不变量增删改须人类批准，记入 `audit.md`
- 规范驱动：新功能先写 spec 再派生 plan/tasks，代码是规范的投影（`ruanjiann-skill.md` §十八）
