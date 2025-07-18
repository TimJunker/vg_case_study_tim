select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    
        select *
        from "casestudy"."core"."core__loans_enriched"
        where loan_amount < 0
    
    


      
    ) dbt_internal_test