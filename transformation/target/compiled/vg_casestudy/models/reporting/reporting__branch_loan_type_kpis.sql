with loans as (
    select *
    from "casestudy"."marts"."marts__loans_enriched"
),

aggregated as (
    select 
        branch_id,
        branch_name,
        loan_type,

        -- loan count by status
        count(loan_id) as count_of_loans,
        count(case when loan_status = 'approved' then loan_id end) as loans_approved,
        count(case when loan_status = 'rejected' then loan_id end) as loans_rejected,
        count(case when loan_status = 'closed' then loan_id end) as loans_closed,

        --customer segmentation
        count(distinct customer_id) as unique_customers,
        count(case when age < 30 then loan_id end) as loans_under_30,
        count(case when age between 30 and 50 then loan_id end) as loans_30_to_50,
        count(case when age > 50 then loan_id end) as loans_over_50,

        -- approval rate
        count(case when loan_status = 'approved' then loan_id end)::float
            / nullif(count(loan_id), 0) as approval_rate,
        count(case when loan_status = 'rejected' then loan_id end)::float
            / nullif(count(loan_id), 0) as rejection_rate,
        count(case when loan_status = 'closed' then loan_id end)::float
            / nullif(count(loan_id), 0) as closed_rate,

        -- loan kpis
        sum(loan_amount) as total_loan_amount,
        sum(loan_amount)::float / nullif(count(loan_id), 0) as avg_loan_amount,
        avg(interest_rate) as avg_interest_rate,
        avg(loan_term)  as avg_loan_term_months,
        count(case when loan_term > 36 then loan_id end)::float / count(loan_id) as long_term_loan_share_more_than_36,
        count(case when loan_term < 24 then loan_id end)::float / count(loan_id) as short_term_loan_share_less_than_24,
        min(case when loans.loan_status = 'approved' then approval_rejection_date end) as earliest_approval_date,
        max(case when loans.loan_status = 'approved' then approval_rejection_date end) as latest_approval_date

    from loans
    group by branch_id,branch_name, loan_type
)

select *
from aggregated