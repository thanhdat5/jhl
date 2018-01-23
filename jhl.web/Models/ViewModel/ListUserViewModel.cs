using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jhl.web.Models.ViewModel
{
    public class ListUserViewModel
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string PhotoImage { get; set; }
        public string Active { get; set; }
        public DateTime? Created { get; set; }
    }
}