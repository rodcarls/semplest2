//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Semplest.Core.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductGroupCycleType
    {
        public ProductGroupCycleType()
        {
            this.Customers = new HashSet<Customer>();
        }
    
        public int ProductGroupCycleTypePK { get; set; }
        public string ProductGroupCycleType1 { get; set; }
        public int CycleInDays { get; set; }
    
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
