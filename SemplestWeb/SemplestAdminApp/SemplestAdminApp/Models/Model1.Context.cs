﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    
    public partial class SemplestEntities : DbContext
    {
        public SemplestEntities()
            : base("name=SemplestEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressType> AddressTypes { get; set; }
        public DbSet<AdvertisingEngine> AdvertisingEngines { get; set; }
        public DbSet<AdvertisingEngineAccount> AdvertisingEngineAccounts { get; set; }
        public DbSet<AdvertisingEngineBidData> AdvertisingEngineBidDatas { get; set; }
        public DbSet<AdvertisingEngineCampaign> AdvertisingEngineCampaigns { get; set; }
        public DbSet<BidType> BidTypes { get; set; }
        public DbSet<BillType> BillTypes { get; set; }
        public DbSet<Configuration> Configurations { get; set; }
        public DbSet<Credential> Credentials { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddressAssociation> CustomerAddressAssociations { get; set; }
        public DbSet<CustomerHierarchy> CustomerHierarchies { get; set; }
        public DbSet<CustomerNote> CustomerNotes { get; set; }
        public DbSet<CustomerPhoneAssociation> CustomerPhoneAssociations { get; set; }
        public DbSet<CustomerStyle> CustomerStyles { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeCustomerAssociation> EmployeeCustomerAssociations { get; set; }
        public DbSet<EmployeeType> EmployeeTypes { get; set; }
        public DbSet<Error> Errors { get; set; }
        public DbSet<HelpDefinition> HelpDefinitions { get; set; }
        public DbSet<Keyword> Keywords { get; set; }
        public DbSet<KeywordBid> KeywordBids { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<PhoneType> PhoneTypes { get; set; }
        public DbSet<ProductGroup> ProductGroups { get; set; }
        public DbSet<ProductGroupCycleType> ProductGroupCycleTypes { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<PromotionAd> PromotionAds { get; set; }
        public DbSet<PromotionKeywordAssociation> PromotionKeywordAssociations { get; set; }
        public DbSet<Right> Rights { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RolesRightsAssociation> RolesRightsAssociations { get; set; }
        public DbSet<SEMCustomerDetail> SEMCustomerDetails { get; set; }
        public DbSet<SiteLink> SiteLinks { get; set; }
        public DbSet<StateCode> StateCodes { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<TransactionHistory> TransactionHistories { get; set; }
        public DbSet<UserRolesAssociation> UserRolesAssociations { get; set; }
        public DbSet<User> Users { get; set; }
    
        public virtual ObjectResult<sp_GetRigtsRolesInteraction_Result> sp_GetRigtsRolesInteraction(Nullable<int> roleId)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(sp_GetRigtsRolesInteraction_Result).Assembly);
    
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("roleId", roleId) :
                new ObjectParameter("roleId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetRigtsRolesInteraction_Result>("sp_GetRigtsRolesInteraction", roleIdParameter);
        }
    }
}
