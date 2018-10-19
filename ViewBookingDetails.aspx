<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewBookingDetails.aspx.cs" Inherits="ViewBookingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style5 {
            height: 20px;
            width: 206px;
        }

        .auto-style6 {
            width: 206px;
        }

        .auto-style7 {
            width: 281px;
            height: 20px;
        }

        .auto-style8 {
            width: 281px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Back to Admin Dashboard</asp:LinkButton>
    <table class="nav-justified">
        <tr>
            <td class="text-center" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Customer Email: "></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblBooking" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="Black" Style="text-decoration: underline" Text="Booking Details" Visible="False"></asp:Label>

                <br />
                <br />
                <div class="test2" style="margin-left: 250px">
                    <asp:GridView ID="gvBooking" runat="server" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" GridLines="None" Height="228px" PageSize="4" Visible="False" Width="1095px" OnRowCommand="gvBooking_RowCommand" OnPageIndexChanging="gvBooking_PageIndexChanging" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" DataFormatString="{0:d}"></asp:BoundField>
                            <asp:BoundField DataField="TotalAmt" HeaderText="Total Amount" ReadOnly="True" DataFormatString="{0:C}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tax" HeaderText="Tax" ReadOnly="True" DataFormatString="{0:C}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BookingCharges" HeaderText="Booking Charges" ReadOnly="True" DataFormatString="{0:C}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CardHolderName" HeaderText="Card Holder">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ApprovalCode" HeaderText="Approval Code" />
                            <asp:TemplateField HeaderText="Item Booking Details" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("BookingID") %>' CommandName="Item">View More</asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle Font-Bold="True" Font-Italic="True" Font-Underline="True" ForeColor="#0000CC" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
            </td>
        </tr>
    </table>
    <br />
    <div class="test" style="text-align: center">
        <asp:Label ID="lblItemBooking" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="Black" Style="text-decoration: underline" Text="Item Booking Details" Visible="False"></asp:Label>
    </div>
    <br />
    <br />
    <asp:DataList ID="dlRoom" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Tahoma" Font-Size="Medium" GridLines="Vertical" HorizontalAlign="Center" RepeatColumns="2">
        <AlternatingItemStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <ItemTemplate>
            <table class="col-xxs-12">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#996633" Text='<%# Eval("RoomID.HID.Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label36" runat="server" Text="Booking ID:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("BookingID.BookingID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Image ID="Image2" runat="server" Height="157px" ImageUrl='<%# "../images/"+Eval("RoomID.Pictures") %>' Width="178px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="Room:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("RoomID.Type") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label6" runat="server" Text="From:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("StartDate","{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label8" runat="server" Text="To:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("EndDate","{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label9" runat="server" Text="Max no. of guest:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("RoomID.Capacity") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;&nbsp;
                        <asp:Label ID="Label10" runat="server" Text="Size:"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("RoomID.RoomSize") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label11" runat="server" Text="Description:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("RoomID.Desc") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label12" runat="server" Text="Services:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("RoomID.Services") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label13" runat="server" Text="Price:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("RoomID.Price","{0:c}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label14" runat="server" Text="Remarks:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label23" runat="server" Text='<%# Eval("RoomID.Remarks") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label37" runat="server" Text="Status:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#CC3300" Text='<%# Eval("ItemBookingStatus") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    <p style="text-align: center">&nbsp;</p>
    <asp:DataList ID="dlRestaurant" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Tahoma" Font-Size="Medium" GridLines="Vertical" HorizontalAlign="Center" RepeatColumns="2">
        <AlternatingItemStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <ItemTemplate>
            <table class="col-xxs-12">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#996633" Text='<%# Eval("RestaurantID.Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label42" runat="server" Text="Booking ID:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("BookingID.BookingID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Image ID="Image3" runat="server" Height="215px" ImageUrl='<%# "../images/"+Eval("RestaurantID.Photo") %>' Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label27" runat="server" Text="Address:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("RestaurantID.Address") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="Date:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("StartDate","{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label29" runat="server" Text="Time:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label30" runat="server" Text='<%# Eval("StartTime","{0:t}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Text="Max no. of guest:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" Text="Description:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("RestaurantID.Description") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;
                        <asp:Label ID="Label43" runat="server" Text="Status:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#CC3300" Text='<%# Eval("ItemBookingStatus") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    <p style="text-align: center">&nbsp;</p>
    <asp:DataList ID="dlTicket" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Tahoma" Font-Size="Medium" GridLines="Vertical" HorizontalAlign="Center" RepeatColumns="2">
        <AlternatingItemStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <ItemTemplate>
            <table class="col-xxs-12">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#996633" Text='<%# Eval("TicketID.Attraction.Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;
                        <asp:Label ID="Label42" runat="server" Text="Booking ID:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("BookingID.BookingID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Image ID="Image3" runat="server" Height="215px" ImageUrl='<%# "../images/"+Eval("TicketID.Attraction.Photo") %>' Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label27" runat="server" Text="Ticket Type:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("TicketID.Type") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="Date:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("StartDate","{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label29" runat="server" Text="No. of guest:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label30" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label13" runat="server" Text="Price:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("Price","{0:c}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;
                        <asp:Label ID="Label43" runat="server" Text="Status:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#CC3300" Text='<%# Eval("ItemBookingStatus") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
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

