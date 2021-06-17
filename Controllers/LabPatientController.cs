using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class LabPatientController : ApiController
    {
        //LabPatient

        HospitalDBEntities1 db = new HospitalDBEntities1();

        [HttpGet]
        [Route("DataAccess/LabPatient/GetLabTestDetails")]
        public IHttpActionResult GetLabTestDetails()
        {
            var bills = db.usp_GetLabTestDetails();
            return Ok(bills);
        }
    }
}
