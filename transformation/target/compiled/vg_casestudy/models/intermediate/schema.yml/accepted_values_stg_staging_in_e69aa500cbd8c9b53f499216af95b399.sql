
    
    

with all_values as (

    select
        transaction_currency as value_field,
        count(*) as n_records

    from "casestudy"."intermediate"."stg_staging_intermediate__transactions"
    group by transaction_currency

)

select *
from all_values
where value_field not in (
    'AUD','BGN','CHF','CZK','DKK','GBP','HUF','ISK','JPY','NOK','PLN','RON','SEK','TRY'
)


