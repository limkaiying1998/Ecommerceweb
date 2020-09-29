using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LimKaiYing
{
    public partial class Login : System.Web.UI.Page
    {
        bool isAdmin;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.SelectedPage = "Login";

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool LoggedIn = false;

            string username = string.Empty;
            string password = string.Empty;

            LoggedIn = Validation(username, password);

            if (IsPostBack)
            {
                //Get the username and password from the text boxes
                username = txtUsername.Text;
                password = txtPassword.Text;

                //Check to see if there is a valid Login
                LoggedIn = Validation(username, password);


                if (LoggedIn)
                {
                    if (isAdmin)
                    {
                        Session.Add("USN", username);
                        Session.Add("ISADMIN", isAdmin);
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Session.Add("USN", username);
                        Response.Redirect("Default.aspx");
                    }

                }
                else
                {
                    lblSuccess.Text = "Incorrect Login Please try again";
                }
            }
        }

        private bool Validation(string username, string password)
        {
            SqlDataReader dr;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            string query = "SELECT * FROM USERS WHERE " + "USN = @username AND PWD = @password";

            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@password", password);

            conn.Open();

            dr = command.ExecuteReader();

            if (dr.Read())
            {
                isAdmin = (Boolean)dr[5];
            }
            else
            {
                conn.Close();
                return false;
            }

            conn.Close();

            return true;
        }
    }
    
}