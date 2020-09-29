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
    public partial class Checkout : System.Web.UI.Page
    {

        Cart cartmgr = new Cart();
        Product product = new Product();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (cartmgr.GetSessionCart().Count == 0)
            {
                Response.Redirect("Products.aspx");
            }
            else
            {
                if (HttpContext.Current.Session["USN"] == null)
                {
                    Response.Redirect("Default.aspx");

                }
                else
                {


                    ShowCart();

                }
            }
        }

        private void ShowCart()
        {
            rptShoppingCart.DataSource = cartmgr.GetSessionCart();
            rptShoppingCart.DataBind();
            lblTotal.Text = "€" + cartmgr.GetAmountTotal().ToString();
        }

        
    }
}