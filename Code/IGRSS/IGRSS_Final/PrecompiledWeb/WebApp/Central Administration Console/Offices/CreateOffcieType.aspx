<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_Offices_CreateOffcieType, App_Web_zdioaxl3" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:GridView ID="GridView1" runat="server">
	</asp:GridView>
	<asp:ObjectDataSource ID="odsOfficeTypes" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAppealType" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOfficeTypes">
	</asp:ObjectDataSource>
</asp:Content>

