select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    branch_id as unique_field,
    count(*) as n_records

from "casestudy"."raw"."branch_names"
where branch_id is not null
group by branch_id
having count(*) > 1



      
    ) dbt_internal_test