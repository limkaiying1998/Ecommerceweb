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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.SelectedPage = "Registration";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool usercheck;
            string username, password, email, houseadd, passcheck;

            username = txtUsername.Text;
            password = txtPassword.Text;
            email = txtEmail.Text;
            houseadd = txtHouseadd.Text;
            passcheck = txtCheckpass.Text;

            if (password == passcheck)
            {
                usercheck = userexistance(username);

                if (usercheck)
                {
                    lblMessage.Text = "Username has been taken already please choose another one";
                }
                else
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

                    string query = "INSERT INTO USERS(USN, PWD, EMAIL, HOUSEADD,ISADMIN) VALUES (@username, @password, @email, @houseadd,@isadmin);";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@houseadd", txtHouseadd.Text);
                    cmd.Parameters.AddWithValue("@isadmin", 0);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblMessage.Text = "Your account has successfully been created! Please proceed to Login page";
                }
            }
            else
            {
                lblMessage.Text = "Passwords do not match, please re-enter";
            }
        }



        private bool userexistance(string username)
        {
            int rowcount = 0;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            //Create my query
            string query = "SELECT COUNT(*) FROM USERS WHERE USN = @username";

            //Create the command and populate the input parameters
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@username", username);

            conn.Open();

            //Run the query. This is a count Query so we need to use ExecuteScalar. 
            rowcount = (int)command.ExecuteScalar();

            //Close the connection 
            conn.Close();

            //return the result
            return (rowcount == 1); ;
        }
    }
}
