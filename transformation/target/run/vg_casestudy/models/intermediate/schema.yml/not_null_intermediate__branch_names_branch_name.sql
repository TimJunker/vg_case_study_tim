select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select branch_name
from "casestudy"."intermediate"."intermediate__branch_names"
where branch_name is null



      
    ) dbt_internal_test