<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="SearchLicenseDetails.aspx.cs" Inherits="Refund_SearchLicenseDetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:FormView ID="FormView1" runat="server" DefaultMode="Insert">
		<InsertItemTemplate>
			<table style="width: 741px; height: 76px">
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="Label1" runat="server" Text="License No"></asp:Label></td>
					<td align="left" style="width: 42px">
						<asp:TextBox ID="TextBox1" runat="server" Width="447px"></asp:TextBox></td>
					<td align="left" style="width: 33px">
						<asp:Button ID="BtnSearch" runat="server" Text="Search" /></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px; height: 15px">
					</td>
					<td align="left" style="width: 42px; height: 15px">
					</td>
					<td align="left" style="width: 33px; height: 15px">
					</td>
					<td align="left" style="width: 100px; height: 15px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
					</td>
					<td align="left" style="width: 42px">
					</td>
					<td align="left" style="width: 33px">
					</td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px; height: 20px">
					</td>
					<td align="left" style="width: 42px; height: 20px">
					</td>
					<td align="left" style="width: 33px; height: 20px">
					</td>
					<td align="left" style="width: 100px; height: 20px">
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
	</asp:FormView>
	<br />
	<br />
	<br />
	<br />
	
</asp:Content>

