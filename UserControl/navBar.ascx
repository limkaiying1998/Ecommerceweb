<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navBar.ascx.cs" Inherits="LimKaiYing.UserControl.navBar" %>

 <div class="navbar">
                    <br />
                    <br />
                      <sup class="logo">Tech Labs</sup>
                              <%
            if(SelectedPage.ToLower() == "Default".ToLower())
            {
                %>
                 <a href="Default.aspx" class="selected"><span>Home</span></a>
                <%
            }
            %>
            <%else
                {
                    %>
                        <a href ="Default.aspx">Home</a>
                    <%
                }
            %>

        
            <%
            if(SelectedPage.ToLower() == "Login".ToLower())
            {
                %>
                <a href="Login.aspx" class="selected"><span>Login</span></a>
                <%
            }
            %>
            <%else
                {
                    %>
                        <a href="Login.aspx">Login</a>
                    <%
                }
            %>
       <%
            if(SelectedPage.ToLower() == "Registration".ToLower())
            {
                %>
                <a href="Registration.aspx" class="selected"><span>Registration</span></a>
                <%
            }
            %>
            <%else
                {
                    %>
                        <a href="Registration.aspx">Registration</a>
                    <%
                }
            %>

      <%
            if(SelectedPage.ToLower() == "Products".ToLower())
            {
                %>
                <a href="Products.aspx" class="selected"><span>Products</span></a>
                <%
            }
            %>
            <%else
                {
                    %>
                        <a href="Products.aspx">Products</a>
                    <%
                }
            %>

       <%
            if(SelectedPage.ToLower() == "Admin".ToLower())
            {
                %>
                <a href="Admin.aspx" class="selected"><span>Admin</span></a>
                <%
            }
            %>
            <%else
                {
                    %>
                        <a href="Admin.aspx">Admin</a>
                    <%
                }
            %>


             <%
            if(SelectedPage.ToLower() == "Contact Us".ToLower())
            {
                %>
               <a href="Default.aspx#footer" class="selected">Contact Us</a>
                <%
            }
        %>
        <%else
            {
                %>
                    <a href="Default.aspx#footer">Contact Us</a>
                <%
            }

        %>



    
                </div>

