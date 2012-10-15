<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Employee_EmployeeSearchPage, App_Web_q231gs2g" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">

<table width="100%">


	<tr>
		<td class="labelColumn">
			<asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
				Text="Employee Number"></asp:Label>
		</td>
		<td class="textColumn">
			<asp:TextBox ID="txtEmployeeNumberIns" runat="server" meta:resourcekey="txtEmployeeNumberIns"></asp:TextBox>
		</td>
		<td class="validationColumn">
		</td>
		<td class="labelColumn">
			
		</td>
		<td class="textColumn">
			
			<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
			
		</td>
		<td class="validationColumn">
		</td>
	</tr>

</table>

</asp:Content>

