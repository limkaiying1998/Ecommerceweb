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
    public partial class TaxCalculator : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.SelectedPage = "Admin";
            if (HttpContext.Current.Session["ISADMIN"] == null)
            {
                Response.Redirect("Default.aspx");

            }
            else
            {

                productstable.Visible = false;
                addproduct.Visible = false;
                editanddelete.Visible = false;

                if (!IsPostBack)
                {
                    rptProductsInfo.DataSource = GetProductsInfo();
                    rptProductsInfo.DataBind();
                }
            }
        }


        //Get products list from database
        private object GetProductsInfo()
        {
            DataTable dataTable = new DataTable();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            string query = "SELECT * FROM PRODUCTS";

            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            dataTable.Load(cmd.ExecuteReader());
            conn.Close();

            return dataTable;
        }

        protected void btnEditlink_Click(object sender, EventArgs e)
        {
            productstable.Visible = true;
            editanddelete.Visible = true;
        }


        protected void btnAddlink_Click(object sender, EventArgs e)
        {
            productstable.Visible = true;
            addproduct.Visible = true;
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                productstable.Visible = true;
                addproduct.Visible = true;

                if (fUpload.HasFile)
                {
                    string productname, productdesc, productprice;
                    productname = txtAddProductName.Text;
                    productdesc = txtAddProductDescription.Text;
                    productprice = txtAddProductPrice.Text;

                    //code taken from moodle
                    byte[] imagebytes = new byte[fUpload.PostedFile.InputStream.Length + 1];
                    fUpload.PostedFile.InputStream.Read(imagebytes, 0, imagebytes.Length);

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

                    string query = "INSERT INTO PRODUCTS (PRODUCTNAME,PRODUCTTYPE,PRODUCTDESC,PRODUCTPRICE,PRODUCTIMAGE) VALUES (@pname,@ptype,@pdesc,@pprice,@data)";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@pname", txtAddProductName.Text);
                    cmd.Parameters.AddWithValue("@ptype", fUpload.PostedFile.ContentType);
                    cmd.Parameters.AddWithValue("@pdesc", txtAddProductDescription.Text);
                    cmd.Parameters.AddWithValue("@pprice", txtAddProductPrice.Text);
                    cmd.Parameters.AddWithValue("@data", imagebytes);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    txtAddProductName.Text = string.Empty;
                    txtAddProductDescription.Text = string.Empty;
                    txtAddProductPrice.Text = string.Empty;

                    rptProductsInfo.DataSource = GetProductsInfo();
                    rptProductsInfo.DataBind();

                    lblSuccessMsg.Text = "Product has been updated";

                }
                else
                {
                    lblSuccessMsg.Text = "Please upload a file";
                }
            }
            catch (Exception){
                Response.Redirect("ErrorPage.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                productstable.Visible = true;
                editanddelete.Visible = true;

                //code taken from moodle
                byte[] imagebytes = new byte[fUpload1.PostedFile.InputStream.Length + 1];
                fUpload1.PostedFile.InputStream.Read(imagebytes, 0, imagebytes.Length);

                string productname, productdescription, productprice;
                int productID;

                productname = txtEditProductName.Text;
                productdescription = txtEditProductDescription.Text;
                productprice = txtEditProductPrice.Text;
                productID = int.Parse(lblProdID.Text);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);


                string query = "UPDATE PRODUCTS SET PRODUCTNAME = @pname, " +
                    "PRODUCTDESC = @pdesc, PRODUCTPRICE = @pprice, PRODUCTIMAGE = @data WHERE PRODUCTID = @pID ";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@pname", productname);
                cmd.Parameters.AddWithValue("@pdesc", productdescription);
                cmd.Parameters.AddWithValue("@pprice", productprice);
                cmd.Parameters.AddWithValue("@pID", productID);
                cmd.Parameters.AddWithValue("@data", imagebytes);

                conn.Open();

                cmd.ExecuteNonQuery();
                conn.Close();

                rptProductsInfo.DataSource = GetProductsInfo();
                rptProductsInfo.DataBind();

                txtEditProductName.Text = string.Empty;
                txtEditProductDescription.Text = string.Empty;
                txtEditProductPrice.Text = string.Empty;
                lblProdID.Text = string.Empty;

                lblUpdateMssg.Text = "Those changes have been saved";
            }
            catch (Exception)
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }

        protected void btnEditProduct_Command(object sender, CommandEventArgs e)
        {
            int prodID = int.Parse(e.CommandArgument.ToString());
            Display(prodID);
            productstable.Visible = true;
            editanddelete.Visible = true;
        }

        private void Display(int productID)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            string query = "SELECT * FROM PRODUCTS WHERE PRODUCTID = @prodID ";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@prodID", productID);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                txtEditProductName.Text = reader["ProductName"].ToString();
                txtEditProductDescription.Text = reader["ProductDesc"].ToString();
                txtEditProductPrice.Text = reader["ProductPrice"].ToString();
                lblProdID.Text = reader["ProductID"].ToString();
            }

            connection.Close();
        }

        protected void btnDeleteProduct_Command(object sender, CommandEventArgs e)
        {
            productstable.Visible = true;
            editanddelete.Visible = true;

            int prodID = int.Parse(e.CommandArgument.ToString());

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

            string query = "DELETE FROM PRODUCTS WHERE PRODUCTID = @ID";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ID", prodID);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            rptProductsInfo.DataSource = GetProductsInfo();
            rptProductsInfo.DataBind();

            
        }
    }
}