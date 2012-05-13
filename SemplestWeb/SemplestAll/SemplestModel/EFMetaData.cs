﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using SemplestModel.Validations;

namespace SemplestModel
{
    [MetadataType(typeof(ConfigurationMetadata))]
    public partial class Configuration
    { }
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
    public partial class Role { }
    public class RoleMetaData
    {
        [HiddenInput(DisplayValue = false)]
        public int RolePK { get; set; }
        [DisplayName("Role Name:")]
        public string RoleName { get; set; }
    }

    [MetadataType(typeof(GeoTargetingMetaData))]
    public partial class GeoTargeting
    {
        public List<StateCode> StateCodes
        {
            get { return new SemplestEntities().StateCodes.OrderBy(t => t.StateAbbr).ToList(); }
        }
        public bool Delete { get; set; }
        internal sealed class GeoTargetingMetaData
        {
            public string Address { get; set; }
            public string City { get; set; }
            [TwoFieldRequiredAttribute("City", "StateCodeFK", ErrorMessage = "State Is Required..")]
            public int? StateCodeFK { get; set; }
            public string Zip { get; set; }
            [TwoFieldRequiredAttribute("Address", "ProximityRadius", ErrorMessage = "Proximity Is Required..")]
            public decimal? ProximityRadius { get; set; }
        }
    }
    public partial class SiteLink
    {
        public bool Delete { get; set; }
    }

    [MetadataType(typeof(SEMCustomerDetailMetaData))]
    public partial class SEMCustomerDetail
    {

    }

    [MetadataType(typeof(PromotionAdMetaData))]
    public partial class PromotionAd
    {
        internal sealed class PromotionAdMetaData
        {
            [Required]
            public string AdTitle { get; set; }
            [Required]
            public string AdTextLine1 { get; set; }
            public string AdTextLine2 { get; set; }

        }
        public bool Delete { get; set; }
    }

    public class SEMCustomerDetailMetaData
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Company { get; set; }

        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid Email Address")]
        [RegularExpression("^[a-z0-9_\\+-]+(\\.[a-z0-9_\\+-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*\\.([a-z]{2,4})$", ErrorMessage = "Invalid Email Address")]
        public string email { get; set; }
    }

}