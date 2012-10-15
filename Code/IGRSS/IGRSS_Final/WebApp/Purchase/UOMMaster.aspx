<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="UOMMaster.aspx.cs" Inherits="Purchase_UOMMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:FormView ID="FvUOMMaster" runat="server" DefaultMode="Insert" DataSourceID="OdsUOMMaster"
		OnItemInserting="FvUOMMaster_ItemInserting" OnItemUpdating="FvUOMMaster_ItemUpdating">
		<InsertItemTemplate>
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
							SkinID="SubHeading" Text="UOM Master"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblUOMNameIns" runat="server" meta:resourcekey="lblUOMNameIns" Text="UOM Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
							Text='<%# Bind("Name") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblUOMDescriptionIns" runat="server" meta:resourcekey="lblUOMDescriptionIns"
							Text="UOM Description"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtUOMDescriptionIns" runat="server" meta:resourcekey="txtUOMDescriptionIns"
							Text='<%# Bind("Description") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				
				<tr align="center">
				
				
					<td class="labelColumn">
					</td>
					<td class="textColumn">
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
					</td>
					<td class="textColumn">
						<asp:Button ID="BtnUOMMasterSaveIns" runat="server" CommandName="Insert" Text="Save" />
					</td>
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
		<EditItemTemplate>
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
							SkinID="SubHeading" Text="UOM Master"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblUOMNameUpd" runat="server" meta:resourcekey="lblUOMNameUpd" Text="UOM Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtNameUpd" runat="server" meta:resourcekey="txtReceiptNumberUpd"
							Text='<%# Bind("Name") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblUOMDescriptionUpd" runat="server" meta:resourcekey="lblUOMDescriptionUpd"
							Text="UOM Description"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtUOMDescriptionUpd" runat="server" meta:resourcekey="txtUOMDescriptionUpd"
							Text='<%# Bind("Description") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
					</td>
					<td class="textColumn">
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
					</td>
					<td class="textColumn">
						<asp:Button ID="BtnUOMMasterUpd" runat="server" CommandName="Update" Text="Update" />
					</td>
					</td>
				</tr>
			</table>
		</EditItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="OdsUOMMaster" runat="server"
		InsertMethod="InsertUomMaster"
		SelectMethod="GetUOMMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase"
		UpdateMethod="UpdateUomMaster" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="UomID" Type="Object" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	
	
</asp:Content>
