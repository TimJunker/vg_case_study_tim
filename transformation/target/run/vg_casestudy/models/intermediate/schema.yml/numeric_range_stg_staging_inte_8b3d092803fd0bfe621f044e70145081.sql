select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    
        select *
        from "casestudy"."intermediate"."stg_staging_intermediate_fx_rates_filled"
        where fx_rate < 0
    
    


      
    ) dbt_internal_test