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
)

select * from select_columns
