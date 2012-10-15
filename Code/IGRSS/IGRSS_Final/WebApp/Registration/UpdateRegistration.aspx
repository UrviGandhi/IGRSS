<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="UpdateRegistration.aspx.cs" Inherits="Registration_UpdateRegistration"
	Title="Untitled Page" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="MvRegistration" runat="server" ActiveViewIndex="0">
		<asp:View ID="ViewRegistration" runat="server">
			<table width="100%">
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblFileSlNo" runat="server" meta:resourcekey="lblFileSlNo" Text="File Sl No">
						</asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtFileSlNoUpd" runat="server" meta:resourcekey="txtFileSlNoUpd"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Button ID="btnSearch" runat="server" Text="Search" /></td>
					<td class="textColumn">
						&nbsp;</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<asp:GridView ID="GvRegistrationDetails" runat="server" AutoGenerateColumns="False"
							CellPadding="4" DataKeyNames="RegistrationId" DataSourceID="odsSearchByfileSlNo"
							Height="84px" OnSelectedIndexChanged="GvRegistrationDetails_SelectedIndexChanged"
							Width="844px">
							<Columns>
								<asp:BoundField DataField="ValuationFormId" HeaderText="ValuationFormId" Visible="false" />
								<asp:BoundField DataField="RegistrationId" HeaderText="RegistrationId" Visible="false" />
								<asp:BoundField DataField="FilePrefix" HeaderText="File Prefix" SortExpression="FilePrefix" />
								<asp:BoundField DataField="FileSlNo" HeaderText="File Sl No" SortExpression="FileSlNo" />
								<asp:BoundField DataField="FileYear" HeaderText="File Year" SortExpression="FileYear" />
								<asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" SortExpression="ApplicantName" />
								<asp:BoundField DataField="ApplnAddress" HeaderText="Applicant Address" SortExpression="ApplnAddress" />
								<asp:BoundField DataField="ApplnDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Application Date"
									HtmlEncode="False" SortExpression="ApplnDate"></asp:BoundField>
								<asp:BoundField DataField="NameOfOwner" HeaderText="NameOfOwner" />
								<asp:CommandField ShowSelectButton="True"></asp:CommandField>
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="View1" runat="server">
			<asp:FormView ID="FvRegistration" runat="server" DataKeyNames="RegistrationId" DataSourceID="odsRegistrationById"
				DefaultMode="Edit" OnDataBound="FvRegistration_DataBound" OnItemUpdating="FvRegistration_ItemUpdating">
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
								<asp:Label ID="lblRegistrationTypeUpd" runat="server" meta:resourcekey="lblRegistrationTypeUpd"
									Text="RegistrationType"></asp:Label>
							</td>
							<td class="textColumn" style="width: 25%">
								<asp:DropDownList ID="ddlRegistrationTypeUpd" runat="server" SelectedValue='<%# Bind("RegistrationTypeId") %>'>
									<asp:ListItem Value="665ad044-7ec7-4376-abbf-be125f4f368f">Property</asp:ListItem>
									
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
								<%--<asp:RequiredFieldValidator ID="ReqfldtxtFilePrefixUpd" runat="server" ControlToValidate="txtFilePrefixUpd"
									ErrorMessage="File Prefix No can't be blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegExptxtFilePrefixUpd" runat="server" ControlToValidate="txtFilePrefixUpd"
									ErrorMessage="RegExptxtFilePrefixUpd" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>--%>
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
								<%--<asp:RegularExpressionValidator ID="RegexptxtFileNoUpd" runat="server" ControlToValidate="txtFileNoUpd"
									ErrorMessage="*" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
								<asp:RegularExpressionValidator ID="RegYear" runat="server" ControlToValidate="txtFileYearUpd"
									ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>--%>
							</td>
							<td class="labelColumn">
								&nbsp;<asp:Label ID="lblApplicationDateUpd" runat="server" meta:resourcekey="lblApplicationDateUpd"
									Text="Application Date"></asp:Label></td>
							<td class="textColumn" style="width: 25%">
								<asp:TextBox ID="txtApplicationDateUpd" runat="server" meta:resourcekey="txtApplicationDateUpd"
									ReadOnly="true" SkinID="Calendar" Text='<%# Bind("ApplnDate","{0:d}") %>'></asp:TextBox>
								<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtApplicationDateUpd" />
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
								<asp:CheckBox ID="ChkIsRentedUpd" runat="server" Checked='<%# Bind("IsRented") %>'
									meta:resourcekey="ChkIsRentedUpd" />
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
								<rjs:PopCalendar ID="PopCatxtReceiptNumberUpd" runat="server" Control="txtReceiptNumberUpd">
								</rjs:PopCalendar>
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
								<rjs:PopCalendar ID="PopCaltxtLeasePeriodToUpd" runat="server" Control="txtLeasePeriodToUpd">
								</rjs:PopCalendar>
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
								<asp:DropDownList ID="ddlPartyTypeUpd" runat="server">
									<asp:ListItem>S</asp:ListItem>
									<asp:ListItem>B</asp:ListItem>
									<asp:ListItem>I</asp:ListItem>
									<asp:ListItem>C</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNameUpd" runat="server" meta:resourcekey="txtNameUpd"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqFldValNameUpd" runat="server" ControlToValidate="txtNameUpd"
									ErrorMessage="Party Name Can't Be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexpName" runat="server" ControlToValidate="txtNameUpd"
									ErrorMessage="Party Name is not in correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
									ValidationGroup="PartyDetails">*</asp:RegularExpressionValidator></td>
							<td class="validationColumn">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblAddressUpd" runat="server" meta:resourcekey="lblAddressUpd" Text="Address"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAddressUpd" runat="server" meta:resourcekey="txtAddressUpd" TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtAddress" runat="server" ControlToValidate="txtAddressUpd"
									ErrorMessage="Address Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblAgeUpd" runat="server" meta:resourcekey="lblAgeUpd" Text="Age"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAgeUpd" runat="server" meta:resourcekey="txtAgeUpd"></asp:TextBox>
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
								<asp:TextBox ID="txtGenderUpd" runat="server" meta:resourcekey="txtGenderUpd"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtGenderUpd" runat="server" ControlToValidate="txtGenderUpd"
									ErrorMessage="Gendor Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblReligion" runat="server" meta:resourcekey="lblReligion" Text="Religion"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlReligionUpd" runat="server" DataTextField="H" DataValueField="H"
									Width="157px">
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
								<asp:Label ID="lblOccupationUpd" runat="server" meta:resourcekey="lblOccupationUpd"
									Text="Occupation"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtOccupationUpd" runat="server" meta:resourcekey="txtOccupationUpd"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtOccupationUpd" runat="server" ControlToValidate="txtOccupationUpd"
									ErrorMessage="Occupation Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblPANUpd" runat="server" meta:resourcekey="lblPANUpd" Text="PAN"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtPANUpd" runat="server" meta:resourcekey="txtPANUpd"></asp:TextBox>
								<asp:RequiredFieldValidator ID="ReqfldtxtPANUpd" runat="server" ControlToValidate="txtPANUpd"
									ErrorMessage="PAN No Can't be Blank" ValidationGroup="PartyDetails">*</asp:RequiredFieldValidator>
							</td>
							<td class="validationColumn">
								<asp:Button ID="btnAddPartyDetailsUpd" runat="server" OnClick="btnAddPartyDetails_Click"
									Text="Add" ValidationGroup="PartyDetails" />
								<asp:Button ID="btnUpdatePartyDetailsUpd" runat="server" OnClick="btnUpdatePartyDetails_Click"
									Text="Update" ValidationGroup="PartyDetails" />
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:GridView ID="GvPartyDetailsUpd" runat="server" AutoGenerateColumns="false" DataKeyNames="RegistrationId"
									OnDataBinding="GvPartyDetailsUpd_DataBinding" OnRowDeleting="GvPartyDetailsUpd_RowDeleting">
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
								<asp:Label ID="lblFeeDetailsHeaderUpd" runat="server" meta:resourcekey="lblFeeDetailsHeaderUpd"
									SkinID="SubHeading" Text="Fee Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblFeeTypeUpd" runat="server" meta:resourcekey="lblFeeTypeUpd" Text="Fee"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlFeeTypeUpd" runat="server" DataSourceID="odsFeeMaster" DataTextField="Name"
									DataValueField="FeeId">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="validationColumn">
								<asp:Label ID="lblFeeAmountUpd" runat="server" meta:resourcekey="lblFeeAmountUpd"
									Text="Amount"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtFeeAmountUpd" runat="server" meta:resourcekey="txtFeeAmountUpd"
									ValidationGroup="FeeDetails"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RegularExpressionValidator ID="RegExptxtFeeAmountUpd" runat="server" ControlToValidate="txtFeeAmountUpd"
									ErrorMessage="Fee Amount must be Numeric" ValidationExpression="^\d+$" ValidationGroup="FeeDetails">*</asp:RegularExpressionValidator>
								<asp:RequiredFieldValidator ID="ReqFldtxtFeeAmountUpd" runat="server" ControlToValidate="txtFeeAmountUpd"
									ErrorMessage="Enter Fee Amount" ValidationGroup="FeeDetails">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnUpdateFeeDetailUpd" runat="server" Text="Update" ValidationGroup="FeeDetails"
									Visible="false" />
								<asp:Button ID="btnAddFeeDetailUpd" runat="server" OnClick="AddFeeDetails_Click"
									Text="Add" ValidationGroup="FeeDetails" />
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:GridView ID="gvFeeStampDetailsUpd" runat="server" AutoGenerateColumns="false"
									DataKeyNames="RegistrationId,FeeId" meta:resourcekey="gvFeeStampDetails" OnRowDeleting="gvFeeStampDetailsUpd_RowDeleting">
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
								<asp:Label ID="lblDocumentDetailsHeaderUpd" runat="server" meta:resourcekey="lblDocumentDetailsHeaderUpd"
									SkinID="SubHeading" Text="Document Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblDocumentTypeUpd" runat="server" meta:resourcekey="lblDocumentTypeUpd"
									Text="Document Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlDocumentTypeUpd" runat="server" DataSourceID="odsGetDocument"
									DataTextField="Name" DataValueField="DocumentTypeId" meta:resourcekey="ddlDocumentTypeUpd">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="validationColumn">
								<asp:Label ID="lvlDocumentNumberUpd" runat="server" meta:resourcekey="lvlDocumentNumberUpd"
									Text="Document Number"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDocumentNumberUpd" runat="server" meta:resourcekey="txtDocumentNumberUpd"
									ValidationGroup="DocumentDetails"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldValtxtDocumentNumberUpd" runat="server" ControlToValidate="txtDocumentNumberUpd"
									ErrorMessage="Enter Document No" ValidationGroup="DocumentDetails">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexptxtDocumentNumberUpd" runat="server" ControlToValidate="txtDocumentNumberUpd"
									ErrorMessage="Enter Document No in correct format" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td class="validationColumn">
								<asp:Label ID="lblDocRemarksUpd" runat="server" meta:resourcekey="lblDocRemarksUpd"
									Text="Doc Remarks" Width="153px"></asp:Label>
							</td>
							<td colspan="6" style="width: 25%">
								<asp:TextBox ID="txtDocRemarksUpd" runat="server" meta:resourcekey="txtDocRemarksUpd"
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td>
								<asp:CheckBox ID="chkSubmittedUpd" runat="server" meta:resourcekey="chkSubmittedUpd"
									Text="Has Submitted?" Width="151px" />
							</td>
							<td>
								<asp:Button ID="btnAddDocumentUpd" runat="server" OnClick="AddDocumentDetails_Click"
									Text="Add" ValidationGroup="DocumentDetails" />
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="Button1" runat="server" Text="Update" ValidationGroup="DocumentDetails"
									Visible="false" /></td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:GridView ID="gvDocumentUpd" runat="server" AutoGenerateColumns="false" DataKeyNames="RegistrationId,DocumentTypeId"
									meta:resourcekey="gvDocumentUpdResource1" OnRowDeleting="gvDocumentUpd_RowDeleting">
									<Columns>
										<asp:TemplateField HeaderText="Document Id" SortExpression="DocumentTypeId" Visible="False">
											<EditItemTemplate>
												<asp:Label ID="lbleDocumentId" runat="server"></asp:Label>
											</EditItemTemplate>
											<ItemTemplate>
												<asp:Label ID="DocumentId" runat="server" Text='<%# Bind("DocumentTypeId") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<%--<asp:TemplateField HeaderText="Document Name" SortExpression="Name">
											<EditItemTemplate>
												<asp:Label ID="lbleDocumentName" runat="server"></asp:Label>
											</EditItemTemplate>
											<ItemTemplate>
												<asp:Label ID="lblDocumentName" runat="server" Text='<%# Bind("DocName") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>--%>
										<%--<asp:TemplateField HeaderText="ID" SortExpression="ValuationFormId" Visible="false">
											<EditItemTemplate>
												<asp:Label ID="lbleValId" runat="server"></asp:Label>
											</EditItemTemplate>
											<ItemTemplate>
												<asp:Label ID="lblValId" runat="server" Text='<%# Bind("ValuationFormId") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>--%>
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
							<td align="right" colspan="6">
								<asp:Button ID="btnUpdateFeeDetailsUpd" runat="server" Text="Update" ValidationGroup="DocumentDetails"
									Visible="false" /></td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:GridView ID="gvDocuments" runat="server" AutoGenerateColumns="false" DataKeyNames="RegistrationId,DocumentTypeId"
									meta:resourcekey="gvDocumentUpdResource1">
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
								<asp:Button ID="btnValuationForm" runat="server" OnClick="btnValuationForm_Click"
									Text="Property Details" Width="121px" />
							</td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</EditItemTemplate>
			</asp:FormView>
			&nbsp; &nbsp;<br />
		</asp:View>
		<asp:View ID="viewValuationForm" runat="server">
			<asp:FormView ID="FvValuationForm" runat="server" DataKeyNames="ValuationFormId"
				DataSourceID="odsValuationForm" OnItemUpdating="FvValuationForm_ItemUpdating">
				<ItemTemplate>
				</ItemTemplate>
				<InsertItemTemplate>
				</InsertItemTemplate>
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPropertyDetailsHeadingUpd" runat="server" meta:resourcekey="lblPropertyDetailsHeadingUpd"
									SkinID="SubHeading" Text="Property Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblDistNameUpd" runat="server" meta:resourcekey="lblDistNameUpd" Text="Village/City Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDistNameUpd" runat="server" meta:resourcekey="txtDistNameUpd"
									Text='<%# Bind("Village_CityName") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblTpSchemeNoUpd" runat="server" meta:resourcekey="lblTpSchemeNoUpd"
									Text="T.P Scheme No"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtTpSchemeNoUpd" runat="server" meta:resourcekey="txtTpSchemeNoUpd"
									Text='<%# Bind("TPSchemeNo") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblTpSchemeNameUpd" runat="server" meta:resourcekey="lblTpSchemeNameUpd"
									Text="T.P Scheme Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtTpSchemeNameUpd" runat="server" meta:resourcekey="txtTpSchemeNameUpd"
									Text='<%# Bind("TPSchemeName") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblFinalPlotNoUpd" runat="server" meta:resourcekey="lblFinalPlotNoUpd"
									Text="Final Plot No"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtFinalPlotNoUpd" runat="server" meta:resourcekey="txtFinalPlotNoUpd"
									Text='<%# Bind("FinalPlotNo") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblCitySurveyNoUpd" runat="server" meta:resourcekey="lblCitySurveyNoUpd"
									Text="City Survey No"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtCitySurveyNoUpd" runat="server" meta:resourcekey="txtCitySurveyNoUpd"
									Text='<%# Bind("CitySurveyNo") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								&nbsp;<asp:Label ID="lblRevenueSurveyNoUpd" runat="server" meta:resourcekey="lblRevenueSurveyNoUpd"
									Text="Revenue Survey No"></asp:Label></td>
							<td class="textColumn">
								<asp:TextBox ID="txtRevenueSurveyNoUpd" runat="server" meta:resourcekey="txtRevenueSurveyNoUpd"
									Text='<%# Bind("RevenueSurveyNo") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblWard_SubWardNoUpd" runat="server" meta:resourcekey="lblWard_SubWardNoUpd"
									Text="Ward/SubWard No"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtWard_SubWardNoUpd" runat="server" meta:resourcekey="txtWard_SubWardNoUpd"
									Text='<%# Bind("Ward_SubWardNo") %>'></asp:TextBox>
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
							<td colspan="6">
								<asp:Label ID="lblPartyDetailsUpd" runat="server" meta:resourcekey="lblPartyDetailsUpd"
									SkinID="SubHeading" Text="Party Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameOfOwnerUpd" runat="server" meta:resourcekey="lblNameOfOwnerUpd"
									Text="Name Of Owner"></asp:Label>
							</td>
							<td colspan="4">
								<asp:TextBox ID="txtNameOfOwnerUpd" runat="server" meta:resourcekey="txtNameOfOwnerUpd"
									Text='<%# Bind("NameOfOwner") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqFldValOwnerNameUpd" runat="server" ControlToValidate="txtNameOfOwnerUpd">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtNameOfOwnerUpd"
									ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblAddressOfOwnerUpd" runat="server" meta:resourcekey="lblAddressOfOwnerUpd"
									Text="Address Of Owner"></asp:Label>
							</td>
							<td colspan="3">
								<asp:TextBox ID="txtAddressOfOwnerUpd" runat="server" meta:resourcekey="txtAddressOfOwnerUpd"
									Text='<%# Bind("AddressOfOwner") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtAddressOfOwnerUpd" runat="server" ControlToValidate="txtAddressOfOwnerUpd"
									ErrorMessage="Address of Owner">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegExprValtxtNameOfOwnerUpd" runat="server" ControlToValidate="txtNameOfOwnerUpd"
									ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator></td>
							<td class="labelColumn">
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqFldValAddressOwnerUpd" runat="server" ControlToValidate="txtAddressOfOwnerUpd">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameOfClaimingPartyUpd" runat="server" meta:resourcekey="lblNameOfClaimingPartyUpd"
									Text="Claiming Party Name"></asp:Label>
							</td>
							<td colspan="4">
								<asp:TextBox ID="txtNameOfClaimingPartyUpd" runat="server" meta:resourcekey="txtNameOfClaimingPartyUpd"
									Text='<%# Bind("NameOfClaimingParty") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqFldValNameOfCLaimingPartyUpd" runat="server" ControlToValidate="txtNameOfClaimingPartyUpd">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexptxtNameOfClaimingPartyUpd" runat="server"
									ControlToValidate="txtNameOfClaimingPartyUpd" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblAddressOfClaimingPartyUpd" runat="server" meta:resourcekey="lblAddressOfClaimingPartyUpd"
									Text="Address Of Claiming Party"></asp:Label>
							</td>
							<td colspan="3">
								<asp:TextBox ID="txtAddressOfClaimingPartyUpd" runat="server" meta:resourcekey="txtAddressOfClaimingPartyUpd"
									Text='<%# Bind("AddressOfClaimingParty") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPropertyDescriptionHeaderUpd" runat="server" meta:resourcekey="lblPropertyDescriptionHeaderUpd"
									SkinID="SubHeading" Text="Property Description Header"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblAreaOfPlotUpd" runat="server" meta:resourcekey="lblAreaOfPlotUpd"
									Text="Area(Sq mts)"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAreaOfPlotUpd" runat="server" meta:resourcekey="txtAreaOfPlotUpd"
									Text='<%# Bind("AreaOfPlot") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfPlotUpd" runat="server" ControlToValidate="txtAreaOfPlotUpd"
									ErrorMessage="Area Of Plot can't be blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexptxtAreaOfPlotUpd" runat="server" ControlToValidate="txtAreaOfPlotUpd"
									ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
							</td>
							<td class="validationColumn">
								<asp:Label ID="lblAreaOfConstructionUpd" runat="server" meta:resourcekey="lblAreaOfConstructionUpd"
									Text="Plinth Area & No of Floors"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAreaOfConstructionUpd" runat="server" meta:resourcekey="txtAreaOfConstructionUpd"
									Text='<%# Bind("AreaOfConstruction") %>' Width="45%"></asp:TextBox>
								<asp:TextBox ID="txtNoOfFloorsUpd" runat="server" meta:resourcekey="txtNoOfFloorsUpd"
									Text='<%# Bind("NoOfFloors") %>' Width="45%"></asp:TextBox></td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfConstructionUpd" runat="server" ControlToValidate="txtAreaOfConstructionUpd"
									ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegExptxtAreaOfConstructionUpd" runat="server"
									ControlToValidate="txtAreaOfConstructionUpd" ErrorMessage="Enter values is not in correct format"
									ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								<asp:RequiredFieldValidator ID="ReqfldtxtNoOfFloorsUpd" runat="server" ControlToValidate="txtNoOfFloorsUpd"
									ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegExptxtNoOfFloorsUpd" runat="server" ControlToValidate="txtNoOfFloorsUpd"
									ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblYearOfConstructionUpd" runat="server" meta:resourcekey="lblYearOfConstructionUpd"
									Text="Year of Construction"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtYearOfConstructionUpd" runat="server" meta:resourcekey="txtYearOfConstructionUpd"
									Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtYearOfConstructionUpd" runat="server" ControlToValidate="txtYearOfConstructionUpd"
									ErrorMessage="Year of construction Can't be blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexptxtYearOfConstructionUpd" runat="server"
									ControlToValidate="txtYearOfConstructionUpd" ErrorMessage="Enter values is not in correct format"
									ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
							</td>
							<td class="validationColumn">
								<asp:Label ID="lblTypeOfPropertyUpd" runat="server" meta:resourcekey="lblTypeOfPropertyUpd"
									Text="Type Of Property"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlTypeOfPropertyUpd" runat="server" AutoPostBack="true" DataSourceID="xdsPropertyType"
									DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfPropertyUpd"
									OnDataBound="ddlTypeOfPropertyUpd_DataBound" SelectedValue='<%# Bind("TypeOfProperty") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:MultiView ID="mvPropertyDetailsUpd" runat="server" ActiveViewIndex="0">
									<asp:View ID="View1" runat="server">
										<table width="100%">
											<tr>
												<td colspan="6">
													<asp:Label ID="lblResidentialDetailsHeaderUpd" runat="server" meta:resourcekey="lblResidentialDetailsHeaderUpd"
														SkinID="SubHeading" Text="Residential Details"></asp:Label>
												</td>
											</tr>
											<tr>
												<td class="labelColumn">
													<asp:Label ID="lblHeightOfCeilingUpd" runat="server" meta:resourcekey="lblHeightOfCeilingUpd"
														Text="Ceiling Height"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtHeightOfCeilingUpd" runat="server" meta:resourcekey="txtHeightOfCeilingUpd"
														Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RequiredFieldValidator ID="ReqfldtxtHeightOfCeilingUpd" runat="server" ControlToValidate="txtHeightOfCeilingUpd"
														ErrorMessage="Height Of Ceiling Can't be blank">*</asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="RegexptxtHeightOfCeilingUpd" runat="server" ControlToValidate="txtHeightOfCeilingUpd"
														ErrorMessage="Height Of Ceiling is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
												</td>
												<td class="validationColumn">
													<asp:Label ID="lblTypeOfTilesUpd" runat="server" meta:resourcekey="lblTypeOfTilesUpd"
														Text="Tiles Type"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:DropDownList ID="ddlTypeOfTilesUpd" runat="server" meta:resourcekey="ddlTypeOfTilesUpd"
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
												<td class="labelColumn">
													<asp:Label ID="lblWallFurnishingUpd" runat="server" meta:resourcekey="lblWallFurnishingUpd"
														Text="Wall Furnishing"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtWallFurnishingUpd" runat="server" meta:resourcekey="txtWallFurnishingUpd"
														Text='<%# Bind("WallFurnishing") %>'></asp:TextBox>
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
											<tr>
												<td class="validationColumn">
													<asp:Label ID="lblNoOfBathroomsUpd" runat="server" meta:resourcekey="lblNoOfBathroomsUpd"
														Text="No Of Bathrooms"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtNoOfBathroomsUpd" runat="server" meta:resourcekey="txtNoOfBathroomsUpd"
														Text='<%# Bind("NoOfBathrooms") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RequiredFieldValidator ID="ReqfldtxtNoOfBathroomsUpd" runat="server" ControlToValidate="txtNoOfBathroomsUpd"
														ErrorMessage="No Of Bathroom Can't be blank">*</asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="RegexptxtNoOfBathroomsUpd" runat="server" ControlToValidate="txtNoOfBathroomsUpd"
														ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
												</td>
												<td class="validationColumn">
													<asp:Label ID="lblBathroomTilesHeightUpd" runat="server" meta:resourcekey="lblBathroomTilesHeightUpd"
														Text="Tiles Height"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtBathroomTilesHeightUpd" runat="server" meta:resourcekey="txtBathroomTilesHeightUpd"
														Text='<%# Bind("BathroomTilesHeight") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RegularExpressionValidator ID="RegexptxtBathroomTilesHeightUpd" runat="server"
														ControlToValidate="txtBathroomTilesHeightUpd" ErrorMessage="Bathroom Tiles height values is not in correct format"
														ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
												</td>
											</tr>
											<tr>
												<td class="labelColumn">
													<asp:Label ID="lblNoOfToiletsUpd" runat="server" meta:resourcekey="lblNoOfToiletsUpd"
														Text="No Of Toilets"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtNoOfToiletsUpd" runat="server" meta:resourcekey="txtNoOfToiletsUpd"
														Text='<%# Bind("NoOfToilets") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RegularExpressionValidator ID="RegExpNoOfToiletUpd" runat="server" ControlToValidate="txtNoOfToiletsUpd"
														ValidationExpression="^\d+$">*</asp:RegularExpressionValidator>
												</td>
												<td class="validationColumn">
													<asp:Label ID="lblToiletTilesHeightUpd" runat="server" meta:resourcekey="lblToiletTilesHeightUpd"
														Text="Toilet Tiles Height"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtToiletTilesHeightUpd" runat="server" meta:resourcekey="txtToiletTilesHeightUpd"
														Text='<%# Bind("ToiletTilesHeight") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RegularExpressionValidator ID="RegExpValToiletTilesHeightUpd" runat="server"
														ControlToValidate="txtToiletTilesHeightUpd" ValidationExpression="^\d*\.{0,1}\d+$">*</asp:RegularExpressionValidator>
												</td>
											</tr>
											<tr>
												<td class="labelColumn">
													<asp:Label ID="lblParkingUpd" runat="server" meta:resourcekey="lblParkingUpd" Text="Parking"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:CheckBox ID="chkParkingUpd" runat="server" Checked='<%# Bind("Parking") %>'
														meta:resourcekey="txtParkingUpd" />
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
									<asp:View ID="viewCommercialUpd" runat="server">
										<table width="100%">
											<tr>
												<td colspan="6">
													<asp:Label ID="lblDescOfPropertyHeadingUpd" runat="server" meta:resourcekey="lblDescOfPropertyHeadingUpd"
														SkinID="SubHeading" Text="Commercial Details"></asp:Label>
												</td>
											</tr>
											<tr>
												<td class="labelColumn">
													<asp:Label ID="lblDescOfPropertyUpd" runat="server" meta:resourcekey="lblDescOfPropertyUpd"
														Text="Desc Of Property"></asp:Label>
												</td>
												<td colspan="4">
													<asp:TextBox ID="txtDescOfPropertyUpd" runat="server" meta:resourcekey="txtDescOfPropertyUpd"
														Text='<%# Bind("DescOfProperty") %>' TextMode="MultiLine"></asp:TextBox>
												</td>
												<td class="validationColumn">
												</td>
											</tr>
											<tr>
												<td colspan="2" style="width: 50%;">
													<asp:CheckBox ID="chkShopsOnGroundFloorUpd" runat="server" Checked='<%# Bind("ShopsOnGroundFloor") %>'
														meta:resourcekey="chkShopsOnGroundFloorUpd" Text="Is Shops On Ground/First Floor?" />
												</td>
												<td class="validationColumn">
												</td>
												<td colspan="2" style="width: 50%;">
													<asp:CheckBox ID="chkIsPropertyInCommercialUpd" runat="server" Checked='<%# Bind("IsPropertyInCommercial") %>'
														meta:resourcekey="chkIsPropertyInCommercialUpd" Text="Is Property in Commercially Developed Area?" />
												</td>
												<td class="validationColumn">
												</td>
											</tr>
										</table>
									</asp:View>
									<asp:View ID="viewIndustrialUpd" runat="server">
										<table width="100%">
											<tr>
												<td colspan="6">
													<asp:Label ID="lblIndustrialHeaderUpd" runat="server" meta:resourcekey="lblIndustrialHeaderUpd"
														SkinID="SubHeading" Text="Industrial Details"></asp:Label>
												</td>
											</tr>
											<tr>
												<td class="labelColumn">
													<asp:Label ID="lblHeightOfIndCeilingUpd" runat="server" meta:resourcekey="lblHeightOfIndCeilingUpd"
														Text="Height till bottom of Ceiling"></asp:Label>
												</td>
												<td class="textColumn">
													<asp:TextBox ID="txtHeightOfIndCeilingUpd" runat="server" meta:resourcekey="txtHeightOfIndCeilingUpd"
														Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
												</td>
												<td class="validationColumn">
													<asp:RegularExpressionValidator ID="RegexpHeightOfIndCeilingUpd" runat="server" ControlToValidate="txtHeightOfIndCeilingUpd"
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
								<asp:Label ID="lblTypeOfElectricficationUpd" runat="server" meta:resourcekey="lblTypeOfElectricficationUpd"
									Text="Electricfication Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlTypeOfElectricficationUpd" runat="server" DataSourceID="xdsElectricalElectrification"
									DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfElectricficationUpd"
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
								<asp:Label ID="lblCompoundWallTypeUpd" runat="server" meta:resourcekey="lblCompoundWallTypeUpd"
									Text="Compound Wall Type"></asp:Label>
							</td>
							<td class="textColumn" style="width: 93px; height: 35px;">
								<asp:DropDownList ID="ddlCompoundWallTypeUpd" runat="server" DataSourceID="xdsCompoundWall"
									DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlCompoundWallTypeUpd"
									Text='<%# Bind("CompoundWallType") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn" style="height: 35px">
							</td>
							<td colspan="2" style="height: 35px">
								<asp:CheckBox ID="chkIsLightsOnCompoundWallUpd" runat="server" Checked='<%# Bind("IsLightsOnCompoundWall") %>'
									meta:resourcekey="chkIsLightsOnCompoundWallUpd" Text="Is Lights On Compound Wall?" />
							</td>
							<td class="validationColumn" style="height: 35px">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<asp:CheckBox ID="chkWaterStorageFacilityUpd" runat="server" Checked='<%# Bind("WaterStorageFacility") %>'
									meta:resourcekey="chkWaterStorageFacilityUpd" Text="Water Storage Facility (Y/N)" />
							</td>
							<td class="validationColumn">
							</td>
							<td colspan="2">
								<asp:CheckBox ID="chkDrainageSystemUpd" runat="server" Checked='<%# Bind("DrainageSystem") %>'
									meta:resourcekey="chkDrainageSystemUpd" Text="Is Drainage Facility Available?" />
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNoOfLiftsUpd" runat="server" meta:resourcekey="lblNoOfLiftsUpd"
									Text="No Of Lifts"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNoOfLiftsUpd" runat="server" meta:resourcekey="txtNoOfLiftsUpd"
									Text='<%# Bind("NoOfLifts") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RegularExpressionValidator ID="RegexpNoOfLifts" runat="server" ControlToValidate="txtNoOfLiftsUpd"
									ErrorMessage="No Of Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
							</td>
							<td class="validationColumn" style="width: 23%">
								<asp:Label ID="lblAreaOfEachLiftUpd" runat="server" meta:resourcekey="lblAreaOfEachLiftUpd"
									Text="Area Of each Lift"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtAreaOfEachLiftUpd" runat="server" meta:resourcekey="txtAreaOfEachLiftUpd"
									Text='<%# Bind("AreaOfEachLift") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RegularExpressionValidator ID="RegexpAreaOfEachLift" runat="server" ControlToValidate="txtAreaOfEachLiftUpd"
									ErrorMessage="Areas Of Each Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<asp:CheckBox ID="chkInternalRoadUpd" runat="server" Checked='<%# Bind("InternalRoad") %>'
									meta:resourcekey="chkInternalRoadUpd" Text="Internal Road Present (Y/N)" />
							</td>
							<td class="validationColumn">
							</td>
							<td colspan="2">
								<asp:CheckBox ID="chkValuatedBeforeUpd" runat="server" Checked='<%# Bind("ValuatedBefore") %>'
									meta:resourcekey="chkValuatedBeforeUpd" Text="Has been Valuated before?" />
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<asp:HiddenField ID="fldValuationFormId" runat="server" Value='<%# Bind("ValuationFormId") %>' />
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="RegUpdate" runat="server" CausesValidation="false" CommandName="Update"
									Text="Update" />
								<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</EditItemTemplate>
			</asp:FormView>
			<br />
			<br />
			<br />
		</asp:View>
	</asp:MultiView><br />
	<asp:ObjectDataSource ID="odsRegistrationById" runat="server" InsertMethod="AddNewRegistration"
		SelectMethod="GetInputsheetDetailsById" TypeName="IGRSS.BusinessLogicLayer.Registration"
		UpdateMethod="UpdateRegistration" OnUpdating="odsRegistrationById_Updating">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
			<asp:Parameter Name="RegistrationId" Type="Object" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="GvRegistrationDetails" Name="RegistrationId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsOffices" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsRegistration" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetInputSheetDetails" TypeName="IGRSS.BusinessLogicLayer.Registration">
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsSearchByfileSlNo" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetInputSheetDetailsByFileSlNo" TypeName="IGRSS.BusinessLogicLayer.Registration"
		UpdateMethod="UpdateRegistration">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
			<asp:Parameter Name="RegistrationId" Type="Object" />
		</UpdateParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="txtFileSlNoUpd" Name="FileSlNo" PropertyName="Text"
				Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsValuationForm" runat="server" SelectMethod="GetValuationFormDetailsByRegistrationId"
		TypeName="IGRSS.BusinessLogicLayer.Registration" UpdateMethod="UpdateValuationFormDetails"
		OnUpdating="odsValuationForm_Updating" InsertMethod="AddNewRegistrationDocumentDetails">
		<SelectParameters>
			<asp:ControlParameter ControlID="GvRegistrationDetails" Name="RegistrationId" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ValuationFormId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="RegistrationId" Type="Object" />
			<asp:Parameter Name="DocumentTypeId" Type="Object" />
			<asp:Parameter Name="Submitted" Type="Boolean" />
			<asp:Parameter Name="NotApplicable" Type="Boolean" />
			<asp:Parameter Name="DocumentNumber" Type="String" />
			<asp:Parameter Name="Remarks" Type="String" />
			<asp:Parameter Name="CreatedBy" Type="String" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	<br />
	<asp:XmlDataSource ID="xdsElectricalElectrification" runat="server" DataFile="~/Adjudication/ElectrificationType.xml">
	</asp:XmlDataSource>
	<asp:XmlDataSource ID="xdsCompoundWall" runat="server" DataFile="~/Adjudication/CompoundWall.xml">
	</asp:XmlDataSource>
	<asp:XmlDataSource ID="xdsPropertyType" runat="server" DataFile="~/Adjudication/PropertyType.xml">
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
</asp:Content>
