using Chinook.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Chinook.DataAccessLayer
{
    public class InvoiceRepo
    {
        const string connectionString = "Server=localhost;Database=Chinook;Trusted_Connection=true;";

        public List<Invoice> GetInvoiceByCountry(string country)
        {
            var sql = @"select (FirstName + ' ' + LastName) as CustomerName, InvoiceId, InvoiceDate, BillingCountry
                        from Invoice
	                        join Customer
	                        on Invoice.CustomerId = Customer.CustomerId
                        where Country = @Country";

            using(var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                var cmd = connection.CreateCommand();
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("Country", country);
                var reader = cmd.ExecuteReader();

                var invoices = new List<Invoice>();
                while(reader.Read())
                {
                    var invoice = new Invoice
                    {
                        CustomerName = (string)reader["CustomerName"],
                        InvoiceId = (int)reader["InvoiceId"],
                        InvoiceDate = (DateTime)reader["InvoiceDate"],
                        BillingCountry = (string)reader["BillingCountry"]
                    };
                    invoices.Add(invoice);
                }
                return invoices;
            }
        }

        public List<string> UniqueInvoiceCountries()
        {
            var sql = @"select distinct BillingCountry
                        from Invoice";

            using(var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                var cmd = connection.CreateCommand();
                cmd.CommandText = sql;
                var reader = cmd.ExecuteReader();

                var invoiceCountries = new List<string>();

                while (reader.Read())
                {
                    var invoice = new Invoice
                    {
                        BillingCountry = (string)reader["BillingCountry"]
                    };
                    invoiceCountries.Add(invoice.BillingCountry);
                }
                return invoiceCountries;
            }
        }
    }
}
