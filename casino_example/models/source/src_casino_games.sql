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
