select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select approval_rejection_date
from "casestudy"."marts"."marts__loans_enriched"
where approval_rejection_date is null



      
    ) dbt_internal_test