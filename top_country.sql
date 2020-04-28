-- Which country's customers spent the most?

select Top(1) BillingCountry, sum(Total) as TotalSalesPerCountry
from Invoice
group by BillingCountry
order by sum(Total) desc