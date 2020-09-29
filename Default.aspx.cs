using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LimKaiYing
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogout.Visible = false;
            if (Session["USN"] != null)
            {
                lblLoggedUser.Text = $"Welcome Back {Session["USN"].ToString()}";
                btnLogout.Visible = true;
            }

            this.Master.SelectedPage = "Default";
            

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");

        }
    }
}