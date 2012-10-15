<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Telephone_Default2" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RefundApplicationId"
		DataSourceID="ObjectDataSource1">
		<Columns>
			<asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
				ReadOnly="True" SortExpression="RefundApplicationId" />
			<asp:BoundField DataField="OfficeId" HeaderText="OfficeId" SortExpression="OfficeId" />
			<asp:BoundField DataField="RegistrationNo" HeaderText="RegistrationNo" SortExpression="RegistrationNo" />
			<asp:BoundField DataField="RefundPrefix" HeaderText="RefundPrefix" SortExpression="RefundPrefix" />
			<asp:BoundField DataField="RefundSlNo" HeaderText="RefundSlNo" SortExpression="RefundSlNo" />
			<asp:BoundField DataField="RefundYear" HeaderText="RefundYear" SortExpression="RefundYear" />
			<asp:BoundField DataField="TypeOfRefund" HeaderText="TypeOfRefund" SortExpression="TypeOfRefund" />
			<asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" SortExpression="ApplicationDate" />
			<asp:BoundField DataField="VendorLicenseId" HeaderText="VendorLicenseId" SortExpression="VendorLicenseId" />
			<asp:BoundField DataField="PurchasedDate" HeaderText="PurchasedDate" SortExpression="PurchasedDate" />
			<asp:BoundField DataField="TotalValueOfStamps" HeaderText="TotalValueOfStamps" SortExpression="TotalValueOfStamps" />
			<asp:BoundField DataField="ReasonForNotUsing" HeaderText="ReasonForNotUsing" SortExpression="ReasonForNotUsing" />
			<asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" SortExpression="ApplicantName" />
			<asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" SortExpression="ApplicantAddress" />
			<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
			<asp:BoundField DataField="District" HeaderText="District" SortExpression="District" />
			<asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
			<asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
			<asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
			<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
			<asp:BoundField DataField="PenaltyAmount" HeaderText="PenaltyAmount" SortExpression="PenaltyAmount" />
			<asp:BoundField DataField="RefundAmount" HeaderText="RefundAmount" SortExpression="RefundAmount" />
			<asp:BoundField DataField="RefundOrderId" HeaderText="RefundOrderId" SortExpression="RefundOrderId" />
			<asp:BoundField DataField="DateOfOrder" HeaderText="DateOfOrder" SortExpression="DateOfOrder" />
			<asp:BoundField DataField="Info" HeaderText="Info" SortExpression="Info" />
			<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
			<asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" />
			<asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" />
			<asp:BoundField DataField="ModifiedAt" HeaderText="ModifiedAt" SortExpression="ModifiedAt" />
			<asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" SortExpression="IsDeleted" />
			<asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" SortExpression="DeletedBy" />
			<asp:BoundField DataField="DeletedAt" HeaderText="DeletedAt" SortExpression="DeletedAt" />
			<asp:BoundField DataField="WfInstanceId" HeaderText="WfInstanceId" SortExpression="WfInstanceId" />
		</Columns>
	</asp:GridView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetRefundApplicationByVillage" TypeName="IGRSS.BusinessLogicLayer.RefundApplication">
		<SelectParameters>
			<asp:ControlParameter ControlID="TextBox2" Name="VillageCode" PropertyName="Text"
				Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<asp:Button ID="Button1" runat="server" Text="Button" />
	<br />
	<br />
	<br />
	<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
	<br />
	<br />
</asp:Content>

