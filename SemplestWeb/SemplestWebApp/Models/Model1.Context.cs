﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SemplestWebApp.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
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
        public DbSet<AdGroup> AdGroups { get; set; }
        public DbSet<AdGroupKeywordAssociation> AdGroupKeywordAssociations { get; set; }
        public DbSet<AdvertisingEngine> AdvertisingEngines { get; set; }
        public DbSet<AdvertisingEngineBidData> AdvertisingEngineBidDatas { get; set; }
        public DbSet<BidType> BidTypes { get; set; }
        public DbSet<BillType> BillTypes { get; set; }
        public DbSet<Campaign> Campaigns { get; set; }
        public DbSet<CampaignAd> CampaignAds { get; set; }
        public DbSet<CampaignCycleType> CampaignCycleTypes { get; set; }
        public DbSet<Credential> Credentials { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddressAssociation> CustomerAddressAssociations { get; set; }
        public DbSet<CustomerHierarchy> CustomerHierarchies { get; set; }
        public DbSet<CustomerPhoneAssociation> CustomerPhoneAssociations { get; set; }
        public DbSet<Keyword> Keywords { get; set; }
        public DbSet<KeywordBid> KeywordBids { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<PhoneType> PhoneTypes { get; set; }
        public DbSet<StateCode> StateCodes { get; set; }
        public DbSet<User> Users { get; set; }
    }
}
