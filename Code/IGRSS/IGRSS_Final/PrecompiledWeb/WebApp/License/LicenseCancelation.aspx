<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_LicenseCancelation, App_Web_syjfv0ab" title="License Cancelation Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvCancelLicense" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieLicCancel" runat="server">
            <table width="100%">
                <tr>
                    <td align="left" colspan="6">
                        <asp:Label ID="lblLicenseCancelation" runat="server" Text="License Cancelation Details"
                            SkinID="Heading" meta:resourcekey="lblLicenseCancelationResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="Label4" runat="server" Text="Enter License No" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtLicenseNo" runat="server" meta:resourcekey="txtLicenseNoResource1"></asp:TextBox></td>
                    <td class="validationColumn">
                    </td>
                    <td class="labelColumn">
                        <asp:Label ID="lblApplicantName" runat="server" Text="Name" meta:resourcekey="lblAppealNoResource11"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtlApplicantName" runat="server" meta:resourcekey="txtAppealNoResource11"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6" style="height: 26px">
                        <asp:Button ID="btnLicenseNo" runat="server" Text="Search" Width="71px" meta:resourcekey="btnLicenseNoResource1" /></td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td align="left">
                        <asp:GridView ID="grdLicense" runat="server" AutoGenerateColumns="False" DataKeyNames="LicenseApplicationId"
                            DataSourceID="odsLicenseNo" Width="697px" OnSelectedIndexChanged="grdLicense_SelectedIndexChanged"
                            EmptyDataText="Records  Found" meta:resourcekey="grdLicenseResource1">
                            <Columns>
                                <asp:BoundField DataField="LicenseNo" HeaderText="License No" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField meta:resourcekey="BoundFieldResource4" DataField="NameOfApplicant"
                                    HeaderText="Name" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IssuedDate" HeaderText="Issued Date" SortExpression="IssuedDate"
                                    meta:resourcekey="BoundFieldResource1" DataFormatString="{0:dd/MM/yyyy}" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EffectiveDate" HeaderText="Valid From" SortExpression="EffectiveDate"
                                    meta:resourcekey="BoundFieldResource2" DataFormatString="{0:dd/MM/yyyy}" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ExpiryDate" HeaderText="Valid Till" SortExpression="ExpiryDate"
                                    meta:resourcekey="BoundFieldResource3" DataFormatString="{0:dd/MM/yyyy}" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:CommandField SelectText="View Detail" ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" HeaderText="Select">
                                    <ControlStyle BackColor="White" Font-Bold="True" Font-Overline="False" Font-Underline="True"
                                        ForeColor="Red" />
                                </asp:CommandField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Records Found !!!
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsLicenseNo" runat="server" DataObjectTypeName="System.Guid"
                            DeleteMethod="DeleteLicenseDetails" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetDataByLicenseNo" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
                            UpdateMethod="CancelVendorLicenses" InsertMethod="RenewVendorLicenses">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtlApplicantName" Name="NameOfApplicant" PropertyName="Text"
                                    Type="String" />
                            </SelectParameters>
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
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vieFv" runat="server">
            <asp:FormView ID="fvLicenseNoDtl" runat="server" DataKeyNames="LicenseApplicationId"
                DataSourceID="odsFillFormView" OnItemCommand="fvLicenseNoDtl_ItemCommand" OnPageIndexChanging="fvLicenseNoDtl_PageIndexChanging"
                Width="742px" meta:resourcekey="fvLicenseNoDtlResource1">
                <EditItemTemplate>
                    LicenseApplicationId:
                    <asp:Label ID="LicenseApplicationIdLabel1" runat="server" Text='<%# Eval("LicenseApplicationId") %>'
                        meta:resourcekey="LicenseApplicationIdLabel1Resource1"></asp:Label><br />
                    NameOfApplicant:
                    <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                        meta:resourcekey="NameOfApplicantTextBoxResource2"></asp:TextBox><br />
                    PresentAddress:
                    <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                        meta:resourcekey="PresentAddressTextBoxResource2"></asp:TextBox><br />
                    PermanentAddress:
                    <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                        meta:resourcekey="PermanentAddressTextBoxResource3"></asp:TextBox><br />
                    DateOfBirth:
                    <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'
                        meta:resourcekey="DateOfBirthTextBoxResource2"></asp:TextBox><br />
                    ApplicationDate:
                    <asp:TextBox ID="ApplicationDateTextBox" runat="server" Text='<%# Bind("ApplicationDate") %>'
                        meta:resourcekey="ApplicationDateTextBoxResource2"></asp:TextBox><br />
                    Qualification:
                    <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                        meta:resourcekey="QualificationTextBoxResource2"></asp:TextBox><br />
                    Experience:
                    <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                        meta:resourcekey="ExperienceTextBoxResource2"></asp:TextBox><br />
                    Caste:
                    <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource2"></asp:TextBox><br />
                    BusinessAddress:
                    <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                        meta:resourcekey="BusinessAddressTextBoxResource2"></asp:TextBox><br />
                    TotalInvestmentAmount:
                    <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                        meta:resourcekey="TotalInvestmentAmountTextBoxResource2"></asp:TextBox><br />
                    NameAndAddressOfReferer:
                    <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                        meta:resourcekey="NameAndAddressOfRefererTextBoxResource2"></asp:TextBox><br />
                    SubmissionOfficeId:
                    <asp:TextBox ID="SubmissionOfficeIdTextBox" runat="server" Text='<%# Bind("SubmissionOfficeId") %>'
                        meta:resourcekey="SubmissionOfficeIdTextBoxResource2"></asp:TextBox><br />
                    IssuedDate:
                    <asp:TextBox ID="IssuedDateTextBox" runat="server" Text='<%# Bind("IssuedDate") %>'
                        meta:resourcekey="IssuedDateTextBoxResource2"></asp:TextBox><br />
                    EffectiveDate:
                    <asp:TextBox ID="EffectiveDateTextBox" runat="server" Text='<%# Bind("EffectiveDate") %>'
                        meta:resourcekey="EffectiveDateTextBoxResource2"></asp:TextBox><br />
                    ExpiryDate:
                    <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>'
                        meta:resourcekey="ExpiryDateTextBoxResource2"></asp:TextBox><br />
                    Status:
                    <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' meta:resourcekey="StatusTextBoxResource2"></asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksTextBoxResource2"></asp:TextBox><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'
                        meta:resourcekey="CreatedByTextBoxResource2"></asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'
                        meta:resourcekey="CreatedAtTextBoxResource2"></asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'
                        meta:resourcekey="ModifiedByTextBoxResource2"></asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'
                        meta:resourcekey="ModifiedAtTextBoxResource2"></asp:TextBox><br />
                    ApplnNumber:
                    <asp:TextBox ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>'
                        meta:resourcekey="ApplnNumberTextBoxResource2"></asp:TextBox><br />
                    HomePhone:
                    <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'
                        meta:resourcekey="HomePhoneTextBoxResource2"></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                        meta:resourcekey="UpdateButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="UpdateCancelButtonResource1"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    LicenseApplicationId:
                    <asp:TextBox ID="LicenseApplicationIdTextBox" runat="server" Text='<%# Bind("LicenseApplicationId") %>'
                        meta:resourcekey="LicenseApplicationIdTextBoxResource1"></asp:TextBox><br />
                    NameOfApplicant:
                    <asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>'
                        meta:resourcekey="NameOfApplicantTextBoxResource1"></asp:TextBox><br />
                    PresentAddress:
                    <asp:TextBox ID="PresentAddressTextBox" runat="server" Text='<%# Bind("PresentAddress") %>'
                        meta:resourcekey="PresentAddressTextBoxResource1"></asp:TextBox><br />
                    PermanentAddress:
                    <asp:TextBox ID="PermanentAddressTextBox" runat="server" Text='<%# Bind("PermanentAddress") %>'
                        meta:resourcekey="PermanentAddressTextBoxResource1"></asp:TextBox><br />
                    DateOfBirth:
                    <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>'
                        meta:resourcekey="DateOfBirthTextBoxResource1"></asp:TextBox><br />
                    ApplicationDate:
                    <asp:TextBox ID="ApplicationDateTextBox" runat="server" Text='<%# Bind("ApplicationDate") %>'
                        meta:resourcekey="ApplicationDateTextBoxResource1"></asp:TextBox><br />
                    Qualification:
                    <asp:TextBox ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>'
                        meta:resourcekey="QualificationTextBoxResource1"></asp:TextBox><br />
                    Experience:
                    <asp:TextBox ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>'
                        meta:resourcekey="ExperienceTextBoxResource1"></asp:TextBox><br />
                    Caste:
                    <asp:TextBox ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource1"></asp:TextBox><br />
                    BusinessAddress:
                    <asp:TextBox ID="BusinessAddressTextBox" runat="server" Text='<%# Bind("BusinessAddress") %>'
                        meta:resourcekey="BusinessAddressTextBoxResource1"></asp:TextBox><br />
                    TotalInvestmentAmount:
                    <asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>'
                        meta:resourcekey="TotalInvestmentAmountTextBoxResource1"></asp:TextBox><br />
                    NameAndAddressOfReferer:
                    <asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>'
                        meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"></asp:TextBox><br />
                    SubmissionOfficeId:
                    <asp:TextBox ID="SubmissionOfficeIdTextBox" runat="server" Text='<%# Bind("SubmissionOfficeId") %>'
                        meta:resourcekey="SubmissionOfficeIdTextBoxResource1"></asp:TextBox><br />
                    IssuedDate:
                    <asp:TextBox ID="IssuedDateTextBox" runat="server" Text='<%# Bind("IssuedDate") %>'
                        meta:resourcekey="IssuedDateTextBoxResource1"></asp:TextBox><br />
                    EffectiveDate:
                    <asp:TextBox ID="EffectiveDateTextBox" runat="server" Text='<%# Bind("EffectiveDate") %>'
                        meta:resourcekey="EffectiveDateTextBoxResource1"></asp:TextBox><br />
                    ExpiryDate:
                    <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>'
                        meta:resourcekey="ExpiryDateTextBoxResource1"></asp:TextBox><br />
                    Status:
                    <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' meta:resourcekey="StatusTextBoxResource1"></asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksTextBoxResource1"></asp:TextBox><br />
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
                    ApplnNumber:
                    <asp:TextBox ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>'
                        meta:resourcekey="ApplnNumberTextBoxResource1"></asp:TextBox><br />
                    HomePhone:
                    <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'
                        meta:resourcekey="HomePhoneTextBoxResource1"></asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"
                        meta:resourcekey="InsertButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="InsertCancelButtonResource1"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblliccan" runat="server" Text="License Cancelation Details" SkinID="Heading"
                                    meta:resourcekey="lblliccanResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblAppNo" runat="server" Text="Application No" meta:resourcekey="lblAppNoResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("ApplnNumber") %>'
                                    Width="131px" meta:resourcekey="TextBox4Resource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblAppName" runat="server" Text="Name" meta:resourcekey="lblAppNameResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>'
                                    Width="131px" meta:resourcekey="TextBox5Resource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 77px">
                                <asp:Label ID="lblPresentAddress" runat="server" Text="Present Address" meta:resourcekey="lblPresentAddressResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Bind("PresentAddress") %>'
                                    TextMode="MultiLine" Height="50px" Width="131px" meta:resourcekey="TextBox1Resource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblPermanentAddress" Text="Permanent Address" runat="server" meta:resourcekey="lblPermanentAddressResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" ReadOnly="True" Text='<%# Bind("PermanentAddress") %>'
                                    Height="50px" TextMode="MultiLine" Width="131px" meta:resourcekey="PermanentAddressTextBoxResource2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblBinAddress" runat="server" Text="Business Address" meta:resourcekey="lblBinAddressResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("BusinessAddress") %>'
                                    TextMode="MultiLine" Height="50px" Width="131px" meta:resourcekey="TextBox3Resource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblDateBirth" runat="server" Text="Date Of Birth" meta:resourcekey="lblDateBirthResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth", "{0:d}") %>'
                                    Width="131px" meta:resourcekey="TextBox6Resource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblqualifi" runat="server" Text="Qualification" meta:resourcekey="lblqualifiResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" Text='<%# Bind("Qualification") %>'
                                    Width="131px" meta:resourcekey="TextBox7Resource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblPhone" runat="server" Text="Phone No" meta:resourcekey="lblPhoneResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True" Text='<%# Bind("HomePhone") %>'
                                    Width="131px" meta:resourcekey="TextBox8Resource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblIssuedate" runat="server" Text="Issue Date" meta:resourcekey="lblIssuedateResource1"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("IssuedDate", "{0:d}") %>'
                                    Width="131px" Enabled="False" ReadOnly="True" meta:resourcekey="TextBox9Resource1"></asp:TextBox></td>
                            <td align="left">
                                <asp:Label ID="lblLicenseNo" runat="server" Text="License No" meta:resourcekey="lblLicenseNo"
                                    Visible="False"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtLicenseNo" runat="server" Width="131px" ReadOnly="True" meta:resourcekey="TextBox9Resource1"
                                    Visible="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4">
                                <asp:Button ID="btnCancelLicense" Text="Cancel License" runat="server" CommandName="CancelLicense"
                                    Width="105px" meta:resourcekey="btnCancelLicenseResource1" /></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
            <asp:ObjectDataSource ID="odsFillFormView" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetlicenseAppBylicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdLicense" Name="LicenseApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCancelVendorLicense" runat="server"></asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
