# 后端目录 (src/backend/)

后端实现占位骨架，遵循六边形架构（表现层 → 应用层 → 领域层 → 基础设施层），规范见 `AGENT.md` 与 `.clinerules`。

## 结构约定

```
src/backend/
├── cmd/            # 入口（main）
├── internal/
│   ├── adapter/    # 表现层：HTTP handler / 路由
│   ├── app/        # 应用层：用例编排
│   ├── domain/     # 领域层：实体与业务规则（不依赖任何框架）
│   └── infra/      # 基础设施层：DB / 缓存 / 外部客户端，通过 Repository 接口接入
├── migrations/     # 数据库迁移（幂等，可重复执行）
└── go.mod / package.json / pyproject.toml  # 视语言而定
```

## 硬性规则

- 数据访问必须经过 Repository 接口，禁止在 Handler 中直接写 SQL
- 所有外部输入视为不可信，进入系统前做允许列表校验
- 无硬编码密钥，全部从环境变量读取（见 `.env.example`）
- 每个 bolt 必须有对应测试（见 `tests/`），CI 全绿才能合并
