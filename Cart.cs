using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LimKaiYing
{
    public class Cart
    {
        public Cart()
        {

        }

        List<Product> products;

        public List<Product> GetSessionCart()
        {
            //get the items from the this sessions cart
            products = (List<Product>)HttpContext.Current.Session["Cart"];

            //Check to see if the list is empty or not
            if (products == null)
            {
                //Create a blank list / A new instance of the list. 
                products = new List<Product>();
            }
            return products;
        }

        public void SaveSessionCart()
        {
            HttpContext.Current.Session["Cart"] = products;
        }

        public void AddItem(Product product)
        {
            //Get the cart from the session 
            products = GetSessionCart();

            //Add the item to the list/Cart
            products.Add(product);

            //Update the session
            SaveSessionCart();

        }

        public int GetNoOfProducts()
        {
            int noOfProducts = 0;

            products = GetSessionCart();

            noOfProducts = products.Count();

            return noOfProducts;
        }

        public double GetAmountTotal()
        {
            double total = 0;

            products = GetSessionCart();

            foreach (var i in products)
            {
                total = total + i.ProductPrice;
            }

            return total;
        }
    }
}