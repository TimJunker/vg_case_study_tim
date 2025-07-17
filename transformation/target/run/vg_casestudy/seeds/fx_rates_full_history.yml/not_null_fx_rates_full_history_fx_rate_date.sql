select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fx_rate_date
from "casestudy"."raw"."fx_rates_full_history"
where fx_rate_date is null



      
    ) dbt_internal_test