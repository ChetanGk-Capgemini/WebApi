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
    
    public partial class usp_GetLabTestDetails_Result
    {
        public int Lab_Id { get; set; }
        public Nullable<int> PId { get; set; }
        public Nullable<int> Doctor_Id { get; set; }
        public Nullable<System.DateTime> Test_Date { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string Billing_Status { get; set; }
        public Nullable<int> Test_Id { get; set; }
    }
}