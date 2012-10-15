<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_LicenseApplication, App_Web_syjfv0ab" title="License Application Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Src="../UserControls/RadioButtonControl.ascx" TagName="RadioButtonControl"
    TagPrefix="uc2" %>
<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvLicApp" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewLicense" runat="server">
            <table width="100%" id="TABLE1">
                <tr>
                    <td align="left">
                        <asp:Label ID="lbllls" runat="server" Text="Enter Application Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="txtApplicationNo" runat="server" Width="163px" meta:resourcekey="txtApplicationNoResource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regAppNo" runat="server" ControlToValidate="txtApplicationNo"
                            ErrorMessage="Enter Valid Application No" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>"
                            meta:resourcekey="regAppNoResource1">*</asp:RegularExpressionValidator>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblApplicationName" runat="server" Text="Enter Name" meta:resourcekey="lblApplicationNameResource1"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="txtVendorName" runat="server" Width="165px" meta:resourcekey="txtVendorNameResource1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regAppName" runat="server" ControlToValidate="txtVendorName"
                            ErrorMessage="Enter Valid Applicant Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                            meta:resourcekey="regAppNameResource1">*</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="btnSearchAppNo" runat="server" Text="Search" Width="61px" OnClick="btnSearchAppNo_Click"
                            meta:resourcekey="btnSearchAppNoResource1" />&nbsp;
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvVendorDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="LicenseApplicationId"
                OnSelectedIndexChanged="gvVendorDetail_SelectedIndexChanged" Width="100%" OnPageIndexChanging="gvVendorDetail_PageIndexChanging"
                PageSize="5" meta:resourcekey="gvVendorDetailResource1">
                <Columns>
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Applicant Name" SortExpression="NameOfApplicant"
                        meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DateOfBirth"
                        meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" SortExpression="ApplicationDate"
                        meta:resourcekey="BoundFieldResource3" />
                    <asp:CommandField ShowSelectButton="True" SelectText="Update" meta:resourcekey="CommandFieldResource1" />
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
            <asp:ObjectDataSource ID="odsGetVendorDetails" runat="server" SelectMethod="GetlicenseAppBylicenseAppID"
                TypeName="IGRSS.BusinessLogicLayer.LicenseApplication" UpdateMethod="updateVendorsDetail"
                OnUpdating="odsGetVendorDetails_Updating" InsertMethod="NewLicenseApplication"
                OnInserting="odsGetVendorDetails_Inserting" OnInserted="odsGetVendorDetails_Inserted"
                OnUpdated="odsGetVendorDetails_Updated">
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
                DataSourceID="odsGetVendorDetails" DefaultMode="Insert" OnItemInserted="fvVendorDetails_ItemInserted1"
                OnItemUpdated="fvVendorDetails_ItemUpdated" OnItemUpdating="fvVendorDetails_ItemUpdating"
                OnLoad="fvVendorDetails_Load" OnItemInserting="fvVendorDetails_ItemInserting"
                OnPageIndexChanging="fvVendorDetails_PageIndexChanging" meta:resourcekey="fvVendorDetailsResource1">
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="License Applicant Details"
                                    meta:resourcekey="LBlLicenseHeadingResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label17" runat="server" Text="File Number" meta:resourcekey="Label17Resource1"></asp:Label></td>
                            <td align="left">
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>' meta:resourcekey="lblfileNoResource1"></asp:Label></td>
                            <td>
                            </td>
                            <td align="left">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" ReadOnly="True" runat="server" Text='<%# Bind("ApplnNumber") %>'
                                    MaxLength="30" meta:resourcekey="ApplnNumberTextBoxResource2"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="txtapplnnum" ControlToValidate="ApplnNumberTextBox"
                                    runat="server" ErrorMessage="Application No is Must" meta:resourcekey="txtapplnnumResource1">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regApplnNumberTextBox" runat="server" ControlToValidate="ApplnNumberTextBox"
                                    ErrorMessage="Please Enter Valid Application No" ValidationExpression="<%$ Resources:ValidationRegx,AlphaNum %>"
                                    meta:resourcekey="regApplnNumberTextBoxResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" Text="Office" meta:resourcekey="Label3Resource2"></asp:Label></td>
                            <td align="left">
                                <asp:DropDownList ID="ddlOfficeNameUpd" runat="server" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SubmissionOfficeId") %>' meta:resourcekey="ddlOfficeNameUpdResource1"
                                    OnLoad="ddlOfficeNameUpd_Load" DataSourceID="odsOffices">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="lblPurpose" runat="server" Text="Purpose" meta:resourcekey="lblPurposeResource1"></asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:DropDownList ID="ddlPurpose" runat="server" DataSourceID="XmlLicensePurpose"
                                    DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("PurposeOfLicense") %>'
                                    meta:resourcekey="ddlPurposeResource1">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                                    MaxLength="30" meta:resourcekey="NameOfApplicantTextBoxResource2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="regAppName" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Applicant Name is Must" meta:resourcekey="regAppNameResource2">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                    meta:resourcekey="regAppnametResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                                    MaxLength="250" TextMode="MultiLine" meta:resourcekey="PresentAddressTextBoxResource2"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                                    MaxLength="250" TextMode="MultiLine" meta:resourcekey="PermanentAddressTextBoxResource2"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                                    MaxLength="250" TextMode="MultiLine" meta:resourcekey="BusinessAddressTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHolding" runat="server" Text="Holding Any Other License" meta:resourcekey="lblHoldingResource1"></asp:Label>
                            </td>
                            <td>
                                <uc2:RadioButtonControl ID="RadioButtonControl1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" Text='Date Of Birth&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lbldateofbirthResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth", "{0:d}") %>'
                                    Width="76%" SkinID="Calendar" ReadOnly="True" meta:resourcekey="DateOfBirthTextBoxResource2"></asp:TextBox>
                                <rjs:PopCalendar ID="pcDateOfBirth" runat="server" Control="DateOfBirthTextBox" To-Date=""
                                    To-Today="True" meta:resourcekey="pcDateOfBirthResource1" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="regDateOfBirth" runat="server" ControlToValidate="DateOfBirthTextBox"
                                    ErrorMessage="Please Enter Date of Birth" meta:resourcekey="regDateOfBirthResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" Text='Phone&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblpjoneResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("HomePhone") %>' Width="131px"
                                    MaxLength="10" meta:resourcekey="txtphoneResource2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ValidateText" ControlToValidate="txtphone" runat="server"
                                    ErrorMessage="Phone No is Mandatory" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pssksks" runat="server" ControlToValidate="txtphone"
                                    ValidationExpression="^\d{5,13}$" ErrorMessage="Phone No Should be Numeric and 5-13 Digit"
                                    meta:resourcekey="pssksksResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                                    MaxLength="30" meta:resourcekey="QualificationTextBoxResource2"></asp:TextBox></td>
                            <td>
                                <asp:RegularExpressionValidator ID="regQualification" runat="server" ControlToValidate="QualificationTextBox"
                                    ErrorMessage="Please Enter Valid Qualificaton" ValidationExpression="<%$ Resources:ValidationRegx, AlphaBet %>"
                                    meta:resourcekey="regQualificationResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" Text='Experience&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblexperienceResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                                    MaxLength="2" meta:resourcekey="ExperienceTextBoxResource2"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvExperienceTextBox" runat="server" ControlToValidate="ExperienceTextBox"
                                    ErrorMessage="Please Enter Experience" meta:resourcekey="rfvExperienceTextBoxResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExperience" runat="server" ControlToValidate="ExperienceTextBox"
                                    ErrorMessage="Experience Should be Numeric" ValidationExpression="<%$ Resources:ValidationRegx, Experience %>"
                                    meta:resourcekey="regExperienceResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource2"
                                    MaxLength="30"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text='Investment Amount&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="Label1Resource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                                    Width="131px" meta:resourcekey="TotalInvestmentAmountTextBoxResource2" MaxLength="8"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ReqFldInvestmentAmountTextBox" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ErrorMessage="Please Enter Investment Amount" meta:resourcekey="ReqFldInvestmentAmountTextBoxResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reginveamount" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Salary %>" ErrorMessage="Enter Numeric Value in Investment Amount Field"
                                    meta:resourcekey="reginveamountResource1">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text='Name Of Refer&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="Label2Resource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    TextMode="MultiLine" meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValNameAndAddressOfRefererIns" runat="server"
                                    ControlToValidate="NameAndAddressOfRefererTextBox" ErrorMessage="Enter Refer Name"
                                    meta:resourcekey="ReqFldValNameAndAddressOfRefererInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regNameOfRefer" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                    ErrorMessage="Enter Valid Refer Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                    meta:resourcekey="regNameOfReferResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblremars" runat="server" Text="Remarks" Visible="False" meta:resourcekey="lblremarsResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine"
                                    Visible="False" meta:resourcekey="RemarksResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <uc1:FileForward ID="FileForward1" runat="server" meta:resourcekey="FileForward1"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkVerified" runat="server" Text="Verification Complete" meta:resourcekey="chkVerifiedResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="Button1" runat="server" CommandName="Update" Text="Update" meta:resourcekey="Button1Resource1" />
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="Button2Resource1" />&nbsp;
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Applicant Details"
                                    meta:resourcekey="LBlLicenseHeadingResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 34px">
                                <asp:Label ID="lblappno" runat="server" Text='Application No&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblappnoResource1"></asp:Label></td>
                            <td align="left" style="height: 34px">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>'
                                    meta:resourcekey="ApplnNumberTextBoxResource1" MaxLength="10"></asp:TextBox></td>
                            <td style="height: 34px">
                                <asp:RequiredFieldValidator ID="txtapplnnum" ControlToValidate="ApplnNumberTextBox"
                                    runat="server" ErrorMessage="Application No is Must" meta:resourcekey="txtapplnnumResource1">
								*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regApplnNumberTextBox" runat="server" ControlToValidate="ApplnNumberTextBox"
                                    ErrorMessage="Please Enter Valid Application No" ValidationExpression="<%$ Resources:ValidationRegx,AlphaNum %>"
                                    meta:resourcekey="regApplnNumberTextBoxResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left" style="height: 34px">
                                <asp:Label ID="Label3" runat="server" Text="Office" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td align="left" style="width: 164px; height: 34px;">
                                <asp:DropDownList ID="ddlOfficeNameIns" runat="server" SelectedValue='<%# Bind("SubmissionOfficeId") %>'
                                    meta:resourcekey="ddlOfficeNameInsResource1" OnLoad="ddlOfficeNameIns_Load">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPurpose" runat="server" Text="Purpose" meta:resourcekey="lblPurposeResource2"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPurpose" runat="server" DataSourceID="XmlLicensePurpose"
                                    DataTextField="Key" DataValueField="Value" SelectedValue='<%# Bind("PurposeOfLicense") %>'
                                    meta:resourcekey="ddlPurposeResource2">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" Text='Applicant Name&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblapnameResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                                    meta:resourcekey="NameOfApplicantTextBoxResource1" MaxLength="30"></asp:TextBox>
                                <td>
                                    <asp:RequiredFieldValidator ID="regAppName" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                        ErrorMessage="Applicant Name is Must" meta:resourcekey="regAppNameResource2">
								*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="NameOfApplicantTextBox"
                                        ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                        meta:resourcekey="regAppnametResource1">*</asp:RegularExpressionValidator>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource1"></asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                                        TextMode="MultiLine" meta:resourcekey="PresentAddressTextBoxResource1" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                                    MaxLength="250" TextMode="MultiLine" Height="53px" meta:resourcekey="PermanentAddressTextBoxResource1"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource1"></asp:Label></td>
                            <td align="left" style="width: 164px">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                                    TextMode="MultiLine" Height="53px" meta:resourcekey="BusinessAddressTextBoxResource1"
                                    MaxLength="250"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHolding" runat="server" Text="Holding Any Other License" meta:resourcekey="lblHoldingResource1"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<uc2:RadioButtonControl ID="RadioButtonControl1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" Text='Date Of Birth&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lbldateofbirthResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth", "{0:d}") %>'
                                    meta:resourcekey="DateOfBirthTextBoxResource1" Width="79%"></asp:TextBox>
                                    <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="DateOfBirthTextBox" To-Date=""
                                    To-Today="True" meta:resourcekey="PopCalendar1Resource1" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="regDateOfBirth" runat="server" ControlToValidate="DateOfBirthTextBox"
                                    ErrorMessage="Please Enter Date of Birth" meta:resourcekey="regDateOfBirthResource1">*</asp:RequiredFieldValidator>
                                
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" Text='Phone&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblpjoneResource1"></asp:Label></td>
                            <td align="left" style="width: 164px">
                                <asp:TextBox ID="txtphone" runat="server" MaxLength="10" Text='<%# Bind("HomePhone") %>'
                                    meta:resourcekey="txtphoneResource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ValidateText" ControlToValidate="txtphone" runat="server"
                                    ErrorMessage="Phone No is Mandatory" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pssksks" runat="server" ControlToValidate="txtphone"
                                    ValidationExpression="^\d{5,10}$" ErrorMessage="Phone No Should be Numeric and 5-10 Digit"
                                    meta:resourcekey="pssksksResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                                    MaxLength="30" meta:resourcekey="QualificationTextBoxResource1"></asp:TextBox></td>
                            <td>
                                <asp:RegularExpressionValidator ID="regQualification" runat="server" ControlToValidate="QualificationTextBox"
                                    ErrorMessage="Please Enter Valid Qualificaton" ValidationExpression="<%$ Resources:ValidationRegx, AlphaBet %>"
                                    meta:resourcekey="regQualificationResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" Text='Experience&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblexperienceResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                                    MaxLength="2" meta:resourcekey="ExperienceTextBoxResource1"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvExperienceTextBox" runat="server" ControlToValidate="ExperienceTextBox"
                                    ErrorMessage="Please Enter Experience" meta:resourcekey="rfvExperienceTextBoxResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExperience" runat="server" ControlToValidate="ExperienceTextBox"
                                    ErrorMessage="Experience Should be Numeric" ValidationExpression="<%$ Resources:ValidationRegx, Experience %>"
                                    meta:resourcekey="regExperienceResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource1"
                                    MaxLength="30"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text='Investment Amount&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td align="left" style="width: 164px">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount", "{0:D}") %>'
                                    meta:resourcekey="TotalInvestmentAmountTextBoxResource1" MaxLength="8"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="ReqFldInvestmentAmountTextBox" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ErrorMessage="Please Enter Investment Amount" meta:resourcekey="ReqFldInvestmentAmountTextBoxResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reginveamount" runat="server" ControlToValidate="TotalInvestmentAmountTextBox"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Salary %>" ErrorMessage="Enter Numeric Value in Investment Amount Field"
                                    meta:resourcekey="reginveamountResource1">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text='Name Of Refer&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtNameAndAddressOfRefererIns" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    MaxLength="30" meta:resourcekey="txtNameAndAddressOfRefererInsResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValNameAndAddressOfRefererIns" runat="server"
                                    ControlToValidate="txtNameAndAddressOfRefererIns" ErrorMessage="Enter Refer Name"
                                    meta:resourcekey="ReqFldValNameAndAddressOfRefererInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regNameOfRefer" runat="server" ControlToValidate="txtNameAndAddressOfRefererIns"
                                    ErrorMessage="Enter Valid Refer Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                    meta:resourcekey="regNameOfReferResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="left">
                                <uc1:FileForward ID="FileForward1" runat="server"  meta:resourcekey="FileForward1"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="LicInsert" runat="server" CommandName="Insert" Text="Save" OnClick="LicInsert_Click" 
                                    meta:resourcekey="LicInsertResource1" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel" runat="server" Text='<%# Eval("LicenseApplicationId") %>'
                        meta:resourcekey="LicenseApplicationIdLabelResource1"></asp:Label><br />
                    NameOfApplicant:
                    <asp:Label ID="NameOfApplicantLabel" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                        meta:resourcekey="NameOfApplicantLabelResource1"></asp:Label><br />
                    PresentAddress:
                    <asp:Label ID="PresentAddressLabel" runat="server" Text='<%# Bind("PresentAddress") %>'
                        meta:resourcekey="PresentAddressLabelResource1"></asp:Label><br />
                    PermanentAddress:
                    <asp:Label ID="PermanentAddressLabel" runat="server" Text='<%# Bind("PermanentAddress") %>'
                        meta:resourcekey="PermanentAddressLabelResource1"></asp:Label><br />
                    DateOfBirth:
                    <asp:Label ID="DateOfBirthLabel" runat="server" Text='<%# Bind("DateOfBirth") %>'
                        meta:resourcekey="DateOfBirthLabelResource1"></asp:Label><br />
                    ApplicationDate:
                    <asp:Label ID="ApplicationDateLabel" runat="server" Text='<%# Bind("ApplicationDate") %>'
                        meta:resourcekey="ApplicationDateLabelResource1"></asp:Label><br />
                    Qualification:
                    <asp:Label ID="QualificationLabel" runat="server" Text='<%# Bind("Qualification") %>'
                        meta:resourcekey="QualificationLabelResource1"></asp:Label><br />
                    Experience:
                    <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Bind("Experience") %>' meta:resourcekey="ExperienceLabelResource1"></asp:Label><br />
                    Caste:
                    <asp:Label ID="CasteLabel" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteLabelResource1"></asp:Label><br />
                    BusinessAddress:
                    <asp:Label ID="BusinessAddressLabel" runat="server" Text='<%# Bind("BusinessAddress") %>'
                        meta:resourcekey="BusinessAddressLabelResource1"></asp:Label><br />
                    TotalInvestmentAmount:
                    <asp:Label ID="TotalInvestmentAmountLabel" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                        meta:resourcekey="TotalInvestmentAmountLabelResource1"></asp:Label><br />
                    NameAndAddressOfReferer:
                    <asp:Label ID="NameAndAddressOfRefererLabel" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                        meta:resourcekey="NameAndAddressOfRefererLabelResource1"></asp:Label><br />
                    SubmissionOfficeId:
                    <asp:Label ID="SubmissionOfficeIdLabel" runat="server" Text='<%# Bind("SubmissionOfficeId") %>'
                        meta:resourcekey="SubmissionOfficeIdLabelResource1"></asp:Label><br />
                    IssuedDate:
                    <asp:Label ID="IssuedDateLabel" runat="server" Text='<%# Bind("IssuedDate") %>' meta:resourcekey="IssuedDateLabelResource1"></asp:Label><br />
                    EffectiveDate:
                    <asp:Label ID="EffectiveDateLabel" runat="server" Text='<%# Bind("EffectiveDate") %>'
                        meta:resourcekey="EffectiveDateLabelResource1"></asp:Label><br />
                    ExpiryDate:
                    <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Bind("ExpiryDate") %>' meta:resourcekey="ExpiryDateLabelResource1"></asp:Label><br />
                    Status:
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' meta:resourcekey="StatusLabelResource1"></asp:Label><br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksLabelResource1"></asp:Label><br />
                    CreatedBy:
                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' meta:resourcekey="CreatedByLabelResource1"></asp:Label><br />
                    CreatedAt:
                    <asp:Label ID="CreatedAtLabel" runat="server" Text='<%# Bind("CreatedAt") %>' meta:resourcekey="CreatedAtLabelResource1"></asp:Label><br />
                    ModifiedBy:
                    <asp:Label ID="ModifiedByLabel" runat="server" Text='<%# Bind("ModifiedBy") %>' meta:resourcekey="ModifiedByLabelResource1"></asp:Label><br />
                    ModifiedAt:
                    <asp:Label ID="ModifiedAtLabel" runat="server" Text='<%# Bind("ModifiedAt") %>' meta:resourcekey="ModifiedAtLabelResource1"></asp:Label><br />
                    ApplnNumber:
                    <asp:Label ID="ApplnNumberLabel" runat="server" Text='<%# Bind("ApplnNumber") %>'
                        meta:resourcekey="ApplnNumberLabelResource1"></asp:Label><br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New" meta:resourcekey="NewButtonResource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
        </asp:View>
        <asp:View ID="viewreadonly" runat="server">
            <asp:FormView ID="fvReadOnly" runat="server" DataSourceID="odsCompletelicenseDetails"
                DataKeyNames="LicenseApplicationId" meta:resourcekey="fvReadOnlyResource1">
                <ItemTemplate>
                    <table width="100%">
                    </table>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblAppDetailItm" runat="server" meta:resourcekey="lblAppDetailItm"
                                SkinID="SubHeading" Text="Application Details"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="lblFileno" runat="server" Text="File Number" meta:resourcekey="lblFilenoResource2"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFileNumber" runat="server" meta:resourcekey="lblFileNumberResource1"></asp:Label>
                        </td>
                        <td class="validationColumn">
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="lblAppNoItm" runat="server" Text="Application No" meta:resourcekey="lblAppNoItmResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAppNoItm" runat="server" Text='<%# Bind("ApplnNumber") %>' meta:resourcekey="txtAppNoItmResource1"
                                ReadOnly="True"></asp:TextBox></td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumn">
                            <asp:Label ID="Label11" runat="server" Text="Status" meta:resourcekey="Label11Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("Status") %>'
                                meta:resourcekey="TextBox4Resource1" OnDataBinding="TextBox4_DataBinding"></asp:TextBox></td>
                        <td class="validationColumn" >
                        </td>
                        <td class="labelColumn">
                            <asp:Label ID="lblAppDateItm" runat="server" Text="Application Date" meta:resourcekey="lblAppDateItmResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtAppDateItm" ReadOnly="True" runat="server" Text='<%# Bind("ApplicationDate", "{0:d}") %>'
                                meta:resourcekey="txtAppDateItmResource1"></asp:TextBox></td>
                        <td class="validationColumn">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblLeaveDetailsHeaderItm" runat="server" meta:resourcekey="lblLeaveDetailsHeaderItm"
                                SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblEmployeeNameItm" runat="server" meta:resourcekey="lblEmployeeNameItm"
                                        Text="Applicant Name"></asp:Label>
                                    <td>
                                        <asp:TextBox ID="NameOfApplicantLabel" runat="server" ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>'
                                            meta:resourcekey="NameOfApplicantLabelResource2"></asp:TextBox>
                                        <td class="validationColumn">
                                            <td class="labelColumn">
                                                <asp:Label ID="lblApplicationDateItm" runat="server" meta:resourcekey="lblApplicationDateItm"
                                                    Text="Present Address"></asp:Label>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="PresentAddressLabel" runat="server" ReadOnly="True" Text='<%# Bind("PresentAddress") %>'
                                                        meta:resourcekey="PresentAddressLabelResource2"></asp:TextBox>
                                                    <td class="validationColumn">
                                                        <tr>
                                                            <td class="labelColumn">
                                                                <asp:Label ID="Label4" runat="server" Text="Permanent Address" meta:resourcekey="Label4Resource1"></asp:Label>
                                                                <td>
                                                                    <asp:TextBox ID="PermanentAddressLabel" runat="server" ReadOnly="True" Text='<%# Bind("PermanentAddress") %>'
                                                                        meta:resourcekey="PermanentAddressLabelResource2"></asp:TextBox>
                                                                    <td class="validationColumn">
                                                                        <td class="labelColumn">
                                                                            <asp:Label ID="Label10" runat="server" Text="Business Address" meta:resourcekey="Label10Resource1"></asp:Label>
                                                                            <td>
                                                                                <asp:TextBox ID="BusinessAddressLabel" runat="server" ReadOnly="True" Text='<%# Bind("BusinessAddress") %>'
                                                                                    meta:resourcekey="BusinessAddressLabelResource2"></asp:TextBox>
                                                                                <td class="validationColumn">
                                                                                    <tr>
                                                                                        <td class="labelColumn">
                                                                                            <asp:Label ID="Label5" runat="server" Text="DOB" meta:resourcekey="Label5Resource1"></asp:Label>
                                                                                            <td class="textColumn">
                                                                                                <asp:TextBox ID="DateOfBirthLabel" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth") %>'
                                                                                                    meta:resourcekey="DateOfBirthLabelResource2"></asp:TextBox>
                                                                                                <td class="validationColumn">
                                                                                                    <td class="labelColumn">
                                                                                                        <asp:Label ID="Label7" runat="server" Text="Qualification" meta:resourcekey="Label7Resource1"></asp:Label>
                                                                                                        <td class="textColumn">
                                                                                                            <asp:TextBox ID="QualificationLabel" runat="server" ReadOnly="True" Text='<%# Bind("Qualification") %>'
                                                                                                                meta:resourcekey="QualificationLabelResource2"></asp:TextBox>
                                                                                                            <td class="validationColumn">
                                                                                                                <tr>
                                                                                                                    <td class="labelColumn">
                                                                                                                        <asp:Label ID="Label8" runat="server" Text="Experience" meta:resourcekey="Label8Resource1"></asp:Label>
                                                                                                                        <td>
                                                                                                                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("Experience") %>'
                                                                                                                                meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                                                                                                            <td class="validationColumn">
                                                                                                                                <td class="labelColumn">
                                                                                                                                    <asp:Label ID="Label9" runat="server" Text="Caste" meta:resourcekey="Label9Resource1"></asp:Label>
                                                                                                                                    <td class="textColumn">
                                                                                                                                        <asp:TextBox ID="CasteLabel" runat="server" ReadOnly="True" Text='<%# Bind("Caste") %>'
                                                                                                                                            meta:resourcekey="CasteLabelResource2"></asp:TextBox>
                                                                                                                                        <td class="validationColumn">
                                                                                                                                            <tr>
                                                                                                                                                <td colspan="6">
                                                                                                                                                    <asp:Label ID="lblOtherDetails" runat="server" meta:resourcekey="lblOtherDetails"
                                                                                                                                                        SkinID="SubHeading" Text="Other Details"></asp:Label>
                                                                                                                                                    <tr>
                                                                                                                                                        <td class="labelColumn">
                                                                                                                                                            <asp:Label ID="Label12" runat="server" Text="Total Amount" meta:resourcekey="Label12Resource1"></asp:Label>
                                                                                                                                                            <td>
                                                                                                                                                                <asp:TextBox ID="TotalInvestmentAmountLabel" runat="server" ReadOnly="True" Text='<%# Bind("TotalInvestmentAmount") %>'
                                                                                                                                                                    meta:resourcekey="TotalInvestmentAmountLabelResource2"></asp:TextBox>
                                                                                                                                                                <td class="validationColumn">
                                                                                                                                                                    <td class="labelColumn">
                                                                                                                                                                        <asp:Label ID="Label13" runat="server" Text="Name Of Referer" meta:resourcekey="Label13Resource1"></asp:Label>
                                                                                                                                                                        <td class="textColumn">
                                                                                                                                                                            <asp:TextBox ID="NameAndAddressOfRefererLabel" runat="server" ReadOnly="True" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                                                                                                                                                                meta:resourcekey="NameAndAddressOfRefererLabelResource2"></asp:TextBox>
                                                                                                                                                                            <td class="validationColumn">
                                                                                                                                                                                <tr>
                                                                                                                                                                                    <td class="labelColumn">
                                                                                                                                                                                        <asp:Label ID="Label6" runat="server" Text="Phone No" meta:resourcekey="Label6Resource1"></asp:Label>
                                                                                                                                                                                        <td class="textColumn">
                                                                                                                                                                                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("HomePhone") %>'
                                                                                                                                                                                                meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                                                                                                                                                                            <td class="validationColumn">
                                                                                                                                                                                                <td class="labelColumn">
                                                                                                                                                                                                    <asp:Label ID="Label15" runat="server" Text="Office Name" meta:resourcekey="Label15Resource1"></asp:Label>
                                                                                                                                                                                                    <td class="textColumn">
                                                                                                                                                                                                        <asp:DropDownList ID="ddlOfficeNameRE" runat="server" Enabled="False" DataTextField="OfficeName"
                                                                                                                                                                                                            DataValueField="OfficeId" SelectedValue='<%# Bind("SubmissionOfficeId") %>' DataSourceID="odsOffices" meta:resourcekey="ddlOfficeNameREResource1">
                                                                                                                                                                                                        </asp:DropDownList>
                                                                                                                                                                                                        <td class="validationColumn" colspan="4">
                                                                                                                                                                                                            <tr>
                                                                                                                                                                                                                <td colspan="6">
                                                                                                                                                                                                                    <asp:Label ID="Label14" runat="server" SkinID="SubHeading" Text="Creation Details"
                                                                                                                                                                                                                        meta:resourcekey="Label14Resource1"></asp:Label>
                                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                                        <td class="labelColumn">
                                                                                                                                                                                                                            <asp:Label ID="lblCreatedBy" runat="server" Text="Created By" meta:resourcekey="lblCreatedByResource1"></asp:Label>
                                                                                                                                                                                                                            <td>
                                                                                                                                                                                                                                <asp:TextBox ID="txtCreatedBy" runat="server" ReadOnly="True" Text='<%# Bind("CreatedBy") %>'
                                                                                                                                                                                                                                    meta:resourcekey="txtCreatedByResource1"></asp:TextBox>
                                                                                                                                                                                                                                <td class="validationColumn">
                                                                                                                                                                                                                                    <td class="labelColumn">
                                                                                                                                                                                                                                        <asp:Label ID="lblCreatedAt" runat="server" Text="CreatedAt" meta:resourcekey="lblCreatedAtResource1"></asp:Label>
                                                                                                                                                                                                                                        <td>
                                                                                                                                                                                                                                            <asp:TextBox ID="txtCreatedAt" runat="server" ReadOnly="True" Text='<%# Bind("CreatedAt") %>'
                                                                                                                                                                                                                                                meta:resourcekey="txtCreatedAtResource1"></asp:TextBox>
                                                                                                                                                                                                                                            <td class="validationColumn">
                                                                                                                                                                                                                                                <tr>
                                                                                                                                                                                                                                                    <td colspan="6">
                                                                                                                                                                                                                                                        <asp:Label ID="Label18" runat="server" SkinID="SubHeading" Text="License Details"
                                                                                                                                                                                                                                                            meta:resourcekey="Label18Resource1"></asp:Label>
                                                                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                                                                            <td class="labelColumn">
                                                                                                                                                                                                                                                                <asp:Label ID="Label19" runat="server" Text="License No" meta:resourcekey="Label19Resource1"></asp:Label>
                                                                                                                                                                                                                                                                <td>
                                                                                                                                                                                                                                                                    <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" Text='<%# Bind("LicenseNo") %>'
                                                                                                                                                                                                                                                                        meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                    <td class="validationColumn">
                                                                                                                                                                                                                                                                        <td class="labelColumn">
                                                                                                                                                                                                                                                                            <asp:Label ID="Label20" runat="server" Text="IssuedDate" meta:resourcekey="Label20Resource1"></asp:Label>
                                                                                                                                                                                                                                                                            <td class="textColumn">
                                                                                                                                                                                                                                                                                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True" Text='<%# Bind("IssuedDate") %>'
                                                                                                                                                                                                                                                                                    meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                <td class="validationColumn">
                                                                                                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                                                                                                        <td class="labelColumn">
                                                                                                                                                                                                                                                                                            <asp:Label ID="Label21" runat="server" Text="Effective Date" meta:resourcekey="Label21Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                            <td>
                                                                                                                                                                                                                                                                                                <asp:TextBox ID="TextBox9" runat="server" ReadOnly="True" Text='<%# Bind("EffectiveDate") %>'
                                                                                                                                                                                                                                                                                                    meta:resourcekey="TextBox9Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                                <td class="validationColumn">
                                                                                                                                                                                                                                                                                                    <td class="labelColumn">
                                                                                                                                                                                                                                                                                                        <asp:Label ID="Label22" runat="server" Text="Expiry Date" meta:resourcekey="Label22Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                        <td class="textColumn">
                                                                                                                                                                                                                                                                                                            <asp:TextBox ID="TextBox10" runat="server" ReadOnly="True" Text='<%# Bind("ExpiryDate") %>'
                                                                                                                                                                                                                                                                                                                meta:resourcekey="TextBox10Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                                            <td class="validationColumn">
                                                                                                                                                                                                                                                                                                                <tr>
                                                                                                                                                                                                                                                                                                                    <td colspan="6">
                                                                                                                                                                                                                                                                                                                        <asp:Label ID="Label25" runat="server" SkinID="SubHeading" Text="Approval Details"
                                                                                                                                                                                                                                                                                                                            meta:resourcekey="Label25Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                                                                                                                                            <td class="labelColumn">
                                                                                                                                                                                                                                                                                                                                <asp:Label ID="Label26" runat="server" Text="Approved By" meta:resourcekey="Label26Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                <td>
                                                                                                                                                                                                                                                                                                                                    <asp:TextBox ID="TextBox13" runat="server" ReadOnly="True" Text='<%# Bind("ApprovedBy") %>'
                                                                                                                                                                                                                                                                                                                                        meta:resourcekey="TextBox13Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                                                                    <td class="validationColumn">
                                                                                                                                                                                                                                                                                                                                        <td class="labelColumn">
                                                                                                                                                                                                                                                                                                                                            <asp:Label ID="Label27" runat="server" Text="Approval Date" meta:resourcekey="Label27Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                            <td class="textColumn">
                                                                                                                                                                                                                                                                                                                                                <asp:TextBox ID="TextBox14" runat="server" ReadOnly="True" Text='<%# Bind("CreationTime") %>'
                                                                                                                                                                                                                                                                                                                                                    meta:resourcekey="TextBox14Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                                                                                <td class="validationColumn">
                                                                                                                                                                                                                                                                                                                                                    <tr>
                                                                                                                                                                                                                                                                                                                                                        <td colspan="6">
                                                                                                                                                                                                                                                                                                                                                            <asp:Label ID="Label28" runat="server" SkinID="SubHeading" Text="Cancelation Details"
                                                                                                                                                                                                                                                                                                                                                                meta:resourcekey="Label28Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                                            <tr>
                                                                                                                                                                                                                                                                                                                                                                <td class="labelColumn">
                                                                                                                                                                                                                                                                                                                                                                    <asp:Label ID="Label29" runat="server" Text="Is Cancelled" meta:resourcekey="Label29Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                                                    <td>
                                                                                                                                                                                                                                                                                                                                                                        <asp:CheckBox ID="chkIsCancelled" Enabled="False" runat="server" meta:resourcekey="chkIsCancelledResource1" />
                                                                                                                                                                                                                                                                                                                                                                        <td class="validationColumn">
                                                                                                                                                                                                                                                                                                                                                                            <td class="labelColumn">
                                                                                                                                                                                                                                                                                                                                                                                <asp:Label ID="Label30" runat="server" Text="Cancelled By" meta:resourcekey="Label30Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                                                                <td class="textColumn">
                                                                                                                                                                                                                                                                                                                                                                                    <asp:TextBox ID="TextBox16" runat="server" ReadOnly="True" Text='<%# Bind("CancelledBy") %>'
                                                                                                                                                                                                                                                                                                                                                                                        meta:resourcekey="TextBox16Resource1"></asp:TextBox>
                                                                                                                                                                                                                                                                                                                                                                                    <td class="validationColumn">
                                                                                                                                                                                                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                                                                                                                                                                                                            <td colspan="6">
                                                                                                                                                                                                                                                                                                                                                                                                <asp:Label ID="Label16" runat="server" SkinID="SubHeading" Text="Renewal Details"
                                                                                                                                                                                                                                                                                                                                                                                                    meta:resourcekey="Label16Resource1"></asp:Label>
                                                                                                                                                                                                                                                                                                                                                                                                <tr>
                                                                                                                                                                                                                                                                                                                                                                                                    <td colspan="6">
                                                                                                                                                                                                                                                                                                                                                                                                        <tr>
                                                                                                                                                                                                                                                                                                                                                                                                            <td colspan="6" align="left">
                                                                                                                                                                                                                                                                                                                                                                                                                <uc1:FileForward ID="FileForward12" runat="server"></uc1:FileForward>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsCompletelicenseDetails" runat="server" SelectMethod="GetCompleteLicenseDetails"
        TypeName="IGRSS.BusinessLogicLayer.LicenseApplication" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewSalseDetails">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldLicenseId" Name="LicenseApplicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldLicenseId" runat="server" />
    <asp:HiddenField ID="fldModuleCode" runat="server" Value="LIC" />
    <asp:XmlDataSource ID="XmlLicensePurpose" runat="server" DataFile="~/License/LicensePurpose.xml">
    </asp:XmlDataSource>
    <br />
    <asp:ObjectDataSource ID="odsOffices" runat="server" SelectMethod="GetOffices" OldValuesParameterFormatString="original_{0}"
        TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLicensePurpose" runat="server" InsertMethod="NewLicenseApplication"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetLicensePurpose"
        TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
