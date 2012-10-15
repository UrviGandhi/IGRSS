<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="FileMaster.aspx.cs" Inherits="Reports_FileMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table width="100%">
        <tr>
            <td class="labelColumn" style="width: 10%">
                <asp:Label ID="lblDepartment" runat="server" Text="Department" meta:resourcekey="lblDepartment"></asp:Label></td>
            <td class="textColumn">
                <asp:DropDownList ID="ddlModule" runat="server">
                    <asp:ListItem Value="APL">Appeal</asp:ListItem>
                    <asp:ListItem Value="LIC">License</asp:ListItem>
                    <asp:ListItem Value="REF">Refund</asp:ListItem>
                    <asp:ListItem Value="COM">Compalin</asp:ListItem>
                    <asp:ListItem Value="ADJ">Adjudication</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="validationColumn">
                <asp:Button ID="btnShowReport" runat="server" Text="Show Report" OnClick="btnShowReport_Click" Width="133px" />
            </td>
        </tr>
    </table>
</asp:Content>
