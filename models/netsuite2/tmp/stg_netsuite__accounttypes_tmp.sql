{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('accounttypes_netsuite2') }}