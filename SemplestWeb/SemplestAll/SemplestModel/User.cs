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
using System.ComponentModel.DataAnnotations.Schema;


namespace SemplestModel
{
    [Table("Users")]
    public partial class User
    {
        public User()
        {
            this.Credentials = new HashSet<Credential>();
            this.Employees = new HashSet<Employee>();
            this.Errors = new HashSet<Error>();
            this.Schedules = new HashSet<Schedule>();
            this.TransactionHistories = new HashSet<TransactionHistory>();
            this.UserRolesAssociations = new HashSet<UserRolesAssociation>();
        }

        [System.ComponentModel.DataAnnotations.Key]
        public int UserPK { get; set; }
        
        public Nullable<int> CustomerFK { get; set; }
        
        public string FirstName { get; set; }
        
        public string LastName { get; set; }
        
        public string Email { get; set; }
        
        public System.DateTime CreatedDate { get; set; }
        
        public Nullable<System.DateTime> EditedDate { get; set; }
        
        public bool IsActive { get; set; }
        
        public string MiddleInitial { get; set; }
        
        public bool IsRegistered { get; set; }
    
        
        public virtual ICollection<Credential> Credentials { get; set; }
        
        [ForeignKey("CustomerFK")]
        public virtual Customer Customer { get; set; }
        
        public virtual ICollection<Employee> Employees { get; set; }
        
        public virtual ICollection<Error> Errors { get; set; }
        
        public virtual ICollection<Schedule> Schedules { get; set; }
        
        public virtual ICollection<TransactionHistory> TransactionHistories { get; set; }
        
        public virtual ICollection<UserRolesAssociation> UserRolesAssociations { get; set; }
    }
    
}
