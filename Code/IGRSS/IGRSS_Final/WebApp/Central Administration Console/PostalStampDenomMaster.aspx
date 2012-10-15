<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="PostalStampDenomMaster.aspx.cs" Inherits="Inward_Outward_PostalStampDenomMaster"
	Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="mvPostalStamp" runat="server" ActiveViewIndex="0">
		<asp:View ID="vieGv" runat="server">
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblAllPostalStampHeaderIns" runat="server" meta:resourcekey="lblPostalStampHeaderIns"
							SkinID="SubHeading" Text="All Postal Stamp Details"></asp:Label>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<asp:GridView ID="gvPostalDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="StampDenomId"
							DataSourceID="odsGV" OnSelectedIndexChanged="gvPostalDetails_SelectedIndexChanged" OnRowDeleted="gvPostalDetails_RowDeleted">
							<Columns>
								<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
								<asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
								<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
								<asp:CheckBoxField DataField="IsActive" HeaderText="Is Active" SortExpression="IsActive" />
								<asp:CommandField ShowSelectButton="True" />
								<asp:CommandField ShowDeleteButton="True" />
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="vieFv" runat="server">
			<asp:FormView ID="fvPostalStampDenom" runat="server" DefaultMode="Insert" DataSourceID="odsPostalStamp"
				OnItemInserting="fvPostalStampDenom_ItemInserting" OnItemUpdating="fvPostalStampDenom_ItemUpdating">
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampHeaderIns" runat="server" meta:resourcekey="lblPostalStampHeaderIns"
									SkinID="SubHeading" Text="Postal Stamp Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblAmountIns" runat="server" meta:resourcekey="lblAmountIns" Text="Amount"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAmountIns" runat="server" meta:resourcekey="txtAmountIns" Text='<%# Bind("Amount") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="RfvDocumentNoIns" runat="server" ControlToValidate="txtAmountIns">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblDetailsIns" runat="server" meta:resourcekey="lblDetailsIns" Text="Details"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtDetailsIns" runat="server" meta:resourcekey="txtDetailsIns" Text='<%# Bind("Description") %>'
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="rfvDetailsIns" runat="server" ControlToValidate="txtDetailsIns">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblisactiveIns" runat="server" meta:resourcekey="lblisactiveIns" Text="Is Active"></asp:Label>
							</td>
							<td>
								<asp:CheckBox ID="chkisactive" runat="server" Checked='<%# Bind("IsActive") %>' />
							</td>
							<td class="validationColumn" colspan="4">
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" meta:resourcekey="btnInsertIns"
									Text="Save" />
								<asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelIns"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampHeaderUpd" runat="server" meta:resourcekey="lblPostalStampHeaderUpd"
									SkinID="SubHeading" Text="Postal Stamp Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNameUpd" runat="server" meta:resourcekey="txtNameUpd" Text='<%# Bind("Name") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblAmountUpd" runat="server" meta:resourcekey="lblAmountUpd" Text="Amount"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAmountUpd" runat="server" meta:resourcekey="txtAmountUpd" Text='<%# Bind("Amount") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="RfvDocumentNoUpd" runat="server" ControlToValidate="txtAmountUpd">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblDetailsUpd" runat="server" meta:resourcekey="lblDetailsUpd" Text="Details"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtDetailsUpd" runat="server" meta:resourcekey="txtDetailsUpd" Text='<%# Bind("Description") %>'
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="rfvDetailsUpd" runat="server" ControlToValidate="txtDetailsUpd">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblisactiveUpd" runat="server" meta:resourcekey="lblisactiveUpd" Text="Is Active"></asp:Label>
							</td>
							<td>
								<asp:CheckBox ID="chkisactive" runat="server" Checked='<%# Bind("IsActive") %>' />
							</td>
							<td class="validationColumn" colspan="4">
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnUpdateUpd" runat="server" CommandName="Update" meta:resourcekey="btnUpdateUpd"
									Text="Update" />
								<asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</EditItemTemplate>
				<ItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampHeaderItm" runat="server" meta:resourcekey="lblPostalStampHeaderItm"
									SkinID="SubHeading" Text="Postal Stamp Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameItm" runat="server" meta:resourcekey="lblNameItm" Text="Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNameItm" ReadOnly="true" runat="server" meta:resourcekey="txtNameItm"
									Text='<%# Bind("Name") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblAmountItm" runat="server" meta:resourcekey="lblAmountItm" Text="Amount"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAmountItm" runat="server" meta:resourcekey="txtAmountItm" ReadOnly="true"
									Text='<%# Bind("Amount") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblDetailsItm" runat="server" meta:resourcekey="lblDetailsItm" Text="Details"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtDetailsItm" runat="server" meta:resourcekey="txtDetailsItm" ReadOnly="true"
									Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
								
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblisactiveItm" runat="server" meta:resourcekey="lblisactiveItm" Text="Is Active"></asp:Label>
							</td>
							<td>
								<asp:CheckBox ID="chkisactive" Enabled="false" runat="server" Checked='<%# Bind("IsActive") %>' />
							</td>
							<td class="validationColumn" colspan="4">
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
			<asp:ObjectDataSource ID="odsPostalStamp" runat="server"
				InsertMethod="AddPostalStampDenomDetails"
				OnUpdating="odsPostalStamp_Updating" SelectMethod="GetPostalStampDenomByStampDenomId"
				TypeName="IGRSS.BusinessLogicLayer.InwardOutward" UpdateMethod="UpdatePostalStampDenomDetails" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" OldValuesParameterFormatString="original_{0}">
				<UpdateParameters>
					<asp:Parameter Name="Parameter" Type="Object" />
					<asp:Parameter Name="StampDenomId" Type="Object" />
				</UpdateParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="gvPostalDetails" Name="StampDenomId" PropertyName="SelectedValue"
						Type="Object" />
				</SelectParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsGV" runat="server"
				SelectMethod="GetAllPostalStampDenomDetails" TypeName="IGRSS.BusinessLogicLayer.InwardOutward" DeleteMethod="DeleteStampDenomByStampDenomId">
			</asp:ObjectDataSource>
		</asp:View>
	</asp:MultiView>
</asp:Content>
