-- Which sales agent made the most in sales over all?

select Top(1) Employee.EmployeeId, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, sum(Invoice.Total) as TotalSalesPerAgent
from Invoice
	join Customer
		on Invoice.CustomerId = Customer.CustomerId
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'
group by Employee.EmployeeId, Employee.LastName, Employee.FirstName
order by sum(Invoice.Total) desc