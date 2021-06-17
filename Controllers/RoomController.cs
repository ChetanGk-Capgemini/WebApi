using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class RoomController : ApiController
    {

        HospitalDBEntities1 db = new HospitalDBEntities1();

        [HttpGet]
        [Route("DataAccess/RoomData/GetAllRooms")]
        public IHttpActionResult GetAllRooms()
        {
            var bills = db.Usp_GetAllRooms();
            return Ok(bills);
        }
    }
}
