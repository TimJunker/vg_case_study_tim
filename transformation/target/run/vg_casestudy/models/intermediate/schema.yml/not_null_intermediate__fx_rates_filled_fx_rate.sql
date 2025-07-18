select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fx_rate
from "casestudy"."intermediate"."intermediate__fx_rates_filled"
where fx_rate is null



      
    ) dbt_internal_test