select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    
        select *
        from "casestudy"."core"."core__transactions_with_euro"
        where transaction_amount_euro < 0
    
    


      
    ) dbt_internal_test