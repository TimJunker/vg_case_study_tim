select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select approval_rejection_date
from "casestudy"."intermediate"."stg_staging_intermediate__loans"
where approval_rejection_date is null



      
    ) dbt_internal_test