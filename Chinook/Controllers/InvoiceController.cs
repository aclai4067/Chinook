using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Chinook.DataAccessLayer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Chinook.Controllers
{
    [Route("api/Invoice")]
    [ApiController]
    public class InvoiceController : ControllerBase
    {

        // GET: api/Invoice/Brazil
        [HttpGet("{country}")]
        public IActionResult GetCountryInvoices(string country)
        {
            var repo = new InvoiceRepo();
            var invoices = repo.GetInvoiceByCountry(country);
            if (!invoices.Any())
            {
                return NotFound();
            }
            return Ok(invoices);
        }

        // GET: api/Invoice/UniqueCountries
        [HttpGet("UniqueCountries")]
        public IActionResult GetUniqueInvoiceCountries()
        {
            var repo = new InvoiceRepo();
            var countries = repo.UniqueInvoiceCountries();
            if (!countries.Any())
            {
                return NotFound();
            }
            return Ok(countries);
        }
    }
}