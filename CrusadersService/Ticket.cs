//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrusadersService
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ticket
    {
        public int id { get; set; }
        public string Price { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public Nullable<int> Game_id { get; set; }
    
        public virtual Games1 Games1 { get; set; }
    }
}