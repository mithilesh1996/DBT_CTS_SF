{{config(materialised='table',schema='transforming_dev')}}

select 
p.productid,
p.productname,
s.CompanyName as supplierscompany,
s.ContactName as supplierscontact,
s.city as supplierscity,
s.Country as supplierscountry,
c.categoryname,
p.QUANTITYPERUNIT,
p.unitcost,
p.UNITPRICE,
p.UNITSINSTOCK,
p.UNITSONORDER,
iff(p.UNITSONORDER > p.UNITSINSTOCK,'Not availability','availability') as supplirsavailability
from 
{{ref('stg_products')}} p
inner join 
{{ref('trf_suppliers')}} s 
on s.SupplierID=p.SupplierID
inner join 
{{ref('lkp_categories')}} c on 
p.CategoryID=c.CategoryID