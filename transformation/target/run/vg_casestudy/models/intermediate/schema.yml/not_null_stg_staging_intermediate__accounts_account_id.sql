select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select account_id
from "casestudy"."intermediate"."stg_staging_intermediate__accounts"
where account_id is null



      
    ) dbt_internal_test