<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ARdetails.aspx.cs" Inherits="ARdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: white;
        }

        * {
            box-sizing: border-box;
        }

        /* Add padding to containers */
        .container {
            padding: 16px;
            background-color: white;
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Set a style for the submit button */
        .registerbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

            .registerbtn:hover {
                opacity: 1;
            }

        /* Add a blue text color to links */
        a {
            color: dodgerblue;
        }

        /* Set a grey background color and center the text of the "sign in" section */
        .signin {
            background-color: #f1f1f1;
            text-align: center;
        }

        .center {
            width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style1 {
            width: 905px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form action="/action_page.php">
        <div class="container">
            <h1>Restaurant Details</h1>
            <hr>

            <asp:Image ID="imgRestaurant" Width="350px" Height="250px" runat="server" />
            <br />

            <label for="RestaurantName"><b>Restaurant Name</b></label>
            <asp:TextBox ID="tbxRestaurantName" runat="server"></asp:TextBox>

            <label for="sD"><b>Registration Details</b></label>
            <asp:TextBox ID="tbxRegID" runat="server"></asp:TextBox>

            <label for="eD"><b>Address</b></label>
            <asp:TextBox ID="tbxAddress" runat="server"></asp:TextBox>

            <label for="sT"><b>Postal Code</b></label>
            <asp:TextBox ID="tbxPcode" runat="server"></asp:TextBox>

            <label for="eT"><b>City</b></label>
            <asp:TextBox ID="tbxCity" runat="server"></asp:TextBox>

            <label for="country"><b>Country</b></label>
            <asp:TextBox ID="tbxCountry" runat="server"></asp:TextBox>

            <label for="em"><b>Email</b></label>
            <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>

            <label for="pw"><b>Password</b></label>
            <asp:TextBox ID="tbxPassword" runat="server"></asp:TextBox>

            <label for="cNo"><b>Contact Number</b></label>
            <asp:TextBox ID="tbxContact" runat="server"></asp:TextBox>

            <label for="dc"><b>Description</b></label>
            <asp:TextBox ID="tbxDesc" runat="server"></asp:TextBox>

            <label for="sr"><b>Star Rating</b></label>
            <asp:TextBox ID="tbxSrating" runat="server"></asp:TextBox>

            <label for="sr"><b>License</b></label>
            <asp:TextBox ID="tbxLicense" runat="server"></asp:TextBox>

            <label for="oh"><b>Opening Hours</b></label>
            <asp:TextBox ID="tbxHours" runat="server"></asp:TextBox>

            <asp:Button ID="btnAccept" ForeColor="White" BackColor="#009688" runat="server" Text="Accept" OnClick="btnAccept_Click" />
            <asp:Button ID="btnDelete" ForeColor="White" BackColor="#009688" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
        </div>
    </form>
    <h2 style="text-align: center">Menu Item Details</h2>
    <div class="auto-style1">
        <asp:GridView ID="gvMenu" runat="server" CellPadding="4" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" Width="901px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="menuItemID" HeaderText="Menu Item ID" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" />
                <asp:BoundField DataField="description" HeaderText="Description" ReadOnly="True" />
                <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>

