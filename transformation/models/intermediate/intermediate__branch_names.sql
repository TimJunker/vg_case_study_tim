with branch_names as (
    select *
    from {{ ref('branch_names') }}
)

select
    branch_id,
    branch_name 
from branch_names