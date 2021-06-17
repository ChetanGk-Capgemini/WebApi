using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class InPatientController : ApiController
    {
        HospitalDBEntities1 db = new HospitalDBEntities1();
        // GET: api/InPatient
        public IHttpActionResult Get()
        {
            return Ok(db.Usp_GetAllInpatient().ToList());
        }

        // GET: api/InPatient/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/InPatient
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/InPatient/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/InPatient/5
        public void Delete(int id)
        {
        }
    }
}
