-- Which sales agent made the most in sales in 2009? HINT: TOP

select Top(1) Employee.EmployeeId, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, sum(Invoice.Total) as TotalSalesPerAgent
from Invoice
	join Customer
		on Invoice.CustomerId = Customer.CustomerId
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent' AND InvoiceDate between '2009-01-01' AND '2009-12-31'
group by Employee.EmployeeId, Employee.LastName, Employee.FirstName
order by sum(Invoice.Total) desc