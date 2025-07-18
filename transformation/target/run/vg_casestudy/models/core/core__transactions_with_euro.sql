
  
  create view "casestudy"."core"."core__transactions_with_euro__dbt_tmp" as (
    with transactions as (
    select *
    from "casestudy"."intermediate"."stg_staging_intermediate__transactions"
),

fx_rates_filled as (
    select *
    from "casestudy"."intermediate"."stg_staging_intermediate_fx_rates_filled"
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
  );
