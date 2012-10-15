<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionMemo, App_Web_dvk3xubv" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="MvInspectionMemo" runat="server" ActiveViewIndex="1">
		<asp:View ID="viewSearch" runat="server">
			<table width="100%">
				<tr>
					<td>
						<asp:Label ID="lblInspectionFileNo" runat="server" Text="Inspection File No" meta:resourcekey="lblInspectionFileNoResource1"></asp:Label>
					</td>
					<td>
						<asp:TextBox ID="txtInspectionNo" runat="server" Width="265px" meta:resourcekey="txtInspectionNoResource1"></asp:TextBox>
					</td>
					<td>
						<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" meta:resourcekey="btnSearchResource1" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<asp:GridView ID="GvInspectionMemo" runat="server" AutoGenerateColumns="False" DataKeyNames="InspectionId"
							OnSelectedIndexChanged="GvInspectionMemo_SelectedIndexChanged" meta:resourcekey="GvInspectionMemoResource1">
							<EmptyDataTemplate>
								No Data Available!!!
							</EmptyDataTemplate>
							<Columns>
								<asp:BoundField DataField="InspectionId" HeaderText="InspectionId" SortExpression="InspectionId" meta:resourcekey="BoundFieldResource1" />
								<asp:BoundField DataField="InspectedOfficeId" HeaderText="InspectedOfficeId" SortExpression="InspectedOfficeId" meta:resourcekey="BoundFieldResource2" />
								<asp:BoundField DataField="IsDiscrepancyFound" HeaderText="IsDiscrepancyFound" SortExpression="IsDiscrepancyFound" meta:resourcekey="BoundFieldResource3" />
								<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" meta:resourcekey="BoundFieldResource4" />
								<asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="viewInspectionDetails" runat="server">
			<asp:FormView ID="FvInspectionDetailsItm" runat="server" DataSourceID="odsInspectionDetails" meta:resourcekey="FvInspectionDetailsItmResource1">
				<ItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblInspectionDetailHeaderItm" runat="server" meta:resourcekey="lblInspectionDetailHeaderItm"
									SkinID="SubHeading" Text="Inspection Details "></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblInspectionTypeIdItm" runat="server" meta:resourcekey="lblInspectionTypeIdItm"
									Text="Inspection Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlInspectionTypeIdItm" runat="server" DataSourceID="OdsInspectionTypeMaster"
									DataTextField="Name" DataValueField="InspectionTypeId" meta:resourcekey="ddlInspectionTypeIdItm">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblInspectingOfficerIdItm" runat="server" meta:resourcekey="lblInspectingOfficerIdItm"
									Text="Inspecting Officer"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlInspectingOfficerIdItm" runat="server" DataSourceID="OdsEmployeeMaster"
									DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlInspectingOfficerIdItm">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblInspectorOfficeNameItm" runat="server" meta:resourcekey="lblInspectorOfficeNameItm"
									Text="Inspector Office Name"></asp:Label>
							</td>
							<td align="left" colspan="4">
								<asp:TextBox ID="txtInspectorOfficeNameItm" runat="server" meta:resourcekey="txtInspectorOfficeNameItm"
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblInspectedOfficeIdItm" runat="server" meta:resourcekey="lblInspectedOfficeIdItm"
									Text="Inspected Office"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlInspectedOfficeIdItm" runat="server" DataSourceID="OdsOffice"
									DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlInspectedOfficeIdItm">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblLicenseIdItm" runat="server" meta:resourcekey="lblLicenseIdItm"
									Text="Vendor License"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlLicenseIdItm" runat="server" DataSourceID="OdsLicenseMaster"
									DataTextField="LicenseNo" DataValueField="LicenseApplicationId" meta:resourcekey="ddlLicenseIdIns">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
			<asp:MultiView ID="mvMemoDetails" runat="server" ActiveViewIndex="0">
				<asp:View ID="viewMemoGrid" runat="server">
					<asp:Label ID="lblMemoHeading" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
						SkinID="SubHeading" Text="Memos Issued"></asp:Label><br />
					<asp:GridView ID="gvMemo" runat="server" AutoGenerateColumns="False" DataKeyNames="InspectionMemoId"
						DataSourceID="odsMemo" OnSelectedIndexChanged="GvInspectionMemoDetailsIns_SelectedIndexChanged" meta:resourcekey="gvMemoResource1">
						<EmptyDataTemplate>
							No Data Available!!!
						</EmptyDataTemplate>
						<Columns>
							<asp:TemplateField HeaderText="Subject" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
								<EditItemTemplate>
								</EditItemTemplate>
								<ItemStyle HorizontalAlign="Center" />
								<ItemTemplate>
									<asp:LinkButton ID="lnkSubject" runat="server" CausesValidation="False" CommandName="Select"
										Text='<%# Bind("Subject") %>' meta:resourcekey="lnkSubjectResource1"></asp:LinkButton>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="InspectionMemoId" HeaderText="InspectionMemoId" Visible="False" meta:resourcekey="BoundFieldResource5" />
							<asp:BoundField DataField="Subject" HeaderText="Subject" Visible="False" meta:resourcekey="BoundFieldResource6" />
							<asp:BoundField DataField="MemoBody" HeaderText="MemoBody" meta:resourcekey="BoundFieldResource7" />
							<asp:BoundField DataField="MemoDate" HeaderText="MemoDate" meta:resourcekey="BoundFieldResource8" />
							<asp:CommandField ShowSelectButton="True" SelectText="Actions" meta:resourcekey="CommandFieldResource2" />
						</Columns>
					</asp:GridView>
					<asp:Button ID="btnAddNewMemo" runat="server" OnClick="btnAddNewMemo_Click" Text="New Memo"
						Width="79px" meta:resourcekey="btnAddNewMemoResource1" />
					<br />
					<asp:MultiView ID="mvMemoActionTaken" runat="server" ActiveViewIndex="0">
						<asp:View ID="viewActionTakenGrid" runat="server">
							<table width="100%">
								<tr>
									<td colspan="6">
										<asp:Label ID="lblActionTakenHeading" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
											SkinID="SubHeading" Text="Actions Taken"></asp:Label>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<asp:GridView ID="gvMemoActionTaken" runat="server" DataKeyNames="InspectionMemoId"
											DataSourceID="odsMemodetails" AutoGenerateColumns="False" meta:resourcekey="gvMemoActionTakenResource1">
											<Columns>
												<asp:BoundField DataField="InspectionMemoId" HeaderText="InspectionMemoId" meta:resourcekey="BoundFieldResource9" />
												<asp:BoundField DataField="ActionTaken" HeaderText="ActionTaken" meta:resourcekey="BoundFieldResource10" />
												<asp:BoundField DataField="ActionTakenDate" HeaderText="ActionTakenDate" meta:resourcekey="BoundFieldResource11" />
											</Columns>
										</asp:GridView>
									</td>
								</tr>
							</table>
						</asp:View>
						<asp:View ID="viewAddActionTaken" runat="server">
							<asp:FormView ID="fvActionTaken" runat="server" DefaultMode="Insert" DataKeyNames="InspectionMemoId"
								DataSourceID="odsInspectionMemoAction" OnItemInserting="fvActionTaken_ItemInserting" meta:resourcekey="fvActionTakenResource1">
								<InsertItemTemplate>
									<table width="100%">
										<tr>
											<td colspan="6">
												<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
													SkinID="SubHeading" Text="Add Memo Action Taken"></asp:Label>
											</td>
										</tr>
										<tr>
											<td class="labelColumn">
												<asp:Label ID="lblMemoActionDate" runat="server" meta:resourcekey="lblMemoDate" Text="Memo Action Date"></asp:Label>
											</td>
											<td class="textColumn">
												<asp:TextBox ID="txtMemoActionDate" runat="server" meta:resourcekey="txtMemoDate"
													SkinID="calendar" Text='<%# Bind("ActionTakenDate") %>'></asp:TextBox>
												<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtMemoActionDate" meta:resourcekey="PopCalendar1Resource1" />
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
											<td class="labelColumn">
												<asp:Label ID="lblActionBody" runat="server" meta:resourcekey="lblApplicantAddress"
													Text="Memo Action Body"></asp:Label>
											</td>
											<td colspan="4">
												<asp:TextBox ID="txtMemoActionBody" runat="server" meta:resourcekey="txtMemoBody"
													Text='<%# Bind("ActionTaken") %>' TextMode="MultiLine"></asp:TextBox>
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
											<td align="right" class="labelColumn">
												<asp:Button ID="btnAddMemoAction" runat="server" Text="Add" CommandName="Insert" meta:resourcekey="btnAddMemoActionResource1" /></td>
											<td align="left" class="textColumn">
												&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" meta:resourcekey="btnUpdateResource1" /></td>
											<td class="validationColumn">
											</td>
										</tr>
										<tr>
											<td colspan="6" style="height: 26px">
												&nbsp;</td>
										</tr>
									</table>
								</InsertItemTemplate>
							</asp:FormView>
						</asp:View>
					</asp:MultiView></asp:View>
				<asp:View ID="viewAddMemo" runat="server">
					<asp:FormView ID="fvMemo" runat="server" DataKeyNames="InspectionMemoId" DataSourceID="odsMemo"
						DefaultMode="Insert" OnItemInserting="fvMemo_ItemInserting" OnItemInserted="fvMemo_ItemInserted" meta:resourcekey="fvMemoResource1">
						<InsertItemTemplate>
							<table width="100%">
								<tr>
									<td colspan="6">
										<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
											SkinID="SubHeading" Text="Add Memo"></asp:Label>
									</td>
								</tr>
								<tr>
									<td class="labelColumn">
										<asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
											Text="Subject"></asp:Label>
									</td>
									<td class="textColumn">
										<asp:TextBox ID="txtSubjectIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
											Text='<%# Bind("Subject") %>'></asp:TextBox>
									</td>
									<td class="validationColumn">
									</td>
									<td class="labelColumn">
										<asp:Label ID="lblMemoDate" runat="server" meta:resourcekey="lblMemoDate" Text="Memo Date"></asp:Label>
									</td>
									<td class="textColumn">
										<asp:TextBox ID="txtMemoDateIns" runat="server" meta:resourcekey="txtMemoDate" SkinID="calendar"
											Text='<%# Bind("MemoDate") %>'></asp:TextBox>
										<rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtMemoDateIns" meta:resourcekey="PopCalendar2Resource1" />
									</td>
									<td class="validationColumn">
									</td>
								</tr>
								<tr>
									<td class="labelColumn">
										<asp:Label ID="lblApplicantAddress" runat="server" meta:resourcekey="lblApplicantAddress"
											Text="Memo Body"></asp:Label>
									</td>
									<td colspan="4">
										<asp:TextBox ID="txtMemoBodyIns" runat="server" meta:resourcekey="txtMemoBody" Text='<%# Bind("MemoBody") %>'
											TextMode="MultiLine"></asp:TextBox>
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
									<td class="labelColumn" align="right">
									</td>
									<td class="textColumn" align="left">
										&nbsp;</td>
									<td class="validationColumn">
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 26px; text-align: right;">
										&nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Insert" meta:resourcekey="btnAddResource1" /></td>
								</tr>
							</table>
						</InsertItemTemplate>
						<EditItemTemplate>
						</EditItemTemplate>
						<ItemTemplate>
						</ItemTemplate>
					</asp:FormView>
					<asp:HiddenField ID="fldInspectionMemoId" runat="server" Value='<%# Bind("InspectionMemoId") %>' />
					<br />
					<asp:HiddenField ID="fldInspectionId" runat="server" Value='<%# Bind("InspectionId") %>' />
					<br />
					
					
				</asp:View>
			</asp:MultiView>&nbsp;</asp:View>
	</asp:MultiView>
	<asp:ObjectDataSource ID="odsSearch" runat="server" InsertMethod="AddNewInspectionMemoAction"
		OldValuesParameterFormatString="original_{0}" SelectMethod="SearchInspectionDetails"
		TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="txtInspectionNo" Name="InspectorOfficeName" PropertyName="Text"
				Type="String" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="InspectionMemoId" Type="Object" />
			<asp:Parameter Name="InspectionId" Type="Object" />
			<asp:Parameter Name="InspectiontypeId" Type="Object" />
			<asp:Parameter Name="CreationDate" Type="DateTime" />
			<asp:Parameter Name="CreatedBy" Type="String" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
			<asp:Parameter Name="ActionTaken" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
	</asp:ObjectDataSource>
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
	<asp:ObjectDataSource ID="OdsOffice" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
	</asp:ObjectDataSource>
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
	<asp:ObjectDataSource ID="odsInspectionDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
		InsertMethod="AddNewInspectionTypeMaster" OldValuesParameterFormatString="original_{0}"
		SelectMethod="InspectionDetails" TypeName="IGRSS.BusinessLogicLayer.Inspection"
		UpdateMethod="UpdateInspectionItenary">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsMemo" runat="server" InsertMethod="AddNewInspectionMemo"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetInspectionMemoById"
		TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary"
		OnInserting="odsMemo_Inserting">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="InspectionId" Type="Object" />
		</InsertParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="GvInspectionMemo" Name="InspectionId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	<asp:ObjectDataSource ID="odsMemoDetailsById" runat="server" InsertMethod="AddNewInspectionAction"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetInspectionMemoById"
		TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="GvInspectionMemo" Name="InspectionId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="InspectionMemoId" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	<asp:ObjectDataSource ID="odsInspectionMemoAction" runat="server" InsertMethod="AddNewInspectionAction"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetMemoActionByMemoId"
		TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary"
		OnInserting="odsInspectionMemoAction_Inserting">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="fldInspectionMemoId" Name="InspectionMemoId" PropertyName="Value"
				Type="Object" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="InspectionMemoId" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsMemodetails" runat="server" InsertMethod="AddNewInspectionAction"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetMemoActionByMemoId" TypeName="IGRSS.BusinessLogicLayer.Inspection"
		UpdateMethod="UpdateInspectionItenary">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="InspectionMemoId" Type="Object" />
		</InsertParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="fldInspectionMemoId" Name="InspectionMemoId" PropertyName="Value"
				Type="Object" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
</asp:Content>
