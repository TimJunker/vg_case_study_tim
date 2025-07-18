
    
    

with all_values as (

    select
        loan_term as value_field,
        count(*) as n_records

    from "casestudy"."marts"."marts__loans_enriched"
    group by loan_term

)

select *
from all_values
where value_field not in (
    '12','24','36','48','60'
)


