with source as (
    select *
    from {{ ref('raw_offense_codes') }}
),

 transformed as (
     select distinct code,
            "name"
     from source
 )

select *
from transformed