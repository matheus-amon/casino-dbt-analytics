with remove_columns_casino_games as (
    select
        id,
        name,
        active,
        category,
        created_at,
        updated_at,
        environment,
        provider_id,
        mapped_category
)

select * from remove_columns_casino_games
