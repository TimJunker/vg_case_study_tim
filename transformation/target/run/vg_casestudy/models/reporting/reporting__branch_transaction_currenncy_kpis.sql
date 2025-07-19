
  
  create view "casestudy"."reporting"."reporting__branch_transaction_currenncy_kpis__dbt_tmp" as (
    with transactions as (
    select *
    from "casestudy"."marts"."marts__transactions_with_euro"
),

customers as (
    select *
    from "casestudy"."marts"."marts__customers_enriched"
),

joined as (
    select 
        transactions.*,
        customers.*
    from transactions 
    left join customers 
    on transactions.account_id = customers.customer_id
),

aggregated as(
    select 
        branch_id,
        branch_name,
        transaction_date,
        transaction_currency,

        --transaction volume
        count(transaction_id) as count_transactions,
        count(case when transaction_type = 'deposit' then transaction_id end) as count_deposits,
        count(case when transaction_type = 'withdrawal' then transaction_id end) as count_withdrawals,
        count(case when transaction_type = 'transfer' then transaction_id end) as count_transfers,
        count(case when transaction_type = 'deposit' then transaction_id end)::float / count(transaction_id) as share_deposits,
        count(case when transaction_type = 'withdrawal' then transaction_id end)::float / count(transaction_id) as share_withdrawals,
        count(case when transaction_type = 'transfer' then transaction_id end)::float / count(transaction_id) as share_transfers,

        --customer segmentation
        count(case when age < 30 then transaction_id end) as transactions_under_30,
        count(case when age between 30 and 50 then transaction_id end) as transactions_30_to_50,
        count(case when age > 50 then transaction_id end) as transactions_over_50,
        count(case when age < 30 then transaction_id end)::float / count(transaction_id) as share_customers_under_30,
        count(case when age between 30 and 50 then transaction_id end)::float / count(transaction_id) as share_customers_30_to_50,
        count(case when age > 50 then transaction_id end)::float / count(transaction_id) as share_customers_over_50,

        --transaction kpis
        sum(transaction_amount_euro) as total_transaction_amount_euro,
        avg(transaction_amount_euro) as avg_transaction_amount_euro,
        count(case when has_account is true then transaction_id end) as transactions_with_account,
        count(case when has_account is false then transaction_id end) as transactions_without_account

    from joined
    group by branch_id, branch_name, transaction_date, transaction_currency
)

select * 
from aggregated
  );
