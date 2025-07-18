
  
    
    

    create  table
      "casestudy"."intermediate"."intermediate__branch_names__dbt_tmp"
  
    as (
      with branch_names as (
    select *
    from "casestudy"."raw"."branch_names"
)

select
    branch_id,
    branch_name 
from branch_names
    );
  
  