using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class BillController : ApiController
    {
        HospitalDBEntities1 db = new HospitalDBEntities1();

        [HttpGet]
        [Route("DataAccess/Bills/GetAllBills")]
        public IHttpActionResult GetAllBills()
        {
            var bills = db.Usp_GetAllBills();
            return Ok(bills);
        }
    }
}
