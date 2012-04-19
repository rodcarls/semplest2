﻿using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;



namespace Semplest.Admin.Models
{
    [MetadataType(typeof(ConfigurationMetadata))]
    public partial class Configuration
    {}
    public class ConfigurationMetadata
    {
        [DisplayName("Minimum Order Amount:")]
        public decimal CustomerMinOrderAmount { get; set; }
        [DisplayName("Default SEMplest Monthly Flat Fee:")]
        public decimal CustomerDefaultMonthlyFlatFeeAmount { get; set; }
        [DisplayName("Default SEMplest Per Campaign Flat Fee:")]
        public decimal CustomerDefaultPerCampaignFlatFeeAmount { get; set; }
        [DisplayName("Default Per Ad Group Flat Fee:")]
        public decimal CustomerDefaultPerAdGroupFlatFeeAmount { get; set; }
        [DisplayName("Default SEMplest Media Commission:")]
        public decimal DefaultMediaComissionPercentage { get; set; }
        [DisplayName("Default Salesperson Commission Percetnage:")]
        public decimal DefaultSalesPersonCommissionPercentage { get; set; }
        [DisplayName("Min Salesperson Commission Percentage:")]
        public decimal MinSalespersonCommissionPercentage { get; set; }
        [DisplayName("Max Salesperson Commission Percentage:")]
        public Nullable<decimal> MaxSalespersonCommissionPercentage { get; set; }
        [DisplayName("Default Budget Mix:")]
        public Nullable<decimal> DefalutBudgetMixPercentageGoogle { get; set; }
        [DisplayName("Default Budget Mix:")]
        public Nullable<decimal> DefalutBudgetMixPercentageBing { get; set; }
        [DisplayName("SEMplese Banner Image:")]
        public string DefaultSemplestBannerImageUrl { get; set; }
        [DisplayName("SEMplest Style Sheet:")]
        public string DefaultSemplestStyleSheetUrl { get; set; }
        [DisplayName("Maximum # of sitelinks:")]
        public Nullable<int> MaxNumberOfSitelinks { get; set; }
        [DisplayName("Last account number used:")]
        public Nullable<int> LastAccountNumberUsed { get; set; }
        [DisplayName("Last SEMplest Emplyee ID used:")]
        public Nullable<int> LastSEMplestEmployeeIDused { get; set; }
        public string DefaultEmailContactUs { get; set; }
        public string DefalutEmailContactMe { get; set; }
        [DisplayName("Default Product Group Name:")]
        public string DefaultProductGroupName { get; set; }
        [DisplayName("Default Product/Promotion Name:")]
        public string DefaultProductPromotionName { get; set; }
        public string SamplestDevelopmentEmail { get; set; }
        public string SemplestDefaultBudgetMarkUpOrDown { get; set; }
    }


    [MetadataType(typeof(RoleMetaData))]
    public partial class Role{}
        public class RoleMetaData
        {
            [HiddenInput(DisplayValue=false)]
            public int RolePK { get; set; }
            [DisplayName("Role Name:")]
            public string RoleName { get; set; }
        }

}

