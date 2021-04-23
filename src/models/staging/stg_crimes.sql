with source as (
    select *
    from {{ ref('raw_crimes') }}
),

     transformed as (
         select incident_number,
                offense_code,
                offense_code_group,
                offense_description,
                district,
                reporting_area,
                case
                    when shooting = 'Y' then true
                    else false
                    end as shooting,
                occurred_on_date::timestamp as occurred_on_date, "year"::integer as "year", "month"::integer as "month", case
                                                                                                                             when day_of_week = 'Monday'
                                                                                                                                 then 1
                                                                                                                             when day_of_week = 'Tuesday'
                                                                                                                                 then 2
                                                                                                                             when day_of_week = 'Wednesday'
                                                                                                                                 then 3
                                                                                                                             when day_of_week = 'Thursday'
                                                                                                                                 then 4
                                                                                                                             when day_of_week = 'Friday'
                                                                                                                                 then 5
                                                                                                                             when day_of_week = 'Saturday'
                                                                                                                                 then 6
                                                                                                                             else 7
             end as day_of_week,
                "hour"::integer as "hour", ucr_part,
                street,
                lat::decimal(10, 8) as lat, long::decimal(10, 8) as long, location
         from source
     )

select *
from transformed