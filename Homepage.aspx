<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title></title>

    <!-- Bootstrap core CSS -->
    <link href="style/bootstrap.min.css" rel="stylesheet" />
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <style>
        @-ms-viewport {
            width: device-width;
        }

        @-o-viewport {
            width: device-width;
        }

        @viewport {
            width: device-width;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="style/dashboard.css" rel="stylesheet" />
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li>
                        <asp:LinkButton ID="btnShowCust" runat="server" Text="Show Customer List" OnClick="btnShowCust_Click" /></li>
                    <li>
                        <asp:LinkButton ID="btnAttraction" runat="server" Text="Show Attraction" OnClick="btnAttraction_Click" /></li>
                    <li>
                        <asp:LinkButton ID="btnHotel" runat="server" Text="Show Hotel" OnClick="btnHotel_Click" /></li>
                    <li>
                        <asp:LinkButton ID="btnRestaurant" runat="server" Text="Show Restaurant" OnClick="btnRestaurant_Click" /></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li>
                        <asp:LinkButton ID="btnDiscount" runat="server" OnClick="btnDiscount_Click">Manage Discount Coupon</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="btnReview" runat="server" OnClick="btnReview_Click">Manage Review</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="btnDividend" runat="server" OnClick="btnDividend_Click">Manage Dividend</asp:LinkButton></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Dashboard</h1>
                <br />
                <br />
                <div class="row placeholders">
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <asp:Label ID="lblCust" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                        <h4>Customers</h4>
                        <span class="text-muted">Our Customers</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <asp:Label ID="lblAttraction" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                        <h4>Attraction Owner</h4>
                        <span class="text-muted">Our Client for Attraction Owner</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <asp:Label ID="lblHotel" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                        <h4>Hotel Owner</h4>
                        <span class="text-muted">Our Client for Hotel Owner</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <asp:Label ID="lblRestaurant" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                        <h4>Restaurant Owner</h4>
                        <span class="text-muted">Our Client for Restaurant Owner</span>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <asp:Panel ID="pnlCustomer" runat="server">
                                <h2>Customer Details</h2>
                                <asp:TextBox ID="tbxSearch" runat="server" placeholder="Filter Customer Name"></asp:TextBox>
                                <asp:Button ID="btnSearch" ForeColor="White" BackColor="#009688" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
                                <asp:GridView ID="gvCustomer" runat="server" CellPadding="4" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnRowCommand="gvCustomer_RowCommand" OnRowDeleting="gvCustomer_RowDeleting">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Email">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("CustEmail") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustEmail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                                        <asp:BoundField DataField="PersonalID" HeaderText="PersonalID" ReadOnly="True" />
                                        <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" ReadOnly="True" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" />
                                        <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" ReadOnly="True" />
                                        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" ReadOnly="True" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" />
                                        <asp:BoundField DataField="Nationality" HeaderText="Nationality" ReadOnly="True" />
                                        <asp:BoundField DataField="accStatus" HeaderText="Status" ReadOnly="True" />
                                        <asp:CommandField ShowDeleteButton="True">
                                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:CommandField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("CustEmail") %>' CommandName="Booking" Font-Underline="True">View Booking Details</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
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
                            </asp:Panel>
                            <asp:SqlDataSource ID="sqlCust" runat="server" ConnectionString="Data Source=DESKTOP-U2MG32U;Initial Catalog=SmartTravelDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [custEmail], [name], [personalID], [dateOfBirth], [postalCode], [address], [gender], [phoneNumber], [password], [accStatus], [nationality] FROM [Customer] WHERE ([name] LIKE '%' + @name + '%')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="tbxSearch" Name="name" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tr>
                        <tr>
                            <asp:Panel ID="pnlAttraction" runat="server">
                                <h2>Show Attraction</h2>
                                <asp:GridView ID="gvAttraction" runat="server" CellPadding="4" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvAttraction_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="orgEmail" HeaderText="Organization Email" ReadOnly="True" />
                                        <asp:BoundField DataField="name" HeaderText="Attraction Name" ReadOnly="True" />
                                        <asp:BoundField DataField="regID" HeaderText="Registration ID" ReadOnly="True" />
                                        <asp:BoundField DataField="city" HeaderText="City" ReadOnly="True" />
                                        <asp:BoundField DataField="country" HeaderText="Country" ReadOnly="True" />
                                        <asp:BoundField DataField="contactNo" HeaderText="Contact No" ReadOnly="True" />
                                        <asp:BoundField DataField="starRating" HeaderText="Star Rating" ReadOnly="True" />
                                        <asp:BoundField DataField="openingHours" HeaderText="Opening Hours" ReadOnly="True" />
                                        <asp:BoundField DataField="verification" HeaderText="Verification" ReadOnly="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDetails" ForeColor="White" BackColor="#009688" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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


                            </asp:Panel>
                        </tr>
                        <tr>
                            <asp:Panel ID="pnlHotel" runat="server">
                                <h2>Show Hotel</h2>
                                <asp:GridView ID="gvHotel" runat="server" CellPadding="4" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvHotel_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="orgEmail" HeaderText="Organization Email" ReadOnly="True" />
                                        <asp:BoundField DataField="name" HeaderText="Hotel Name" ReadOnly="True" />
                                        <asp:BoundField DataField="regID" HeaderText="Registration ID" ReadOnly="True" />
                                        <asp:BoundField DataField="city" HeaderText="City" ReadOnly="True" />
                                        <asp:BoundField DataField="country" HeaderText="Country" ReadOnly="True" />
                                        <asp:BoundField DataField="contactNo" HeaderText="Contact No" ReadOnly="True" />
                                        <asp:BoundField DataField="starRating" HeaderText="Star Rating" ReadOnly="True" />
                                        <asp:BoundField DataField="verification" HeaderText="Verification" ReadOnly="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDetails" ForeColor="White" BackColor="#009688" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                            </asp:Panel>
                        </tr>
                        <tr>
                            <asp:Panel ID="pnlRestaurant" runat="server">
                                <h2>Show Restaurant</h2>
                                <asp:GridView ID="gvRestaurant" runat="server" CellPadding="4" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvRestaurant_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="orgEmail" HeaderText="Organization Email" ReadOnly="True" />
                                        <asp:BoundField DataField="name" HeaderText="Restaurant Name" ReadOnly="True" />
                                        <asp:BoundField DataField="regID" HeaderText="Registration ID" ReadOnly="True" />
                                        <asp:BoundField DataField="city" HeaderText="City" ReadOnly="True" />
                                        <asp:BoundField DataField="country" HeaderText="Country" ReadOnly="True" />
                                        <asp:BoundField DataField="contactNo" HeaderText="Contact No" ReadOnly="True" />
                                        <asp:BoundField DataField="starRating" HeaderText="Star Rating" ReadOnly="True" />
                                        <asp:BoundField DataField="verification" HeaderText="Verification" ReadOnly="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDetails" ForeColor="White" BackColor="#009688" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                            </asp:Panel>
                        </tr>


                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</asp:Content>

