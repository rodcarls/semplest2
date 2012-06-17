//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;


namespace SemplestModel
{
    
    public partial class PromotionKeywordAssociation
    {
        public PromotionKeywordAssociation()
        {
            this.KeywordBids = new HashSet<KeywordBid>();
        }

        [System.ComponentModel.DataAnnotations.Key,Column(Order = 1)]
        public int KeywordFK { get; set; }
        [System.ComponentModel.DataAnnotations.Key,Column(Order = 2)]
        public int PromotionFK { get; set; }
        
        public System.DateTime CreatedDate { get; set; }
        
        public bool IsActive { get; set; }
        
        public bool IsDeleted { get; set; }
        
        public bool IsNegative { get; set; }
        
        public Nullable<double> SemplestProbability { get; set; }
        
        public bool IsTargetMSN { get; set; }
        
        public bool IsTargetGoogle { get; set; }

        [ForeignKey("KeywordFK")]
        public virtual Keyword Keyword { get; set; }
        
        public virtual ICollection<KeywordBid> KeywordBids { get; set; }
        [ForeignKey("PromotionFK")]
        public virtual Promotion Promotion { get; set; }
    }
    
}
