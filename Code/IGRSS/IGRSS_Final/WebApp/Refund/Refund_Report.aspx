<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Refund_Report.aspx.cs" Inherits="Refund_Refund_Report" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
		OnTextChanged="RadioButtonList1_TextChanged" RepeatDirection="Horizontal" TextAlign="Left">
		<asp:ListItem>Distic</asp:ListItem>
		<asp:ListItem>Taluka</asp:ListItem>
		<asp:ListItem>Village</asp:ListItem>
	</asp:RadioButtonList>
	<asp:ListBox ID="ListBox1" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"
		SelectionMode="Multiple"></asp:ListBox>
	<asp:ObjectDataSource ID="odsDistic" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetDistirctMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
	</asp:ObjectDataSource>
	&nbsp; &nbsp; &nbsp;&nbsp;
	<asp:ObjectDataSource ID="odsVillage" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetVillageMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsTaluka" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetTalukaMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
	</asp:ObjectDataSource>
</asp:Content>

