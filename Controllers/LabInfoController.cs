using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class Lab_InformationController : ApiController
    {
        //LabInfo

        HospitalDBEntities1 db = new HospitalDBEntities1();

        // GET: api/LabInformation
        public IHttpActionResult GetLab_Information()
        {
            List<usp_GetAllLabDetails_Result> lab = db.usp_GetAllLabDetails().ToList();
            if (lab != null)
            {


                return Ok(lab);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpPost]
        // PUT: api/Lab_Information/
        [ResponseType(typeof(void))]
        public IHttpActionResult PostLab_Information(Lab_Information l)
        {
            var P = db.usp_InsertLab(l.Lab_Id, l.LabTestName, l.Price);
            if (P == 1)
            {


                return Ok("1");
            }
            else
            {
                return NotFound();
            }
        }

        // DELETE: api/Lab_Information/5
        [ResponseType(typeof(Lab_Information))]
        public IHttpActionResult DeleteLab_Information(int id)
        {
            var p = db.usp_DeleteLabDetails(id);
            if (p == 1)
            {


                return Ok("1");
            }
            else
            {
                return NotFound();
            }

        }
    }
}
