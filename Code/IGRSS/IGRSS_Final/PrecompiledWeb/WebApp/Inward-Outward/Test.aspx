<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_Test, App_Web_b0gavear" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table width="100%">
		<tr>
			<td width="100">
				<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
				<asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple">
					<asp:ListItem Value="1">Pradeep</asp:ListItem>
					<asp:ListItem Value="2">Yadav</asp:ListItem>
					<asp:ListItem Value="3">Sahoo</asp:ListItem>
				</asp:ListBox></td>
			<td>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
			</td>
		</tr>
		<tr>
			<td>
				<asp:GridView ID="GridView1" runat="server">
				</asp:GridView>
			</td>
		</tr>
	</table>
</asp:Content>
