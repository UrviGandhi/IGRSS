<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_StampRequsition, App_Web_dhxbsoqy" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblRequsitionHeaderIns" runat="server" meta:resourcekey="lblRequsitionHeaderIns"
					SkinID="SubHeading" Text="Stamp Requsition"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblOfficeIdIns" runat="server" meta:resourcekey="lblOfficeIdIns" Text="Office"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="ddlOfficeIdIns" runat="server" meta:resourcekey="ddlOfficeIdIns"
					Text='<%# Bind("OfficeId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblRequestDateIns" runat="server" meta:resourcekey="lblRequestDateIns"
					Text="Request Date"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtRequestDateIns" runat="server" meta:resourcekey="txtRequestDateIns"
					Text='<%# Bind("RequestDate") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtRequestDateIns" Format ="dd mm yyyy" />
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblTotal_ValueIns" runat="server" meta:resourcekey="lblTotal_ValueIns"
					Text="Requsition Value"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtTotalValueIns" runat="server" meta:resourcekey="txtTotalValueIns"
					Text='<%# Bind("TotalValue") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblStampDetailsHeaderIns" runat="server" meta:resourcekey="lblStampDetailsHeaderIns"
					SkinID="SubHeading" Text="Stamp Denominations Requested"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblStampDenomTypeIdIns" runat="server" meta:resourcekey="lblStampDenomTypeIdIns"
					Text="Stamp Denomination"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="ddlStampDenomTypeIdIns" runat="server" meta:resourcekey="ddlStampDenomTypeIdIns"
					Text='<%# Bind("StampDenomId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQuantityIns" runat="server" meta:resourcekey="lblQuantityIns" Text="Quantity"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtQuantityIns" runat="server" meta:resourcekey="txtQuantityIns"
					Text='<%# Bind("Quantity") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblValueIns" runat="server" meta:resourcekey="lblValueIns" Text="Value"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtValueIns" runat="server" meta:resourcekey="txtValueIns" Text='<%# Bind("Value") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnStampAddIns" runat="server" meta:resourcekey="btnStampAddIns"
					Text="Add" />
				<asp:Button ID="btnStampUpdateIns" runat="server" meta:resourcekey="btnStampUpdateIns"
					Text="Update" />
				<asp:Button ID="btnStampCancelIns" runat="server" meta:resourcekey="btnStampCancelIns"
					Text="Cancel" />
			</td>
		</tr>		
		<tr>
			<td colspan="6">
				<asp:GridView ID="gvStampsIns" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataKeyNames="PostalStampPurchaseReqDetails" ForeColor="#333333" GridLines="None"
					Width="100%">
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<EditRowStyle BackColor="#999999" />
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<Columns>
						<asp:BoundField DataField="PurRequestId" HeaderText="Inspection Id" Visible="False" />
						<asp:BoundField DataField="StampDenomId" HeaderText="Stamp Denom Id" Visible="False" />
						<asp:TemplateField HeaderText="PurRequestId" ShowHeader="False">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("PurRequestId") %>'></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Name" HeaderText="Name" />
						<asp:BoundField DataField="Quantity" HeaderText="Quantity" />
						<asp:BoundField DataField="Value" HeaderText="Value" />
						<asp:CommandField ShowDeleteButton="True" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnAdd" runat="server" CommandName="Add" meta:resourcekey="btnAdd"
					Text="Save" />
				<asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnAddIns"
					Text="Cancel" />
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblRequsitionHeaderUpd" runat="server" meta:resourcekey="lblRequsitionHeaderUpd"
					SkinID="SubHeading" Text="Stamp Requsition"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblOfficeIdUpd" runat="server" meta:resourcekey="lblOfficeIdUpd" Text="Office"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="ddlOfficeIdUpd" runat="server" meta:resourcekey="ddlOfficeIdUpd"
					Text='<%# Bind("OfficeId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblRequestDateUpd" runat="server" meta:resourcekey="lblRequestDateUpd"
					Text="Request Date"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtRequestDateUpd" runat="server" meta:resourcekey="txtRequestDateUpd"
					Text='<%# Bind("RequestDate") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtRequestDateUpd" Format="dd mm yyyy" />
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblTotal_ValueUpd" runat="server" meta:resourcekey="lblTotal_ValueUpd"
					Text="Requsition Value"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtTotalValueUpd" runat="server" meta:resourcekey="txtTotalValueUpd"
					Text='<%# Bind("TotalValue") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblStampDetailsHeaderUpd" runat="server" meta:resourcekey="lblStampDetailsHeaderUpd"
					SkinID="SubHeading" Text="Stamp Denominations Requested"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblStampDenomTypeIdUpd" runat="server" meta:resourcekey="lblStampDenomTypeIdUpd"
					Text="Stamp Denomination"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="ddlStampDenomTypeIdUpd" runat="server" meta:resourcekey="ddlStampDenomTypeIdUpd"
					Text='<%# Bind("StampDenomId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQuantityUpd" runat="server" meta:resourcekey="lblQuantityUpd" Text="Quantity"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtQuantityUpd" runat="server" meta:resourcekey="txtQuantityUpd"
					Text='<%# Bind("Quantity") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblValueUpd" runat="server" meta:resourcekey="lblValueUpd" Text="Value"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtValueUpd" runat="server" meta:resourcekey="txtValueUpd" Text='<%# Bind("Value") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnStampAddUpd" runat="server" meta:resourcekey="btnStampAddUpd"
					Text="Add" />
				<asp:Button ID="btnStampUpdateUpd" runat="server" meta:resourcekey="btnStampUpdateUpd"
					Text="Update" />
				<asp:Button ID="btnStampCancelUpd" runat="server" meta:resourcekey="btnStampCancelUpd"
					Text="Cancel" />
			</td>
		</tr>		
		<tr>
			<td colspan="6">
				<asp:GridView ID="gvStampsUpd" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataKeyNames="PostalStampPurchaseReqDetails" ForeColor="#333333" GridLines="None"
					Width="100%">
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<EditRowStyle BackColor="#999999" />
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<Columns>
						<asp:BoundField DataField="PurRequestId" HeaderText="Inspection Id" Visible="False" />
						<asp:BoundField DataField="StampDenomId" HeaderText="Stamp Denom Id" Visible="False" />
						<asp:TemplateField HeaderText="PurRequestId" ShowHeader="False">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("PurRequestId") %>'></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Name" HeaderText="Name" />
						<asp:BoundField DataField="Quantity" HeaderText="Quantity" />
						<asp:BoundField DataField="Value" HeaderText="Value" />
						<asp:CommandField ShowDeleteButton="True" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnUpdate" runat="server" CommandName="Update" meta:resourcekey="btnUpdate"
					Text="Update" />
				<asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
					Text="Cancel" />
			</td>
		</tr>
	</table>
</asp:Content>
