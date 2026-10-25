# 测试目录 (tests/)

遵循 TDD 红绿重构与测试金字塔（单元 > 集成 > 契约），规范见 `AGENT.md` 与 tdd-workflow。

## 结构约定

```
tests/
├── unit/          # 单元测试：领域逻辑、纯函数，不依赖外部服务
├── integration/   # 集成测试：Repository / DB / 外部客户端，用测试容器或本地实例
└── contract/      # 契约测试：按 docs/api-contract.yaml 校验前后端契约
```

## 硬性规则

- TDD 顺序：先写测试（红）→ 再写实现（绿）→ 重构，禁止先实现后补测
- 每个 bolt 必须有对应测试，CI 全绿才能合并
- 测试命名与被测单元一一对应，Golden Thread 可追溯到 REQ-ID
- CI 流水线见 `ci/pipeline.yml`，须可从零复现
