<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="LimKaiYing.Products" %>
<%@ MasterType VirtualPath="~/Masterpage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
        <div id="checkoutlabels" runat="server">
                <asp:Label runat="server" CssClass="labeldecoration" ID="lblProducts"></asp:Label>
                <asp:Label runat="server" CssClass="labeldecoration" ID="lblTotal"></asp:Label>
            <asp:Button ID="btnCheckout" CssClass="buttonstyling" Text="Checkout" OnClick="btnCheckout_Click" runat="server" />
            </div>
    <br />
    <div id="productstable" runat="server">
     <table id="productsinfo">
        <thead>
            <%--Column titles--%>
            <tr>
                <th>Product ID</th>
                <th>Product Name </th>
                <th>Product Description</th>
                <th>Product Price</th>
                <th>Product Image</th>
                <th>Add To Cart</th>
            </tr>
        </thead>
        <tbody>
            

            <%--Create a repeater to output the informatin gotten from the Database--%>
                <asp:Repeater ID="rptProductsInfo" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("PRODUCTID") %> </td>
                        <td><%# Eval("PRODUCTNAME") %> </td>
                        <td><%# Eval("PRODUCTDESC") %> </td>
                        <td><%#  (string.Format("{0:C}",Eval("PRODUCTPRICE").ToString())) %> </td>
                        <td><img src='data:image/jpg;base64,<%# Eval("PRODUCTIMAGE") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("PRODUCTIMAGE")): string.Empty%> ' alt="image" /> </td>
                        <td>
                            <asp:Button ID="btnAddCart" CssClass="buttonstyling" runat="server" CommandArgument='<%#Eval ("PRODUCTID") %>' OnCommand="btnAddCart_Command" Text="Add To Cart" CommandName="Add To Cart"/>
                    </td>
                            
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            
        </tbody>
    </table>
        </div>
</asp:Content>
