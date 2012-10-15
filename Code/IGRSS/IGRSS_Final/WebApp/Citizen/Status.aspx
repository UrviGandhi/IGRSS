<%@ Page Language="C#" MasterPageFile="~/Citizen/Citizen.master" AutoEventWireup="true"
	CodeFile="Status.aspx.cs" Inherits="Citizen_Status" Title="Application Status" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
	<asp:MultiView ID="mvAppealStatus" runat="server" ActiveViewIndex="0">
		<asp:View ID="viewsearch" runat="server">
			<table style="width: 100%; text-align: left;">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblAppealRegistartion" runat="server" meta:resourcekey="lblAppealRegistartion"
							SkinID="SubHeading" Text="Appeal Status"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblAppealNo" runat="server" Text="Enter Appeal No"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtAppealNo" runat="server"></asp:TextBox>
					</td>
					<tr>
				<tr>
					<td align="right" colspan="6">
						<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Submit" />&nbsp;
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="viewDetails" runat="server">
			<table style="width: 100%; text-align: left;">
				<tr>
					<td colspan="6">
						<asp:GridView ID="gvAppealStatus" runat="server" AutoGenerateColumns="False" DataKeyNames="AppealApplicationId" DataSourceID="odsAppealStatus">
							<Columns>
								<asp:BoundField DataField="RegistrationNo" HeaderText="Registration No" SortExpression="RegistrationNo" />
								<asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" SortExpression="ApplicantName" />
								<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
								<asp:BoundField DataField="InwardDate" HeaderText="Date" SortExpression="InwardDate" />
								<asp:BoundField DataField="AppealStatus" HeaderText="Status" SortExpression="AppealStatus" />
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
	</asp:MultiView>
	<asp:ObjectDataSource ID="odsAppealStatus" runat="server" DataObjectTypeName="System.Guid"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealStatusByAppealNo"
		TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication">
		<SelectParameters>
			<asp:ControlParameter ControlID="txtAppealNo" Name="AppealSlNo" PropertyName="Text"
				Type="Decimal" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>
