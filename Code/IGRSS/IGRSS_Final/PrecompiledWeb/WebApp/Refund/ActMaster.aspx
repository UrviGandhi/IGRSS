<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_ActMaster, App_Web_e5jlgnnw" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<br />
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="OdsActMaster"
		ForeColor="#333333" GridLines="None" Height="1px" Width="592px" AutoGenerateColumns="False" DataKeyNames="ActId" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" >
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<Columns>
			<asp:BoundField DataField="NameOfAct" HeaderText="NameOfAct" SortExpression="NameOfAct" />
					<asp:BoundField DataField="DescriptionOfAct" HeaderText="DescriptionOfAct" SortExpression="DescriptionOfAct" />
			<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
			<asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" />
			<asp:CommandField ShowSelectButton="True" />
		</Columns>
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
		<EditRowStyle BackColor="#999999" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
	</asp:GridView>
	<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert New"
		Width="95px" />&nbsp;
	<br />
	<asp:FormView ID="FormView1" runat="server"  DataSourceID="odsSelectedActDetails" Width="304px" DataKeyNames="ActId" >
		<InsertItemTemplate>
			<table width="30%">
				<tr>
					<td align="center" colspan="3" style="height: 16px">
						<asp:Label ID="lblActMasterHeader" runat="server" SkinID="Heading" Text="Act Master"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
					<td align="left" style="width: 158px">
						<asp:TextBox ID="txtName" runat="server" Text='<%# Bind("NameOfAct")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
					<td align="left" style="width: 158px">
						<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("DescriptionOfAct")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td style="width: 100px">
					</td>
					<td align="left" style="width: 158px" >
						<asp:Button ID="btnActMasterSave" runat="server" CommandName="Insert" Text="Save" />
						<asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="Cancel" />
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
						<asp:Label ID="lblActMasterHeader" runat="server" SkinID="Heading" Text="Act Master"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtName" runat="server" Text='<%# Bind("NameOfAct")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td align="left" style="width: 100px">
						<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
					<td align="left" style="width: 100px">
						<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("DescriptionOfAct")%>'></asp:TextBox></td>
					<td align="left" style="width: 100px">
					</td>
				</tr>
				<tr>
					<td style="width: 100px">
					</td>
					<td align="left" >
						<asp:Button ID="btnActMasterSave" runat="server" CommandName="Update" Text="Update" />
						<asp:Button ID="Button3" runat="server" CommandName="Update" Text="Cancel" />
						</td>
					<td style="width: 100px">
					</td>
				</tr>
			</table>
			
		</EditItemTemplate>
		<ItemTemplate>
			
		</ItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="odsSelectedActDetails" runat="server" InsertMethod="InsertNewActMaster"  SelectMethod="GetActDetailsById" TypeName="IGRSS.BusinessLogicLayer.RefundActMaster" UpdateMethod="UpdateActMaster">
		<UpdateParameters>
			<asp:Parameter Name="ActId" Type="Object" />
			<asp:Parameter Name="DescriptionOfAct" Type="String" />
			<asp:Parameter Name="NameOfAct" Type="String" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="GridView1" Name="ActId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="DescriptionOfAct" Type="String" />
			<asp:Parameter Name="NameOfAct" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
<asp:ObjectDataSource ID="OdsActMaster" runat="server" InsertMethod="InsertNewActMaster" OldValuesParameterFormatString="original_{0}" SelectMethod="GetActMasterDetails" TypeName="IGRSS.BusinessLogicLayer.RefundActMaster" UpdateMethod="UpdateActMaster">
		<InsertParameters>
			<asp:Parameter Name="DescriptionOfAct" Type="String" />
			<asp:Parameter Name="NameOfAct" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</InsertParameters>
	<UpdateParameters>
		<asp:Parameter Name="ActId" Type="Object" />
		<asp:Parameter Name="DescriptionOfAct" Type="String" />
		<asp:Parameter Name="NameOfAct" Type="String" />
	</UpdateParameters>
	</asp:ObjectDataSource>
</asp:Content>

