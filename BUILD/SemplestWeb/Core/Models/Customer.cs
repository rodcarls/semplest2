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
    
    public partial class Customer
    {
        public Customer()
        {
            this.AdvertisingEngineAccounts = new HashSet<AdvertisingEngineAccount>();
            this.CustomerHierarchies = new HashSet<CustomerHierarchy>();
            this.ProductGroups = new HashSet<ProductGroup>();
            this.CustomerAddressAssociations = new HashSet<CustomerAddressAssociation>();
            this.CustomerPhoneAssociations = new HashSet<CustomerPhoneAssociation>();
            this.CustomerHierarchies1 = new HashSet<CustomerHierarchy>();
            this.CustomerNotes = new HashSet<CustomerNote>();
            this.EmployeeCustomerAssociations = new HashSet<EmployeeCustomerAssociation>();
            this.Users = new HashSet<User>();
        }
    
        public int CustomerPK { get; set; }
        public string Name { get; set; }
        public decimal TotalTargetCycleBudget { get; set; }
        public int ProductGroupCycleTypeFK { get; set; }
        public int BillTypeFK { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> EditedDate { get; set; }
    
        public virtual ICollection<AdvertisingEngineAccount> AdvertisingEngineAccounts { get; set; }
        public virtual BillType BillType { get; set; }
        public virtual ICollection<CustomerHierarchy> CustomerHierarchies { get; set; }
        public virtual ICollection<ProductGroup> ProductGroups { get; set; }
        public virtual ICollection<CustomerAddressAssociation> CustomerAddressAssociations { get; set; }
        public virtual ICollection<CustomerPhoneAssociation> CustomerPhoneAssociations { get; set; }
        public virtual ProductGroupCycleType ProductGroupCycleType { get; set; }
        public virtual ICollection<CustomerHierarchy> CustomerHierarchies1 { get; set; }
        public virtual ICollection<CustomerNote> CustomerNotes { get; set; }
        public virtual CustomerStyle CustomerStyle { get; set; }
        public virtual ICollection<EmployeeCustomerAssociation> EmployeeCustomerAssociations { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
