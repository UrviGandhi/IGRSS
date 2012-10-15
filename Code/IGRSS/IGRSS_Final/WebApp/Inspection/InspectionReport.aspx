<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="InspectionReport.aspx.cs" Inherits="Inspection_InspectionReport" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table width="100%">
		<tr>
			<td colspan="6" style="height: 18px">
				<asp:Label ID="lblInspectionDetailsHeadingIns" runat="server" meta:resourcekey="lblInspectionDetailsHeadingIns"
					SkinID="SubHeading" Text="Inspection Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblInspectionTypeIdIns" runat="server" meta:resourcekey="lblInspectionTypeIdIns"
					Text="Inspection Type"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtInspectionTypeIdIns" runat="server" meta:resourcekey="txtInspectionTypeIdIns"
					Text='<%# Bind("InspectionTypeId") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblInspectionOfficeIdIns" runat="server" meta:resourcekey="lblInspectionOfficeIdIns"
					Text="Inspection OfficeId"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtInspectionOfficeIdIns" runat="server" meta:resourcekey="txtInspectionOfficeIdIns"
					Text='<%# Bind("InspectionOfficeId") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 2%">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="height: 26px">
				<asp:Label ID="lblLicenseIdIns" runat="server" meta:resourcekey="lblLicenseIdIns"
					Text="License Number"></asp:Label>
			</td>
			<td class="textColumn" style="height: 26px">
				<asp:TextBox ID="txtLicenseIdIns" runat="server" meta:resourcekey="txtLicenseIdIns"
					Text='<%# Bind("LicenseId") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="height: 26px">
			</td>
			<td class="labelColumn" style="height: 26px">
				<asp:Label ID="lblInspectorOfficeNameIns" runat="server" meta:resourcekey="lblInspectorOfficeNameIns"
					Text="Inspector Office Name"></asp:Label>
			</td>
			<td class="textColumn" style="height: 26px">
				<asp:TextBox ID="txtInspectorOfficeNameIns" runat="server" meta:resourcekey="txtInspectorOfficeNameIns"
					Text='<%# Bind("InspectorOfficeName") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 2%; height: 26px;">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblIsDiscrepancyFoundIns" runat="server" meta:resourcekey="lblIsDiscrepancyFoundIns"
					Text="Receipt Number"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:CheckBox ID="chkIsDiscrepancyFoundIns" runat="server" Checked='<%# Bind("IsDiscrepancyFound") %>'
					meta:resourcekey="chkIsDiscrepancyFoundIns" />
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
			</td>
			<td class="textColumn">
			</td>
			<td class="validationColumn" style="width: 2%">
			</td>
		</tr>
	</table>
	<br />
	<asp:FormView ID="FormView1" runat="server" DataKeyNames="RoleId" DataSourceID="odsRoles"
		DefaultMode="Insert" EnableTheming="True">
		<EditItemTemplate>
			RoleId:
			<asp:Label ID="RoleIdLabel1" runat="server" Text='<%# Eval("RoleId") %>'></asp:Label><br />
			RoleName:
			<asp:TextBox ID="RoleNameTextBox" runat="server" Text='<%# Bind("RoleName") %>'>
			</asp:TextBox><br />
			OfficeTypeId:
			<asp:TextBox ID="OfficeTypeIdTextBox" runat="server" Text='<%# Bind("OfficeTypeId") %>'>
			</asp:TextBox><br />
			Description:
			<asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'>
			</asp:TextBox><br />
			CreatedBy:
			<asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'>
			</asp:TextBox><br />
			CreatedAt:
			<asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'>
			</asp:TextBox><br />
			ModifiedBy:
			<asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'>
			</asp:TextBox><br />
			ModifiedAt:
			<asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'>
			</asp:TextBox><br />
			DeletedBy:
			<asp:TextBox ID="DeletedByTextBox" runat="server" Text='<%# Bind("DeletedBy") %>'>
			</asp:TextBox><br />
			DeletedAt:
			<asp:TextBox ID="DeletedAtTextBox" runat="server" Text='<%# Bind("DeletedAt") %>'>
			</asp:TextBox><br />
			IsActive:
			<asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' /><br />
			OfficeTypeName:
			<asp:TextBox ID="OfficeTypeNameTextBox" runat="server" Text='<%# Bind("TypeName") %>'>
			</asp:TextBox><br />
			<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
				Text="Update">
			</asp:LinkButton>
			<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
				Text="Cancel">
			</asp:LinkButton>
		</EditItemTemplate>
		<InsertItemTemplate>
			<asp:Wizard ID="Wizard2" runat="server" OnFinishButtonClick="Wizard2_FinishButtonClick">
				<WizardSteps>
					<asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
						<table>
							<tr>
								<td>
									<asp:Label ID="lblRoleName" runat="server" Text="Role Name"></asp:Label>
								</td>
								<td>
									&nbsp;<asp:TextBox ID="txtRoleName" runat="server" Text='<%# Bind("RoleName") %>'
										Width="250px"></asp:TextBox>
								</td>
								<td>
									<asp:RequiredFieldValidator ID="rfvRoleName" runat="server" ControlToValidate="txtRoleName"
										ErrorMessage="Role Name is required.">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Label ID="Label3" runat="server" Text="Office Type"></asp:Label>
								</td>
								<td>
									<asp:DropDownList ID="ddlOfficeType" runat="server" DataSourceID="odsOfficeTypes"
										DataTextField="OfficeTypeName" DataValueField="OfficeTypeId" SelectedValue='<%# Bind("OfficeTypeId") %>'
										Width="250px">
									</asp:DropDownList>
									&nbsp;&nbsp;</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<asp:Label ID="lblIsActive" runat="server" Text="Active"></asp:Label>
								</td>
								<td style="text-align: left">
									<asp:CheckBox ID="chkIsActive" runat="server" Checked='<%# Bind("IsActive") %>' />
									&nbsp;</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr>
								<td>
									<asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'
										TextMode="MultiLine" Width="250px"></asp:TextBox>
								</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3">
									<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
								</td>
							</tr>
						</table>
					</asp:WizardStep>
					<asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
					</asp:WizardStep>
				</WizardSteps>
			</asp:Wizard>
			<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RoleName") %>' Width="250px"></asp:TextBox>
		</InsertItemTemplate>
		<ItemTemplate>
			RoleId:
			<br />
			RoleName:
			<br />
			OfficeTypeId:
			<br />
			Description:
			<asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>'></asp:Label><br />
			CreatedBy:
			<asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label><br />
			CreatedAt:
			<asp:Label ID="CreatedAtLabel" runat="server" Text='<%# Bind("CreatedAt") %>'></asp:Label><br />
			ModifiedBy:
			<asp:Label ID="ModifiedByLabel" runat="server" Text='<%# Bind("ModifiedBy") %>'></asp:Label><br />
			ModifiedAt:
			<asp:Label ID="ModifiedAtLabel" runat="server" Text='<%# Bind("ModifiedAt") %>'></asp:Label><br />
			DeletedBy:
			<asp:Label ID="DeletedByLabel" runat="server" Text='<%# Bind("DeletedBy") %>'></asp:Label><br />
			DeletedAt:
			<asp:Label ID="DeletedAtLabel" runat="server" Text='<%# Bind("DeletedAt") %>'></asp:Label><br />
			IsActive:
			<asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>'
				Enabled="false" /><br />
			OfficeTypeName:
			<asp:Label ID="OfficeTypeNameLabel" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label><br />
			<br />
			<asp:Wizard ID="Wizard1" runat="server">
				<WizardSteps>
					<asp:WizardStep runat="server" Title="Step 1">
						<asp:Label ID="RoleIdLabel" runat="server" Text='<%# Eval("RoleId") %>'></asp:Label>
						<asp:Label ID="RoleNameLabel" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
						<asp:Label ID="OfficeTypeIdLabel" runat="server" Text='<%# Bind("OfficeTypeId") %>'></asp:Label>
					</asp:WizardStep>
					<asp:WizardStep runat="server" Title="Step 2">
					</asp:WizardStep>
				</WizardSteps>
			</asp:Wizard>
			<br />
			<br />
			<br />
			<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
				Text="Edit"></asp:LinkButton>
			<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
				Text="Delete"></asp:LinkButton>
			<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
				Text="New"></asp:LinkButton>
		</ItemTemplate>
	</asp:FormView>
	<br />
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddNewRole"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetRoles" TypeName="IGRSS.BusinessLogicLayer.RolesManagement"
		UpdateMethod="UpdateRoleInformation" DataObjectTypeName="System.Guid" DeleteMethod="DeleteRole">
		<UpdateParameters>
			<asp:Parameter Name="RoleId" Type="Object" />
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsRoles" runat="server" DeleteMethod="DeleteRole" InsertMethod="AddNewRole"
		SelectMethod="GetRoles" TypeName="IGRSS.BusinessLogicLayer.RolesManagement" UpdateMethod="UpdateRoleInformation">
		<UpdateParameters>
			<asp:Parameter Name="RoleId" Type="Object" />
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsOfficeTypes" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOfficeDetails" TypeName="IGRSS.BusinessLogicLayer.OfficeMaster" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" InsertMethod="AddNewOffices">
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsRoleDetails" runat="server" InsertMethod="AddNewRole"
		SelectMethod="GetRoleDetails" TypeName="IGRSS.BusinessLogicLayer.RolesManagement"
		UpdateMethod="UpdateRoleInformation">
		<UpdateParameters>
			<asp:Parameter Name="RoleId" Type="Object" />
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</UpdateParameters>
		<SelectParameters>
			<asp:Parameter Name="RoleId" Type="Object" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="RoleName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="IsActive" Type="Boolean" />
		</InsertParameters>
	</asp:ObjectDataSource>
</asp:Content>
