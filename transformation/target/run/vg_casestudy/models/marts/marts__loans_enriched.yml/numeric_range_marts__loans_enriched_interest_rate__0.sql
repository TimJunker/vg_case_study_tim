select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    
        select *
        from "casestudy"."marts"."marts__loans_enriched"
        where interest_rate < 0
    
    


      
    ) dbt_internal_test