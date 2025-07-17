
    
    

select
    fx_rate_date as unique_field,
    count(*) as n_records

from "casestudy"."intermediate"."stg_staging_intermediate_fx_rates_filled"
where fx_rate_date is not null
group by fx_rate_date
having count(*) > 1


