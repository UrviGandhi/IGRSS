<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionDetails, App_Web_dvk3xubv" title="Inspection Details Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:FormView ID="FvInspectionDetails" runat="server" DataKeyNames="InspectionId"
		DefaultMode="Insert" Width="750px" OnDataBinding="FvInspectionDetails_DataBinding" meta:resourcekey="FvInspectionDetailsResource1" DataSourceID="odsInspectionDetails">
<InsertItemTemplate>
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblInspectionDetailHeaderIns" runat="server" meta:resourcekey="lblInspectionDetailHeaderIns"
					SkinID="SubHeading" Text="Inspection Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblInspectionTypeIdIns" runat="server" meta:resourcekey="lblInspectionTypeIdIns"
					Text="Inspection Type"></asp:Label>
			</td>
			
			
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectionTypeIdIns" runat="server" meta:resourcekey="ddlInspectionTypeIdIns"
					Text='<%# Bind("InspectionTypeId") %>' DataSourceID="OdsInspectionTypeMaster" DataTextField="Name" DataValueField="InspectionTypeId">
				</asp:DropDownList>
				
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblInspectingOfficerIdIns" runat="server" meta:resourcekey="lblInspectingOfficerIdIns"
					Text="Inspecting Officer"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectingOfficerIdIns" runat="server" meta:resourcekey="ddlInspectingOfficerIdIns"
					Text='<%# Bind("InspectingOfficerId") %>' DataSourceID="OdsEmployeeMaster" DataTextField="FirstName" DataValueField="EmployeeID">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblInspectorOfficeNameIns" runat="server" meta:resourcekey="lblInspectorOfficeNameIns"
					Text="Inspector Office Name"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%" align="left">
				<asp:TextBox ID="txtInspectorOfficeNameIns" runat="server" meta:resourcekey="txtInspectorOfficeNameIns"
					Text='<%# Bind("InspectorOfficeName") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblInspectedOfficeIdIns" runat="server" meta:resourcekey="lblInspectedOfficeIdIns"
					Text="Inspected Office"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectedOfficeIdIns" runat="server" meta:resourcekey="ddlInspectedOfficeIdIns"
					Text='<%# Bind("InspectedOfficeId") %>' DataSourceID="OdsOffice" DataTextField="OfficeName" DataValueField="OfficeId">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblLicenseIdIns" runat="server" meta:resourcekey="lblLicenseIdIns"
					Text="Vendor License"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlLicenseIdIns" runat="server" meta:resourcekey="ddlLicenseIdIns"
					Text='<%# Bind("LicenseId") %>' DataSourceID="OdsLicenseMaster" DataTextField="LicenseNo" DataValueField="LicenseApplicationId">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblCheckListIns" runat="server" meta:resourcekey="lblCheckListIns"
					SkinID="SubHeading" Text="Inspection CheckList Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblInspectionCheckListIdIns" runat="server" meta:resourcekey="lblInspectionCheckListIdIns"
					Text="Check List"></asp:Label>
			</td>
			<td class="textColumn" colspan="2">
				<asp:DropDownList ID="ddlInspectionCheckListIdIns" runat="server" meta:resourcekey="ddlInspectionCheckListIdIns"
					Text='<%# Bind("InspectionCheckListId") %>' DataSourceID="OdsInspectionCheckListMaster" DataTextField="Description" DataValueField="CheckListId">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="textColumn">
				<asp:CheckBox ID="chkbxCheckedIns" runat="server" Checked='<%# Bind("Checked") %>'
					meta:resourcekey="chkbxCheckedIns" Text="Checked" />
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblCheckListremarksIns" runat="server" meta:resourcekey="lblCheckListremarksIns"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%" align="left">
				<asp:TextBox ID="txtCheckListRemarksIns" runat="server" meta:resourcekey="txtCheckListRemarksIns"
					Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnChecklistAddIns" runat="server" meta:resourcekey="btnChecklistAddIns"
					Text="Add" OnClick="btnChecklistAddIns_Click" />
				<asp:Button ID="btnChecklistUpdateIns" runat="server" meta:resourcekey="btnChecklistUpdateIns"
					Text="Update" />
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:GridView ID="GvInspectionCheckListIns" runat="server" AutoGenerateColumns="False"
					CellPadding="4" DataKeyNames="InspectionCheckListId" ForeColor="#333333" GridLines="None"
					Width="100%" OnSelectedIndexChanged="GvInspectionCheckListIns_SelectedIndexChanged" meta:resourcekey="GvInspectionCheckListInsResource1">
					<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
					<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
					<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:BoundField DataField="InspectionId" HeaderText="Inspection Id" Visible="False" meta:resourcekey="BoundFieldResource12" />
						<asp:BoundField DataField="InspectionCheckListId" HeaderText="CheckList Id" Visible="False" meta:resourcekey="BoundFieldResource13" />
						<asp:TemplateField HeaderText="InspectionId" ShowHeader="False" meta:resourcekey="TemplateFieldResource3">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("InspectionId") %>' meta:resourcekey="LinkButton1Resource3"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						
						<asp:BoundField DataField="Checked" HeaderText="Checked" meta:resourcekey="BoundFieldResource14" />
						<asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource15" />
						<asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource3" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblQueriesIns" runat="server" meta:resourcekey="lblQueriesIns" SkinID="SubHeading"
					Text="Queries"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 23%">
				<asp:Label ID="lblQueryChecklistIns" runat="server" meta:resourcekey="lblQueryChecklistIns"
					Text="CheckList"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="ddlCheckListIdIns" runat="server" meta:resourcekey="ddlCheckListId"
					Text='<%# Bind("CheckListId") %>' DataSourceID="OdsInspectionCheckListMaster" DataTextField="Description" DataValueField="CheckListId">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 23%">
				<asp:Label ID="lblQueryIns" runat="server" meta:resourcekey="lblQueryIns" Text="Query"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%" align="left">
				<asp:TextBox ID="txtQueryIns" runat="server" meta:resourcekey="txtQueryIns" Text='<%# Bind("Query") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQueryRemarksIns" runat="server" meta:resourcekey="lblQueryRemarksIns"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%" align="left">
				<asp:TextBox ID="txtQueryRemarksIns" runat="server" meta:resourcekey="txtRemarksIns"
					Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnQueryAddIns" runat="server" meta:resourcekey="btnQueryAddIns"
					Text="Add" OnClick="btnQueryAddIns_Click" />
				<asp:Button ID="btnQueryUpdateIns" runat="server" meta:resourcekey="btnQueryUpdateIns"
					Text="Update" />&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:GridView ID="GvInspectionQueriesIns" runat="server" AutoGenerateColumns="False"
					CellPadding="4" DataKeyNames="QueryId" ForeColor="#333333" GridLines="None" Width="100%" OnRowDeleting="GvInspectionQueriesIns_RowDeleting" meta:resourcekey="GvInspectionQueriesInsResource1">
					<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
					<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
					<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:BoundField DataField="CheckListId" HeaderText="CheckList Id" Visible="False" meta:resourcekey="BoundFieldResource16" />
						<asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource4">
							<ItemTemplate>
							</ItemTemplate>
						</asp:TemplateField>
						
						<asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource17" />
						<asp:BoundField DataField="Query" HeaderText="Query" meta:resourcekey="BoundFieldResource18" />
						<asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource19" />
						<asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource4" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblIsDiscrepancyFoundIns" runat="server" meta:resourcekey="lblIsDiscrepancyFoundIns"
					SkinID="SubHeading"></asp:Label>
				<asp:CheckBox ID="chkIsDiscrepancyFoundIns" runat="server" meta:resourcekey="chkIsDiscrepancyFoundIns"
					Text="Discrepancy Found" />
			</td>
		</tr>
		<tr>
			<td class="labelColumn" >
				<asp:Label ID="lblInspectionRemarksIns" runat="server" meta:resourcekey="lblInspectionRemarksIns"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtInspectionRemarksIns" runat="server" meta:resourcekey="txtInspectionRemarksIns"
					Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnAddIns" runat="server" CommandName="Insert" meta:resourcekey="btnAddIns"
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
				<asp:Label ID="lblInspectionDetailHeaderUpd" runat="server" meta:resourcekey="lblInspectionDetailHeaderUpd"
					SkinID="SubHeading" Text="Inspection Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectionTypeIdUpd" runat="server" meta:resourcekey="lblInspectionTypeIdUpd"
					Text="Inspection Type"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectionTypeIdUpd" runat="server" meta:resourcekey="ddlInspectionTypeIdUpd"
					Text='<%# Bind("InspectionTypeId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblInspectingOfficerIdUpd" runat="server" meta:resourcekey="lblInspectingOfficerIdUpd"
					Text="Inspecting Officer"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectingOfficerIdUpd" runat="server" meta:resourcekey="ddlInspectingOfficerIdUpd"
					Text='<%# Bind("InspectingOfficerId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectorOfficeNameUpd" runat="server" meta:resourcekey="lblInspectorOfficeNameUpd"
					Text="Applicant Address"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtInspectorOfficeNameUpd" runat="server" meta:resourcekey="txtInspectorOfficeNameUpd"
					Text='<%# Bind("InspectorOfficeName") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectedOfficeIdUpd" runat="server" meta:resourcekey="lblInspectedOfficeIdUpd"
					Text="Inspected Office"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlInspectedOfficeIdUpd" runat="server" meta:resourcekey="ddlInspectedOfficeIdUpd"
					Text='<%# Bind("InspectedOfficeId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblLicenseIdUpd" runat="server" meta:resourcekey="lblLicenseIdUpd"
					Text="Vendor License"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlLicenseIdUpd" runat="server" meta:resourcekey="ddlLicenseIdUpd"
					Text='<%# Bind("LicenseId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblCheckListUpd" runat="server" meta:resourcekey="lblCheckListUpd"
					SkinID="SubHeading" Text="Inspection CheckList Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectionCheckListIdUpd" runat="server" meta:resourcekey="lblInspectionCheckListIdUpd"
					Text="Check List"></asp:Label>
			</td>
			<td class="textColumn" colspan="2">
				<asp:DropDownList ID="ddlInspectionCheckListIdUpd" runat="server" meta:resourcekey="ddlInspectionCheckListIdUpd"
					Text='<%# Bind("InspectionCheckListId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="textColumn">
				<asp:CheckBox ID="chkCheckedUpd" runat="server" Checked='<%# Bind("Checked") %>'
					meta:resourcekey="chkCheckedUpd" Text="Checked" />
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblCheckListremarksUpd" runat="server" meta:resourcekey="lblCheckListremarksUpd"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtCheckListremarksUpd" runat="server" meta:resourcekey="txtCheckListremarksUpd"
					Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnChecklistAddUpd" runat="server" meta:resourcekey="btnChecklistAddUpd"
					Text="Add" />
				<asp:Button ID="btnChecklistUpdateUpd" runat="server" meta:resourcekey="btnChecklistUpdateUpd"
					Text="Update" />
				<asp:Button ID="btnChecklistCancelUpd" runat="server" meta:resourcekey="btnChecklistCancelUpd"
					Text="Cancel" />
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataKeyNames="ChecklistInspection" ForeColor="#333333" GridLines="None" Width="100%" meta:resourcekey="GridView1Resource1">
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<EditRowStyle BackColor="#999999" />
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<Columns>
						<asp:BoundField DataField="InspectionId" HeaderText="Inspection Id" Visible="False" meta:resourcekey="BoundFieldResource1" />
						<asp:BoundField DataField="InspectionCheckListId" HeaderText="CheckList Id" Visible="False" meta:resourcekey="BoundFieldResource2" />
						<asp:TemplateField HeaderText="InspectionId" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("InspectionId") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource3" />
						<asp:BoundField DataField="Checked" HeaderText="Checked" meta:resourcekey="BoundFieldResource4" />
						<asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource5" />
						<asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblQueriesUpd" runat="server" meta:resourcekey="lblQueriesUpd" SkinID="SubHeading"
					Text="Queries"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQueryChecklistUpd" runat="server" meta:resourcekey="lblQueryChecklistUpd"
					Text="CheckList"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="ddlCheckListId"
					Text='<%# Bind("CheckListId") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQueryUpd" runat="server" meta:resourcekey="lblQueryUpd" Text="Query"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtQueryUpd" runat="server" meta:resourcekey="txtQueryUpd" Text='<%# Bind("Query") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="textColumn">
				<asp:CheckBox ID="chkReplyReceivedUpd" runat="server" meta:resourcekey="chkreplyreceivedUpd"
					Text='<%# Bind("Received") %>' />
			</td>
			<td colspan="5">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblQueryRemarksUpd" runat="server" meta:resourcekey="lblQueryRemarksUpd"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtQueryRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd"
					Text='<%# Bind("Remarks") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnQueryAddUpd" runat="server" meta:resourcekey="btnQueryAddUpd"
					Text="Add" />
				<asp:Button ID="btnQueryUpdateUpd" runat="server" meta:resourcekey="btnQueryUpdateUpd"
					Text="Update" />
				<asp:Button ID="btnQueryCancelUpd" runat="server" meta:resourcekey="btnQueryCancelUpd"
					Text="Cancel" />
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:GridView ID="gvQueryUpd" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataKeyNames="InspectionQueries" ForeColor="#333333" GridLines="None" Width="100%" meta:resourcekey="gvQueryUpdResource1">
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<EditRowStyle BackColor="#999999" />
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<Columns>
						<asp:BoundField DataField="InspectionId" HeaderText="Inspection Id" Visible="False" meta:resourcekey="BoundFieldResource6" />
						<asp:BoundField DataField="CheckListId" HeaderText="CheckList Id" Visible="False" meta:resourcekey="BoundFieldResource7" />
						<asp:TemplateField HeaderText="InspectionId" ShowHeader="False" meta:resourcekey="TemplateFieldResource2">
							<ItemTemplate>
								<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("InspectionId") %>' meta:resourcekey="LinkButton1Resource2"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource8" />
						<asp:BoundField DataField="Query" HeaderText="Query" meta:resourcekey="BoundFieldResource9" />
						<asp:BoundField DataField="Received" HeaderText="Reply" meta:resourcekey="BoundFieldResource10" />
						<asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource11" />
						<asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblIsDiscrepancyFoundUpd" runat="server" meta:resourcekey="lblIsDiscrepancyFoundUpd"
					SkinID="SubHeading"></asp:Label>
				<asp:CheckBox ID="chkIsDiscrepancyFoundUpd" runat="server" meta:resourcekey="chkIsDiscrepancyFoundUpd"
					Text="Discrepancy Found" />
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectionRemarksUpd" runat="server" meta:resourcekey="lblInspectionRemarksUpd"
					Text="Remarks"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtInspectionRemarksUpd" runat="server" meta:resourcekey="txtInspectionRemarksUpd"
					Text='<%# Bind("Remarks") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnUpdateUpd" runat="server" CommandName="Update" meta:resourcekey="btnUpdate"
					Text="Update" />
				<asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
					Text="Cancel" />
			</td>
		</tr>
	</table>

</EditItemTemplate>
	</asp:FormView>
    <asp:ObjectDataSource ID="odsInspectionDetails" runat="server"></asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeDetails"
		TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateEmployeeMaster">
		<UpdateParameters>
			<asp:Parameter Name="EmployeeID" Type="Object" />
			<asp:Parameter Name="Parameters" Type="Object" />
			<asp:Parameter Name="QualificationDetails" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="dtQualification" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="OdsOffice" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOfficeDetails" TypeName="IGRSS.BusinessLogicLayer.OfficeMaster">
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="OdsLicenseMaster" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetLicenses" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
		UpdateMethod="CancelVendorLicenses">
		<UpdateParameters>
			<asp:Parameter Name="LicenseNo" Type="String" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="RenewedDate" Type="DateTime" />
			<asp:Parameter Name="EffectiveDate" Type="DateTime" />
			<asp:Parameter Name="ExpiryDate" Type="DateTime" />
			<asp:Parameter Name="LicenseApplicationId" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
		InsertMethod="AddNewInspectionDetails" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="OdsInspectionCheckListMaster" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
		InsertMethod="AddNewInspectionDetails" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAllInspectionCheckListMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
	</asp:ObjectDataSource>
	
	
	
</asp:Content>
