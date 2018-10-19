<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageDiscountCoupon.aspx.cs" Inherits="ManageDiscountCoupon" %>

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

        .text {
            color: black;
        }

        .center {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        .auto-style1 {
            width: 1065px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div class="text" style="text-align: center">
        <h3>Manage Discount Coupon</h3>
    </div>
    <div class="auto-style1">
        <asp:GridView ID="gvDiscount" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" OnRowDeleting="gvDiscount_RowDeleting" OnRowEditing="gvDiscount_RowEditing" OnRowUpdating="gvDiscount_RowUpdating" OnRowCancelingEdit="gvDiscount_RowCancelingEdit" Width="1062px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Coupon Code">
                    <EditItemTemplate>
                        <asp:Label ID="lblCode" runat="server" Text='<%# Eval("couponCode") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCouponCode" runat="server" Text='<%# Bind("couponCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxDesc" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Percentage">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxPersen" runat="server" Text='<%# Bind("percentage") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("percentage") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxAMT" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("amount", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxSd" runat="server" Text='<%# Bind("startDate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("startDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEd" runat="server" Text='<%# Bind("endDate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("endDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>

    <form action="/action_page.php">
        <div class="container">
            <h1 style="text-align: center">Add Discount Coupon</h1>
            <p style="text-align: center">Please fill in this form to add a Discount Coupon.</p>
            <hr>

            <label for="cC"><b>Coupon Code</b></label>
            <asp:TextBox ID="tbxCc" runat="server" placeholder="DC1, DC2, etc..."></asp:TextBox>

            <label for="sD"><b>Name</b></label>
            <asp:TextBox ID="tbxName" runat="server"></asp:TextBox>

            <label for="eD"><b>Description</b></label>
            <asp:TextBox ID="tbxDesc" runat="server"></asp:TextBox>

            <label for="sT"><b>Percentage</b></label>
            <asp:TextBox ID="tbxPercentage" runat="server" placeholder="0.20, 0.15, etc..."></asp:TextBox>

            <label for="eT"><b>Amount</b></label>
            <asp:TextBox ID="tbxAMT" runat="server" placeholder="0.20, 0.15, etc..."></asp:TextBox>

            <label for="country"><b>Start Date</b></label>
            <asp:TextBox ID="tbxSd" runat="server" TextMode="Date"></asp:TextBox>

            <label for="em"><b>End Date</b></label>
            <asp:TextBox ID="tbxEd" runat="server" TextMode="Date"></asp:TextBox>

            <br />

            <br />
            <div style="text-align: center">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" Width="285px" ForeColor="White" BackColor="#009688" Font-Bold="True" Font-Size="Large" Height="48px" />
                <br />
                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>

