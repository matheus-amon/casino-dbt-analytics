-- stg_src_casino_games.sql
-- Lógica do antigo src_casino_games.sql
with select_columns as (
    select
        id,
        name,
        active,
        category,
        created_at,
        environment,
        provider_id,
        mapped_category
    from raw_casino_games
)

select * from select_columns
