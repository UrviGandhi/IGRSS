<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_RevenueStampsMaster, App_Web_e5jlgnnw" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:GridView ID="GridView1" runat="server" DataSourceID="OdsRevenueStampMaster" DataKeyNames="RevenueStampId"
		Width="388px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" >
		<Columns>
			<asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
			<asp:BoundField DataField="Description" HeaderText="Description" />
			<asp:BoundField DataField="Amount" HeaderText="Amount" />
			<asp:CommandField ShowSelectButton="True" HeaderText=" Select To Update" />
			
			<asp:TemplateField>
				<HeaderTemplate>
					
				</HeaderTemplate>
				<ItemTemplate>	
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
		<EditRowStyle BackColor="#999999" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		
		
	</asp:GridView>
	<table>
		<tr>
			<td style="width: 100px; height: 26px" align="left">
	<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert New "
		Width="101px" /></td>
			<td style="width: 100px; height: 26px">
				<asp:Button ID="BtnSearchByName" runat="server" Text="Search By Name" Width="121px" /></td>
			<td style="width: 100px; height: 26px">
				<asp:TextBox ID="TxtSearchByName" runat="server"></asp:TextBox></td>
			<td style="height: 26px">
			</td>
		</tr>
	</table>
	<br />
	<asp:ObjectDataSource ID="OdsRevenueStampMaster" runat="server" InsertMethod="NewRevenueStampMaster"  SelectMethod="GetrevenueStampMasterDetails" TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster" UpdateMethod="UpdateRevenueStampMaster">
		<InsertParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Amount" Type="Decimal" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Amount" Type="Decimal" />
			<asp:Parameter Name="RevenueStampId" Type="Object" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<asp:FormView ID="FVRevenueStampMaster" runat="server" DataSourceID="odsSelectedStampDetails"
		Width="708px" DataKeyNames="RevenueStampId">
		<InsertItemTemplate>
			<table width="30%">
				<tr>
					<td align="center" colspan="3" style="height: 16px">
						<asp:Label ID="lblRevenueStampHeader" runat="server" SkinID="Heading" Text="Revenue Stamps Master"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox></td>
					<td align="left" style="width: 92px">
						&nbsp; &nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
					<td align="left" style="width: 92px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount")%>'></asp:TextBox></td>
					<td align="left" style="width: 92px">
					</td>
				</tr>
				<tr>
					<td style="width: 100px">
					</td>
					<td align="left" >
						<asp:Button ID="btnRevenueStampMasterSave" runat="server" Text="Insert"  CommandName="Insert"/>
						<asp:Button ID="Button2" runat="server" CommandName="Insert" Text="Cancel" />
						</td>
					<td align="left" style="width: 92px">
					</td>
					<td style="width: 100px">
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
		<EditItemTemplate>
			<table width="30%">
				<tr>
					<td align="center" colspan="3" style="height: 16px">
						<asp:Label ID="lblRevenueStampHeader" runat="server" SkinID="Heading" Text="Revenue Stamps Master"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td >
					</td>
					<td align="left" >
						<asp:Button ID="btnRevenueStampMasterSave" runat="server" CommandName="Update" Text="Update" />
						<asp:Button ID="btnRevenueStampMasterCancel" runat="server" CommandName="Update" Text="Cancel" />
					</td>
					<td style="width: 100px">
					</td>
				</tr>
			</table>
		</EditItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="odsSelectedStampDetails" runat="server" InsertMethod="NewRevenueStampMaster"  SelectMethod="GetRevenueStampDetailsById" TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster" UpdateMethod="UpdateRevenueStampMaster" >
		<InsertParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Amount" Type="Decimal" />
		</InsertParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="GridView1" Name="RevenueStampId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Amount" Type="Decimal" />
			<asp:Parameter Name="RevenueStampId" Type="Object" />
		</UpdateParameters>
	</asp:ObjectDataSource>
</asp:Content>

