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
    
    public partial class User
    {
        public User()
        {
            this.Credentials = new HashSet<Credential>();
            this.Employees = new HashSet<Employee>();
            this.TransactionHistories = new HashSet<TransactionHistory>();
            this.UserRolesAssociations = new HashSet<UserRolesAssociation>();
        }
    
        public int UserPK { get; set; }
        public Nullable<int> CustomerFK { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> EditedDate { get; set; }
        public bool IsActive { get; set; }
        public string MiddleInitial { get; set; }
    
        public virtual ICollection<Credential> Credentials { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<TransactionHistory> TransactionHistories { get; set; }
        public virtual ICollection<UserRolesAssociation> UserRolesAssociations { get; set; }
    }
}
