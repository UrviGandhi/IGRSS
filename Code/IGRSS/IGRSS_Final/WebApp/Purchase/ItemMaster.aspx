<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="Purchase_ItemMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:FormView ID="FvItemMaster" runat="server" DefaultMode="Insert" DataSourceID="OdsItemMaster" OnItemInserting="FvItemMaster_ItemInserting" OnItemUpdating="FvItemMaster_ItemUpdating">
	
	<InsertItemTemplate>
	
		<table width="100%">
			<tr>
				<td colspan="6">
					<asp:Label ID="lblItemMasterIns" runat="server" meta:resourcekey="lblItemMasterIns"
						SkinID="SubHeading" Text="Item Master"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Item Name"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'>
					</asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
				<td class="labelColumn">
					<asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
						Text="Item Description "></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="txtDescriptionIns" runat="server" meta:resourcekey="txtDescriptionIns"
						Text='<%# Bind("Description") %>'>
					</asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
						</tr>
				
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblUomIDIns" runat="server" meta:resourcekey="lblUomIDIns" Text="Unit Of Management"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlUomIDIns" runat="server" DataSourceID="OdsUOMMaster" DataTextField="Name"
							DataValueField="UomID" SelectedValue='<%# Bind("UomID") %>' Width="165px">
						</asp:DropDownList>
						
						
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						
					</td>
					<td class="textColumn">
					
					</td>
					<td class="validationColumn">
					</td>
				</tr>
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
					<asp:Button ID="btnItemMasterIns" runat="server" CommandName="Insert" Text="Save" />
				</td>
				<td>
				</td>
			</tr>
		</table>
	</InsertItemTemplate>
	
	
	
	</asp:FormView>
	<br />
	<br />


	<asp:ObjectDataSource ID="OdsItemMaster" runat="server" OnInserting="OdsItemMaster_Inserting"
		OnUpdating="OdsItemMaster_Updating" InsertMethod="InsertItemMaster" SelectMethod="GetItemMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
		<UpdateParameters>
			<asp:Parameter Name="VendorID" Type="Object" />
			<asp:Parameter Name="VendorType" Type="String" />
			<asp:Parameter Name="CompanyName" Type="String" />
			<asp:Parameter Name="VendorName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="Phone" Type="String" />
			<asp:Parameter Name="ContactPerson" Type="String" />
			<asp:Parameter Name="CreatedBy" Type="String" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="OdsUOMMaster" runat="server" InsertMethod="InsertVendorMaster"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetUOMMasterTableDetails"
		TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
		<UpdateParameters>
			<asp:Parameter Name="VendorID" Type="Object" />
			<asp:Parameter Name="VendorType" Type="String" />
			<asp:Parameter Name="CompanyName" Type="String" />
			<asp:Parameter Name="VendorName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="Phone" Type="String" />
			<asp:Parameter Name="ContactPerson" Type="String" />
			<asp:Parameter Name="CreatedBy" Type="String" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="VendorID" Type="Object" />
			<asp:Parameter Name="VendorType" Type="String" />
			<asp:Parameter Name="CompanyName" Type="String" />
			<asp:Parameter Name="VendorName" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="Phone" Type="String" />
			<asp:Parameter Name="ContactPerson" Type="String" />
			<asp:Parameter Name="CreatedBy" Type="String" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<br />




</asp:Content>
