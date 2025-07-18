select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select loan_id
from "casestudy"."marts"."marts__loans_enriched"
where loan_id is null



      
    ) dbt_internal_test