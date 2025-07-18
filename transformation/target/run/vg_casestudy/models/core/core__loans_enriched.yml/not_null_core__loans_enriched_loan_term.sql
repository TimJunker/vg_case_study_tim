select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select loan_term
from "casestudy"."core"."core__loans_enriched"
where loan_term is null



      
    ) dbt_internal_test