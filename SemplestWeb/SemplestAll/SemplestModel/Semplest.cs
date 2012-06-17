﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace SemplestModel
{
    public class Semplest : DbContext
    {
    
        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressType> AddressTypes { get; set; }
        public DbSet<AdvertisingEngine> AdvertisingEngines { get; set; }
        public DbSet<AdvertisingEngineAccount> AdvertisingEngineAccounts { get; set; }
        public DbSet<AdvertisingEngineAd> AdvertisingEngineAds { get; set; }
        public DbSet<AdvertisingEnginePromotion> AdvertisingEnginePromotions { get; set; }
        public DbSet<AdvertisingEngineReportData> AdvertisingEngineReportDatas { get; set; }
        public DbSet<BidType> BidTypes { get; set; }
        public DbSet<BillType> BillTypes { get; set; }
        public DbSet<BudgetCycle> BudgetCycles { get; set; }
        public DbSet<Configuration> Configurations { get; set; }
        public DbSet<Credential> Credentials { get; set; }
        public DbSet<CreditCardProfile> CreditCardProfiles { get; set; }
        public DbSet<CreditCardTransaction> CreditCardTransactions { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddressAssociation> CustomerAddressAssociations { get; set; }
        public DbSet<CustomerHierarchy> CustomerHierarchies { get; set; }
        public DbSet<CustomerNote> CustomerNotes { get; set; }
        public DbSet<CustomerPhoneAssociation> CustomerPhoneAssociations { get; set; }
        public DbSet<CustomerStyle> CustomerStyles { get; set; }
        public DbSet<EmailTemplate> EmailTemplates { get; set; }
        public DbSet<EmailType> EmailTypes { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeCustomerAssociation> EmployeeCustomerAssociations { get; set; }
        public DbSet<EmployeePhoneAssociation> EmployeePhoneAssociations { get; set; }
        public DbSet<EmployeeType> EmployeeTypes { get; set; }
        public DbSet<Error> Errors { get; set; }
        public DbSet<Frequency> Frequencies { get; set; }
        public DbSet<GeoTargeting> GeoTargetings { get; set; }
        public DbSet<HelpDefinition> HelpDefinitions { get; set; }
        public DbSet<Keyword> Keywords { get; set; }
        public DbSet<KeywordBid> KeywordBids { get; set; }
        public DbSet<KeywordBidData> KeywordBidDatas { get; set; }
        public DbSet<KeywordCategory> KeywordCategories { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<PhoneType> PhoneTypes { get; set; }
        public DbSet<ProductGroup> ProductGroups { get; set; }
        public DbSet<ProductGroupCycleType> ProductGroupCycleTypes { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<PromotionAdEngineSelected> PromotionAdEngineSelecteds { get; set; }
        public DbSet<PromotionAdengineStatu> PromotionAdengineStatus { get; set; }
        public DbSet<PromotionAd> PromotionAds { get; set; }
        public DbSet<PromotionKeywordAssociation> PromotionKeywordAssociations { get; set; }
        public DbSet<PromotionPayment> PromotionPayments { get; set; }
        public DbSet<PromotionStatu> PromotionStatus { get; set; }
        public DbSet<Right> Rights { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RolesRightsAssociation> RolesRightsAssociations { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<ScheduleJob> ScheduleJobs { get; set; }
        public DbSet<ScheduleLog> ScheduleLogs { get; set; }
        public DbSet<ScheduleTaskAssociation> ScheduleTaskAssociations { get; set; }
        public DbSet<SEMCustomerDetail> SEMCustomerDetails { get; set; }
        public DbSet<SiteLink> SiteLinks { get; set; }
        public DbSet<StateCode> StateCodes { get; set; }
        public DbSet<TargetedDailyBudget> TargetedDailyBudgets { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<TrafficEstimator> TrafficEstimators { get; set; }
        public DbSet<TransactionHistory> TransactionHistories { get; set; }
        public DbSet<UserRolesAssociation> UserRolesAssociations { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<WebContent> WebContents { get; set; }
        public DbSet<WebContentQuestionMarkHelp> WebContentQuestionMarkHelps { get; set; }
        public DbSet<vwGetLivePromotionsForUser> vwGetLivePromotionsForUsers { get; set; }
        public DbSet<vwProductPromotion> vwProductPromotions { get; set; }
        public DbSet<vwPromotionChart> vwPromotionCharts { get; set; }
        public DbSet<vwCreditCardTransactionDetail> vwCreditCardTransactionDetails { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}
