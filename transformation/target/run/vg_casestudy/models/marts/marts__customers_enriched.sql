
  
  create view "casestudy"."marts"."marts__customers_enriched__dbt_tmp" as (
    with customers as (
    select *
    from "casestudy"."intermediate"."stg_staging_intermediate__customers"
),

accounts as (
    select *
    from "casestudy"."intermediate"."stg_staging_intermediate__accounts"
),

branch_names as (
    select *
    from "casestudy"."intermediate"."intermediate__branch_names"
),


joined as (
    select 
        customers.customer_id,
        customers.firstname,
        customers.lastname,
        customers.age,
        customers.branch_id,
        branch_names.branch_name,
        accounts.account_id,
        accounts.account_type,
        accounts.account_opening_date,
        case 
            when accounts.account_id is null then false
            else true
        end as has_account

    from customers
    left join accounts
    on customers.customer_id = accounts.customer_id
    left join branch_names
    on customers.branch_id = branch_names.branch_id
)

select *
from joined
  );
