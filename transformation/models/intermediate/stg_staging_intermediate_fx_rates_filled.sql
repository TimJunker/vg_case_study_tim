with calendar as (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="date('2024-12-31')",
        end_date="date('2025-03-11')"
    ) }}

),

currencies as (
    select distinct trim(currency_iso_code) as currency_iso_code
    from {{ ref('fx_rates_full_history') }}
),

date_matrix as (
    select 
        currencies.currency_iso_code,
        calendar.date_day as fx_rate_date
    from currencies
    cross join calendar 

),

joined as (
    select 
        date_matrix.currency_iso_code,
        date_matrix.fx_rate_date,
        fx_rates_full_history.fx_rate
    from date_matrix
    left join {{ ref('fx_rates_full_history') }} as fx_rates_full_history
    on date_matrix.currency_iso_code = fx_rates_full_history.currency_iso_code
    and date_matrix.fx_rate_date = fx_rates_full_history.fx_rate_date
),

forward_fill_dates as (
    select 
        currency_iso_code,
        fx_rate_date::date as fx_rate_date,

        last_value(fx_rate ignore nulls) over(
            partition by currency_iso_code
            order by fx_rate_date asc
            rows between unbounded preceding and current row
        ) as fx_rate
    from joined
)

select *
from forward_fill_dates
