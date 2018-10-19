<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="style/loginform.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <body id="LoginForm">
        <div class="container">
            <h1 class="form-heading">login Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <br />
                        <br />
                        <br />
                        <h2>Admin Login</h2>
                        <p>Please enter your email and password</p>
                    </div>
                    <form id="Login">

                        <div class="form-group">
                            <asp:TextBox ID="tbxEmail" class="form-control" placeholder="Enter Email Address" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email cannot be blank" ControlToValidate="tbxEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="tbxPassword" class="form-control" type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxPassword" ErrorMessage="Password cannot be blank"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnLogin" class="btn btn-primary" ForeColor="White" BackColor="#009688" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <br />
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

