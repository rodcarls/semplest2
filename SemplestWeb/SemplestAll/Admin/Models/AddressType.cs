//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Semplest.Admin.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class AddressType
    {
        public AddressType()
        {
            this.CustomerAddressAssociations = new HashSet<CustomerAddressAssociation>();
        }
    
        public int AddressTypePK { get; set; }
        public string AddressType1 { get; set; }
    
        public virtual ICollection<CustomerAddressAssociation> CustomerAddressAssociations { get; set; }
    }
}
