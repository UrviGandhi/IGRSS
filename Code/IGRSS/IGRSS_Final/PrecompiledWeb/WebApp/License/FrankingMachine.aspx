<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_FrankingMachine, App_Web_syjfv0ab" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/RadioButtonControl.ascx" TagName="RadioButtonControl"
    TagPrefix="uc2" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvLicApp" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewLicense" runat="server">
            <table id="TABLE1" width="100%">
                <tr>
                    <td align="left">
                        <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" Text="Enter Application Number"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="txtApplicationNo" runat="server" meta:resourcekey="txtApplicationNoResource1"
                            Width="163px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regAppNo" runat="server" ControlToValidate="txtApplicationNo"
                            ErrorMessage="Enter Valid Application No" meta:resourcekey="regAppNoResource1"
                            ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>">*</asp:RegularExpressionValidator>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblApplicationName" runat="server" meta:resourcekey="lblApplicationNameResource1"
                            Text="Enter Name"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="txtVendorName" runat="server" meta:resourcekey="txtVendorNameResource1"
                            Width="165px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regAppName" runat="server" ControlToValidate="txtVendorName"
                            ErrorMessage="Enter Valid Applicant Name" meta:resourcekey="regAppNameResource1"
                            ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="btnSearchAppNo" runat="server" meta:resourcekey="btnSearchAppNoResource1"
                            OnClick="btnSearchAppNo_Click" Text="Search" Width="61px" />&nbsp;
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvVendorDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="LicenseApplicationId"
                meta:resourcekey="gvVendorDetailResource1" OnPageIndexChanging="gvVendorDetail_PageIndexChanging"
                OnSelectedIndexChanged="gvVendorDetail_SelectedIndexChanged" PageSize="5" Width="100%">
                <Columns>
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Applicant Name" meta:resourcekey="BoundFieldResource1"
                        SortExpression="NameOfApplicant" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" meta:resourcekey="BoundFieldResource2"
                        SortExpression="DateOfBirth" />
                    <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" meta:resourcekey="BoundFieldResource3"
                        SortExpression="ApplicationDate" />
                    <asp:CommandField meta:resourcekey="CommandFieldResource1" SelectText="Update" ShowSelectButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    Record Not Found
                </EmptyDataTemplate>
                <PagerSettings Mode="NumericFirstLast" />
            </asp:GridView>
            <asp:ObjectDataSource ID="odsVendorDtl" runat="server" SelectMethod="GetvendordetailByAppNumber"
                TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
                <SelectParameters>
                    <asp:Parameter Name="ApplnNumber" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="vieLicFm" runat="server">
            <asp:ObjectDataSource ID="odsGetVendorDetails" runat="server" InsertMethod="NewLicenseApplication"
                OnInserting="odsGetVendorDetails_Inserting" OnUpdating="odsGetVendorDetails_Updating"
                SelectMethod="GetlicenseAppBylicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication"
                UpdateMethod="updateVendorsDetail">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldLicenseId" Name="LicenseApplicationId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="parameter" Type="Object" />
                    <asp:Parameter Name="Verified" Type="Boolean" />
                    <asp:Parameter Name="AlertId" Type="Object" />
                    <asp:Parameter Name="LicenseApplicationId" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:FormView ID="fvVendorDetails" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsFrankingMachineDetails" DefaultMode="Insert" meta:resourcekey="fvVendorDetailsResource1"
                OnItemInserted="fvVendorDetails_ItemInserted1" OnItemInserting="fvVendorDetails_ItemInserting"
                OnItemUpdated="fvVendorDetails_ItemUpdated" OnItemUpdating="fvVendorDetails_ItemUpdating"
                OnLoad="fvVendorDetails_Load" OnPageIndexChanging="fvVendorDetails_PageIndexChanging">
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource2"
                                    SkinID="Heading" Text="Enter Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource2" Text="Application No"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource2"
                                    Text='<%# Bind("ApplnNumber") %>' MaxLength="15"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="txtapplnnum" runat="server" ControlToValidate="ApplnNumberTextBox"
                                    ErrorMessage="Application No is Must" meta:resourcekey="txtapplnnumResource1">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regApplnNumberTextBox" runat="server" ControlToValidate="ApplnNumberTextBox"
                                    ErrorMessage="Please Enter Valid Application No" meta:resourcekey="regApplnNumberTextBoxResource1"
                                    ValidationExpression="<%$ Resources:ValidationRegx,AlphaNum %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource2" Text="Office"></asp:Label></td>
                            <td align="left">
                                <asp:DropDownList ID="ddlOfficeNameUpd" runat="server" DataSourceID="odsOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlOfficeNameUpdResource1"
                                    OnLoad="ddlOfficeNameUpd_Load" SelectedValue='<%# Bind("SubmissionOfficeId") %>'>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td>
                                <asp:Label ID="lblPurpose" runat="server" Text="Purpose" meta:resourcekey="lblPurposeResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPurpose" runat="server" DataSourceID="XmlLicensePurpose"
                                    DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("PurposeOfLicense") %>' meta:resourcekey="ddlPurposeResource1">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource2" Text="Bank Name"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource2"
                                    Text='<%# Bind("NameOfApplicant") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="regAppName" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Applicant Name is Must" meta:resourcekey="regAppNameResource2">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Name" meta:resourcekey="regAppnametResource1" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource2"
                                    Text="Zonal Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" meta:resourcekey="PresentAddressTextBoxResource2"
                                    Text='<%# Bind("PresentAddress") %>' TextMode="MultiLine" Columns="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource2"
                                    Text="Main Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" meta:resourcekey="PermanentAddressTextBoxResource2"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" Columns="250"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" meta:resourcekey="BaddtressResource2" Text="Applying Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" meta:resourcekey="BusinessAddressTextBoxResource2"
                                    Text='<%# Bind("BusinessAddress") %>' TextMode="MultiLine" Columns="250"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHolding" runat="server" Text="Holding Any Other License" meta:resourcekey="lblHoldingResource1"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<uc2:RadioButtonControl ID="RadioButtonControl1" runat="server" Value='<%# Bind("HoldingAnyOtherLicense") %>'>
                                </uc2:RadioButtonControl>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" meta:resourcekey="LblcasteResource2" Text="Type of Bank"></asp:Label></td>
                            <td align="left">
                                &nbsp;
                                <asp:TextBox ID="CasteTextBox" runat="server" meta:resourcekey="CasteTextBoxResource2"
                                    Text='<%# Bind("Caste") %>' MaxLength="30"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource2" Text="Phone"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtphone" runat="server" meta:resourcekey="txtphoneResource2" Text='<%# Bind("HomePhone") %>'
                                    Width="131px" MaxLength="11"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ValidateText" runat="server" ControlToValidate="txtphone"
                                    ErrorMessage="Phone No is Mandatory" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pssksks" runat="server" ControlToValidate="txtphone"
                                    ErrorMessage="Phone No Should be Numeric and 10 Digit" meta:resourcekey="pssksksResource1"
                                    ValidationExpression="^\d{5,10}$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource2" Text="Name Of Refer" Visible="False"></asp:Label></td>
                            <td align="left">
                                &nbsp;<asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"
                                    Text='<%# Bind("NameAndAddressOfReferer") %>' TextMode="MultiLine" MaxLength="30" Visible="False"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text="Investment Amount" Visible="False"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" meta:resourcekey="TotalInvestmentAmountTextBoxResource2"
                                    Text='1' Width="131px" MaxLength="8" Visible="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ReqFldInvestmentAmountTextBox" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ErrorMessage="Please Enter Invesment Amount" meta:resourcekey="ReqFldInvestmentAmountTextBoxResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reginveamount" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ErrorMessage="Enter Numeric Value in Invesment Amount Field" meta:resourcekey="reginveamountResource1"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Salary %>">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td align="left">
                                </td>
                            <td align="left">
                                &nbsp;</td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValNameAndAddressOfRefererIns" runat="server"
                                    ControlToValidate="NameAndAddressOfRefererTextBox" ErrorMessage="Enter Refer Name"
                                    meta:resourcekey="ReqFldValNameAndAddressOfRefererInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regNameOfRefer" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Refer Name" meta:resourcekey="regNameOfReferResource1"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblremars" runat="server" meta:resourcekey="lblremarsResource1" Text="Remarks"
                                    Visible="False"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="Remarks" runat="server" meta:resourcekey="RemarksResource1" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine" Visible="False" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <uc1:FileForward ID="FileForward1" runat="server" OnLoad="FileForward1_Load"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkVerified" runat="server" meta:resourcekey="chkVerifiedResource1"
                                    Text="Verification Complete" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="Button1" runat="server" CommandName="Update" meta:resourcekey="Button1Resource1"
                                    Text="Update" />
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    meta:resourcekey="Button2Resource1" Text="Cancel" />&nbsp;
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource1"
                                    SkinID="Heading" Text="Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width:20%">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource1" Text='Application No<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left" style="width:20%">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource1"
                                    Text='<%# Bind("ApplnNumber") %>' MaxLength="15"></asp:TextBox></td>
                            <td style="width:10%">
                                <asp:RequiredFieldValidator ID="txtapplnnum" runat="server" ControlToValidate="ApplnNumberTextBox"
                                    ErrorMessage="Application No is Must" meta:resourcekey="txtapplnnumResource1">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regApplnNumberTextBox" runat="server" ControlToValidate="ApplnNumberTextBox" ValidationExpression="<%$ Resources:ValidationRegx,AlphaNum %>"
                                    ErrorMessage="Please Enter Valid Application No" Text="*"></asp:RegularExpressionValidator>
                            </td>
                            <td align="left" style="width:20%">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="Office"></asp:Label></td>
                            <td align="left"  style="width:20%">
                                <asp:DropDownList ID="ddlOfficeNameIns" runat="server" DataTextField="OfficeName"
                                    DataValueField="OfficeId" meta:resourcekey="ddlOfficeNameInsResource1" OnLoad="ddlOfficeNameIns_Load"
                                    SelectedValue='<%# Bind("SubmissionOfficeId") %>' DataSourceID="odsOffices">
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%"></td>
                        </tr>
                        <tr style="display:none;">
                            <td>
                                <asp:Label ID="lblPurpose" runat="server" Text="Purpose" meta:resourcekey="lblPurposeResource2"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPurpose" runat="server" DataSourceID="XmlLicensePurpose"
                                    DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("PurposeOfLicense") %>' meta:resourcekey="ddlPurposeResource2">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource1" Text='Bank Name<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource1"
                                    Text='<%# Bind("NameOfApplicant") %>' MaxLength="50"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="regAppName" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Applicant Name is Must" meta:resourcekey="regAppNameResource2">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Name" meta:resourcekey="regAppnametResource1" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource1"
                                    Text="Zonal Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" meta:resourcekey="PresentAddressTextBoxResource1"
                                    Text='<%# Bind("PresentAddress") %>' TextMode="MultiLine" Width="100%" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource1"
                                    Text="Main Branch Address"></asp:Label></td>
                            <td align="left" >
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Height="53px" meta:resourcekey="PermanentAddressTextBoxResource1"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" MaxLength="250"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" meta:resourcekey="BaddtressResource1" Text="Applying Branch Address"></asp:Label></td>
                            <td align="left" >
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Height="53px" meta:resourcekey="BusinessAddressTextBoxResource1"
                                    Text='<%# Bind("BusinessAddress") %>' TextMode="MultiLine" MaxLength="250"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHolding" runat="server" Text="Holding Any Other License" meta:resourcekey="lblHoldingResource2"></asp:Label>
                            </td>
                            <td>
                                <uc2:RadioButtonControl ID="RadioButtonControl1" runat="server" Value='<%# Bind("HoldingAnyOtherLicense") %>'>
                                </uc2:RadioButtonControl>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource1" Text='Phone<span style="color: Red;">*</span>'></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtphone" runat="server" MaxLength="10" meta:resourcekey="txtphoneResource1"
                                    Text='<%# Bind("HomePhone") %>' Width="95%"></asp:TextBox>
                            </td>
                            <td>
                            <asp:RegularExpressionValidator ID="pssksks" runat="server" ControlToValidate="txtphone"
                                    ErrorMessage="Phone No Should be Numeric and 10 Digit" meta:resourcekey="pssksksResource1"
                                    ValidationExpression="^\d{5,10}$">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="ValidateText" runat="server" ControlToValidate="txtphone"
                                    ErrorMessage="Phone No is Mandatory" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left">
                                </td>
                            <td>
                                
                                </td>
                            <td align="left">
                                
                            </td>
                            <td align="left" >
                                &nbsp;</td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" meta:resourcekey="lblqualificationResource1"
                                    Text="Type of Bank"></asp:Label></td>
                            <td align="left" >
                                <asp:TextBox ID="QualificationTextBox" runat="server" meta:resourcekey="QualificationTextBoxResource1"
                                    Text='<%# Bind("Qualification") %>' MaxLength="25"></asp:TextBox></td>
                            <td>
                                <asp:RegularExpressionValidator ID="regQualification" runat="server" ControlToValidate="QualificationTextBox"
                                    ErrorMessage="Please Enter Valid Qualificaton" meta:resourcekey="regQualificationResource1"
                                    ValidationExpression="<%$ Resources:ValidationRegx, AlphaBet %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" meta:resourcekey="lblexperienceResource1"
                                    Text="Experience" Visible="False"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" MaxLength="2" meta:resourcekey="ExperienceTextBoxResource1"
                                    Text='<%# Bind("Experience") %>' Visible="False"></asp:TextBox></td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Name Of Refer" Visible="False"></asp:Label></td>
                            <td align="left" >
                                <asp:TextBox ID="txtNameAndAddressOfRefererIns" runat="server" meta:resourcekey="txtNameAndAddressOfRefererInsResource1"
                                    Text='<%# Bind("NameAndAddressOfReferer") %>' MaxLength="30" Visible="False"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Investment Amount" Visible="False"></asp:Label></td>
                            <td align="left" >
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" meta:resourcekey="TotalInvestmentAmountTextBoxResource1"
                                    Text='<%# Bind("TotalInvestmentAmount", "{0:D}") %>' MaxLength="8" Visible="False"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;<asp:Label ID="Lblcaste" runat="server" meta:resourcekey="LblcasteResource1"
                                    Text="Caste" Visible="False"></asp:Label></td>
                            <td align="left">
                                &nbsp;<asp:TextBox ID="CasteTextBox" runat="server" meta:resourcekey="CasteTextBoxResource1" Visible="False" MaxLength="20"></asp:TextBox></td>
                            <td class="validationColumn">
                                &nbsp;<asp:RegularExpressionValidator ID="regNameOfRefer" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Refer Name" meta:resourcekey="regNameOfReferResource1"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" meta:resourcekey="lbldateofbirthResource1"
                                    Text='Date Of Birth<span style="color: Red;">*</span>' Visible="False"></asp:Label></td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="5">
                                <uc1:FileForward ID="FileForward1" runat="server" OnLoad="FileForward1_Load"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="LicInsert" runat="server" CommandName="Insert" meta:resourcekey="LicInsertResource1"
                                    OnClick="LicInsert_Click" Text="Save" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    meta:resourcekey="CancelButtonResource1" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel" runat="server" meta:resourcekey="LicenseApplicationIdLabelResource1"
                        Text='<%# Eval("LicenseApplicationId") %>'></asp:Label><br />
                    NameOfApplicant:
                    <asp:Label ID="NameOfApplicantLabel" runat="server" meta:resourcekey="NameOfApplicantLabelResource1"
                        Text='<%# Bind("NameOfApplicant") %>'></asp:Label><br />
                    PresentAddress:
                    <asp:Label ID="PresentAddressLabel" runat="server" meta:resourcekey="PresentAddressLabelResource1"
                        Text='<%# Bind("PresentAddress") %>'></asp:Label><br />
                    PermanentAddress:
                    <asp:Label ID="PermanentAddressLabel" runat="server" meta:resourcekey="PermanentAddressLabelResource1"
                        Text='<%# Bind("PermanentAddress") %>'></asp:Label><br />
                    DateOfBirth:
                    <asp:Label ID="DateOfBirthLabel" runat="server" meta:resourcekey="DateOfBirthLabelResource1"
                        Text='<%# Bind("DateOfBirth") %>'></asp:Label><br />
                    ApplicationDate:
                    <asp:Label ID="ApplicationDateLabel" runat="server" meta:resourcekey="ApplicationDateLabelResource1"
                        Text='<%# Bind("ApplicationDate") %>'></asp:Label><br />
                    Qualification:
                    <asp:Label ID="QualificationLabel" runat="server" meta:resourcekey="QualificationLabelResource1"
                        Text='<%# Bind("Qualification") %>'></asp:Label><br />
                    Experience:
                    <asp:Label ID="ExperienceLabel" runat="server" meta:resourcekey="ExperienceLabelResource1"
                        Text='<%# Bind("Experience") %>'></asp:Label><br />
                    Caste:
                    <asp:Label ID="CasteLabel" runat="server" meta:resourcekey="CasteLabelResource1"
                        Text='<%# Bind("Caste") %>'></asp:Label><br />
                    BusinessAddress:
                    <asp:Label ID="BusinessAddressLabel" runat="server" meta:resourcekey="BusinessAddressLabelResource1"
                        Text='<%# Bind("BusinessAddress") %>'></asp:Label><br />
                    TotalInvestmentAmount:
                    <asp:Label ID="TotalInvestmentAmountLabel" runat="server" meta:resourcekey="TotalInvestmentAmountLabelResource1"
                        Text='<%# Bind("TotalInvestmentAmount") %>'></asp:Label><br />
                    NameAndAddressOfReferer:
                    <asp:Label ID="NameAndAddressOfRefererLabel" runat="server" meta:resourcekey="NameAndAddressOfRefererLabelResource1"
                        Text='<%# Bind("NameAndAddressOfReferer") %>'></asp:Label><br />
                    SubmissionOfficeId:
                    <asp:Label ID="SubmissionOfficeIdLabel" runat="server" meta:resourcekey="SubmissionOfficeIdLabelResource1"
                        Text='<%# Bind("SubmissionOfficeId") %>'></asp:Label><br />
                    IssuedDate:
                    <asp:Label ID="IssuedDateLabel" runat="server" meta:resourcekey="IssuedDateLabelResource1"
                        Text='<%# Bind("IssuedDate") %>'></asp:Label><br />
                    EffectiveDate:
                    <asp:Label ID="EffectiveDateLabel" runat="server" meta:resourcekey="EffectiveDateLabelResource1"
                        Text='<%# Bind("EffectiveDate") %>'></asp:Label><br />
                    ExpiryDate:
                    <asp:Label ID="ExpiryDateLabel" runat="server" meta:resourcekey="ExpiryDateLabelResource1"
                        Text='<%# Bind("ExpiryDate") %>'></asp:Label><br />
                    Status:
                    <asp:Label ID="StatusLabel" runat="server" meta:resourcekey="StatusLabelResource1"
                        Text='<%# Bind("Status") %>'></asp:Label><br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" meta:resourcekey="RemarksLabelResource1"
                        Text='<%# Bind("Remarks") %>'></asp:Label><br />
                    CreatedBy:
                    <asp:Label ID="CreatedByLabel" runat="server" meta:resourcekey="CreatedByLabelResource1"
                        Text='<%# Bind("CreatedBy") %>'></asp:Label><br />
                    CreatedAt:
                    <asp:Label ID="CreatedAtLabel" runat="server" meta:resourcekey="CreatedAtLabelResource1"
                        Text='<%# Bind("CreatedAt") %>'></asp:Label><br />
                    ModifiedBy:
                    <asp:Label ID="ModifiedByLabel" runat="server" meta:resourcekey="ModifiedByLabelResource1"
                        Text='<%# Bind("ModifiedBy") %>'></asp:Label><br />
                    ModifiedAt:
                    <asp:Label ID="ModifiedAtLabel" runat="server" meta:resourcekey="ModifiedAtLabelResource1"
                        Text='<%# Bind("ModifiedAt") %>'></asp:Label><br />
                    ApplnNumber:
                    <asp:Label ID="ApplnNumberLabel" runat="server" meta:resourcekey="ApplnNumberLabelResource1"
                        Text='<%# Bind("ApplnNumber") %>'></asp:Label><br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        meta:resourcekey="NewButtonResource1" Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;<br />
            <br />
            &nbsp;
        </asp:View>
        <asp:View ID="viewreadonly" runat="server">
            <asp:FormView ID="fvReadOnly" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsFrankingMachineDetails" meta:resourcekey="fvReadOnlyResource1">
                <ItemTemplate>
                    <table width="100%">
                    </table>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblAppDetailItm" runat="server" meta:resourcekey="lblAppDetailItm"
                                SkinID="SubHeading" Text="Application Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="lblAppNoItm" runat="server" meta:resourcekey="lblAppNoItmResource1"
                                Text="Application No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAppNoItm" runat="server" meta:resourcekey="txtAppNoItmResource1"
                                Text='<%# Bind("ApplnNumber") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                        </td>
                        <asp:Label ID="lblAppDateItm" runat="server" meta:resourcekey="lblAppDateItmResource1"
                            Text="Application Date"></asp:Label>
                        <td>
                            <asp:TextBox ID="txtAppDateItm" runat="server" meta:resourcekey="txtAppDateItmResource1"
                                ReadOnly="True" Text='<%# Bind("ApplicationDate") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Status"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="TextBox4Resource1" ReadOnly="True"
                                Text='<%# Bind("Status") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn" colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblLeaveDetailsHeaderItm" runat="server" meta:resourcekey="lblLeaveDetailsHeaderItm"
                                SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="lblEmployeeNameItm" runat="server" meta:resourcekey="lblEmployeeNameItm"
                                Text="Applicant Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="NameOfApplicantLabel" runat="server" meta:resourcekey="NameOfApplicantLabelResource2"
                                ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="lblApplicationDateItm" runat="server" meta:resourcekey="lblApplicationDateItm"
                                Text="Present Address"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="PresentAddressLabel" runat="server" meta:resourcekey="PresentAddressLabelResource2"
                                ReadOnly="True" Text='<%# Bind("PresentAddress") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Permanent Address"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="PermanentAddressLabel" runat="server" meta:resourcekey="PermanentAddressLabelResource2"
                                ReadOnly="True" Text='<%# Bind("PermanentAddress") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="Business Address"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="BusinessAddressLabel" runat="server" meta:resourcekey="BusinessAddressLabelResource2"
                                ReadOnly="True" Text='<%# Bind("BusinessAddress") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="DOB"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="DateOfBirthLabel" runat="server" meta:resourcekey="DateOfBirthLabelResource2"
                                ReadOnly="True" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Qualification"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="QualificationLabel" runat="server" meta:resourcekey="QualificationLabelResource2"
                                ReadOnly="True" Text='<%# Bind("Qualification") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="Experience"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1" ReadOnly="True"
                                Text='<%# Bind("Experience") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="Caste"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="CasteLabel" runat="server" meta:resourcekey="CasteLabelResource2"
                                ReadOnly="True" Text='<%# Bind("Caste") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblOtherDetails" runat="server" meta:resourcekey="lblOtherDetails"
                                SkinID="SubHeading" Text="Other Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label12" runat="server" meta:resourcekey="Label12Resource1" Text="Total Amount"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TotalInvestmentAmountLabel" runat="server" meta:resourcekey="TotalInvestmentAmountLabelResource2"
                                ReadOnly="True" Text='<%# Bind("TotalInvestmentAmount") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label13" runat="server" meta:resourcekey="Label13Resource1" Text="Name Of Referer"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="NameAndAddressOfRefererLabel" runat="server" meta:resourcekey="NameAndAddressOfRefererLabelResource2"
                                ReadOnly="True" Text='<%# Bind("NameAndAddressOfReferer") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="Phone No"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="TextBox3Resource1" ReadOnly="True"
                                Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label15" runat="server" meta:resourcekey="Label15Resource1" Text="Office Name"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="SubmissionOfficeIdLabel" runat="server" meta:resourcekey="SubmissionOfficeIdLabelResource2"
                                ReadOnly="True" Text='<%# Bind("SubmissionOfficeId") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn" colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label14" runat="server" meta:resourcekey="Label14Resource1" SkinID="SubHeading"
                                Text="Creation Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="lblCreatedBy" runat="server" meta:resourcekey="lblCreatedByResource1"
                                Text="Created By"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtCreatedBy" runat="server" meta:resourcekey="txtCreatedByResource1"
                                ReadOnly="True" Text='<%# Bind("CreatedBy") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="lblCreatedAt" runat="server" meta:resourcekey="lblCreatedAtResource1"
                                Text="CreatedAt"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtCreatedAt" runat="server" meta:resourcekey="txtCreatedAtResource1"
                                ReadOnly="True" Text='<%# Bind("CreatedAt") %>'></asp:TextBox></td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label18" runat="server" meta:resourcekey="Label18Resource1" SkinID="SubHeading"
                                Text="License Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label19" runat="server" meta:resourcekey="Label19Resource1" Text="License No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox7" runat="server" meta:resourcekey="TextBox7Resource1" ReadOnly="True"
                                Text='<%# Bind("LicenseNo") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label20" runat="server" meta:resourcekey="Label20Resource1" Text="IssuedDate"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="TextBox8" runat="server" meta:resourcekey="TextBox8Resource1" ReadOnly="True"
                                Text='<%# Bind("IssuedDate") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label21" runat="server" meta:resourcekey="Label21Resource1" Text="Effective Date"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox9" runat="server" meta:resourcekey="TextBox9Resource1" ReadOnly="True"
                                Text='<%# Bind("EffectiveDate") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label22" runat="server" meta:resourcekey="Label22Resource1" Text="Expiry Date"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="TextBox10" runat="server" meta:resourcekey="TextBox10Resource1"
                                ReadOnly="True" Text='<%# Bind("ExpiryDate") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label25" runat="server" meta:resourcekey="Label25Resource1" SkinID="SubHeading"
                                Text="Approval Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label26" runat="server" meta:resourcekey="Label26Resource1" Text="Approved By"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox13" runat="server" meta:resourcekey="TextBox13Resource1"
                                ReadOnly="True" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label27" runat="server" meta:resourcekey="Label27Resource1" Text="Approval Date"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="TextBox14" runat="server" meta:resourcekey="TextBox14Resource1"
                                ReadOnly="True" Text='<%# Bind("CreationTime") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label28" runat="server" meta:resourcekey="Label28Resource1" SkinID="SubHeading"
                                Text="Cancelation Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label29" runat="server" meta:resourcekey="Label29Resource1" Text="Is Cancelled"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkIsCancelled" runat="server" Enabled="False" meta:resourcekey="chkIsCancelledResource1" />
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="Label30" runat="server" meta:resourcekey="Label30Resource1" Text="Cancelled By"></asp:Label>
                        </td>
                        <td class="textColumn">
                            <asp:TextBox ID="TextBox16" runat="server" meta:resourcekey="TextBox16Resource1"
                                ReadOnly="True" Text='<%# Bind("CancelledBy") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" SkinID="SubHeading"
                                Text="Renewal Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                        </td>
                    </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsFrankingMachineDetails" runat="server" SelectMethod="GetCompleteLicenseDetails"
        TypeName="IGRSS.BusinessLogicLayer.LicenseApplication" InsertMethod="NewFrankingApplication" OnInserting="odsFrankingMachineDetails_Inserting" OnUpdating="odsFrankingMachineDetails_Updating" UpdateMethod="updateFrankingDetails">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldLicenseId" Name="LicenseApplicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="Verified" Type="Boolean" />
            <asp:Parameter Name="AlertId" Type="Object" />
            <asp:Parameter Name="LicenseApplicationId" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldLicenseId" runat="server" />
    <asp:HiddenField ID="fldModuleCode" runat="server" Value="LIC" />
    <asp:ObjectDataSource ID="odsOffices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLicensePurpose" runat="server" InsertMethod="NewLicenseApplication"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetLicensePurpose"
        TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:XmlDataSource ID="XmlLicensePurpose" runat="server" DataFile="~/License/LicensePurpose.xml">
    </asp:XmlDataSource>
</asp:Content>
