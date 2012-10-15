<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_RefundTest, App_Web_e5jlgnnw" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
		<asp:ListItem>1</asp:ListItem>
		<asp:ListItem>15</asp:ListItem>
	</asp:ListBox>
	<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Grnerate Report"
		Width="141px" />
</asp:Content>

