select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select has_account
from "casestudy"."core"."core__customers_enriched"
where has_account is null



      
    ) dbt_internal_test