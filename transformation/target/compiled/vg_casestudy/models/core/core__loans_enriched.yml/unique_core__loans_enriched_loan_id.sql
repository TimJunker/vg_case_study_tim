
    
    

select
    loan_id as unique_field,
    count(*) as n_records

from "casestudy"."core"."core__loans_enriched"
where loan_id is not null
group by loan_id
having count(*) > 1


