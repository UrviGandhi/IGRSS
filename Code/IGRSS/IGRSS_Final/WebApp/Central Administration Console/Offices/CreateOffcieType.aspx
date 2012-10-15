<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master"  AutoEventWireup="true" CodeFile="CreateOffcieType.aspx.cs" Inherits="Central_Administration_Console_Offices_CreateOffcieType" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:GridView ID="GridView1" runat="server">
	</asp:GridView>
	<asp:ObjectDataSource ID="odsOfficeTypes" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAppealType" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOfficeTypes">
	</asp:ObjectDataSource>
</asp:Content>

