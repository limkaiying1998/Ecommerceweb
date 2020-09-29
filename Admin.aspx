<%@ Page Title="" Language="C#" MasterPageFile="~/MasterpageAdmin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="LimKaiYing.TaxCalculator" %>
<%@ MasterType VirtualPath="~/MasterpageAdmin.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin</title>


     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="hero-image">
          <div class="hero-text">
            <h1>Welcome Back Admin</h1>
            <p>Tech Labs<br />
                You have access to additional functions as the admin of Tech Labs</p>
              <br />

              <asp:button ID="btnEditlink" CssClass="buttonstyling" OnClick="btnEditlink_Click" runat="server" Text="Edit & Delete Products" />
              <asp:button ID="btnAddlink" CssClass="buttonstyling" OnClick="btnAddlink_Click" runat="server" Text="Add New Product" />
          </div>
    </div>
    <br />
    <br />
        
     <div id="addproduct" runat="server">
    <h1>Add New Product</h1>

        <asp:Label ID="lblAddProductName" runat="server" Text="Product Name" AssociatedControlID="txtAddProductName"></asp:Label>
         <br />
        <asp:TextBox ID="txtAddProductName" CssClass="labeldecoration"  MaxLength="100" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAddProductName" runat="server" ControlToValidate="txtAddProductName" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblAddProductDescription" runat="server" Text="Product Description" AssociatedControlID="txtAddProductDescription"></asp:Label>
         <br />
        <asp:TextBox ID="txtAddProductDescription" CssClass="labeldecoration" MaxLength="500" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAddProductDescription" runat="server" ControlToValidate="txtAddProductDescription" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblAddProductPrice" runat="server" Text="Product Price" AssociatedControlID="txtAddProductPrice"></asp:Label>
         <br />
        <asp:TextBox ID="txtAddProductPrice" CssClass="labeldecoration" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAddProductPrice" runat="server" ControlToValidate="txtAddProductPrice" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
         <asp:Label runat="server" Text="File Upload" ID="lblUpload"></asp:Label>
         <asp:FileUpload ID="fUpload" runat="server" />
         <br />

    <asp:Button ID="btnAddProduct" CssClass="buttonstyling" runat="server" Text="Add New Product" OnClick="btnAddProduct_Click" CausesValidation="true" ValidationGroup="Required" />
    <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
    </div>
    <br />
    <br />
    <div id="editanddelete" runat="server">
    <h1>Edit and Delete</h1>
        <asp:Label ID="lblProdCode" runat="server" Text="Product ID"></asp:Label>
        <asp:Label ID="lblProdID" runat="server" Text=""  ></asp:Label> 
        <br />
        <asp:Label ID="lblEditProductName" runat="server" Text="Product Name" AssociatedControlID="txtEditProductName"></asp:Label>
        <br />
        <asp:TextBox ID="txtEditProductName" CssClass="labeldecoration"  MaxLength="100" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEditProductName" runat="server" ControlToValidate="txtEditProductName" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblEditProductDescription" runat="server" Text="Product Description" AssociatedControlID="txtEditProductDescription"></asp:Label>
        <br />
        <asp:TextBox ID="txtEditProductDescription" CssClass="labeldecoration" MaxLength="500" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEditProductDescription" runat="server" ControlToValidate="txtEditProductDescription" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblEditProductPrice" runat="server" Text="Product Price" AssociatedControlID="txtEditProductPrice"></asp:Label>
        <br />
        <asp:TextBox ID="txtEditProductPrice" CssClass="labeldecoration" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEditProductPrice" runat="server" ControlToValidate="txtEditProductPrice" ValidationGroup="Required" Text="Must contain a value"></asp:RequiredFieldValidator>
        <br />
         <asp:Label runat="server" Text="File Upload" ID="lblUpload1"></asp:Label>
         <asp:FileUpload ID="fUpload1" runat="server" />
         <br />

    <asp:Button ID="btnUpdate" CssClass="buttonstyling" runat="server" Text="Update Product" onclick="btnUpdate_Click" CausesValidation="true" ValidationGroup="Required" />
    <asp:Label ID="lblUpdateMssg" runat="server"></asp:Label>
    </div>
    <br />
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
                <th>Edit</th>
                <th>Delete</th>
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
                        <td><%# Eval("PRODUCTPRICE") %> </td>
                        <td><img src='data:image/jpg;base64,<%# Eval("PRODUCTIMAGE") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("PRODUCTIMAGE")): string.Empty%> ' alt="image" /> </td>
                        <td>
                            <asp:Button ID="btnEditProduct" CssClass="buttonstyling" runat="server" CommandArgument='<%#Eval ("PRODUCTID") %>' oncommand="btnEditProduct_Command" Text="Edit" CommandName="Edit"/>
                    </td>
                        <td><asp:Button ID="btnDeleteProduct" CssClass="buttonstyling" runat="server" CommandArgument='<%#Eval ("PRODUCTID") %>' Text="Delete" OnClientClick="return confirm('Are you sure?')" OnCommand="btnDeleteProduct_Command" CommandName="Delete" /></td>
                            
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
        </div>
    <br />
    <br />
    <br />

 
    
    
</asp:Content>
