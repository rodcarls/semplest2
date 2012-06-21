//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class KeywordBid
    {
        public KeywordBid()
        {
            this.AdvertisingEngineReportDatas = new HashSet<AdvertisingEngineReportData>();
            this.KeywordBidDatas = new HashSet<KeywordBidData>();
            this.TrafficEstimators = new HashSet<TrafficEstimator>();
        }
    
        public int KeywordBidPK { get; set; }
        public int KeywordFK { get; set; }
        public int AdvertisingEngineFK { get; set; }
        public int PromotionFK { get; set; }
        public System.DateTime StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public bool IsActive { get; set; }
        public int BidTypeFK { get; set; }
        public int MicroBidAmount { get; set; }
        public Nullable<long> KeywordAdEngineID { get; set; }
        public string CompetitionType { get; set; }
        public bool IsDefaultValue { get; set; }
        public System.DateTime CreatedDate { get; set; }
    
        public virtual AdvertisingEngine AdvertisingEngine { get; set; }
        public virtual ICollection<AdvertisingEngineReportData> AdvertisingEngineReportDatas { get; set; }
        public virtual BidType BidType { get; set; }
        public virtual ICollection<KeywordBidData> KeywordBidDatas { get; set; }
        public virtual ICollection<TrafficEstimator> TrafficEstimators { get; set; }
        public virtual PromotionKeywordAssociation PromotionKeywordAssociation { get; set; }
    }
}