with customers as (
    select *
    from "casestudy"."marts"."marts__customers_enriched"
),

aggregated as (
    select
        branch_id,
        branch_name,
        count(distinct customer_id) as unique_customers,
        count(distinct case when has_account is false then customer_id end) as customers_without_account,

        count(case when account_type = 'current' then customer_id end) as customers_with_account_type_current,
        count(case when account_type = 'savings' then customer_id end) as customers_with_account_type_savings,
        count(case when account_type = 'current' then account_id end)::float / nullif(count(account_id), 0) as share_current_accounts,
        count(case when account_type = 'savings' then account_id end)::float / nullif(count(account_id), 0) as share_savings_accounts,

        avg(age) as avg_customer_age,
        min(age) as min_customer_age,
        max(age) as max_customer_age,
        count(distinct case when age < 30 then customer_id end) as customers_under_30,
        count(distinct case when age between 30 and 50 then customer_id end) as customers_30_to_50,
        count(distinct case when age > 50 then customer_id end) as customers_over_50,
        count(distinct case when age < 30 then customer_id end)::float / count(distinct customer_id) as share_customers_under_30,
        count(distinct case when age between 30 and 50 then customer_id end)::float / count(distinct customer_id) as share_customers_30_to_50,
        count(distinct case when age > 50 then customer_id end)::float / count(distinct customer_id) as share_customers_over_50,
        avg(case when account_opening_date is not null then date_diff('day', account_opening_date, current_date)::float / 365 end) as avg_account_age_years,
        avg(case when account_opening_date is not null then account_opening_date end)::date as avg_account_opening_date


    from customers
    group by branch_id, branch_name
)

select *
from aggregated