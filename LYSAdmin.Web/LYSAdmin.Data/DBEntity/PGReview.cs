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
    
    public partial class PGReview
    {
        public int PGReviewID { get; set; }
        public long UserID { get; set; }
        public string Comments { get; set; }
        public Nullable<decimal> Rating { get; set; }
        public Nullable<System.DateTime> CommentTime { get; set; }
        public int PGDetailID { get; set; }
    
        public virtual PGDetail PGDetail { get; set; }
        public virtual User User { get; set; }
    }
}
