//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Runtime.Serialization;


namespace SemplestModel
{
    
    public partial class ProductGroupCycleType
    {
        public ProductGroupCycleType()
        {
            this.Customers = new HashSet<Customer>();
        }

        [System.ComponentModel.DataAnnotations.Key]
        public int ProductGroupCycleTypePK { get; set; }
        
        public string ProductGroupCycleType1 { get; set; }
        
        public int CycleInDays { get; set; }
    
        
        public virtual ICollection<Customer> Customers { get; set; }
    }
    
}
