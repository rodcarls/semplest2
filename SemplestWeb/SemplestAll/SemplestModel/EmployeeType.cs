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
    
    public partial class EmployeeType
    {
        public EmployeeType()
        {
            this.Employees = new HashSet<Employee>();
        }

        [System.ComponentModel.DataAnnotations.Key]
        public int EmployeeTypeID { get; set; }
        
        public string EmployeeType1 { get; set; }
    
        
        public virtual ICollection<Employee> Employees { get; set; }
    }
    
}
