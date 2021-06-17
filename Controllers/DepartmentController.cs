using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiDemo.Models;

namespace WebApiDemo.Controllers
{
    public class DepartmentController : ApiController
    {
        //Department

        HospitalDBEntities1 db = new HospitalDBEntities1();

        [HttpGet]
        [Route("DataAccess/Department/GetAllDep")]
        public IHttpActionResult GetAllDep()
        {
            var bills = db.usp_GetAllDep();
            return Ok(bills);
        }

        [HttpGet]
        [Route("DataAccess/Department/DeletetDep/{id}")]
        public IHttpActionResult DeletetDep(int id)
        {
            var result = db.usp_DeletetDep(id);
            if (result == 1)
                return Ok("1");
            else
                return Ok("0");
        }

        //Delete
        [HttpPost]
        public IHttpActionResult PostDepartment(int id)
        {
            int a = db.usp_DeletetDep(id);
            if (a == 1)
                return Ok();
            else
                return NotFound();
        }

        // PUT: api/Departments/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDepartment(int id, Department department)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != department.DeptId)
            {
                return BadRequest();
            }

            db.Entry(department).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DepartmentExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }
        private bool DepartmentExists(int id)
        {
            return db.Departments.Count(e => e.DeptId == id) > 0;
        }

        // POST: api/Departments
        [ResponseType(typeof(Department))]
        public IHttpActionResult PostDepartment(Department department)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Departments.Add(department);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (DepartmentExists(department.DeptId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = department.DeptId }, department);
        }
    }
}
