
    
    

select
    branch_id as unique_field,
    count(*) as n_records

from "casestudy"."intermediate"."intermediate__branch_names"
where branch_id is not null
group by branch_id
having count(*) > 1


