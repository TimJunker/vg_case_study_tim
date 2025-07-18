select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fx_rate_date
from "casestudy"."intermediate"."intermediate__fx_rates_filled"
where fx_rate_date is null



      
    ) dbt_internal_test