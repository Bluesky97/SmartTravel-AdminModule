<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testjson.aspx.cs" Inherits="testjson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />

    <table>
        <tr>
            <td>
                <asp:TextBox ID="tbxInput" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="tbxOutput" Width="708px" runat="server" Height="310px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

