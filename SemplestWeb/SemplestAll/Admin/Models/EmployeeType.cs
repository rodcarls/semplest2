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
    
    public partial class EmployeeType
    {
        public EmployeeType()
        {
            this.Employees = new HashSet<Employee>();
        }
    
        public int EmployeeTypeID { get; set; }
        public string EmployeeType1 { get; set; }
    
        public virtual ICollection<Employee> Employees { get; set; }
    }
}
