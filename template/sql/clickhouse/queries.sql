-- ClickHouse 聚合查询模板
-- 验收：查询须在可接受延迟内返回正确结果（protocol.yml validators.clickhouse-query）

-- 1. 每日事件量与 UV（读物化视图）
SELECT
    event_date,
    sum(event_count) AS events,
    uniqMerge(uv_count) AS uv
FROM <database_name>.events_daily
WHERE event_date >= today() - INTERVAL 7 DAY
GROUP BY event_date
ORDER BY event_date;

-- 2. 明细查询示例（参数化，禁止字符串拼接）
SELECT event_type, count() AS cnt
FROM <database_name>.events
WHERE event_time >= %(start_time)s AND event_time < %(end_time)s
GROUP BY event_type
ORDER BY cnt DESC;
