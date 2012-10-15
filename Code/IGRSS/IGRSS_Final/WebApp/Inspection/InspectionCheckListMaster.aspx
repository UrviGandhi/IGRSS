<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="InspectionCheckListMaster.aspx.cs" Inherits="Inspection_InspectionCheckListMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">

	<asp:FormView ID="FvInspectionCheckListMaster" runat="server" DataSourceID="OdsInspectionCheckListMaster"
		DefaultMode="Insert" OnItemInserting="FvInspectionCheckListMaster_ItemInserting">
	
	<InsertItemTemplate>
	
		<table width="100%">
			<tr>
				<td colspan="6">
					<asp:Label ID="lblInspectionCheckListMasterIns" runat="server" meta:resourcekey="lblInspectionCheckListMasterIns"
						SkinID="SubHeading" Text="Inspection CheckList Master"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="lblInspectionTypeIns" runat="server" meta:resourcekey="lblInspectionTypeIns"
						Text="Inspection Type"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:DropDownList ID="ddlInspectionTypeIns" runat="server" DataSourceID="OdsInspectionTypeMaster"
						DataTextField="Name" DataValueField="InspectionTypeId" SelectedValue='<%# Bind("InspectionTypeId") %>'
						Width="165px">
					</asp:DropDownList>
				
				
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
					<asp:Label ID="lblIsActiveIns" runat="server" meta:resourcekey="lblIsActiveIns" Text="Is Active"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:CheckBox ID="chkboxActiveIns" runat="server" Checked='<%# Bind("IsActive") %>'
						meta:resourcekey="chkboxActiveIns">
					</asp:CheckBox>
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
					<asp:Button ID="btnInspectionCheckListMasterIns" runat="server" CommandName="Insert" Text="Save" />
				</td>
				<td>
				</td>
			</tr>
		</table>
	
	
	</InsertItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
		InsertMethod="AddNewInspectionDetails" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="OdsInspectionCheckListMaster" runat="server"
		InsertMethod="AddNewInspectionCheckListMaster" OldValuesParameterFormatString="original_{0}"
		OnInserting="OdsInspectionCheckListMaster_Inserting" SelectMethod="GetAllInspectionCheckListMaster"
		TypeName="IGRSS.BusinessLogicLayer.Inspection"></asp:ObjectDataSource>
	<br />
</asp:Content>

