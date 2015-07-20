using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CrusadersService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class CrusadersService : ICrusadersService
    {
        static CrusadersEntities db = new CrusadersEntities();



        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }


        public List<Ticket> GetAllTickets()
        {
            return db.Tickets.ToList();
        }

        public Ticket GetTicket(int id)
        {
            return db.Tickets.Find(id);
        }

        public void CreateTicket(Ticket ticket)
        {
            db.Tickets.Add(ticket);
            db.SaveChanges();
        }

        public void UpdateTicket(int id, Ticket ticket)
        {
            Ticket updatedTicket = db.Tickets.Find(id);
            updatedTicket.Description = ticket.Description;
            updatedTicket.Game_id = ticket.Game_id;
            updatedTicket.Price = ticket.Price;
            updatedTicket.Type = ticket.Type;
            db.SaveChanges();
        }
    }
}
