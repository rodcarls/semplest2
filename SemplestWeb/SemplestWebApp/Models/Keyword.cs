//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Keyword
    {
        public Keyword()
        {
            this.AdGroupKeywordAssociations = new HashSet<AdGroupKeywordAssociation>();
        }
    
        public int KeywordPK { get; set; }
        public string Keyword1 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string EditedDate { get; set; }
    
        public virtual ICollection<AdGroupKeywordAssociation> AdGroupKeywordAssociations { get; set; }
    }
}
