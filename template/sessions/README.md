# 会话持久化目录 (sessions/)

本目录存放 JSONL 格式的会话持久化文件（借鉴 loopra），用于跨会话保留助手上下文，避免遗忘导致与已有代码矛盾。

## 文件格式

每个会话一个文件：`sessions/<session-id>.jsonl`

每行是一个 JSON 对象，包含：
- `ts`：时间戳（ISO 8601）
- `role`：user / assistant / system
- `content`：消息内容
- `tokens`：Token 用量（可选）
- `summary`：自动摘要（可选，用于长会话折叠）

## 使用约定

- 新会话开始时创建新文件，文件名包含会话 ID 和时间戳
- 会话结束时追加总结行，标记会话状态（completed / paused / blocked）
- 跨会话恢复时，先读取上一会话的摘要与进度记录
- 定期自动摘要折叠，控制 Token 用量

## 与 memory/ 的区别

- `memory/`：项目级持久化记忆（agents/plan/progress/verify/gotchas.md），跨项目任务共享
- `sessions/`：单次会话级上下文，会话结束后归档
