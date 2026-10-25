-- ClickHouse OLAP 建表模板（幂等：可重复执行）
-- 引擎选型、排序键、分区策略的决策依据见 docs/architecture.md
-- 验收：见 protocol.yml validators.clickhouse-query

CREATE DATABASE IF NOT EXISTS <database_name>;

-- 1. 事件明细表（MergeTree）
CREATE TABLE IF NOT EXISTS <database_name>.events (
    event_id    UInt64,
    event_time  DateTime64(3) DEFAULT now64(3),
    event_date  Date DEFAULT toDate(event_time),
    event_type  LowCardinality(String),
    user_id     UInt64,
    payload     String
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_type, event_time)
TTL event_date + INTERVAL 90 DAY;

-- 2. 按天聚合的物化视图
CREATE TABLE IF NOT EXISTS <database_name>.events_daily (
    event_date Date,
    event_type LowCardinality(String),
    event_count UInt64,
    uv_count    AggregateFunction(uniq, UInt64)
) ENGINE = AggregatingMergeTree()
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_type, event_date);

CREATE MATERIALIZED VIEW IF NOT EXISTS <database_name>.events_daily_mv
TO <database_name>.events_daily
AS SELECT
    event_date,
    event_type,
    count() AS event_count,
    uniqState(user_id) AS uv_count
FROM <database_name>.events
GROUP BY event_date, event_type;
