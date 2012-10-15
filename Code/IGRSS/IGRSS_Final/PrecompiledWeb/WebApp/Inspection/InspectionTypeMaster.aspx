<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionTypeMaster, App_Web_dvk3xubv" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">


	<asp:FormView ID="FvInspectionTypeMaster" runat="server"  DefaultMode="Insert" DataSourceID="OdsInspectionTypeMaster" OnItemInserting="FvInspectionTypeMaster_ItemInserting" >
	<InsertItemTemplate>
		<table width="100%">
			<tr>
				<td colspan="6">
					<asp:Label ID="lblInspectionTypeMasterIns" runat="server" meta:resourcekey="lblInspectionTypeMasterIns"
						SkinID="SubHeading" Text="Inspection Type Master"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name">
					</asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'>
					</asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
				<td class="labelColumn">
					<asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
						Text="Description"></asp:Label>
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
				<td>
					<asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" />
				</td>
			</tr>
		</table>
	
	
	</InsertItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" InsertMethod="AddNewInspectionTypeMaster" OldValuesParameterFormatString="original_{0}" OnInserting="OdsInspectionTypeMaster_Inserting" SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection"></asp:ObjectDataSource>
</asp:Content>

