select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select interest_rate
from "casestudy"."marts"."marts__loans_enriched"
where interest_rate is null



      
    ) dbt_internal_test