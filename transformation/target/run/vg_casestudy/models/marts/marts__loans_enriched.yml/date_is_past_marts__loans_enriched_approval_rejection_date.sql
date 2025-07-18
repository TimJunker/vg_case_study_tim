select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    select *
    from "casestudy"."marts"."marts__loans_enriched"
    where approval_rejection_date > current_date()
    

      
    ) dbt_internal_test