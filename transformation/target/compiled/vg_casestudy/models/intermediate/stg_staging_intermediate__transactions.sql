with staging as (
    select * from "casestudy"."staging"."stg_raw_staging__transactions"
),

filtered as (
    select
        transaction_id,
        transaction_date,
        account_id,
        transaction_type,
        transaction_amount,
        case 
            when transaction_currency = 'RON1' then 'RON'
            else transaction_currency
        end as transaction_currency
    from staging
    where not has_date_parsing_error
)

select * from filtered