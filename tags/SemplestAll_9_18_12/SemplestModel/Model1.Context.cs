﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SemplestModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    
    public partial class Semplest : DbContext
    {
        public Semplest()
            : base("name=Semplest")
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
        public DbSet<AdvertisingEngineAd> AdvertisingEngineAds { get; set; }
        public DbSet<AdvertisingEngineAPICharge> AdvertisingEngineAPICharges { get; set; }
        public DbSet<AdvertisingEnginePromotion> AdvertisingEnginePromotions { get; set; }
        public DbSet<AdvertisingEngineReportData> AdvertisingEngineReportDatas { get; set; }
        public DbSet<BidType> BidTypes { get; set; }
        public DbSet<BillType> BillTypes { get; set; }
        public DbSet<BudgetCycle> BudgetCycles { get; set; }
        public DbSet<Credential> Credentials { get; set; }
        public DbSet<CreditCardNickName> CreditCardNickNames { get; set; }
        public DbSet<CreditCardProfile> CreditCardProfiles { get; set; }
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
        public DbSet<KeywordCategory> KeywordCategories { get; set; }
        public DbSet<KeywordInitialBidData> KeywordInitialBidDatas { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<PhoneType> PhoneTypes { get; set; }
        public DbSet<ProductGroup> ProductGroups { get; set; }
        public DbSet<ProductGroupCycleType> ProductGroupCycleTypes { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<PromotionAdEngineSelected> PromotionAdEngineSelecteds { get; set; }
        public DbSet<PromotionAdengineStatu> PromotionAdengineStatus { get; set; }
        public DbSet<PromotionAd> PromotionAds { get; set; }
        public DbSet<PromotionBidding> PromotionBiddings { get; set; }
        public DbSet<PromotionKeywordAssociation> PromotionKeywordAssociations { get; set; }
        public DbSet<PromotionStatu> PromotionStatus { get; set; }
        public DbSet<Right> Rights { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RolesRightsAssociation> RolesRightsAssociations { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<ScheduleJob> ScheduleJobs { get; set; }
        public DbSet<ScheduleLog> ScheduleLogs { get; set; }
        public DbSet<ScheduleTaskAssociation> ScheduleTaskAssociations { get; set; }
        public DbSet<SEMCustomerDetail> SEMCustomerDetails { get; set; }
        public DbSet<SemplestBidType> SemplestBidTypes { get; set; }
        public DbSet<SiteLink> SiteLinks { get; set; }
        public DbSet<StateCode> StateCodes { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<TargetedDailyBudget> TargetedDailyBudgets { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<TrafficEstimator> TrafficEstimators { get; set; }
        public DbSet<TransactionHistory> TransactionHistories { get; set; }
        public DbSet<UserRolesAssociation> UserRolesAssociations { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<WebContent> WebContents { get; set; }
        public DbSet<WebContentQuestionMarkHelp> WebContentQuestionMarkHelps { get; set; }
        public DbSet<WebsiteWebContent> WebsiteWebContents { get; set; }
        public DbSet<SchedulerView> SchedulerViews { get; set; }
        public DbSet<vwGetLivePromotionsForUser> vwGetLivePromotionsForUsers { get; set; }
        public DbSet<vwProductPromotion> vwProductPromotions { get; set; }
        public DbSet<Configuration> Configurations { get; set; }
        public DbSet<vwCreditCardTransactionDetail> vwCreditCardTransactionDetails { get; set; }
        public DbSet<vwPromotionChart> vwPromotionCharts { get; set; }
        public DbSet<KeywordBidData> KeywordBidDatas { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<MSNGeoLocation> MSNGeoLocations { get; set; }
        public DbSet<NickNameProfileAssociation> NickNameProfileAssociations { get; set; }
        public DbSet<PayType> PayTypes { get; set; }
        public DbSet<PromotionBudget> PromotionBudgets { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<TransactionType> TransactionTypes { get; set; }
        public DbSet<ZipCode> ZipCodes { get; set; }
        public DbSet<UserType> UserTypes { get; set; }
    
        public virtual ObjectResult<sp_GetRigtsRolesInteraction_Result> sp_GetRigtsRolesInteraction(Nullable<int> roleId)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(sp_GetRigtsRolesInteraction_Result).Assembly);
    
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("roleId", roleId) :
                new ObjectParameter("roleId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetRigtsRolesInteraction_Result>("sp_GetRigtsRolesInteraction", roleIdParameter);
        }
    
        public virtual ObjectResult<vwPromotionChart> GetMondayChart(Nullable<System.DateTime> startDate, Nullable<System.DateTime> endDate)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(vwPromotionChart).Assembly);
    
            var startDateParameter = startDate.HasValue ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(System.DateTime));
    
            var endDateParameter = endDate.HasValue ?
                new ObjectParameter("EndDate", endDate) :
                new ObjectParameter("EndDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<vwPromotionChart>("GetMondayChart", startDateParameter, endDateParameter);
        }
    
        public virtual ObjectResult<vwPromotionChart> GetMondayChart(Nullable<System.DateTime> startDate, Nullable<System.DateTime> endDate, MergeOption mergeOption)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(vwPromotionChart).Assembly);
    
            var startDateParameter = startDate.HasValue ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(System.DateTime));
    
            var endDateParameter = endDate.HasValue ?
                new ObjectParameter("EndDate", endDate) :
                new ObjectParameter("EndDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<vwPromotionChart>("GetMondayChart", mergeOption, startDateParameter, endDateParameter);
        }
    
        public virtual ObjectResult<SetNegativeKeyword_Result> SetNegativeKeyword(string keyword, Nullable<int> promotionID, ObjectParameter negativeKeywordID, ObjectParameter exists)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(SetNegativeKeyword_Result).Assembly);
    
            var keywordParameter = keyword != null ?
                new ObjectParameter("keyword", keyword) :
                new ObjectParameter("keyword", typeof(string));
    
            var promotionIDParameter = promotionID.HasValue ?
                new ObjectParameter("PromotionID", promotionID) :
                new ObjectParameter("PromotionID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SetNegativeKeyword_Result>("SetNegativeKeyword", keywordParameter, promotionIDParameter, negativeKeywordID, exists);
        }
    
        public virtual int GetMSNGeoLocation(Nullable<int> promotionID, string valueList, string valueDelimiter, string listDelimiter, ObjectParameter totalSize)
        {
            var promotionIDParameter = promotionID.HasValue ?
                new ObjectParameter("PromotionID", promotionID) :
                new ObjectParameter("PromotionID", typeof(int));
    
            var valueListParameter = valueList != null ?
                new ObjectParameter("ValueList", valueList) :
                new ObjectParameter("ValueList", typeof(string));
    
            var valueDelimiterParameter = valueDelimiter != null ?
                new ObjectParameter("ValueDelimiter", valueDelimiter) :
                new ObjectParameter("ValueDelimiter", typeof(string));
    
            var listDelimiterParameter = listDelimiter != null ?
                new ObjectParameter("ListDelimiter", listDelimiter) :
                new ObjectParameter("ListDelimiter", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetMSNGeoLocation", promotionIDParameter, valueListParameter, valueDelimiterParameter, listDelimiterParameter, totalSize);
        }
    }
}