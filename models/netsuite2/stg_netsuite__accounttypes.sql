{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__accounttypes_tmp') }}
    where not coalesce(_fivetran_deleted, false)

),

final as (
    
    select
        _fivetran_synced,
        id as accounttype_id,
        balancesheet = 'T' as is_balancesheet,
        [left] = 'T' as is_leftside,
        longname as [type_name]
    from fields
)

select * 
from final
