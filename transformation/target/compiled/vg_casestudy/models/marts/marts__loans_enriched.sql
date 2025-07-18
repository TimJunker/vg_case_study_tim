with loans as (
    select *
    from "casestudy"."intermediate"."stg_staging_intermediate__loans"
),

customers_enriched as (
    select *
    from "casestudy"."marts"."marts__customers_enriched"
),

joined as (
    select
        loans.loan_id,
        loans.customer_id,
        customers_enriched.firstname,
        customers_enriched.lastname,
        customers_enriched.age,
        customers_enriched.branch_id,
        customers_enriched.branch_name,
        customers_enriched.account_id,
        customers_enriched.account_type,
        customers_enriched.account_opening_date,
        customers_enriched.has_account,
        loans.loan_type,
        loans.loan_amount,
        loans.interest_rate,
        loans.loan_term,
        loans.loan_status,
        loans.approval_rejection_date

    from loans
    left join customers_enriched
        on loans.customer_id = customers_enriched.customer_id    
)

select * 
from joined