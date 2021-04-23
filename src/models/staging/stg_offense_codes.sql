with source as (
    select *
    from {{ ref('raw_offense_codes') }}
),

     transformed as (
         select code   as code,
                "name" as "name"
         from source
     )

select *
from transformed