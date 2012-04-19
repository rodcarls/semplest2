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
    
    public partial class Configuration
    {
        public int ConfigurationPK { get; set; }
        public decimal CustomerMinOrderAmount { get; set; }
        public decimal CustomerDefaultMonthlyFlatFeeAmount { get; set; }
        public decimal CustomerDefaultPerCampaignFlatFeeAmount { get; set; }
        public decimal CustomerDefaultPerAdGroupFlatFeeAmount { get; set; }
        public decimal DefaultMediaComissionPercentage { get; set; }
        public decimal DefaultSalesPersonCommissionPercentage { get; set; }
        public decimal MinSalespersonCommissionPercentage { get; set; }
        public Nullable<decimal> MaxSalespersonCommissionPercentage { get; set; }
        public Nullable<decimal> DefalutBudgetMixPercentageGoogle { get; set; }
        public Nullable<decimal> DefalutBudgetMixPercentageBing { get; set; }
        public string DefaultSemplestBannerImageUrl { get; set; }
        public string DefaultSemplestStyleSheetUrl { get; set; }
        public Nullable<int> MaxNumberOfSitelinks { get; set; }
        public Nullable<int> LastAccountNumberUsed { get; set; }
        public Nullable<int> LastSEMplestEmployeeIDused { get; set; }
        public string DefaultEmailContactUs { get; set; }
        public string DefalutEmailContactMe { get; set; }
        public string DefaultProductGroupName { get; set; }
        public string DefaultProductPromotionName { get; set; }
        public string SamplestDevelopmentEmail { get; set; }
        public string SemplestDefaultBudgetMarkUpOrDown { get; set; }
    }
}
