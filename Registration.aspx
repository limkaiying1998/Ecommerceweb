<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LimKaiYing.Registration" %>
<%@ MasterType VirtualPath="~/Masterpage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="hero-image">
        
        <div class="hero-text">

            <h1>Tech Labs </h1>
            <p>
                Register with TechLabs today!
            </p>
            <br />
            
        </div>
    </div>
    <br />
    <br />
    <div class="log-form">
    <i class="fa fa-user"></i><asp:Label ID="lblUsername" runat="server" Text=" Username"></asp:Label><br />
    <asp:TextBox ID="txtUsername" CssClass="labeldecoration" MaxLength="50" required="required" runat="server"></asp:TextBox>
    <br />
    <i class='fas fa-key'></i><asp:Label ID="lblPassword" runat="server" Text=" Password"></asp:Label><br />
    <asp:TextBox ID="txtPassword" CssClass="labeldecoration" MaxLength="50" required="required" type="password" runat="server"></asp:TextBox>
    <br />
    <i class='fas fa-key'></i><asp:Label ID="lblCheckpass" runat="server" Text=" Please Re-Enter Password"></asp:Label><br />
    <asp:TextBox ID="txtCheckpass" CssClass="labeldecoration" MaxLength="50" required="required" type="password" runat="server"></asp:TextBox>
    <br />
    <i class="material-icons">&#xe0be;</i><asp:Label ID="lblEmail" runat="server" Text=" Email"></asp:Label><br />
    <asp:TextBox ID="txtEmail" CssClass="labeldecoration" MaxLength="100" type="email" required="required" runat="server"></asp:TextBox>
    <br />
    <i class='fas fa-address-book'></i><asp:Label ID="lblHouseadd" runat="server" Text=" House Address"></asp:Label><br />
    <asp:TextBox ID="txtHouseadd" CssClass="labeldecoration" MaxLength="250" required="required" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnRegister" CssClass="buttonstyling" runat="server" Text="Register" OnClick="btnRegister_Click" />
    
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
