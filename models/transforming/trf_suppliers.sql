{{config(materialised='table',schema='transforming_dev')}}

select 
  get(xmlget(SUPPLIERSINFO,'SupplierID'),'$') as SupplierID,
  get(xmlget(SUPPLIERSINFO,'CompanyName'),'$')::varchar as CompanyName ,
  get(xmlget(SUPPLIERSINFO,'ContactName'),'$')::varchar as ContactName,
  get(xmlget(SUPPLIERSINFO,'Address'),'$')::varchar as Address,
  get(xmlget(SUPPLIERSINFO,'City'),'$')::varchar as City ,
  get(xmlget(SUPPLIERSINFO,'PostalCode'),'$')::varchar as PostalCode ,
  get(xmlget(SUPPLIERSINFO,'Country'),'$')::varchar as Country,
  get(xmlget(SUPPLIERSINFO,'Phone'),'$')::varchar as Phone ,
  get(xmlget(SUPPLIERSINFO,'Fax'),'$')::varchar as Fax ,
  from {{ref('stg_suppliers')}}