select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fx_rate
from "casestudy"."raw"."fx_rates_full_history"
where fx_rate is null



      
    ) dbt_internal_test