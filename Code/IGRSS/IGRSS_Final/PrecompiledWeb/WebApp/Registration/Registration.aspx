<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Registration_Registration, App_Web_rkvnn2am" title="Registration Application Form" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
	<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="MvRegistration" runat="server" ActiveViewIndex="0">
		<asp:View ID="ViewRegistration" runat="server">
			&nbsp;</asp:View>
		<asp:View ID="viewValuationForm" runat="server">
			&nbsp;</asp:View>
	</asp:MultiView>
	<asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" DisplaySideBar="False"
		OnFinishButtonClick="Wizard1_FinishButtonClick">
		<WizardSteps>
			<asp:WizardStep runat="server" Title="Step 1">
				<asp:FormView ID="FvRegistration" runat="server" DataKeyNames="RegistrationId" DefaultMode="Insert"
					DataSourceID="odsRegistration" OnItemInserting="FvRegistration_ItemInserting">
					<InsertItemTemplate>
						<table width="100%">
							<tr>
								<td colspan="6">
									<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
										SkinID="SubHeading" Text="Registration Application"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
										Text="Office Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="dlOfficeName" runat="server" DataSourceID="odsOffices" DataTextField="OfficeName"
										DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>' Width="180px">
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblRegistrationTypeIns" runat="server" meta:resourcekey="lblRegistrationTypeIns"
										Text="RegistrationType"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:DropDownList ID="ddlRegistrationTypeIns" runat="server" SelectedValue='<%# Bind("RegistrationTypeId") %>'>
										<asp:ListItem Value="665ad044-7ec7-4376-abbf-be125f4f368f">Property</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblFileNoIns" runat="server" meta:resourcekey="lblFileNoIns" Text="File No"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtFilePrefixIns" runat="server" meta:resourcekey="txtFilePrefixIns"
										Text='<%# Bind("FilePrefix") %>' Width="20%"></asp:TextBox>
									/
									<asp:RequiredFieldValidator ID="ReqfldtxtFilePrefixIns" runat="server" ControlToValidate="txtFilePrefixIns"
										ErrorMessage="File Prefix No can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExptxtFilePrefixIns" runat="server" ControlToValidate="txtFilePrefixIns"
										ErrorMessage="RegExptxtFilePrefixIns" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>
									<asp:TextBox ID="txtFileNoIns" runat="server" meta:resourcekey="txtFileNoIns" Text='<%# Bind("FileSlNo") %>'
										Width="15%"></asp:TextBox>
									/
									<asp:RequiredFieldValidator ID="ReqtxtFileNoIns" runat="server" ControlToValidate="txtFileNoIns"
										ErrorMessage="File Serial No can't be blank">*</asp:RequiredFieldValidator>
									<asp:TextBox ID="txtFileYearIns" runat="server" meta:resourcekey="txtFileYearIns"
										Text='<%# Bind("FileYear") %>' Width="15%"></asp:TextBox>
									<asp:RequiredFieldValidator ID="ReqfldtxtFileYearIns" runat="server" ControlToValidate="txtFileYearIns"
										ErrorMessage="File Year No can't be blank">*</asp:RequiredFieldValidator>
								</td>
								<td class="validationColumn">
								
									<asp:RegularExpressionValidator ID="RegexptxtFileNoIns" runat="server" ControlToValidate="txtFileNoIns"
										ErrorMessage="*" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
									<asp:RegularExpressionValidator ID="RegYear" runat="server" ControlToValidate="txtFileYearIns"
										ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="labelColumn">
									&nbsp;<asp:Label ID="lblApplicationDateIns" runat="server" meta:resourcekey="lblApplicationDateIns"
										Text="Application Date"></asp:Label></td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtApplicationDateIns" runat="server" meta:resourcekey="txtApplicationDateIns"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("ApplnDate","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCalenderApplnDate" runat="server" Control="txtApplicationDateIns" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
										Text="Applicant Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
										Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldApplicantName" runat="server" ControlToValidate="txtApplicantNameIns"
										ErrorMessage="Name Can't Be Blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExpApplicantName" runat="server" ControlToValidate="txtApplicantNameIns"
										ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
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
									<asp:Label ID="lblApplicantAddress" runat="server" meta:resourcekey="lblApplicantAddress"
										Text="Applicant Address"></asp:Label>
								</td>
								<td colspan="4" style="width: 25%" align="left">
									<asp:TextBox ID="txtApplicantAddress" runat="server" TextMode="MultiLine" meta:resourcekey="txtApplicantAddress"
										Text='<%# Bind("ApplnAddress") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblPropertyValueIns" runat="server" meta:resourcekey="lblPropertyValueIns"
										Text="Property Value"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtPropertyValueIns" runat="server" meta:resourcekey="txtPropertyValueIns"
										Text='<%# Bind("PropertyValue") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblIsRentedIns" runat="server" meta:resourcekey="lblIsRentedIns" Text="Is Rented"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:CheckBox ID="ChkIsRentedIns" runat="server" Checked='<%# Bind("IsRented") %>'
										meta:resourcekey="ChkIsRentedIns" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblLeasePeriodFrom" runat="server" meta:resourcekey="lblLeasePeriodFrom"
										Text="Lease Period From"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtReceiptNumberIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("LeasePeriodFrom","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCatxtReceiptNumberIns" runat="server" Control="txtReceiptNumberIns" />
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblLeasePeriodToIns" runat="server" meta:resourcekey="lblLeasePeriodToIns"
										Text="Lease Period To"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtLeasePeriodToIns" runat="server" meta:resourcekey="txtLeasePeriodToIns"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("LeasePeriodTo","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCaltxtLeasePeriodToIns" runat="server" Control="txtLeasePeriodToIns" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblDepositAmount" runat="server" meta:resourcekey="lblDepositAmount"
										Text="Deposit Amount"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtDepositAmount" runat="server" meta:resourcekey="txtDepositAmount"
										Text='<%# Bind("DepositAmount") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
										Text="Tax"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtTaxIns" runat="server" meta:resourcekey="txtTaxIns" Text='<%# Bind("Tax") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblYearlyRentIns" runat="server" meta:resourcekey="lblYearlyRentIns"
										Text="Yearly Rent"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtYearlyRentIns" runat="server" meta:resourcekey="txtYearlyRentIns"
										Text='<%# Bind("YearlyRent") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblStampDutyUsedIns" runat="server" meta:resourcekey="lblStampDutyUsedIns"
										Text="Stamp Duty Used"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtStampDutyUsedIns" runat="server" meta:resourcekey="txtStampDutyUsedIns"
										Text='<%# Bind("StampDutyUsed") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								
								
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblRegistrationPartyDetailsIns" runat="server" meta:resourcekey="lblRegistrationPartyDetailsIns"
										SkinID="SubHeading" Text="Party Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblPartyTypeIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
										Text="Party Type"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlPartyTypeIns" runat="server" DataSourceID="xdsPartyType"
										DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("PartyType") %>'>
										
									</asp:DropDownList>
									
									<%--<asp:DropDownList ID="ddlPartyType" runat="server" SelectedValue='<%# Bind("PartyType") %>'>
										<asp:ListItem>S</asp:ListItem>
										<asp:ListItem>B</asp:ListItem>
										<asp:ListItem>I</asp:ListItem>
										<asp:ListItem>C</asp:ListItem>
									</asp:DropDownList>--%>
										
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqFldValNameIns" runat="server" ControlToValidate="txtNameIns"
										ErrorMessage="Party Name Can't Be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexpName" runat="server" ControlToValidate="txtNameIns"
										ErrorMessage="Party Name is not in correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
										ValidationGroup="PartyDetails">*</asp:RegularExpressionValidator></td>
								<td class="validationColumn">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblAddressIns" runat="server" meta:resourcekey="lblAddressIns" Text="Address"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAddressIns" runat="server" meta:resourcekey="txtAddressIns" Text='<%# Bind("Address") %>'
										TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAddress" runat="server" ControlToValidate="txtAddressIns"
										ErrorMessage="Address Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblAgeIns" runat="server" meta:resourcekey="lblAgeIns" Text="Age"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAgeIns" runat="server" meta:resourcekey="txtAgeIns" Text='<%# Bind("Age") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAgeIns" runat="server" ControlToValidate="txtAgeIns"
										ErrorMessage="Age Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblGenderIns" runat="server" meta:resourcekey="lblGenderIns" Text="Gender"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtGenderIns" runat="server" meta:resourcekey="txtGenderIns" Text='<%# Bind("Gender") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtGenderIns" runat="server" ControlToValidate="txtGenderIns"
										ErrorMessage="Gendor Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblReligion" runat="server" meta:resourcekey="lblReligion" Text="Religion"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlReligionIns" runat="server" DataTextField="H" DataValueField="H"
										SelectedValue='<%# Bind("Religion") %>' Width="157px">
										<asp:ListItem Selected="True" Value="28aa5892-f80e-4bbe-bcd7-ea02afd9461b">Hindu</asp:ListItem>
										<asp:ListItem Value="b08d0268-7f53-4382-af0b-7a82d7844fdc">Muslim</asp:ListItem>
										<asp:ListItem Value="6e4e8574-a692-4c0a-a1c9-6877857028eb">Others</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblOccupationIns" runat="server" meta:resourcekey="lblOccupationIns"
										Text="Occupation"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtOccupationIns" runat="server" meta:resourcekey="txtOccupationIns"
										Text='<%# Bind("Occupation") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtOccupationIns" runat="server" ControlToValidate="txtOccupationIns"
										ErrorMessage="Occupation Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblPANIns" runat="server" meta:resourcekey="lblPANIns" Text="PAN"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtPANIns" runat="server" meta:resourcekey="txtPANIns" Text='<%# Bind("PAN") %>'></asp:TextBox>
									<asp:RequiredFieldValidator ID="ReqfldtxtPANIns" runat="server" ControlToValidate="txtPANIns"
										ErrorMessage="PAN No Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="validationColumn">
									<asp:Button ID="btnAddPartyDetailsIns" runat="server" Text="Add" ValidationGroup="PartyDetails"
										OnClick="btnAddPartyDetails_Click" />
									<asp:Button ID="btnUpdatePartyDetailsIns" runat="server" Text="Update" ValidationGroup="PartyDetails"
										OnClick="btnUpdatePartyDetailsIns_Click" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:GridView ID="GvPartyDetailsIns" runat="server" AutoGenerateColumns="false" DataKeyNames="PartyID"
										OnRowDeleting="GvPartyDetailsIns_RowDeleting" OnSelectedIndexChanged="GvPartyDetailsIns_SelectedIndexChanged">
										<Columns>
											<asp:BoundField DataField="PartyID" HeaderText="PartyID" Visible="False" />
											<asp:BoundField DataField="RegistrationId" HeaderText="RegistrationId" Visible="False" />
											<asp:BoundField DataField="PartyType" HeaderText="PartyType" />
											<asp:BoundField DataField="Name" HeaderText="Name" />
											<asp:BoundField DataField="Address" HeaderText="Address " />
											<asp:BoundField DataField="Age" HeaderText="Age" />
											<asp:BoundField DataField="Gender" HeaderText="Gender" />
											<asp:BoundField DataField="Religion" HeaderText="Religion" Visible="false" />
											<asp:BoundField DataField="Occupation" HeaderText="Occupation" />
											<asp:BoundField DataField="PAN" HeaderText="PAN" />
											<asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" />
											<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
										</Columns>
									</asp:GridView>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblFeeDetailsHeaderIns" runat="server" meta:resourcekey="lblFeeDetailsHeaderIns"
										SkinID="SubHeading" Text="Fee Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblFeeTypeIns" runat="server" meta:resourcekey="lblFeeTypeIns" Text="Fee"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlFeeTypeIns" runat="server" DataSourceID="odsFeeMaster" DataTextField="Name"
										DataValueField="FeeId">
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn">
									<asp:Label ID="lblFeeAmountIns" runat="server" meta:resourcekey="lblFeeAmountIns"
										Text="Amount"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtFeeAmountIns" runat="server" meta:resourcekey="txtFeeAmountIns"
										ValidationGroup="FeeDetails"></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegExptxtFeeAmountIns" runat="server" ControlToValidate="txtFeeAmountIns"
										ErrorMessage="Fee Amount must be Numeric" ValidationExpression="^\d+$" ValidationGroup="FeeDetails">*</asp:RegularExpressionValidator>
									<asp:RequiredFieldValidator ID="ReqFldtxtFeeAmountIns" runat="server" ControlToValidate="txtFeeAmountIns"
										ErrorMessage="Enter Fee Amount" ValidationGroup="FeeDetails">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="6">
									<asp:Button ID="btnUpdateFeeDetailIns" runat="server" Text="Update" ValidationGroup="FeeDetails"
										Visible="false" />
									<asp:Button ID="btnAddFeeDetailIns" runat="server" OnClick="AddFeeDetails_Click"
										Text="Add" ValidationGroup="FeeDetails" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:GridView ID="gvFeeStampDetailsIns" runat="server" AutoGenerateColumns="false"
										DataKeyNames="RegistrationId,FeeId" meta:resourcekey="gvFeeStampDetails" OnRowDeleting="gvFeeStampDetailsIns_RowDeleting">
										<EmptyDataTemplate>
											No Data Available!!!
										</EmptyDataTemplate>
										
									
										<Columns>
											<asp:TemplateField HeaderText="Fee Id" SortExpression="FeeId" Visible="False">
												<EditItemTemplate>
													&nbsp;<asp:Label ID="lbleFeeId" runat="server"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblFeeId" runat="server" Text='<%# Bind("FeeId") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Amount" SortExpression="Amount">
												<EditItemTemplate>
													<asp:Label ID="lbleFeeAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblFeeAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="ID" SortExpression="AdjudicationId" Visible="false">
												<EditItemTemplate>
													&nbsp;<asp:Label ID="lbleAdjID" runat="server" Text='<%# Bind("RegistrationId") %>'></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblAdjID" runat="server" Text='<%# Bind("RegistrationId") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:CommandField SelectText="Update" ShowSelectButton="True" />
											<asp:CommandField ShowDeleteButton="True" />
										</Columns>
									</asp:GridView>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblDocumentDetailsHeaderIns" runat="server" meta:resourcekey="lblDocumentDetailsHeaderIns"
										SkinID="SubHeading" Text="Document Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblDocumentTypeIns" runat="server" meta:resourcekey="lblDocumentTypeIns"
										Text="Document Type"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlDocumentTypeIns" runat="server" DataSourceID="odsGetDocument"
										DataTextField="Name" DataValueField="DocumentTypeId" meta:resourcekey="ddlDocumentTypeIns">
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn">
									<asp:Label ID="lvlDocumentNumberIns" runat="server" meta:resourcekey="lvlDocumentNumberIns"
										Text="Document Number"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtDocumentNumberIns" runat="server" meta:resourcekey="txtDocumentNumberIns"
										ValidationGroup="DocumentDetails"></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldValtxtDocumentNumberIns" runat="server" ControlToValidate="txtDocumentNumberIns"
										ErrorMessage="Enter Document No" ValidationGroup="DocumentDetails">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtDocumentNumberIns" runat="server" ControlToValidate="txtDocumentNumberIns"
										ErrorMessage="Enter Document No in correct format" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<%--<tr>
								<td class="validationColumn">
									<asp:Label ID="lblDocRemarksIns" runat="server" meta:resourcekey="lblDocRemarksIns"
										Text="Doc Remarks" Width="153px"></asp:Label>
								</td>
								<td colspan="6" style="width: 25%">
									<asp:TextBox ID="txtDocRemarksIns" runat="server" meta:resourcekey="txtDocRemarksIns"
										TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>--%>
							<tr>
                        <td colspan="6">
                            <uc1:FileForward id="FileForward1" runat="server"  EnableViewState="true">
                            </uc1:FileForward>
                            </td>
                        </tr>
							<tr>
								<td>
									<asp:CheckBox ID="chkSubmittedIns" runat="server" meta:resourcekey="chkSubmittedIns"
										Text="Has Submitted?" Width="151px" />
								</td>
								<td>
									<asp:Button ID="btnAddDocumentIns" runat="server" OnClick="AddDocumentDetails_Click"
										Text="Add" ValidationGroup="DocumentDetails" />
								</td>
							</tr>
							<tr>
								<td align="right" colspan="6" style="height: 26px">
									<asp:Button ID="btnUpdateDocumentIns" runat="server" Text="Update" ValidationGroup="DocumentDetails"
										Visible="false" /></td>
							</tr>
							
							<tr>
								<td colspan="6">
									<asp:GridView ID="gvDocumentIns" runat="server" AutoGenerateColumns="false" DataKeyNames="RegistrationId,DocumentTypeId"
										meta:resourcekey="gvDocumentsInsResource1" OnRowDeleting="gvDocumentIns_RowDeleting">
										
										<Columns>
											<asp:TemplateField HeaderText="Document Id" SortExpression="DocumentTypeId" Visible="False">
												<EditItemTemplate>
													<asp:Label ID="lbleDocumentId" runat="server"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="DocumentId" runat="server" Text='<%# Bind("DocumentTypeId") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											
											<asp:TemplateField HeaderText="Document No" SortExpression="DocumentNo">
												<EditItemTemplate>
													<asp:Label ID="lbleDocumentNo" runat="server"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblDocumentNo" runat="server" Text='<%# Bind("DocumentNumber") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
												<EditItemTemplate>
													<asp:Label ID="lbleRemarks" runat="server"></asp:Label>
												</EditItemTemplate>
												<ItemTemplate>
													<asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
												</ItemTemplate>
											</asp:TemplateField>
											<asp:CheckBoxField DataField="Submitted" HeaderText="Submitted" SortExpression="Submitted" />
											<asp:CommandField SelectText="Update" ShowSelectButton="True" />
											<asp:CommandField ShowDeleteButton="true" />
										</Columns>
									</asp:GridView>
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
									
								</td>
								<td class="validationColumn">
									</td>
							</tr>
						</table>
					</InsertItemTemplate>
					<EditItemTemplate>
						<table width="100%">
							<tr>
								<td colspan="6">
									<asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
										SkinID="SubHeading" Text="Registration Application"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblReceiptNumberUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
										Text="Office Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="dlOfficeName" runat="server" DataSourceID="odsOffices" DataTextField="OfficeName"
										DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>' Width="180px">
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblRegistrationTypeUpd" runat="server" meta:resourcekey="lblRegistrationTypeUpd"
										Text="RegistrationType"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:DropDownList ID="ddlRegistrationTypeUpd" runat="server">
										<asp:ListItem>Property</asp:ListItem>
										<asp:ListItem>Land</asp:ListItem>
										<asp:ListItem>Marriage</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblFileNoUpd" runat="server" meta:resourcekey="lblFileNoUpd" Text="File No"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtFilePrefixUpd" runat="server" meta:resourcekey="txtFilePrefixUpd"
										Text='<%# Bind("FilePrefix") %>' Width="20%"></asp:TextBox>
									/
									<asp:RequiredFieldValidator ID="ReqfldtxtFilePrefixUpd" runat="server" ControlToValidate="txtFilePrefixUpd"
										ErrorMessage="File Prefix No can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExptxtFilePrefixUpd" runat="server" ControlToValidate="txtFilePrefixUpd"
										ErrorMessage="RegExptxtFilePrefixUpd" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>
									<asp:TextBox ID="txtFileNoUpd" runat="server" meta:resourcekey="txtFileNoUpd" Text='<%# Bind("FileSlNo") %>'
										Width="15%"></asp:TextBox>
									/
									<asp:RequiredFieldValidator ID="ReqtxtFileNoUpd" runat="server" ControlToValidate="txtFileNoUpd"
										ErrorMessage="File Serial No can't be blank">*</asp:RequiredFieldValidator>
									<asp:TextBox ID="txtFileYearUpd" runat="server" meta:resourcekey="txtFileYearUpd"
										Text='<%# Bind("FileYear") %>' Width="15%"></asp:TextBox>
									<asp:RequiredFieldValidator ID="ReqfldtxtFileYearUpd" runat="server" ControlToValidate="txtFileYearUpd"
										ErrorMessage="File Year No can't be blank">*</asp:RequiredFieldValidator>
								</td>
								<td class="validationColumn">
									<%--<asp:RegularExpressionValidator ID="RegFileNo" runat="server" ControlToValidate="txtFileNoUpd"
									ValidationExpression="<%$ Resources:ValidationRegx, PinCode %>">*</asp:RegularExpressionValidator>--%>
									<asp:RegularExpressionValidator ID="RegexptxtFileNoUpd" runat="server" ControlToValidate="txtFileNoUpd"
										ErrorMessage="*" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
									<asp:RegularExpressionValidator ID="RegYear" runat="server" ControlToValidate="txtFileYearUpd"
										ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="labelColumn">
									&nbsp;<asp:Label ID="lblApplicationDateUpd" runat="server" meta:resourcekey="lblApplicationDateUpd"
										Text="Application Date"></asp:Label></td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtApplicationDateUpd" runat="server" meta:resourcekey="txtApplicationDateUpd"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("ApplnDate","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCalenderApplnDate" runat="server" Control="txtApplicationDateUpd" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblApplicantNameUpd" runat="server" meta:resourcekey="lblApplicantNameUpd"
										Text="Applicant Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtApplicantNameUpd" runat="server" meta:resourcekey="txtApplicantNameUpd"
										Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldApplicantName" runat="server" ControlToValidate="txtApplicantNameUpd"
										ErrorMessage="Name Can't Be Blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExpApplicantName" runat="server" ControlToValidate="txtApplicantNameUpd"
										ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
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
									<asp:Label ID="lblApplicantAddress" runat="server" meta:resourcekey="lblApplicantAddress"
										Text="Applicant Address"></asp:Label>
								</td>
								<td align="left" colspan="4" style="width: 25%">
									<asp:TextBox ID="txtApplicantAddress" runat="server" meta:resourcekey="txtApplicantAddress"
										Text='<%# Bind("ApplnAddress") %>' TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblPropertyValueUpd" runat="server" meta:resourcekey="lblPropertyValueUpd"
										Text="Property Value"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtPropertyValueUpd" runat="server" meta:resourcekey="txtPropertyValueUpd"
										Text='<%# Bind("PropertyValue") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblIsRentedUpd" runat="server" meta:resourcekey="lblIsRentedUpd" Text="Is Rented"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:CheckBox ID="ChkIsRentedUpd" runat="server" meta:resourcekey="ChkIsRentedUpd" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblLeasePeriodFrom" runat="server" meta:resourcekey="lblLeasePeriodFrom"
										Text="Lease Period From"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtReceiptNumberUpd" runat="server" meta:resourcekey="txtReceiptNumberUpd"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("LeasePeriodFrom","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCatxtReceiptNumberUpd" runat="server" Control="txtReceiptNumberUpd" />
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblLeasePeriodToUpd" runat="server" meta:resourcekey="lblAdjudicationTotalFeesUpd"
										Text="Lease Period To"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtLeasePeriodToUpd" runat="server" meta:resourcekey="txtLeasePeriodToUpd"
										ReadOnly="true" SkinID="Calendar" Text='<%# Bind("LeasePeriodTo","{0:d}") %>'></asp:TextBox>
									<rjs:PopCalendar ID="PopCaltxtLeasePeriodToUpd" runat="server" Control="txtLeasePeriodToUpd" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblDepositAmount" runat="server" meta:resourcekey="lblDepositAmount"
										Text="Deposit Amount"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtDepositAmount" runat="server" meta:resourcekey="txtDepositAmount"
										Text='<%# Bind("DepositAmount") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblAdjudicationTotalFeesUpd" runat="server" meta:resourcekey="lblAdjudicationTotalFeesUpd"
										Text="Tax"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtTaxUpd" runat="server" meta:resourcekey="txtTaxUpd" Text='<%# Bind("Tax") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblYearlyRentUpd" runat="server" meta:resourcekey="lblYearlyRentUpd"
										Text="Yearly Rent"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtYearlyRentUpd" runat="server" meta:resourcekey="txtYearlyRentUpd"
										Text='<%# Bind("YearlyRent") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblStampDutyUsedUpd" runat="server" meta:resourcekey="lblStampDutyUsedUpd"
										Text="Stamp Duty Used"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtStampDutyUsedUpd" runat="server" meta:resourcekey="txtStampDutyUsedUpd"
										Text='<%# Bind("StampDutyUsed") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblRegistrationPartyDetailsUpd" runat="server" meta:resourcekey="lblRegistrationPartyDetailsUpd"
										SkinID="SubHeading" Text=" Registration Party Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblPartyTypeUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
										Text="Party Type"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlPartyType" runat="server" SelectedValue='<%# Bind("PartyType") %>'>
										<asp:ListItem>Seller</asp:ListItem>
										<asp:ListItem>Buyer</asp:ListItem>
										<asp:ListItem>Identifier</asp:ListItem>
										<asp:ListItem>Confirmer</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtNameUpd" runat="server" meta:resourcekey="txtNameUpd" Text='<%# Bind("Name") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqFldValNameUpd" runat="server" ControlToValidate="txtNameUpd"
										ErrorMessage="Party Name Can't Be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexpName" runat="server" ControlToValidate="txtNameUpd"
										ErrorMessage="Party Name is not in correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
										ValidationGroup="PartyDetails">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblAddressUpd" runat="server" meta:resourcekey="lblAddressUpd" Text="Address"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAddressUpd" runat="server" meta:resourcekey="txtAddressUpd" Text='<%# Bind("Address") %>'
										TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAddress" runat="server" ControlToValidate="txtAddressUpd"
										ErrorMessage="Address Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblAgeUpd" runat="server" meta:resourcekey="lblAgeUpd" Text="Age"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAgeUpd" runat="server" meta:resourcekey="txtAgeUpd" Text='<%# Bind("Age") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAgeUpd" runat="server" ControlToValidate="txtAgeUpd"
										ErrorMessage="Age Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblGenderUpd" runat="server" meta:resourcekey="lblGenderUpd" Text="Gender"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtGenderUpd" runat="server" meta:resourcekey="txtGenderUpd" Text='<%# Bind("Gender") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtGenderUpd" runat="server" ControlToValidate="txtGenderUpd"
										ErrorMessage="Gendor Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblReligion" runat="server" meta:resourcekey="lblReligion" Text="Religion"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlReligion" runat="server" SelectedValue='<%# Bind("Religion") %>'
										Width="157px">
										<asp:ListItem>Hindu</asp:ListItem>
										<asp:ListItem>Muslim</asp:ListItem>
										<asp:ListItem>Others</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblOccupationUpd" runat="server" meta:resourcekey="lblOccupationUpd"
										Text="Occupation"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtOccupationUpd" runat="server" meta:resourcekey="txtOccupationUpd"
										Text='<%# Bind("Occupation") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtOccupationUpd" runat="server" ControlToValidate="txtOccupationUpd"
										ErrorMessage="Occupation Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblPANUpd" runat="server" meta:resourcekey="lblPANUpd" Text="PAN"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtPANUpd" runat="server" meta:resourcekey="txtPANUpd" Text='<%# Bind("PAN") %>'></asp:TextBox>
									<asp:RequiredFieldValidator ID="ReqfldtxtPANUpd" runat="server" ControlToValidate="txtPANUpd"
										ErrorMessage="PAN No Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								</td>
								<td class="validationColumn">
									<asp:Button ID="btnAddPartyDetailsUpd" runat="server" OnClick="btnAddPartyDetails_Click"
										Text="Add" ValidationGroup="PartyDetails" />
									<asp:Button ID="btnUpdatePartyDetailsUpd" runat="server" Text="Update" ValidationGroup="PartyDetails" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:GridView ID="GvPartyDetailsUpd" runat="server" AutoGenerateColumns="false" DataKeyNames="PartyID"
										OnRowDeleting="GvPartyDetailsIns_RowDeleting" OnSelectedIndexChanged="GvPartyDetailsIns_SelectedIndexChanged">
										<Columns>
											<asp:BoundField DataField="PartyID" HeaderText="PartyID" Visible="False" />
											<asp:BoundField DataField="RegistrationId" HeaderText="RegistrationId" Visible="False" />
											<asp:BoundField DataField="PartyType" HeaderText="PartyType" />
											<asp:BoundField DataField="Name" HeaderText="Name" />
											<asp:BoundField DataField="Address" HeaderText="Address " />
											<asp:BoundField DataField="Age" HeaderText="Age" />
											<asp:BoundField DataField="Gender" HeaderText="Gender" />
											<asp:BoundField DataField="Occupation" HeaderText="Occupation" />
											<asp:BoundField DataField="PAN" HeaderText="PAN" />
											<asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" />
											<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
										</Columns>
									</asp:GridView>
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
									<asp:Button ID="btnSave" runat="server" Text="Valuation Form" Width="113px" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
						</table>
					</EditItemTemplate>
				</asp:FormView>
			</asp:WizardStep>
			<asp:WizardStep runat="server" Title="Step 2">
				<asp:FormView ID="FvValuationForm" runat="server" DataKeyNames="AdjudicationId,ValuationFormId"
					DataSourceID="odsValuationForm" DefaultMode="Insert" OnItemInserting="FvValuationForm_ItemInserting">
					<InsertItemTemplate>
						<table width="100%">
							<tr>
								<td colspan="6" style="height: 18px">
									<asp:Label ID="lblPropertyDetailsHeadingIns" runat="server" meta:resourcekey="lblPropertyDetailsHeadingIns"
										SkinID="SubHeading" Text="Property Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblDistNameIns" runat="server" meta:resourcekey="lblDistNameIns" Text="Village/City Name"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtDistNameIns" runat="server" meta:resourcekey="txtDistNameIns"
										Text='<%# Bind("Village_CityName") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn" style="width: 23%">
									<asp:Label ID="lblTpSchemeNoIns" runat="server" meta:resourcekey="lblTpSchemeNoIns"
										Text="T.P Scheme No"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtTpSchemeNoIns" runat="server" meta:resourcekey="txtTpSchemeNoIns"
										Text='<%# Bind("TPSchemeNo") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblTpSchemeNameIns" runat="server" meta:resourcekey="lblTpSchemeNameIns"
										Text="T.P Scheme Name"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtTpSchemeNameIns" runat="server" meta:resourcekey="txtTpSchemeNameIns"
										Text='<%# Bind("TPSchemeName") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn" style="width: 23%">
									<asp:Label ID="lblFinalPlotNoIns" runat="server" meta:resourcekey="lblFinalPlotNoIns"
										Text="Final Plot No"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtFinalPlotNoIns" runat="server" meta:resourcekey="txtFinalPlotNoIns"
										Text='<%# Bind("FinalPlotNo") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblCitySurveyNoIns" runat="server" meta:resourcekey="lblCitySurveyNoIns"
										Text="City Survey No"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtCitySurveyNoIns" runat="server" meta:resourcekey="txtCitySurveyNoIns"
										Text='<%# Bind("CitySurveyNo") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn" style="width: 23%">
									&nbsp;<asp:Label ID="lblRevenueSurveyNoIns" runat="server" meta:resourcekey="lblRevenueSurveyNoIns"
										Text="Revenue Survey No"></asp:Label></td>
								<td class="textColumn">
									<asp:TextBox ID="txtRevenueSurveyNoIns" runat="server" meta:resourcekey="txtRevenueSurveyNoIns"
										Text='<%# Bind("RevenueSurveyNo") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblWard_SubWardNoIns" runat="server" meta:resourcekey="lblWard_SubWardNoIns"
										Text="Ward/SubWard No"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtWard_SubWardNoIns" runat="server" meta:resourcekey="txtWard_SubWardNoIns"
										Text='<%# Bind("Ward_SubWardNo") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn" style="width: 23%">
								</td>
								<td class="textColumn">
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblPartyDetailsIns" runat="server" meta:resourcekey="lblPartyDetailsIns"
										SkinID="SubHeading" Text="Party Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblNameOfOwnerIns" runat="server" meta:resourcekey="lblNameOfOwnerIns"
										Text="Name Of Owner"></asp:Label>
								</td>
								<td colspan="4">
									<asp:TextBox ID="txtNameOfOwnerIns" runat="server" meta:resourcekey="txtNameOfOwnerIns"
										Text='<%# Bind("NameOfOwner") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqFldValOwnerNameIns" runat="server" ControlToValidate="txtNameOfOwnerIns">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtNameOfOwnerIns"
										ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblAddressOfOwnerIns" runat="server" meta:resourcekey="lblAddressOfOwnerIns"
										Text="Address Of Owner"></asp:Label>
								</td>
								<td colspan="3" style="width: 25%">
									<asp:TextBox ID="txtAddressOfOwnerIns" runat="server" meta:resourcekey="txtAddressOfOwnerIns"
										Text='<%# Bind("AddressOfOwner") %>' TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAddressOfOwnerIns" runat="server" ControlToValidate="txtAddressOfOwnerIns"
										ErrorMessage="Address of Owner">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExprValtxtNameOfOwnerIns" runat="server" ControlToValidate="txtNameOfOwnerIns"
										ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator></td>
								<td class="labelColumn">
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqFldValAddressOwnerIns" runat="server" ControlToValidate="txtAddressOfOwnerIns">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblNameOfClaimingPartyIns" runat="server" meta:resourcekey="lblNameOfClaimingPartyIns"
										Text="Claiming Party Name"></asp:Label>
								</td>
								<td colspan="4">
									<asp:TextBox ID="txtNameOfClaimingPartyIns" runat="server" meta:resourcekey="txtNameOfClaimingPartyIns"
										Text='<%# Bind("NameOfClaimingParty") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqFldValNameOfCLaimingPartyIns" runat="server" ControlToValidate="txtNameOfClaimingPartyIns">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtNameOfClaimingPartyIns" runat="server"
										ControlToValidate="txtNameOfClaimingPartyIns" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblAddressOfClaimingPartyIns" runat="server" meta:resourcekey="lblAddressOfClaimingPartyIns"
										Text="Address Of Claiming Party"></asp:Label>
								</td>
								<td colspan="3">
									<asp:TextBox ID="txtAddressOfClaimingPartyIns" runat="server" meta:resourcekey="txtAddressOfClaimingPartyIns"
										Text='<%# Bind("AddressOfClaimingParty") %>' TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:Label ID="lblPropertyDescriptionHeaderIns" runat="server" meta:resourcekey="lblPropertyDescriptionHeaderIns"
										SkinID="SubHeading" Text="Property Description Header"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblAreaOfPlotIns" runat="server" meta:resourcekey="lblAreaOfPlotIns"
										Text="Area(Sq mts)"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtAreaOfPlotIns" runat="server" meta:resourcekey="txtAreaOfPlotIns"
										Text='<%# Bind("AreaOfPlot") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
										ErrorMessage="Area Of Plot can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
										ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn" style="width: 23%">
									<asp:Label ID="lblAreaOfConstructionIns" runat="server" meta:resourcekey="lblAreaOfConstructionIns"
										Text="Plinth Area & No of Floors"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAreaOfConstructionIns" runat="server" meta:resourcekey="txtAreaOfConstructionIns"
										Text='<%# Bind("AreaOfConstruction") %>' Width="45%"></asp:TextBox>
									<asp:TextBox ID="txtNoOfFloorsIns" runat="server" meta:resourcekey="txtNoOfFloorsIns"
										Text='<%# Bind("NoOfFloors") %>' Width="45%"></asp:TextBox></td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfConstructionIns" runat="server" ControlToValidate="txtAreaOfConstructionIns"
										ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExptxtAreaOfConstructionIns" runat="server"
										ControlToValidate="txtAreaOfConstructionIns" ErrorMessage="Enter values is not in correct format"
										ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
									<asp:RequiredFieldValidator ID="ReqfldtxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
										ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegExptxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
										ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblYearOfConstructionIns" runat="server" meta:resourcekey="lblYearOfConstructionIns"
										Text="Year of Construction"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtYearOfConstructionIns" runat="server" meta:resourcekey="txtYearOfConstructionIns"
										Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtYearOfConstructionIns" runat="server" ControlToValidate="txtYearOfConstructionIns"
										ErrorMessage="Year of construction Can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtYearOfConstructionIns" runat="server"
										ControlToValidate="txtYearOfConstructionIns" ErrorMessage="Enter values is not in correct format"
										ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn" style="width: 23%">
									<asp:Label ID="lblTypeOfPropertyIns" runat="server" meta:resourcekey="lblTypeOfPropertyIns"
										Text="Type Of Property"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlTypeOfPropertyIns" runat="server" AutoPostBack="true" DataSourceID="xdsPropertyType"
										DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfPropertyIns"
										OnSelectedIndexChanged="ddlTypeOfPropertyIns_SelectedIndexChanged" SelectedValue='<%# Bind("TypeOfProperty") %>'>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<asp:MultiView ID="mvPropertyDetailsIns" runat="server" ActiveViewIndex="0">
										<asp:View ID="View1" runat="server">
											<table width="100%">
												<tr>
													<td colspan="6">
														<asp:Label ID="lblResidentialDetailsHeaderIns" runat="server" meta:resourcekey="lblResidentialDetailsHeaderIns"
															SkinID="SubHeading" Text="Residential Details"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="labelColumn">
														<asp:Label ID="lblHeightOfCeilingIns" runat="server" meta:resourcekey="lblHeightOfCeilingIns"
															Text="Ceiling Height"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtHeightOfCeilingIns" runat="server" meta:resourcekey="txtHeightOfCeilingIns"
															Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RequiredFieldValidator ID="ReqfldtxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
															ErrorMessage="Height Of Ceiling Can't be blank">*</asp:RequiredFieldValidator>
														<asp:RegularExpressionValidator ID="RegexptxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
															ErrorMessage="Height Of Ceiling is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
													</td>
													<td class="validationColumn">
														<asp:Label ID="lblTypeOfTilesIns" runat="server" meta:resourcekey="lblTypeOfTilesIns"
															Text="Tiles Type"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:DropDownList ID="ddlTypeOfTilesIns" runat="server" meta:resourcekey="ddlTypeOfTilesIns"
															SelectedValue='<%# Bind("TypeOfTiles") %>'>
															<asp:ListItem meta:resourcekey="ListItemResource21" Text="Mosaic" Value="2cd90b7c-de3e-488e-be52-cb0f7f335812"></asp:ListItem>
															<asp:ListItem meta:resourcekey="ListItemResource22" Text="Marble" Value="dbd44bd2-28b4-4cdf-83b6-e434c2912985"></asp:ListItem>
															<asp:ListItem meta:resourcekey="ListItemResource23" Text="Red Oxide" Value="4f1ac771-b5e4-424d-85bf-6a6931d93559"></asp:ListItem>
														</asp:DropDownList>
													</td>
													<td class="validationColumn">
													</td>
												</tr>
												<tr>
													<td class="labelColumn" style="height: 26px">
														<asp:Label ID="lblWallFurnishingIns" runat="server" meta:resourcekey="lblWallFurnishingIns"
															Text="Wall Furnishing"></asp:Label>
													</td>
													<td class="textColumn" style="height: 26px">
														<asp:TextBox ID="txtWallFurnishingIns" runat="server" meta:resourcekey="txtWallFurnishingIns"
															Text='<%# Bind("WallFurnishing") %>'></asp:TextBox>
													</td>
													<td class="validationColumn" style="height: 26px">
													</td>
													<td class="validationColumn" style="height: 26px">
													</td>
													<td class="textColumn" style="height: 26px">
													</td>
													<td class="validationColumn" style="height: 26px">
													</td>
												</tr>
												<tr>
													<td class="validationColumn">
														<asp:Label ID="lblNoOfBathroomsIns" runat="server" meta:resourcekey="lblNoOfBathroomsIns"
															Text="No Of Bathrooms"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtNoOfBathroomsIns" runat="server" meta:resourcekey="txtNoOfBathroomsIns"
															Text='<%# Bind("NoOfBathrooms") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RequiredFieldValidator ID="ReqfldtxtNoOfBathroomsIns" runat="server" ControlToValidate="txtNoOfBathroomsIns"
															ErrorMessage="No Of Bathroom Can't be blank">*</asp:RequiredFieldValidator>
														<asp:RegularExpressionValidator ID="RegexptxtNoOfBathroomsIns" runat="server" ControlToValidate="txtNoOfBathroomsIns"
															ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
													</td>
													<td class="validationColumn">
														<asp:Label ID="lblBathroomTilesHeightIns" runat="server" meta:resourcekey="lblBathroomTilesHeightIns"
															Text="Tiles Height"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtBathroomTilesHeightIns" runat="server" meta:resourcekey="txtBathroomTilesHeightIns"
															Text='<%# Bind("BathroomTilesHeight") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RegularExpressionValidator ID="RegexptxtBathroomTilesHeightIns" runat="server"
															ControlToValidate="txtBathroomTilesHeightIns" ErrorMessage="Bathroom Tiles height values is not in correct format"
															ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
													</td>
												</tr>
												<tr>
													<td class="labelColumn">
														<asp:Label ID="lblNoOfToiletsIns" runat="server" meta:resourcekey="lblNoOfToiletsIns"
															Text="No Of Toilets"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtNoOfToiletsIns" runat="server" meta:resourcekey="txtNoOfToiletsIns"
															Text='<%# Bind("NoOfToilets") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RegularExpressionValidator ID="RegExpNoOfToiletIns" runat="server" ControlToValidate="txtNoOfToiletsIns"
															ValidationExpression="^\d+$">*</asp:RegularExpressionValidator>
													</td>
													<td class="validationColumn">
														<asp:Label ID="lblToiletTilesHeightIns" runat="server" meta:resourcekey="lblToiletTilesHeightIns"
															Text="Toilet Tiles Height"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtToiletTilesHeightIns" runat="server" meta:resourcekey="txtToiletTilesHeightIns"
															Text='<%# Bind("ToiletTilesHeight") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RegularExpressionValidator ID="RegExpValToiletTilesHeightIns" runat="server"
															ControlToValidate="txtToiletTilesHeightIns" ValidationExpression="^\d*\.{0,1}\d+$">*</asp:RegularExpressionValidator>
													</td>
												</tr>
												<tr>
													<td class="labelColumn">
														<asp:Label ID="lblParkingIns" runat="server" meta:resourcekey="lblParkingIns" Text="Parking"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:CheckBox ID="chkParkingIns" runat="server" Checked='<%# Bind("Parking") %>'
															meta:resourcekey="txtParkingIns" />
													</td>
													<td class="validationColumn">
													</td>
													<td class="validationColumn">
													</td>
													<td class="textColumn">
													</td>
													<td class="validationColumn">
													</td>
												</tr>
											</table>
										</asp:View>
										<asp:View ID="viewCommercialIns" runat="server">
											<table width="100%">
												<tr>
													<td colspan="6">
														<asp:Label ID="lblDescOfPropertyHeadingIns" runat="server" meta:resourcekey="lblDescOfPropertyHeadingIns"
															SkinID="SubHeading" Text="Commercial Details"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="labelColumn">
														<asp:Label ID="lblDescOfPropertyIns" runat="server" meta:resourcekey="lblDescOfPropertyIns"
															Text="Desc Of Property"></asp:Label>
													</td>
													<td colspan="4">
														<asp:TextBox ID="txtDescOfPropertyIns" runat="server" meta:resourcekey="txtDescOfPropertyIns"
															Text='<%# Bind("DescOfProperty") %>' TextMode="MultiLine"></asp:TextBox>
													</td>
													<td class="validationColumn">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="width: 50%;">
														<asp:CheckBox ID="chkShopsOnGroundFloorIns" runat="server" Checked='<%# Bind("ShopsOnGroundFloor") %>'
															meta:resourcekey="chkShopsOnGroundFloorIns" Text="Is Shops On Ground/First Floor?" />
													</td>
													<td class="validationColumn">
													</td>
													<td colspan="2" style="width: 50%;">
														<asp:CheckBox ID="chkIsPropertyInCommercialIns" runat="server" Checked='<%# Bind("IsPropertyInCommercial") %>'
															meta:resourcekey="chkIsPropertyInCommercialIns" Text="Is Property in Commercially Developed Area?" />
													</td>
													<td class="validationColumn">
													</td>
												</tr>
											</table>
										</asp:View>
										<asp:View ID="viewIndustrialIns" runat="server">
											<table width="100%">
												<tr>
													<td colspan="6">
														<asp:Label ID="lblIndustrialHeaderIns" runat="server" meta:resourcekey="lblIndustrialHeaderIns"
															SkinID="SubHeading" Text="Industrial Details"></asp:Label>
													</td>
												</tr>
												<tr>
													<td class="labelColumn">
														<asp:Label ID="lblHeightOfIndCeilingIns" runat="server" meta:resourcekey="lblHeightOfIndCeilingIns"
															Text="Height till bottom of Ceiling"></asp:Label>
													</td>
													<td class="textColumn">
														<asp:TextBox ID="txtHeightOfIndCeilingIns" runat="server" meta:resourcekey="txtHeightOfIndCeilingIns"
															Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
													</td>
													<td class="validationColumn">
														<asp:RegularExpressionValidator ID="RegexpHeightOfIndCeilingIns" runat="server" ControlToValidate="txtHeightOfIndCeilingIns"
															ErrorMessage="Height Of ceiling Format must be decimal" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
													</td>
													<td class="labelColumn">
													</td>
													<td class="textColumn">
													</td>
													<td class="validationColumn">
													</td>
												</tr>
											</table>
										</asp:View>
									</asp:MultiView>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblTypeOfElectricficationIns" runat="server" meta:resourcekey="lblTypeOfElectricficationIns"
										Text="Electricfication Type"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:DropDownList ID="ddlTypeOfElectricficationIns" runat="server" DataSourceID="xdsElectricalElectrification"
										DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfElectricficationIns"
										Text='<%# Bind("TypeOfElectricfication") %>'>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn" style="width: 23%">
								</td>
								<td class="textColumn">
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn" style="height: 35px">
									<asp:Label ID="lblCompoundWallTypeIns" runat="server" meta:resourcekey="lblCompoundWallTypeIns"
										Text="Compound Wall Type"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%; height: 35px;">
									<asp:DropDownList ID="ddlCompoundWallTypeIns" runat="server" DataSourceID="xdsCompoundWall"
										DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlCompoundWallTypeIns"
										Text='<%# Bind("CompoundWallType") %>'>
									</asp:DropDownList>
								</td>
								<td class="validationColumn" style="height: 35px">
								</td>
								<td colspan="2" style="height: 35px">
									<asp:CheckBox ID="chkIsLightsOnCompoundWallIns" runat="server" Checked='<%# Bind("IsLightsOnCompoundWall") %>'
										meta:resourcekey="chkIsLightsOnCompoundWallIns" Text="Is Lights On Compound Wall?" />
								</td>
								<td class="validationColumn" style="height: 35px">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:CheckBox ID="chkWaterStorageFacilityIns" runat="server" Checked='<%# Bind("WaterStorageFacility") %>'
										meta:resourcekey="chkWaterStorageFacilityIns" Text="Water Storage Facility (Y/N)" />
								</td>
								<td class="validationColumn">
								</td>
								<td colspan="2">
									<asp:CheckBox ID="chkDrainageSystemIns" runat="server" Checked='<%# Bind("DrainageSystem") %>'
										meta:resourcekey="chkDrainageSystemIns" Text="Is Drainage Facility Available?" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblNoOfLiftsIns" runat="server" meta:resourcekey="lblNoOfLiftsIns"
										Text="No Of Lifts"></asp:Label>
								</td>
								<td class="textColumn" style="width: 25%">
									<asp:TextBox ID="txtNoOfLiftsIns" runat="server" meta:resourcekey="txtNoOfLiftsIns"
										Text='<%# Bind("NoOfLifts") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegexpNoOfLifts" runat="server" ControlToValidate="txtNoOfLiftsIns"
										ErrorMessage="No Of Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn" style="width: 23%">
									<asp:Label ID="lblAreaOfEachLiftIns" runat="server" meta:resourcekey="lblAreaOfEachLiftIns"
										Text="Area Of each Lift"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtAreaOfEachLiftIns" runat="server" meta:resourcekey="txtAreaOfEachLiftIns"
										Text='<%# Bind("AreaOfEachLift") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegexpAreaOfEachLift" runat="server" ControlToValidate="txtAreaOfEachLiftIns"
										ErrorMessage="Areas Of Each Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:CheckBox ID="chkInternalRoadIns" runat="server" Checked='<%# Bind("InternalRoad") %>'
										meta:resourcekey="chkInternalRoadIns" Text="Internal Road Present (Y/N)" />
								</td>
								<td class="validationColumn">
								</td>
								<td colspan="2">
									<asp:CheckBox ID="chkValuatedBeforeIns" runat="server" Checked='<%# Bind("ValuatedBefore") %>'
										meta:resourcekey="chkValuatedBeforeIns" Text="Has been Valuated before?" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							
							
						</table>
					</InsertItemTemplate>
				</asp:FormView>
			</asp:WizardStep>
		</WizardSteps>
	</asp:Wizard>
	<br />
	<asp:ObjectDataSource ID="odsOffices" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsGetDocument" runat="server" DataObjectTypeName="System.Guid"
		InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetDocumentMaster" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
		UpdateMethod="UpdatePhysicalVerification">
		<InsertParameters>
			<asp:Parameter Name="AdjudicationId" Type="Object" />
			<asp:Parameter Name="CertificateNumber" Type="String" />
			<asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
			<asp:Parameter Name="CertificateDescription" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:XmlDataSource ID="xdsElectricalElectrification" runat="server" DataFile="~/Adjudication/ElectrificationType.xml">
	</asp:XmlDataSource>
	<asp:XmlDataSource ID="xdsCompoundWall" runat="server" DataFile="~/Adjudication/CompoundWall.xml">
	</asp:XmlDataSource>
	<asp:ObjectDataSource ID="odsFeeMaster" runat="server" DataObjectTypeName="System.Guid"
		InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetFees" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
		UpdateMethod="UpdatePhysicalVerification">
		<InsertParameters>
			<asp:Parameter Name="AdjudicationId" Type="Object" />
			<asp:Parameter Name="CertificateNumber" Type="String" />
			<asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
			<asp:Parameter Name="CertificateDescription" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsRegistration" runat="server" InsertMethod="AddNewRegistration"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetInputSheetDetails"
		TypeName="IGRSS.BusinessLogicLayer.Registration" UpdateMethod="UpdateRegistration"
		OnInserting="odsRegistration_Inserting">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
			<asp:Parameter Name="RegistrationId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
			<asp:Parameter Name="Id" Type="Object" />
			<asp:Parameter Name="FeeDetails" Type="Object" />
			<asp:Parameter Name="DocDetails" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsValuationForm" runat="server" InsertMethod="AddNewValuationFormForRegistration"
		SelectMethod="GetValuationFormDetails" TypeName="IGRSS.BusinessLogicLayer.Registration"
		OldValuesParameterFormatString="original_{0}" OnInserting="odsValuationForm_Inserting"
		UpdateMethod="UpdateRegistration">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
			<asp:Parameter Name="RegistrationId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="Id" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	<asp:XmlDataSource ID="xdsPropertyType" runat="server" DataFile="~/Adjudication/PropertyType.xml">
	</asp:XmlDataSource>
	<br />
	<asp:XmlDataSource ID="xdsPartyType" runat="server" DataFile="~/Registration/PartyType.xml"></asp:XmlDataSource>
	<br />
</asp:Content>
