<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="FrankingApproval.aspx.cs" Inherits="License_FrankingApproval" Title="Untitled Page" %>
<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:MultiView ID="mvLicApprove" runat="server" ActiveViewIndex="0">
        <asp:View ID="vewlicApprove" runat="server">
            <table width="100%">
                <tr>
                    <td align="left" colspan="6">
                        <asp:Label ID="lblApproveLicenseForm" runat="server" meta:resourcekey="lblApproveLicenseFormResource1"
                            SkinID="Heading" Text="License Issue Details"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="height: 26px">
                        <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" Text="Enter Application Number"></asp:Label></td>
                    <td align="left" style="height: 26px">
                        <asp:TextBox ID="txtApplicationNo" runat="server" meta:resourcekey="txtApplicationNoResource1"
                            Width="163px"></asp:TextBox></td>
                    <td align="left" style="height: 26px">
                        <asp:Label ID="lblApplicationName" runat="server" meta:resourcekey="lblApplicationNameResource1"
                            Text="Enter Name"></asp:Label></td>
                    <td align="left" style="height: 26px">
                        <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1" Width="165px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="btnSearchAppNo" runat="server" meta:resourcekey="btnSearchAppNoResource1"
                            OnClick="btnSearchAppNo_Click" Text="Search" Width="61px" />&nbsp;
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td align="left" style="height: 141px">
                        <asp:GridView ID="grdVen_Dtl" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="LicenseApplicationId" meta:resourcekey="grdVen_DtlResource1" OnPageIndexChanging="grdVen_Dtl_PageIndexChanging"
                            OnSelectedIndexChanged="grdVen_Dtl_SelectedIndexChanged1" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="NameOfApplicant" HeaderText="NameOfApplicant" meta:resourcekey="BoundFieldResource1"
                                    SortExpression="NameOfApplicant" />
                                <asp:BoundField DataField="DateOfBirth" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DateOfBirth"
                                    HtmlEncode="False" meta:resourcekey="BoundFieldResource2" SortExpression="DateOfBirth" />
                                <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="ApplicationDate"
                                    HtmlEncode="False" meta:resourcekey="BoundFieldResource3" SortExpression="ApplicationDate" />
                                <asp:CommandField meta:resourcekey="CommandFieldResource1" ShowSelectButton="True" />
                            </Columns>
                            <EmptyDataTemplate>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="odsVendorDtl" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetvendordetailByAppNumber" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
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
                DataSourceID="odsGetVendorDetails" meta:resourcekey="fvVendorDetailsResource1"
                OnItemCommand="fvVendorDetails_ItemCommand" OnPageIndexChanging="fvVendorDetails_PageIndexChanging">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource3"
                                    SkinID="Heading" Text="Enter License Details"></asp:Label>
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
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource3" Text="Applicant Name"></asp:Label></td>
                            <td align="left" style="width: 151px; height: 28px">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource3"
                                    Text='<%# Bind("NameOfApplicant") %>'></asp:TextBox>
                            </td>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource3"
                                    Text="Present Address"></asp:Label></td>
                            <td align="left" style="height: 28px">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" meta:resourcekey="PresentAddressTextBoxResource3"
                                    Text='<%# Bind("PresentAddress") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource3"
                                    Text="Permanent Address"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" meta:resourcekey="PermanentAddressTextBoxResource3"
                                    Text='<%# Bind("PermanentAddress") %>'></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" meta:resourcekey="BaddtressResource3" Text="Business Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" meta:resourcekey="BusinessAddressTextBoxResource3"
                                    Text='<%# Bind("BusinessAddress") %>'></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" meta:resourcekey="lblqualificationResource3"
                                    Text="Qualification"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="QualificationTextBox" runat="server" meta:resourcekey="QualificationTextBoxResource3"
                                    Text='<%# Bind("Qualification") %>'></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" meta:resourcekey="lblexperienceResource3"
                                    Text="Experience"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" meta:resourcekey="ExperienceTextBoxResource3"
                                    Text='<%# Bind("Experience") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" meta:resourcekey="LblcasteResource3" Text="Caste"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="CasteTextBox" runat="server" meta:resourcekey="CasteTextBoxResource3"
                                    Text='<%# Bind("Caste") %>'></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" meta:resourcekey="lbldateofbirthResource3"
                                    Text="Date Of Birth"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" meta:resourcekey="DateOfBirthTextBoxResource3"
                                    Text='<%# Bind("DateOfBirth") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource3" Text="Investment Amount"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" meta:resourcekey="TotalInvestmentAmountTextBoxResource3"
                                    Text='<%# Bind("TotalInvestmentAmount") %>'></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource3" Text="Name Of Refer"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" meta:resourcekey="NameAndAddressOfRefererTextBoxResource3"
                                    Text='<%# Bind("NameAndAddressOfReferer") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource2" Text="Office Name"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="DropDownList1Resource2"
                                    SelectedValue='<%# Bind("SubmissionOfficeId") %>' Width="158px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource3" Text="Application No"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource3"
                                    Text='<%# Bind("ApplnNumber") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource3" Text="Phone"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="txtphone" runat="server" meta:resourcekey="txtphoneResource3" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                            </td>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource2" Text="Status"></asp:Label></td>
                            <td align="left" style="height: 42px">
                                <asp:TextBox ID="dlStatus" runat="server" meta:resourcekey="dlStatusResource2" Text='<%# Bind("Status") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblremars" runat="server" meta:resourcekey="lblremarsResource2" Text="Remarks"></asp:Label></td>
                            <td style="width: 151px; height: 42px">
                                <asp:TextBox ID="Remarks" runat="server" meta:resourcekey="RemarksResource2" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" meta:resourcekey="UpdateButtonResource1"
                                    Text="Update" />
                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    meta:resourcekey="UpdateCancelButtonResource1" Text="Cancel" />
                                <asp:Button ID="deleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                    meta:resourcekey="deleteButtonResource1" Text="Delete" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource1"
                                    SkinID="Heading" Text="Enter License Details"></asp:Label>
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
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource1" Text="Applicant Name"></asp:Label></td>
                            <td align="left" style="width: 151px; height: 28px">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource1"
                                    Text='<%# Bind("NameOfApplicant") %>'></asp:TextBox>
                            </td>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource1"
                                    Text="Present Address"></asp:Label></td>
                            <td align="left" style="height: 28px">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" meta:resourcekey="PresentAddressTextBoxResource1"
                                    Text='<%# Bind("PresentAddress") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource1"
                                    Text="Permanent Address"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" meta:resourcekey="PermanentAddressTextBoxResource1"
                                    Text='<%# Bind("PermanentAddress") %>'></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lbldateofbirth" runat="server" meta:resourcekey="lbldateofbirthResource1"
                                    Text="Date Of Birth"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" meta:resourcekey="DateOfBirthTextBoxResource1"
                                    Text='<%# Bind("DateOfBirth") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualification" runat="server" meta:resourcekey="lblqualificationResource1"
                                    Text="Qualification"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="QualificationTextBox" runat="server" meta:resourcekey="QualificationTextBoxResource1"
                                    Text='<%# Bind("Qualification") %>'></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" meta:resourcekey="lblexperienceResource1"
                                    Text="Experience"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" meta:resourcekey="ExperienceTextBoxResource1"
                                    Text='<%# Bind("Experience") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Lblcaste" runat="server" meta:resourcekey="LblcasteResource1" Text="Caste"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="CasteTextBox" runat="server" meta:resourcekey="CasteTextBoxResource1"
                                    Text='<%# Bind("Caste") %>'></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" meta:resourcekey="BaddtressResource1" Text="Business Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" meta:resourcekey="BusinessAddressTextBoxResource1"
                                    Text='<%# Bind("BusinessAddress") %>'></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Investment Amount"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" meta:resourcekey="TotalInvestmentAmountTextBoxResource1"
                                    Text='<%# Bind("TotalInvestmentAmount") %>'></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Name Of Refer"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"
                                    Text='<%# Bind("NameAndAddressOfReferer") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="Office Name"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="DropDownList1Resource1"
                                    SelectedValue='<%# Bind("SubmissionOfficeId") %>' Width="158px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource1" Text="Application No"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource1"
                                    Text='<%# Bind("ApplnNumber") %>'></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource1" Text="Phone"></asp:Label></td>
                            <td align="left" style="width: 151px">
                                <asp:TextBox ID="txtphone" runat="server" meta:resourcekey="txtphoneResource1" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                            </td>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1" Text="Status"></asp:Label></td>
                            <td align="left" style="height: 42px">
                                <asp:DropDownList ID="dlStatus" runat="server" meta:resourcekey="dlStatusResource1"
                                    SelectedValue='<%# Bind("Status") %>' Width="158px">
                                    <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True">Approved</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2">Rejected</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource3">InProgess</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 42px">
                                <asp:Label ID="lblremars" runat="server" meta:resourcekey="lblremarsResource1" Text="Remarks"></asp:Label></td>
                            <td style="width: 151px; height: 42px">
                                <asp:TextBox ID="Remarks" runat="server" meta:resourcekey="RemarksResource1" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="LicInsert" runat="server" CommandName="Insert" meta:resourcekey="LicInsertResource1"
                                    Text="Save" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    meta:resourcekey="CancelButtonResource1" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource2"
                                    SkinID="Heading" Text="Vendor Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" Text="File Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                                <td align="left">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource2" Text="Application No"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("ApplnNumber") %>' Width="131px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource2" Text="Bank Name"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>' Width="131px"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource2" Text="Phone"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="txtphone" runat="server" meta:resourcekey="txtphoneResource2" ReadOnly="True"
                                    Text='<%# Bind("HomePhone") %>' Width="131px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource2"
                                    Text="Zonal Branch Address"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" Height="50px" meta:resourcekey="PresentAddressTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("PresentAddress") %>' TextMode="MultiLine" Width="131px"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource2"
                                    Text="Main Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" Height="50px" meta:resourcekey="PermanentAddressTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" Width="131px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Baddtress" runat="server" meta:resourcekey="BaddtressResource2" Text="Applying Branch Address"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                <asp:TextBox ID="BusinessAddressTextBox" runat="server" Height="50px" meta:resourcekey="BusinessAddressTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("BusinessAddress") %>' TextMode="MultiLine" Width="131px"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text="Investment Amount"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" meta:resourcekey="TotalInvestmentAmountTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("TotalInvestmentAmount") %>' Width="131px"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource2" Text="Name Of Refer"></asp:Label></td>
                            <td align="left" style="width: 172px">
                                &nbsp;<asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" meta:resourcekey="NameAndAddressOfRefererTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("NameAndAddressOfReferer") %>'
                                    Width="131px"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblexperience" runat="server" meta:resourcekey="lblexperienceResource2"
                                    Text="Experience"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ExperienceTextBox" runat="server" meta:resourcekey="ExperienceTextBoxResource2"
                                    ReadOnly="True" Text='<%# Bind("Experience") %>' Width="131px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            
                            
                        </tr>
                        <tr>
                            <td align="left" colspan="4" style="height: 18px">
                                <asp:Label ID="LBlLicenseHg" runat="server" meta:resourcekey="LBlLicenseHgResource1"
                                    SkinID="Heading" Text="Enter License Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lblLicenseNo" runat="server" meta:resourcekey="lblLicenseNoResource1"
                                    Text='License No<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left" style="width: 172px; height: 26px">
                                <asp:TextBox ID="txtLicNo" runat="server" meta:resourcekey="txtLicNoResource1" Width="131px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqLicNo" runat="server" ControlToValidate="txtLicNo"
                                    ErrorMessage="License NO is Must" meta:resourcekey="reqLicNoResource1">*
                                </asp:RequiredFieldValidator></td>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lblissuedate" runat="server" meta:resourcekey="lblissuedateResource1"
                                    Text='Issue Date<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left" style="height: 26px">
                                <asp:TextBox ID="txtIssueDate" runat="server" meta:resourcekey="txtIssueDateResource1"
                                    ReadOnly="True" Width="131px"></asp:TextBox>
                                    <rjs:popcalendar id="PopCalendar1" runat="server" control="txtIssueDate" meta:resourcekey="PopCalendar1Resource1"></rjs:popcalendar>
                                </td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                    ErrorMessage="Issue Date is Must" meta:resourcekey="rfvIssueDateResource1">*
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="height: 26px">
                                <asp:Label ID="lbleffectivedate" runat="server" meta:resourcekey="lbleffectivedateResource1"
                                    Text='Valid From<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left" style="width: 172px; height: 26px">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" meta:resourcekey="txtEffectiveDateResource1"
                                    ReadOnly="True" Width="131px"></asp:TextBox>&nbsp;<rjs:popcalendar id="lslsl" runat="server"
                                        control="txtEffectiveDate" meta:resourcekey="lslslResource1"></rjs:popcalendar>
                                <asp:RequiredFieldValidator ID="refEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    ErrorMessage="Effective Date is Must" meta:resourcekey="refEffectiveDateResource1">*
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="left" style="height: 26px">
                                &nbsp;<asp:Label ID="lblexpirydate" runat="server" meta:resourcekey="lblexpirydateResource1"
                                    Text='Valid Till<span style="color: Red;">*</span>'></asp:Label></td>
                            <td align="left" style="height: 26px">
                                <asp:TextBox ID="txtExpiryDate" runat="server" meta:resourcekey="txtExpiryDateResource1"
                                    ReadOnly="True" Width="131px"></asp:TextBox>
                                    <rjs:popcalendar id="PopCalendar2" runat="server" control="txtExpiryDate" meta:resourcekey="PopCalendar2Resource1"></rjs:popcalendar>
                                    </td>
                            <asp:RequiredFieldValidator ID="regExpiryDate" runat="server" ControlToValidate="txtExpiryDate"
                                ErrorMessage="Expiry Date is Must" meta:resourcekey="regExpiryDateResource1">*
                            </asp:RequiredFieldValidator><td align="left" style="height: 26px">
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4" style="height: 26px">
                                <asp:Button ID="InsertButton" runat="server" CommandName="ApproveVendorLicense" meta:resourcekey="InsertButtonResource1"
                                    OnClick="InsertButton_Click" Text="Approve" />
                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="RejectVendorLicense"
                                    meta:resourcekey="InsertCancelButtonResource1" Text="Reject" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <uc1:fileforward id="ffcLicenseApproval" runat="server" onload="ffcLicenseApproval_Load"></uc1:fileforward>
            <br />
            <asp:ObjectDataSource ID="odsGetVendorDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
                InsertMethod="NewLicenseApplication" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetlicenseAppBylicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldApplicationId" Name="LicenseApplicationId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <br />
            <asp:FormView ID="fvLicenseDtl" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsLicenseDtl" DefaultMode="Insert" meta:resourcekey="fvLicenseDtlResource1">
                <EditItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel1" runat="server" meta:resourcekey="LicenseApplicationIdLabel1Resource1"
                        Text='<%# Eval("LicenseApplicationId") %>'></asp:Label><br />
                    LicenseNo:
                    <asp:TextBox ID="LicenseNoTextBox" runat="server" meta:resourcekey="LicenseNoTextBoxResource1"
                        Text='<%# Bind("LicenseNo") %>'></asp:TextBox><br />
                    IssuedDate:
                    <asp:TextBox ID="IssuedDateTextBox" runat="server" meta:resourcekey="IssuedDateTextBoxResource1"
                        Text='<%# Bind("IssuedDate") %>'></asp:TextBox><br />
                    EffectiveDate:
                    <asp:TextBox ID="EffectiveDateTextBox" runat="server" meta:resourcekey="EffectiveDateTextBoxResource1"
                        Text='<%# Bind("EffectiveDate") %>'></asp:TextBox><br />
                    ExpiryDate:
                    <asp:TextBox ID="ExpiryDateTextBox" runat="server" meta:resourcekey="ExpiryDateTextBoxResource1"
                        Text='<%# Bind("ExpiryDate") %>'></asp:TextBox><br />
                    IsCancelled:
                    <asp:CheckBox ID="IsCancelledCheckBox" runat="server" Checked='<%# Bind("IsCancelled") %>'
                        meta:resourcekey="IsCancelledCheckBoxResource2" /><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" meta:resourcekey="CreatedByTextBoxResource1"
                        Text='<%# Bind("CreatedBy") %>'></asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" meta:resourcekey="CreatedAtTextBoxResource1"
                        Text='<%# Bind("CreatedAt") %>'></asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" meta:resourcekey="ModifiedByTextBoxResource1"
                        Text='<%# Bind("ModifiedBy") %>'></asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" meta:resourcekey="ModifiedAtTextBoxResource1"
                        Text='<%# Bind("ModifiedAt") %>'></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" meta:resourcekey="UpdateButtonResource2"
                        Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        meta:resourcekey="UpdateCancelButtonResource2" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel" runat="server" meta:resourcekey="LicenseApplicationIdLabelResource1"
                        Text='<%# Eval("LicenseApplicationId") %>'></asp:Label><br />
                    LicenseNo:
                    <asp:Label ID="LicenseNoLabel" runat="server" meta:resourcekey="LicenseNoLabelResource1"
                        Text='<%# Bind("LicenseNo") %>'></asp:Label><br />
                    IssuedDate:
                    <asp:Label ID="IssuedDateLabel" runat="server" meta:resourcekey="IssuedDateLabelResource1"
                        Text='<%# Bind("IssuedDate") %>'></asp:Label><br />
                    EffectiveDate:
                    <asp:Label ID="EffectiveDateLabel" runat="server" meta:resourcekey="EffectiveDateLabelResource1"
                        Text='<%# Bind("EffectiveDate") %>'></asp:Label><br />
                    ExpiryDate:
                    <asp:Label ID="ExpiryDateLabel" runat="server" meta:resourcekey="ExpiryDateLabelResource1"
                        Text='<%# Bind("ExpiryDate") %>'></asp:Label><br />
                    IsCancelled:
                    <asp:CheckBox ID="IsCancelledCheckBox" runat="server" Checked='<%# Bind("IsCancelled") %>'
                        Enabled="False" meta:resourcekey="IsCancelledCheckBoxResource1" /><br />
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
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        meta:resourcekey="EditButtonResource1" Text="Edit"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                        meta:resourcekey="DeleteButtonResource2" Text="Delete"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        meta:resourcekey="NewButtonResource1" Text="New"></asp:LinkButton>
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

