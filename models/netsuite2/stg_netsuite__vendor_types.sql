{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__vendor_types_tmp') }}

),

final as (
    
    select 
        ID vendor_type_id,
        name,
        _fivetran_deleted

    from base
)

select * 
from final
where not coalesce(_fivetran_deleted, false)
