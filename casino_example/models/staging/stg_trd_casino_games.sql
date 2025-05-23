-- stg_trd_casino_games.sql
-- Lógica do antigo trd_casino_games.sql
with changed_type_and_rename_columns as (
    select
        cast(id as varchar) as game_id,
        cast(name as varchar) as game_name,
        cast(active as integer) as game_active,
        cast(category as varchar) as game_category,
        cast(created_at as date) as created_date,
        cast(environment as varchar) as game_environment,
        cast(provider_id as varchar) as game_provider,
        cast(mapped_category as varchar) as sigap_category
    from {{ ref('stg_src_casino_games') }}
)

select * from changed_type_and_rename_columns
where game_active = 1
