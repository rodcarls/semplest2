//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SemplestAdminApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TransactionHistory
    {
        public int TransactionHistoryPK { get; set; }
        public int UserFK { get; set; }
        public System.DateTime TransactionDate { get; set; }
        public string TableName { get; set; }
        public string Field { get; set; }
        public string OldValue { get; set; }
        public string NewValue { get; set; }
    
        public virtual User User { get; set; }
    }
}
