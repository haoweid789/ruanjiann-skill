# Obsidian 笔记库 (obsidian/)

双向链接笔记库，用于 Inception 阶段的知识沉淀与项目 Wiki（Obsidian Skills 领域）。

## 结构约定

- `00-总览/`：项目索引、MOC（Map of Content）
- `10-架构/`：ADR 决策记录（与 `docs/architecture.md` 双向同步）
- `20-需求/`：需求调研笔记（与 `requirements.md` 的 REQ-IDs 互链）
- `30-技术/`：技术调研、库选型、踩坑记录
- `90-日志/`：会议记录、待办跟踪

## 使用规则

- 笔记之间用 `[[双向链接]]` 组织，禁止只建不用
- ADR 决策必须同时落到本库与 `docs/architecture.md`，保持活文档
- 每条笔记标注对应 REQ-ID / UNIT-ID，支撑 Golden Thread 追溯

## 示例

见 `示例笔记-项目总览.md`，演示双向链接与 frontmatter 写法。
