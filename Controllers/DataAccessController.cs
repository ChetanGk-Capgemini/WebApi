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
    public class DataAccessController : ApiController
    {
        private string cnst = "server=.;database=HospitalDB; integrated security=true";
        [Route("DataAccess/GetMaxDoctorId")]
        public IHttpActionResult GetMaxDoctorId()
        {
            int id = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_GetMaxDoctorId", cn);
            //SqlDataAdapter sda = new SqlDataAdapter("select Max([Doctor Id])from Doctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read() == true)
            {
                if (!dr.IsDBNull(0))
                {
                    id = dr.GetInt32(0);
                    id += 1;
                }
            }
            return Ok(id);
        }
        [Route("DataAccess/InsertDoctor/{Doc}")]
        public IHttpActionResult InsertDoctor(Doctor Doc)
        {
            //string cnst = "server=.\\Pavan;database=HospitalDb; integrated security=true";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_AddDoctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorid", Doc.Doctor_Id);
            cmd.Parameters.AddWithValue("@doctorname", Doc.Doctor_Name);
            cmd.Parameters.AddWithValue("@deptid", Doc.DeptId);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            return Ok("1");
        }
        [HttpPost]
        [Route("DataAccess/UpdateDoctor/{Doc}")]
        public IHttpActionResult UpdateDoctor(Doctor Doc)
        {
            //string cnst = "server=.\\Pavan;database=HospitalDb; integrated security=true";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_UpdateDoctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorid", Doc.Doctor_Id);
            cmd.Parameters.AddWithValue("@doctorname", Doc.Doctor_Name);
            cmd.Parameters.AddWithValue("@deptid", Doc.DeptId);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            return Ok("1");
        }
        [HttpGet]
        [Route("DataAccess/DeleteDoctor/{DoctorId}")]
        public IHttpActionResult DeleteDoctor(int DoctorId)
        {
            //string cnst = "server=.\\Pavan;database=HospitalDb; integrated security=true";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_DeleteDoctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorid", DoctorId);
            cmd.ExecuteNonQuery();
            return Ok("1");
        }
        [HttpGet]
        [Route("DataAccess/SearchDoctor/{DoctorId}")]
        public IHttpActionResult SearchDoctor(string DoctorId)
        {
            Doctor Doc;
            //string cnst = "server=.\\Pavan;database=HospitalDb; integrated security=true";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_SearchDoctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doctorid", DoctorId);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Doc = new Doctor();
                Doc.Doctor_Id = dr.GetInt32(0);
                Doc.Doctor_Name = dr.GetString(1);
                Doc.DeptId = dr.GetInt32(2);
            }
            else
            {
                Doc = null;
            }
            dr.Close();
            cn.Close();
            cn.Dispose();
            return Ok(Doc);
        }
        [Route("DataAccess/GetAllDoctor")]
        public IHttpActionResult GetAllDoctor()
        {
            Doctor Doc;
            List<Doctor> Doclist = new List<Doctor>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_GetAllDoctor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read() == true)
            {
                Doc = new Doctor();
                Doc.Doctor_Id = dr.GetInt32(0);
                Doc.Doctor_Name = dr.GetString(1);
                Doc.DeptId = dr.GetInt32(2);
                Doclist.Add(Doc);
            }
            dr.Close();
            cn.Close();
            cn.Dispose();
            return Ok(Doclist);
        }
        [Route("DataAccess/GetAllDep")]
        public IHttpActionResult GetAllDep()
        {
            List<Department> deplst = new List<Department>();
            Department dep = new Department();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_GetAllDep", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read() == true)
            {
                dep = new Department();
                dep.DeptId = dr.GetInt32(0);
                dep.DepartmentName = dr.GetString(1);

                deplst.Add(dep);
            }
            return Ok(deplst);
        }

        [HttpGet]
        [Route("DataAccess/SearchInpatient/{Pid}/{Admissiondate}")]
        public IHttpActionResult SearchInpatient(string Pid, DateTime Admissiondate)
        {
            Inpatient Ipt;
            //string cnst = "server=.\\Pavan;database=HospitalDb; integrated security=true";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("Usp_SearchInpatient", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid", Pid);
            cmd.Parameters.AddWithValue("@admission_date", Admissiondate);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read() == true)
            {
                Ipt = new Inpatient();
                Ipt.Pid = dr.GetInt32(0);
                Ipt.Room_No = dr.GetInt32(1);
                Ipt.Doctor_Id = dr.GetInt32(2);
                Ipt.Admission_Date = dr.GetDateTime(3);
                Ipt.Discharge_Date = dr.GetDateTime(4);
                Ipt.Amount_Per_Day = dr.GetDecimal(5);
            }
            else
            {
                Ipt = null;
            }
            dr.Close();
            cn.Close();
            cn.Dispose();
            return Ok(Ipt);
        }

        [HttpGet]
        [Route("DataAccess/GetAllInpatient")]
        public IHttpActionResult GetAllInpatient()
        {
            Inpatient Ipt;
            List<Inpatient> Iptlist = new List<Inpatient>();
            
            return Ok(Iptlist);
        }


        [HttpPost]
        [Route("DataAccess/InsertDep")]
        public IHttpActionResult InsertDep(Department dep)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cnst;
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_InsertDep", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DID", dep.DeptId);
            cmd.Parameters.AddWithValue("@DName", dep.DepartmentName);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            return Ok("1");
        }

        [HttpGet]
        [Route("DataAccess/GetAllBills")]
        public IHttpActionResult GetAllBills()
        {
            return Ok();
        }
    }
}
