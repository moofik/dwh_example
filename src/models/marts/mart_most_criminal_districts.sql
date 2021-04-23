select district,
       count(*) as offense_count
from {{ ref('stg_crimes') }}
group by district
order by offense_count desc