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
    
    public partial class SchedulerView
    {
        public string CustomerName { get; set; }
        public string PromotionName { get; set; }
        public string ScheduleName { get; set; }
        public int SchedulePK { get; set; }
        public string Frequency { get; set; }
        public System.DateTime ExecutionStartTime { get; set; }
        public bool IsComplete { get; set; }
        public bool IsSuccessful { get; set; }
        public bool IsEnabled { get; set; }
        public bool IsInactive { get; set; }
        public int ScheduleJobPK { get; set; }
    }
}