<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="LimKaiYing.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="StyleSheet.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <img src="Images/bannertechlab.png" />
    <br />
    <br />
     <p>Your shopping cart</p>
            <div id="carttable">
    <table id="cartinfo">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptShoppingCart" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("PRODUCTID") %></td>
                        <td><%# Eval("PRODUCTNAME") %></td>
                        <td><%# (string.Format("{0:C}","€" + Eval("PRODUCTPRICE").ToString()))%></td>
                        
                </ItemTemplate>
            </asp:Repeater>

           
        </tbody>
    </table>
                </div>

                <br />
                <div id="totallabel">
                <h1>Total</h1>
                <br />
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </div>
        <h2>Your item has been shipped successfully</h2>
        <a href="Default.aspx">Return to Homepage</a>

    </form>
</body>
</html>
