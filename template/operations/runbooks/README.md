# 运维手册索引 (operations/runbooks/)

故障 / 扩容 / 维护手册模板。每个 runbook 一份文件，按以下骨架编写。

## 索引

| Runbook | 触发场景 | 负责人 |
|---|---|---|
| [服务宕机处理](incident.md) | 健康检查失败、错误率突增 | <待填写> |
| [扩容操作](scaling.md) | 流量超出容量阈值 | <待填写> |
| [例行维护](maintenance.md) | 依赖升级、数据清理 | <待填写> |

## Runbook 编写骨架

```markdown
# <标题>
## 触发条件
## 影响面
## 处理步骤（每步含验证命令）
## 回滚方式
## 事后动作（复盘、更新 gotchas.md）
```

> 新 runbook 从 `incident.md` 复制；处理完故障必须把新坑补进 `memory/gotchas.md`。
