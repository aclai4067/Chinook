using Chinook.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Chinook
{
    public class CustomerRepo
    {
        const string connectionString = "Server=localhost;Database=Chinook;Trusted_Connection=true;";

        public List<Customer> GetByCountry(string country)
        {
            var sql = @"select CustomerId, FirstName, LastName, Country
                        from Customer
                        where Country = @Country";

            using(var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                var cmd = connection.CreateCommand();
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("Country", country);
                var reader = cmd.ExecuteReader();
                var customers = new List<Customer>();

                while (reader.Read())
                {
                    var customer = new Customer
                    {
                        CustomerId = (int)reader["CustomerId"],
                        FirstName = (string)reader["FirstName"],
                        LastName = (string)reader["LastName"],
                        Country = (string)reader["Country"]
                    };
                    customers.Add(customer);
                }
                return customers;
            }
        }
    }
}
