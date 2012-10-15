<%@ page autoeventwireup="true" inherits="Valuation_Default, App_Web_1opp1cfq" language="C#" masterpagefile="~/IGRSS_Default.master" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	&nbsp; &nbsp;
	<asp:GridView ID="gvValuationAlerts" runat="server" DataSourceID="odsValuationAlerts" AutoGenerateColumns="False" DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="gvValuationAlerts_SelectedIndexChanged" PageSize="5">
		<Columns>
			<asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
				SortExpression="Id" Visible="False" />
			<asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
			<asp:BoundField DataField="SentBy" HeaderText="SentBy" SortExpression="SentBy" />
			<asp:BoundField DataField="SentOn" HeaderText="SentOn" SortExpression="SentOn" />
			<asp:CommandField SelectText="View" ShowSelectButton="True" />
		</Columns>
		<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<RowStyle BackColor="#EFF3FB" />
		<EditRowStyle BackColor="#2461BF" />
		<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
		<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" />
	</asp:GridView>
	<asp:ObjectDataSource ID="odsValuationAlerts" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlerts" TypeName="IGRSS.BusinessLogicLayer.Valuation.ValuationAlertsBLL" InsertMethod="AddAlerts">
		<InsertParameters>
			<asp:Parameter Name="To" Type="String" />
			<asp:Parameter Name="Message" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
</asp:Content>

