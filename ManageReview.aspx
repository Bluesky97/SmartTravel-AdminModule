<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageReview.aspx.cs" Inherits="ManageReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 123px;
        }

        .auto-style2 {
            width: 749px;
        }

        .auto-style4 {
            width: 92px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Heading-->
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlSP" runat="server" AutoPostBack="True" Font-Size="Medium" Height="28px" Width="238px">
        <asp:ListItem>Select Service Provider</asp:ListItem>
        <asp:ListItem>Hotel Owner</asp:ListItem>
        <asp:ListItem>Attraction Owner</asp:ListItem>
        <asp:ListItem>Restaurant Owner</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblOutput" runat="server" Text="Search By Name:" Font-Size="Medium"></asp:Label>
    <asp:TextBox ID="tbxName" runat="server" Height="24px" Width="171px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp; 
    <asp:Button ID="btnSearch" runat="server" Text="Search" ForeColor="White" BackColor="#009688" Height="29px" OnClick="btnSearch_Click" Width="133px" />
    &nbsp;
    <asp:Label ID="lblDelete" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <div class="col-lg-4 col-md-3 col-sm-3">
        <hr />
    </div>
    <div class="col-lg-4 col-md-6 col-sm-6">
        <h2 class="tm-section-title">Reported Feedbacks</h2>
    </div>
    <div class="col-lg-4 col-md-3 col-sm-3">
        <hr />
    </div>
    <br />
    <br />
    <br />

    <table class="nav-justified">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:GridView ID="gvReviewReportedAttraction" runat="server" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvReviewReportedAttraction_PageIndexChanging" OnRowCommand="gvReviewReportedAttraction_RowCommand" OnRowDeleting="gvReviewReportedAttraction_RowDeleting">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Feedback" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Rating" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AttractionID.AttractionID" HeaderText="Attraction ID" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AttractionID.Name" HeaderText="Attraction Name" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("RevID") %>' Font-Bold="True" Font-Italic="True">Update Status</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
                <asp:GridView ID="gvReviewReportedHotel" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvReviewReportedHotel_PageIndexChanging" OnRowCommand="gvReviewReportedHotel_RowCommand" OnRowDeleting="gvReviewReportedHotel_RowDeleting" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Feedback" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Rating" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID.HotelID" HeaderText="Hotel ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID.Name" HeaderText="Hotel Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Italic="True" CommandArgument='<%# Eval("RevID") %>'>Update Status</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
                <asp:GridView ID="gvReviewReportedRestaurant" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvReviewReportedRestaurant_PageIndexChanging" OnRowCommand="gvReviewReportedRestaurant_RowCommand" OnRowDeleting="gvReviewReportedRestaurant_RowDeleting" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Feedback" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Rating" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RestaurantID.RestaurantID" HeaderText="Restaurant ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RestaurantID.Name" HeaderText="Restaurant Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Italic="True" CommandArgument='<%# Eval("RevID") %>'>Update Status</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Panel ID="pnlEdit" runat="server" Visible="False" Width="1246px">
                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Feedback ID: "></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFeedbackID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" runat="server" Text="Status :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlStatus" runat="server" Height="29px" Width="103px">
                                    <asp:ListItem>Reported!</asp:ListItem>
                                    <asp:ListItem>None</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnUpdate" runat="server" ForeColor="White" BackColor="#009688" Text="Update" Width="100px" OnClick="btnUpdate_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

    <div class="col-lg-4 col-md-3 col-sm-3">
        <hr />
    </div>
    <div class="col-lg-4 col-md-6 col-sm-6">
        <h2 class="tm-section-title">All Feedbacks</h2>
    </div>
    <div class="col-lg-4 col-md-3 col-sm-3">
        <hr />
    </div>
    <br />
    <br />
    <br />

    <table class="nav-justified">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:GridView ID="gvReviewA" runat="server" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvReviewA_PageIndexChanging" OnRowDeleting="gvReviewA_RowDeleting">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Comment">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Ratings">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AttractionID.AttractionID" HeaderText="Attraction ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AttractionID.Name" HeaderText="Attraction Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
                <asp:GridView ID="gvReviewH" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" OnPageIndexChanging="gvReviewH_PageIndexChanging" OnRowDeleting="gvReviewH_RowDeleting" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Comment">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Ratings">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID.HotelID" HeaderText="Hotel ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID.Name" HeaderText="Hotel Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
                <asp:GridView ID="gvReviewR" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium" Height="290px" Width="1208px" PageSize="5" AllowPaging="True" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" OnPageIndexChanging="gvReviewR_PageIndexChanging" OnRowDeleting="gvReviewR_RowDeleting">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="RevID" HeaderText="Review ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Time" DataFormatString="{0:t}" HeaderText="Time">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Feedback" HeaderText=" Comment">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating" HeaderText="Ratings">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReportStatus" HeaderText="Report Status">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RestaurantID.RestaurantID" HeaderText="Restaurant ID">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RestaurantID.Name" HeaderText="Restaurant Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField></asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ControlStyle Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
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
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

