using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Chinook.Model
{
    public class Invoice
    {
        public string CustomerName { get; internal set; }
        public int InvoiceId { get; internal set; }
        public DateTime InvoiceDate { get; internal set; }
        public string BillingCountry { get; internal set; }
    }
}
