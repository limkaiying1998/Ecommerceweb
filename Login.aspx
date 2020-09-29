<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LimKaiYing.Login" %>
<%@ MasterType VirtualPath="~/Masterpage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-image">
        
        <div class="hero-text">
                <div>
                    <img src="Images/profile-icon-png-898-300x300.png" /><br />
                </div>
            <h1>Tech Labs </h1>
            <p>
                Login with TechLabs to start shopping!
            </p>
            <br />    
            
        </div>

    </div>
    <br />
    <br />
    <div class="log-form">

    <i class="fa fa-user"></i><asp:Label ID="lblUsername" runat="server" Text=" Username"></asp:Label>
    <asp:TextBox ID="txtUsername" CssClass="labeldecoration" required="required" placeholder="Enter Username" runat="server"></asp:TextBox>
    <br />
    <i class='fas fa-key'></i><asp:Label ID="lblPassword" runat="server" Text=" Password"></asp:Label>
    <asp:TextBox ID="txtPassword" CssClass="labeldecoration" required="required" placeholder="Enter Password" type="password" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnLogin" CssClass="buttonstyling" runat="server" Text="Login" OnClick="btnLogin_Click" />
    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
        </div>

</asp:Content>
