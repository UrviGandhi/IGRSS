<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RefundTypeMasters.aspx.cs" Inherits="Refund_RefundTypeMasters" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:FormView ID="FormView1" runat="server" DataSourceID="odsRefundTypeMaster" DefaultMode="Insert" Width="35%" Height="108px" AllowPaging="True" DataKeyNames="RefundTypeId">
		<InsertItemTemplate>
			<table width="100%">
				<tr>
					<td align="left" colspan="3">
						<asp:Label ID="Label1" runat="server" SkinID="Heading" Text="Refund Type Master"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" >
						<asp:Label ID="lblName" runat="server" Text="Name" ></asp:Label></td>
					<td align="left" >
						<asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox></td>
					<td align="left" >
					</td>
				</tr>
				<tr>
					<td align="left" >
						<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
					<td align="left" >
						<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
					<td align="left" >
					</td>
				</tr>
				<tr>
					<td  >
					</td>
					<td align="center" >
						<asp:Button ID="btnSave" runat="server" Text="Save"  CommandName="Insert"/></td>
					<td  >
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
		
	</asp:FormView>
	&nbsp;
	<asp:ObjectDataSource ID="odsRefundTypeMaster" runat="server" InsertMethod="NewRefunType" OldValuesParameterFormatString="original_{0}" SelectMethod="GetRefundTypeMasterDetails" TypeName="IGRSS.BusinessLayer.BusinessLogicLayer.RefundTypeMaster">
		<InsertParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
</asp:Content>

