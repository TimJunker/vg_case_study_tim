select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select transaction_amount_euro
from "casestudy"."core"."core__transactions_with_euro"
where transaction_amount_euro is null



      
    ) dbt_internal_test