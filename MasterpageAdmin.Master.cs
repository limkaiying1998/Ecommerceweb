using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LimKaiYing
{
    public partial class MasterpageAdmin : System.Web.UI.MasterPage
    {
        public string SelectedPage { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            navBar.SelectedPage = SelectedPage;
        }
    }
}