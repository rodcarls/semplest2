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
    
    public partial class BillType
    {
        public BillType()
        {
            this.Customers = new HashSet<Customer>();
        }
    
        public int BillTypePK { get; set; }
        public string BillType1 { get; set; }
    
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
