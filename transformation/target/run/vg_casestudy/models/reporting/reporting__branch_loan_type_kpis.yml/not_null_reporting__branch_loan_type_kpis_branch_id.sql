select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select branch_id
from "casestudy"."reporting"."reporting__branch_loan_type_kpis"
where branch_id is null



      
    ) dbt_internal_test