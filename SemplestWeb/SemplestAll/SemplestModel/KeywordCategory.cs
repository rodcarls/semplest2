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
    
    public partial class KeywordCategory
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int KeywordCategoryPK { get; set; }
        
        public int PromotionFK { get; set; }
        
        public string KeywordCategory1 { get; set; }

        [ForeignKey("PromotionFK")]
        public virtual Promotion Promotion { get; set; }
    }
    
}
