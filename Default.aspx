<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LimKaiYing.Test" %>

<%@ MasterType VirtualPath="~/Masterpage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Homepage</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="hero-image">
        
        <div class="hero-text">
                <div>
                    <img src="Images/profile-icon-png-898-300x300.png" /><br /><asp:Label ID="lblLoggedUser" runat="server" Text=""></asp:Label>
                </div>
            <h1>Tech Labs </h1>
            <p>
                Buy your phones with Tech Labs<br />
                Login/Register to shop today
            </p>
            <br />

            <a href="Login.aspx" target="_blank" class="button">Login</a>
            <a href="Registration.aspx" target="_blank" class="button">Register</a>
            <br />
            <br />
      <asp:Button ID="btnLogout" CssClass="buttonstyle" runat="server" Text="Logout" OnClick="btnLogout_Click"/>     
            
        </div>

    </div>
    <br />
    <br />
    
    <div class="format">
        <h2>About Us</h2>
        <p>TechLabs has been aiming to provide the best online deals for mobile devices from companies such as Samsung, Apple, Huawei and many more.
            Phones get better and more feature-rich by the day – but picking a model and a tariff to go with it has never been more difficult. And that's where TechLabs come in.
            Our goal at TechLabs is to become a beloved brand, offering not only the best services to our customers but also quality. We strive to become an innovative company for all our consumers.

        </p>
    </div>

    <br />
    <br />
    <p>Introducing The Latest 2019 Smartphone Available On Tech Labs</p>
    <div class="youtubevid1">
        <iframe width="420" height="315" src="https://www.youtube.com/embed/ZCfgkIyD9g0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    <div class="youtubevid2">
        <iframe width="420" height="315" src="https://www.youtube.com/embed/NfxwablloIw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    
 

</asp:Content>
