//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Collections.Generic;

namespace Semplest.Core.Models
{
    public class Frequency
    {
        public Frequency()
        {
            Schedules = new HashSet<Schedule>();
        }

        public int FrequencyPK { get; set; }
        public string Frequency1 { get; set; }

        public virtual ICollection<Schedule> Schedules { get; set; }
    }
}