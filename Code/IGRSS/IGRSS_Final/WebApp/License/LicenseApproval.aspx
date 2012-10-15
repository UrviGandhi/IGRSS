<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="LicenseApproval.aspx.cs" Inherits="License_LicenseApproval" Title="License Approval Form"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvLicApprove" runat="server" ActiveViewIndex="0">
        <asp:View ID="vewlicApprove" runat="server">
            <table width="100%">
                <tr>
                    <td colspan="6" align="left">
                        <asp:Label ID="lblApproveLicenseForm" runat="server" Text="License Issue Details"
                            SkinID="Heading" meta:resourcekey="lblApproveLicenseFormResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="height: 26px">
                        <asp:Label ID="lbllls" runat="server" Text="Enter Application Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" style="height: 26px">
                        <asp:TextBox ID="txtApplicationNo" runat="server" Width="163px" meta:resourcekey="txtApplicationNoResource1"></asp:TextBox></td>
                    <td align="left" style="height: 26px">
                        <asp:Label ID="lblApplicationName" runat="server" Text="Enter Name" meta:resourcekey="lblApplicationNameResource1"></asp:Label></td>
                    <td align="left" style="height: 26px">
                        <asp:TextBox ID="TextBox1" runat="server" Width="165px" meta:resourcekey="TextBox1Resource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="btnSearchAppNo" runat="server" Text="Search" Width="61px" OnClick="btnSearchAppNo_Click"
                            meta:resourcekey="btnSearchAppNoResource1" />&nbsp;
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td align="left" style="height: 141px">
                        <asp:GridView ID="grdVen_Dtl" runat="server" AutoGenerateColumns="False" DataKeyNames="LicenseApplicationId"
                            Width="100%" AllowPaging="True" OnPageIndexChanging="grdVen_Dtl_PageIndexChanging"
                            OnSelectedIndexChanged="grdVen_Dtl_SelectedIndexChanged1" meta:resourcekey="grdVen_DtlResource1">
                            <Columns>
                                <asp:BoundField DataField="NameOfApplicant" HeaderText="NameOfApplicant" SortExpression="NameOfApplicant"
                                    meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="DateOfBirth" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DateOfBirth"
                                    HtmlEncode="False" SortExpression="DateOfBirth" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="ApplicationDate"
                                    HtmlEncode="False" SortExpression="ApplicationDate" meta:resourcekey="BoundFieldResource3" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                            </Columns>
                            <EmptyDataTemplate>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="odsVendorDtl" runat="server" SelectMethod="GetvendordetailByAppNumber"
                TypeName="IGRSS.BusinessLogicLayer.LicenseApplication" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtApplicationNo" Name="ApplnNumber" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:HiddenField ID="fldApplicationId" runat="server" />
            &nbsp;&nbsp;
        </asp:View>
        <asp:View ID="vewjjj" runat="server">
            <asp:FormView ID="fvVendorDetails" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsGetVendorDetails" OnItemCommand="fvVendorDetails_ItemCommand"
                meta:resourcekey="fvVendorDetailsResource1" OnPageIndexChanging="fvVendorDetails_PageIndexChanging">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Enter License Details"
                                    meta:resourcekey="LBlLicenseHeadingResource3"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" Text="File Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource3"></asp:Label></td>
                            <td align="left" style="width: 151px; height: 28px">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                                    meta:resourcekey="NameOfApplicantTextBoxResource3"></asp:TextBox>
                            </td>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource3"></asp:Label></td>
                            <td align="left" style="height: 28px">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                                    meta:resourcekey="PresentAddressTextBoxResource3"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource3"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                                    meta:resourcekey="PermanentAddressTextBoxResource3"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource3"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                                    meta:resourcekey="BusinessAddressTextBoxResource3"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource3"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                                    meta:resourcekey="QualificationTextBoxResource3"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource3"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                                    meta:resourcekey="ExperienceTextBoxResource3"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource3"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource3"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource3"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'
                                    meta:resourcekey="DateOfBirthTextBoxResource3"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource3"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                                    meta:resourcekey="TotalInvestmentAmountTextBoxResource3"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource3"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    meta:resourcekey="NameAndAddressOfRefererTextBoxResource3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" Text="Office Name" meta:resourcekey="Label3Resource2"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("SubmissionOfficeId") %>'
                                    Width="158px" meta:resourcekey="DropDownList1Resource2">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource3"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>'
                                    meta:resourcekey="ApplnNumberTextBoxResource3"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource3"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("HomePhone") %>' meta:resourcekey="txtphoneResource3"></asp:TextBox>
                            </td>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblStatus" runat="server" Text="Status" meta:resourcekey="lblStatusResource2"></asp:Label></td>
                            <td align="left" style="height: 42px">
                                <asp:TextBox ID="dlStatus" runat="server" Text='<%# Bind("Status") %>' meta:resourcekey="dlStatusResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblremars" runat="server" Text="Remarks" meta:resourcekey="lblremarsResource2"></asp:Label></td>
                            <td style="width: 151px; height: 42px">
                                <asp:TextBox ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine"
                                    meta:resourcekey="RemarksResource2"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" meta:resourcekey="UpdateButtonResource1" />
                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="UpdateCancelButtonResource1" />
                                <asp:Button ID="deleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text="Delete" meta:resourcekey="deleteButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Enter License Details"
                                    meta:resourcekey="LBlLicenseHeadingResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" Text="File Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource1"></asp:Label></td>
                            <td align="left" style="width: 151px; height: 28px">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                                    meta:resourcekey="NameOfApplicantTextBoxResource1"></asp:TextBox>
                            </td>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource1"></asp:Label></td>
                            <td align="left" style="height: 28px">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                                    meta:resourcekey="PresentAddressTextBoxResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                                    meta:resourcekey="PermanentAddressTextBoxResource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'
                                    meta:resourcekey="DateOfBirthTextBoxResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                                    meta:resourcekey="QualificationTextBoxResource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                                    meta:resourcekey="ExperienceTextBoxResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource1"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                                    meta:resourcekey="BusinessAddressTextBoxResource1"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                                    meta:resourcekey="TotalInvestmentAmountTextBoxResource1"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" Text="Office Name" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("SubmissionOfficeId") %>'
                                    Width="158px" meta:resourcekey="DropDownList1Resource1">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>'
                                    meta:resourcekey="ApplnNumberTextBoxResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource1"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("HomePhone") %>' meta:resourcekey="txtphoneResource1"></asp:TextBox>
                            </td>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblStatus" runat="server" Text="Status" meta:resourcekey="lblStatusResource1"></asp:Label></td>
                            <td align="left" style="height: 42px">
                                <asp:DropDownList ID="dlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'
                                    Width="158px" meta:resourcekey="dlStatusResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True">Approved</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2">Rejected</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource3">InProgess</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblremars" runat="server" Text="Remarks" meta:resourcekey="lblremarsResource1"></asp:Label></td>
                            <td style="width: 151px; height: 42px">
                                <asp:TextBox ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine"
                                    meta:resourcekey="RemarksResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="LicInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="LicInsertResource1" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Vendor Details"
                                    meta:resourcekey="LBlLicenseHeadingResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" Text="File Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="ApplnNumberTextBox" ReadOnly="True" runat="server" Text='<%# Bind("ApplnNumber") %>'
                                    Width="131px" meta:resourcekey="ApplnNumberTextBoxResource2"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" ReadOnly="True" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                                    Width="131px" meta:resourcekey="NameOfApplicantTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="PresentAddressTextBox" ReadOnly="True" TextMode="MultiLine" runat="server"
                                    Height="50px" Text='<%# Bind("PresentAddress") %>' Width="131px" meta:resourcekey="PresentAddressTextBoxResource2"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Height="50px" ReadOnly="True"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" Width="131px" meta:resourcekey="PermanentAddressTextBoxResource2"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" ReadOnly="True" Text='<%# Bind("BusinessAddress") %>'
                                    TextMode="MultiLine" Height="50px" Width="131px" meta:resourcekey="BusinessAddressTextBoxResource2"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth", "{0:d}") %>'
                                    Width="131px" MaxLength="10" OnDataBinding="DateOfBirthTextBox_DataBinding" meta:resourcekey="DateOfBirthTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="QualificationTextBox" ReadOnly="True" runat="server" Text='<%# Bind("Qualification") %>'
                                    Width="131px" meta:resourcekey="QualificationTextBoxResource2"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" ReadOnly="True" runat="server" Text='<%# Bind("Experience") %>'
                                    Width="131px" meta:resourcekey="ExperienceTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="CasteTextBox" ReadOnly="True" runat="server" Text='<%# Bind("Caste") %>'
                                    Width="131px" meta:resourcekey="CasteTextBoxResource2"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource2"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" ReadOnly="True" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                                    Width="131px" meta:resourcekey="TotalInvestmentAmountTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource2"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" ReadOnly="True" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    Height="50px" TextMode="MultiLine" Width="131px" meta:resourcekey="NameAndAddressOfRefererTextBoxResource2"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource2"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="txtphone" ReadOnly="True" runat="server" Text='<%# Bind("HomePhone") %>'
                                    Width="131px" meta:resourcekey="txtphoneResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4" style="height: 18px">
                                <asp:Label ID="LBlLicenseHg" runat="server" SkinID="Heading" Text="Enter License Details"
                                    meta:resourcekey="LBlLicenseHgResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lblLicenseNo" runat="server" Text='License No&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblLicenseNoResource1"></asp:Label></td>
                            <td align="left" style="height: 26px; width: 172px;">
                                <asp:TextBox ID="txtLicNo" runat="server" Width="131px" meta:resourcekey="txtLicNoResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqLicNo" runat="server" ControlToValidate="txtLicNo"
                                    ErrorMessage="License NO is Must" meta:resourcekey="reqLicNoResource1">*
                                </asp:RequiredFieldValidator></td>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lblissuedate" runat="server" Text='Issue Date&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblissuedateResource1"></asp:Label></td>
                            <td align="left" style="height: 26px">
                                <asp:TextBox ID="txtIssueDate" runat="server" Width="131px" ReadOnly="True" meta:resourcekey="txtIssueDateResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                    ErrorMessage="Issue Date is Must" meta:resourcekey="rfvIssueDateResource1">*
                                </asp:RequiredFieldValidator></td>
                            <td align="left">
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtIssueDate" meta:resourcekey="PopCalendar1Resource1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lbleffectivedate" runat="server" Text='Valid From&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lbleffectivedateResource1"></asp:Label></td>
                            <td align="left" style="width: 172px; height: 26px;">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" Width="131px" ReadOnly="True" meta:resourcekey="txtEffectiveDateResource1"></asp:TextBox>&nbsp;<rjs:PopCalendar
                                    ID="lslsl" runat="server" Control="txtEffectiveDate" meta:resourcekey="lslslResource1" />
                                <asp:RequiredFieldValidator ID="refEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    ErrorMessage="Effective Date is Must" meta:resourcekey="refEffectiveDateResource1">*
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="left" style="height: 26px">
                                &nbsp;<asp:Label ID="lblexpirydate" runat="server" Text='Valid Till&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblexpirydateResource1"></asp:Label></td>
                            <td align="left" style="height: 26px">
                                <asp:TextBox ID="txtExpiryDate" runat="server" Width="131px" ReadOnly="True" meta:resourcekey="txtExpiryDateResource1"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="regExpiryDate" runat="server" ControlToValidate="txtExpiryDate"
                                ErrorMessage="Expiry Date is Must" meta:resourcekey="regExpiryDateResource1">*
                            </asp:RequiredFieldValidator><td align="left" style="height: 26px">
                                <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtExpiryDate" meta:resourcekey="PopCalendar2Resource1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4" style="height: 26px">
                                <asp:Button ID="InsertButton" runat="server" CommandName="ApproveVendorLicense" Text="Approve"
                                    OnClick="InsertButton_Click" meta:resourcekey="InsertButtonResource1" />
                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="RejectVendorLicense"
                                    Text="Reject" meta:resourcekey="InsertCancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <uc1:FileForward ID="ffcLicenseApproval" runat="server" OnLoad="ffcLicenseApproval_Load" />
            <br />
            <asp:ObjectDataSource ID="odsGetVendorDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetlicenseAppBylicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication"
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" InsertMethod="NewLicenseApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldApplicationId" Name="LicenseApplicationId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices"
                DataObjectTypeName="System.Guid" DeleteMethod="DeActivateOffice"></asp:ObjectDataSource>
            <br />
            <asp:FormView ID="fvLicenseDtl" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsLicenseDtl" DefaultMode="Insert" meta:resourcekey="fvLicenseDtlResource1">
                <EditItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel1" runat="server" Text='<%# Eval("LicenseApplicationId") %>'
                        meta:resourcekey="LicenseApplicationIdLabel1Resource1"></asp:Label><br />
                    LicenseNo:
                    <asp:TextBox ID="LicenseNoTextBox" runat="server" Text='<%# Bind("LicenseNo") %>'
                        meta:resourcekey="LicenseNoTextBoxResource1"></asp:TextBox><br />
                    IssuedDate:
                    <asp:TextBox ID="IssuedDateTextBox" runat="server" Text='<%# Bind("IssuedDate") %>'
                        meta:resourcekey="IssuedDateTextBoxResource1"></asp:TextBox><br />
                    EffectiveDate:
                    <asp:TextBox ID="EffectiveDateTextBox" runat="server" Text='<%# Bind("EffectiveDate") %>'
                        meta:resourcekey="EffectiveDateTextBoxResource1"></asp:TextBox><br />
                    ExpiryDate:
                    <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>'
                        meta:resourcekey="ExpiryDateTextBoxResource1"></asp:TextBox><br />
                    IsCancelled:
                    <asp:CheckBox ID="IsCancelledCheckBox" runat="server" Checked='<%# Bind("IsCancelled") %>'
                        meta:resourcekey="IsCancelledCheckBoxResource2" /><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'
                        meta:resourcekey="CreatedByTextBoxResource1"></asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'
                        meta:resourcekey="CreatedAtTextBoxResource1"></asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'
                        meta:resourcekey="ModifiedByTextBoxResource1"></asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'
                        meta:resourcekey="ModifiedAtTextBoxResource1"></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                        meta:resourcekey="UpdateButtonResource2"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="UpdateCancelButtonResource2"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel" runat="server" Text='<%# Eval("LicenseApplicationId") %>'
                        meta:resourcekey="LicenseApplicationIdLabelResource1"></asp:Label><br />
                    LicenseNo:
                    <asp:Label ID="LicenseNoLabel" runat="server" Text='<%# Bind("LicenseNo") %>' meta:resourcekey="LicenseNoLabelResource1"></asp:Label><br />
                    IssuedDate:
                    <asp:Label ID="IssuedDateLabel" runat="server" Text='<%# Bind("IssuedDate") %>' meta:resourcekey="IssuedDateLabelResource1"></asp:Label><br />
                    EffectiveDate:
                    <asp:Label ID="EffectiveDateLabel" runat="server" Text='<%# Bind("EffectiveDate") %>'
                        meta:resourcekey="EffectiveDateLabelResource1"></asp:Label><br />
                    ExpiryDate:
                    <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Bind("ExpiryDate") %>' meta:resourcekey="ExpiryDateLabelResource1"></asp:Label><br />
                    IsCancelled:
                    <asp:CheckBox ID="IsCancelledCheckBox" runat="server" Checked='<%# Bind("IsCancelled") %>'
                        Enabled="False" meta:resourcekey="IsCancelledCheckBoxResource1" /><br />
                    CreatedBy:
                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' meta:resourcekey="CreatedByLabelResource1"></asp:Label><br />
                    CreatedAt:
                    <asp:Label ID="CreatedAtLabel" runat="server" Text='<%# Bind("CreatedAt") %>' meta:resourcekey="CreatedAtLabelResource1"></asp:Label><br />
                    ModifiedBy:
                    <asp:Label ID="ModifiedByLabel" runat="server" Text='<%# Bind("ModifiedBy") %>' meta:resourcekey="ModifiedByLabelResource1"></asp:Label><br />
                    ModifiedAt:
                    <asp:Label ID="ModifiedAtLabel" runat="server" Text='<%# Bind("ModifiedAt") %>' meta:resourcekey="ModifiedAtLabelResource1"></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit" meta:resourcekey="EditButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete" meta:resourcekey="DeleteButtonResource2"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New" meta:resourcekey="NewButtonResource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsLicenseDtl" runat="server" DeleteMethod="DeleteLicenseDetails"
                InsertMethod="IssueLicense" SelectMethod="GetLicensedetailByLicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
                UpdateMethod="UpdateLicenseDetails">
                <UpdateParameters>
                    <asp:Parameter Name="LicenseApplicationId" Type="Object" />
                    <asp:Parameter Name="LicenseNo" Type="String" />
                    <asp:Parameter Name="IssuedDate" Type="DateTime" />
                    <asp:Parameter Name="EffectiveDate" Type="DateTime" />
                    <asp:Parameter Name="ExpiryDate" Type="DateTime" />
                    <asp:Parameter Name="IsCancelled" Type="Boolean" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdVen_Dtl" Name="LicenseApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="LicenseApplicationId" Type="Object" />
                    <asp:Parameter Name="LicenseNo" Type="String" />
                    <asp:Parameter Name="IssuedDate" Type="DateTime" />
                    <asp:Parameter Name="EffectiveDate" Type="DateTime" />
                    <asp:Parameter Name="ExpiryDate" Type="DateTime" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
