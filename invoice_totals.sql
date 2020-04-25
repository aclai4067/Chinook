--  Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name 
-- for all invoices and customers.

select Invoice.Total, Customer.FirstName + ' ' + Customer.LastName as CustomerFullName, Customer.Country, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName
from Invoice
	left join Customer
		on Invoice.CustomerId = Customer.CustomerId
	left join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'

