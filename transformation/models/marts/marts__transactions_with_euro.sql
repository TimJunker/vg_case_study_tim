with transactions as (
    select *
    from {{ ref('stg_staging_intermediate__transactions') }}
),

fx_rates_filled as (
    select *
    from {{ ref('intermediate__fx_rates_filled') }}
),

joined as (
    select 
        transactions.transaction_id,
        transactions.transaction_date,
        transactions.account_id,
        transactions.transaction_type,
        transactions.transaction_amount,
        transactions.transaction_currency,
        fx_rates_filled.fx_rate,
        transactions.transaction_amount / nullif(coalesce(fx_rates_filled.fx_rate, 1.0),0) as transaction_amount_euro
    from transactions
    left join fx_rates_filled
    on transactions.transaction_currency = fx_rates_filled.currency_iso_code
    and transactions.transaction_date = fx_rates_filled.fx_rate_date
)

select *
from joined
