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
    
    public partial class Game
    {
        public Game()
        {
            this.Tickets = new HashSet<Ticket>();
            this.Players = new HashSet<Player>();
        }
    
        public int id { get; set; }
        public string Opponent { get; set; }
        public string Venue { get; set; }
        public string Comp { get; set; }
        public string Data { get; set; }
        public string Image { get; set; }
        public Nullable<int> Result_id { get; set; }
    
        public virtual ICollection<Ticket> Tickets { get; set; }
        public virtual GameResult GamesResult { get; set; }
        public virtual ICollection<Player> Players { get; set; }
    }
}
