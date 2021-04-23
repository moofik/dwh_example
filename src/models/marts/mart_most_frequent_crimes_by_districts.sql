select district,
       "name",
       count(*) as offense_count
from {{ ref('stg_crimes') }} as t1
inner join {{ ref('stg_offense_codes') }} as t2
on t1.offense_code = t2.code
group by district, "name"
order by district, offense_count desc