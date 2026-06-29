SELECT

p.Application_Name,

p.Table_Name,

p.Column_Name,

p.Prod_Classification,

a.Approved_Classification,

CASE

WHEN p.Prod_Classification <> a.Approved_Classification

THEN 'Classification Mismatch'

ELSE 'Validated'

END AS Validation_Status

FROM prod_metadata p

LEFT JOIN approved_metadata a

ON p.Application_Name = a.Application_Name

AND p.Table_Name = a.Table_Name

AND p.Column_Name = a.Column_Name;
