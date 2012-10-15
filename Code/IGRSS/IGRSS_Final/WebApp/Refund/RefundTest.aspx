<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RefundTest.aspx.cs" Inherits="Refund_RefundTest" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
		<asp:ListItem>1</asp:ListItem>
		<asp:ListItem>15</asp:ListItem>
	</asp:ListBox>
	<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Grnerate Report"
		Width="141px" />
</asp:Content>

