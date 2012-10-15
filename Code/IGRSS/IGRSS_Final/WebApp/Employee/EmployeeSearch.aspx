<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="EmployeeSearch.aspx.cs" Inherits="Employee_EmployeeSearchPage" Title="Untitled Page" %>
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

