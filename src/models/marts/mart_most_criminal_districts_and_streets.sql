select district,
       street,
       count(*) as offense_count
from {{ ref('stg_crimes') }}
group by district, street
order by offense_count desc