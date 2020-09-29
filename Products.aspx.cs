using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LimKaiYing
{
    public partial class Products : System.Web.UI.Page
    {
        Cart cartmgr = new Cart();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USN"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                checkoutlabels.Visible = false;
                this.Master.SelectedPage = "Products";
                if (!IsPostBack)
                {
                    rptProductsInfo.DataSource = GetProductsInfo();
                    rptProductsInfo.DataBind();

                    lblProducts.Text = "No of items in basket " + cartmgr.GetNoOfProducts();
                    lblTotal.Text = "Total €" + cartmgr.GetAmountTotal();
                }
            }
        }

        private object GetProductsInfo()
        {
            DataTable dataTable = new DataTable();

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            string query = "SELECT * FROM PRODUCTS";

            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            dataTable.Load(cmd.ExecuteReader());
            conn.Close();

            return dataTable;
        }

        protected void btnAddCart_Command(object sender, CommandEventArgs e)
        {
            checkoutlabels.Visible = true;
            int ProductID;
            Product product = new Product();

            ProductID = Convert.ToInt32(e.CommandArgument.ToString());

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            string query = "SELECT * FROM PRODUCTS WHERE PRODUCTID = @pID";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@pID", ProductID);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                product.ProductID = Convert.ToInt32(reader["PRODUCTID"]);
                product.ProductName = reader["PRODUCTNAME"].ToString();
                product.ProductDescription = reader["PRODUCTDESC"].ToString();
                product.ProductPrice = Convert.ToDouble(reader["PRODUCTPRICE"]);
            }

            cartmgr.AddItem(product);

            lblProducts.Text = "No of items in basket " + cartmgr.GetNoOfProducts();
            lblTotal.Text = "Total €" + cartmgr.GetAmountTotal();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}