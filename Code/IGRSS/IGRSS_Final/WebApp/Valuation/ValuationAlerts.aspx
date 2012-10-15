<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ValuationAlerts.aspx.cs" Inherits="Valuation_ValuationAlerts" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:GridView ID="GridValuationAlerts" runat="server" Width="594px" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
		<Columns>
			<asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
				SortExpression="Id" />
			<asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
			<asp:BoundField DataField="SentOn" HeaderText="SentOn" SortExpression="SentOn" />
			<asp:BoundField DataField="SentBy" HeaderText="SentBy" SortExpression="SentBy" />
			<asp:BoundField DataField="SentTo" HeaderText="SentTo" SortExpression="SentTo" />
			<asp:ButtonField Text="View " />
		</Columns>
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
		<EditRowStyle BackColor="#999999" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=BLRSERVER\SQL2005;Initial Catalog=IGRSS_DEV;Persist Security Info=True;User ID=sa;Password=trans"
		ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Alerts]"></asp:SqlDataSource>
</asp:Content>

