//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApiDemo.Models
{
    using System;
    
    public partial class Usp_GetAllInpatient_Result
    {
        public int Pid { get; set; }
        public Nullable<int> Room_No { get; set; }
        public Nullable<int> Doctor_Id { get; set; }
        public System.DateTime Admission_Date { get; set; }
        public Nullable<System.DateTime> Discharge_Date { get; set; }
        public Nullable<decimal> Amount_Per_Day { get; set; }
    }
}
