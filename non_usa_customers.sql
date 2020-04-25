-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

select FirstName + ' ' + LastName as FullName, CustomerId, Country
from Customer
where not Country like 'USA'
order by Country