-- Provide a query that shows the count of customers assigned to each sales agent.

select Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, count(Customer.CustomerId) as TotalCustomersPerAgent
from Customer
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'
group by Customer.SupportRepId, Employee.LastName, Employee.FirstName
