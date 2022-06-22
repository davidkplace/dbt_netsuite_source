{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__income_accounts_tmp') }}

),


final as (
    
    select 
        ID AccountID
        ,ACCOUNTSEARCHDISPLAYNAME AccountName
        ,ACCTNUMBER AccountNumber
        ,ACCTTYPE AccountType
        ,PARENT ParentID
        ,_FIVETRAN_DELETED
    from base
)

select * 
from final
where not coalesce(_fivetran_deleted, false)