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
    
    public partial class PromotionPayment
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int PromotionPaymentPK { get; set; }
        
        public Nullable<int> PromotionFK { get; set; }
        
        public System.DateTime BudgetToAddDate { get; set; }
        
        public bool IsValid { get; set; }
        
        public System.DateTime CreatedDate { get; set; }
        
        public Nullable<int> CreditCardTransactionFK { get; set; }

        [ForeignKey("CreditCardTransactionFK")]
        public virtual CreditCardTransaction CreditCardTransaction { get; set; }
        [ForeignKey("PromotionFK")]
        public virtual Promotion Promotion { get; set; }
    }
    
}
