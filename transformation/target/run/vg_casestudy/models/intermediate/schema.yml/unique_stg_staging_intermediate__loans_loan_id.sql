select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    loan_id as unique_field,
    count(*) as n_records

from "casestudy"."intermediate"."stg_staging_intermediate__loans"
where loan_id is not null
group by loan_id
having count(*) > 1



      
    ) dbt_internal_test