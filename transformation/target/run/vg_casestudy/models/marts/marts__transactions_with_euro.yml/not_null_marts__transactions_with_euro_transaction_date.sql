select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select transaction_date
from "casestudy"."marts"."marts__transactions_with_euro"
where transaction_date is null



      
    ) dbt_internal_test