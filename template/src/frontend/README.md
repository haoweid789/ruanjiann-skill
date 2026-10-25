# 前端目录 (src/frontend/)

前端实现占位骨架，Next.js / React + App Router，规范见 `AGENT.md` 与 vercel-react-best-practices。

## 结构约定

```
src/frontend/
├── app/                # App Router 页面与布局
│   ├── (auth)/         # 需鉴权的路由组
│   └── api/            # BFF 路由（边缘函数）
├── components/         # 组件（按领域分目录，禁止巨型组件）
├── hooks/              # 自定义 Hook 层（状态管理入口，全局状态最小化）
├── lib/                # 工具函数与 API 客户端
└── styles/             # 设计系统（与 docs/ui-spec.md 同步）
```

## 硬性规则

- Server Components 优先，客户端组件仅在必要时显式标注 `"use client"`
- 路由守卫显式定义，鉴权逻辑集中在 `(auth)` 路由组
- API 契约以 `docs/api-contract.yaml` 为单一事实来源，变更须同步更新
- 部署目标 Vercel，ISR/SSG 按页面配置，性能预算见 `vercel.json`
