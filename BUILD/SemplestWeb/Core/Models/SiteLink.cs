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
    
    public partial class SiteLink
    {
        public int SiteLInkPK { get; set; }
        public int PromotionAdsFK { get; set; }
        public string LinkText { get; set; }
        public string LinkURL { get; set; }
    
        public virtual PromotionAd PromotionAd { get; set; }
    }
}
