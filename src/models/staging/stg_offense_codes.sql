with source as (
    select *,
        row_number() over (
            partition by code order by (select 1)
        ) rn_code --для исключения дублей
    from {{ ref('raw_offense_codes') }}
),

 transformed as (
     select code,
            "name"
     from source
     where rn_code = 1
 )

select *
from transformed