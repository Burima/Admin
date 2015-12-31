//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LYSAdmin.Data.DBEntity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transaction
    {
        public int TransactionID { get; set; }
        public string OrderID { get; set; }
        public string mode { get; set; }
        public int TransactionStatusID { get; set; }
        public decimal amount { get; set; }
        public string productinfo { get; set; }
        public string Error { get; set; }
        public string PG_TYPE { get; set; }
        public string bank_ref_num { get; set; }
        public string payuMoneyId { get; set; }
        public string additionalCharges { get; set; }
        public bool IsValidTransaction { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime LastUpdatedOn { get; set; }
        public long UserID { get; set; }
        public int BedID { get; set; }
    
        public virtual Bed Bed { get; set; }
        public virtual TransactionStatus TransactionStatus { get; set; }
        public virtual User User { get; set; }
    }
}