//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;

namespace Semplest.Core.Models
{
    public class CustomerHierarchy
    {
        public int CustomerHierarchyPK { get; set; }
        public int CustomerFK { get; set; }
        public int CustomerParentFK { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Customer Customer1 { get; set; }
    }
}