select  "year",
        "month",
        "name",
        count(*) as offense_count
from {{ ref('stg_crimes') }} as t1
inner join {{ ref('stg_offense_codes') }} as t2
on t1.offense_code = t2.code
group by "year", "month", "name"
order by "year", "month", offense_count desc