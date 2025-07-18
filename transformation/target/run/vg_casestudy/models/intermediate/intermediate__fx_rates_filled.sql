
  
    
    

    create  table
      "casestudy"."intermediate"."intermediate__fx_rates_filled__dbt_tmp"
  
    as (
      with calendar as (

    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
    
    

    )

    select *
    from unioned
    where generated_number <= 70
    order by generated_number



),

all_periods as (

    select (
        

    date('2024-12-31') + ((interval '1 day') * (row_number() over (order by 1) - 1))


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= date('2025-03-11')

)

select * from filtered



),

currencies as (
    select distinct trim(currency_iso_code) as currency_iso_code
    from "casestudy"."raw"."fx_rates_full_history"
),

date_matrix as (
    select 
        currencies.currency_iso_code,
        calendar.date_day as fx_rate_date
    from currencies
    cross join calendar 

),

joined as (
    select 
        date_matrix.currency_iso_code,
        date_matrix.fx_rate_date,
        fx_rates_full_history.fx_rate
    from date_matrix
    left join "casestudy"."raw"."fx_rates_full_history" as fx_rates_full_history
    on date_matrix.currency_iso_code = fx_rates_full_history.currency_iso_code
    and date_matrix.fx_rate_date = fx_rates_full_history.fx_rate_date
),

forward_fill_dates as (
    select 
        currency_iso_code,
        fx_rate_date::date as fx_rate_date,

        last_value(fx_rate ignore nulls) over(
            partition by currency_iso_code
            order by fx_rate_date asc
            rows between unbounded preceding and current row
        ) as fx_rate
    from joined
)

select *
from forward_fill_dates
    );
  
  