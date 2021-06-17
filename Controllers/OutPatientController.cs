using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class OutPatientController : ApiController
    {

        HospitalDBEntities1 db = new HospitalDBEntities1();
        //GetAll
        public IHttpActionResult Get()
        {
            var Outp = db.Usp_GetAllOutpatient().ToList();
            return Ok(Outp);
        }

        // POST: api/Outpatients //insert
        public IHttpActionResult Post(Outpatient value)
        {
            if (value.Treatment_Date == DateTime.MinValue) value.Treatment_Date = DateTime.Now;
            int outp = db.Usp_AddOutpatient(value.Pid.ToString(), value.Treatment_Date, value.Doctor_Id);
            if (outp == 1)
                return Ok();
            else
                return NotFound();
        }
        // PUT: api/Outpatients/5 //update
        public IHttpActionResult Put([FromBody] Outpatient value, int id, DateTime dt)
        {
            int outp = db.Usp_UpdateOutpatient(value.Pid, value.Treatment_Date, value.Doctor_Id);

            if (outp == 1)
                return Ok();
            else
                return NotFound();
        }

        // DELETE: api/Outpatients/5 //delte
        public IHttpActionResult Delete(int id, DateTime dt)
        {
            int outp = db.Usp_DeleteOutpatient(id, dt);

            if (outp == 1)
                return Ok();
            else
                return NotFound();
        }
    }
}
