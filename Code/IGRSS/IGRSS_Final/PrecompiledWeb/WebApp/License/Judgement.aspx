<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_Judgement, App_Web_syjfv0ab" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvJudgement" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table width="100%">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                            SkinID="SubHeading" Text="Search File"></asp:Label></td>
                </tr>
                <tr>
                    <td class="labelColumn" style="height: 26px">
                        <asp:Label ID="lblLicenseNo" runat="server" Text="License No" meta:resourcekey="lblLicenseNoResource1"></asp:Label></td>
                    <td class="textColumn" style="height: 26px">
                        <asp:TextBox ID="txtLicenseNo" runat="server" meta:resourcekey="txtLicenseNo"></asp:TextBox></td>
                    <td class="validationColumn" style="height: 26px">
                    </td>
                    <td class="labelColumn" style="height: 26px">
                        <asp:Label ID="lblNameOfApplicant" runat="server" Text="Applicant Name" meta:resourcekey="lblNameOfApplicantResource1"></asp:Label></td>
                    <td class="textColumn" style="width: 25%; height: 26px;">
                        <asp:TextBox ID="txtApplicantName" runat="server" MaxLength="30" meta:resourcekey="txtApplicantNameResource1"></asp:TextBox></td>
                    <td class="validationColumn" style="height: 26px">
                        <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtApplicantName"
                            ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                            meta:resourcekey="regAppnametResource1">*</asp:RegularExpressionValidator>
                    </td>
                    <td style="height: 26px">
                    </td>
                    <td align="right" style="height: 26px; width: 70px;">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" meta:resourcekey="btnSearchResource1" />
                    </td>
                    <td align="right" style="height: 26px">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvRenewVendor" runat="server" DataSourceID="ObjectDataSource1"
                AutoGenerateColumns="False" OnSelectedIndexChanged="gvRenewVendor_SelectedIndexChanged"
                DataKeyNames="LicenseApplicationId" meta:resourcekey="gvRenewVendorResource1">
                <Columns>
                    <asp:BoundField DataField="ApplnNumber" HeaderText="App No" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False"
                        HeaderText="Application Date" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Name" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" DataFormatString="{0:dd/MM/yyyy}"
                        HtmlEncode="False" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="HomePhone" HeaderText="Phone" meta:resourcekey="BoundFieldResource5" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Data Not Found!" meta:resourcekey="Label1Resource1"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetVendorLicenseDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
                UpdateMethod="CancelVendorLicenses">
                <UpdateParameters>
                    <asp:Parameter Name="LicenseNo" Type="String" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtApplicantName" Name="NameOfApplicant" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="RenewedDate" Type="DateTime" />
                    <asp:Parameter Name="EffectiveDate" Type="DateTime" />
                    <asp:Parameter Name="ExpiryDate" Type="DateTime" />
                    <asp:Parameter Name="LicenseApplicationId" Type="Object" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="viewOffenceDetails" runat="server">
            <asp:FormView runat="server" ID="FvVendorOffence" DataSourceID="odsCompletelicenseDetails"
                DataKeyNames="LicenseApplicationId" meta:resourcekey="FvVendorOffenceResource1">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppDetailItm" runat="server" meta:resourcekey="lblAppDetailItm"
                                    SkinID="SubHeading" Text="Vendor Details"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNameItm" runat="server" meta:resourcekey="lblEmployeeNameItm"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="NameOfApplicantLabel" runat="server" ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>'
                                    meta:resourcekey="NameOfApplicantLabelResource2"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label6" runat="server" Text="Phone No" meta:resourcekey="Label6Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("HomePhone") %>'
                                    meta:resourcekey="TextBox3Resource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label19" runat="server" Text="License No" meta:resourcekey="Label19Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" Text='<%# Bind("LicenseNo") %>'
                                    meta:resourcekey="TextBox7Resource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label20" runat="server" Text="IssuedDate" meta:resourcekey="Label20Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True" Text='<%# Bind("IssuedDate", "{0:d}") %>'
                                    meta:resourcekey="TextBox8Resource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label21" runat="server" Text="Effective Date" meta:resourcekey="Label21Resource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBox9" runat="server" ReadOnly="True" Text='<%# Bind("EffectiveDate", "{0:d}") %>'
                                    meta:resourcekey="TextBox9Resource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label22" runat="server" Text="Expiry Date" meta:resourcekey="Label22Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox10" runat="server" ReadOnly="True" Text='<%# Bind("ExpiryDate", "{0:d}") %>'
                                    meta:resourcekey="TextBox10Resource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                </ItemTemplate>
            </asp:FormView>
            <table width="100%">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblVOffenceDetailsIns" runat="server" meta:resourcekey="lblVOffenceDetailsIns"
                            SkinID="SubHeading" Text="Vendor Offence Details"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 222px">
                        <asp:GridView ID="gvEVendorOffenceDetails" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="VendorOffenceId" DataSourceID="odsOffenceDetails" OnSelectedIndexChanged="gvEVendorOffenceDetails_SelectedIndexChanged"
                            meta:resourcekey="gvEVendorOffenceDetailsResource1">
                            <Columns>
                                <asp:BoundField DataField="OffenceDate" HeaderText="Offence Date" SortExpression="OffenceDate"
                                    DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary"
                                    meta:resourcekey="BoundFieldResource7" />
                                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details"
                                    meta:resourcekey="BoundFieldResource8" />
                                <asp:CommandField SelectText="Add Hearing" ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Data Not Found!" meta:resourcekey="Label1Resource2"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsOffenceDetails" runat="server" SelectMethod="GetVendorOffenceDetailsByLicenseAppId"
                            TypeName="IGRSS.BusinessLogicLayer.VendorOffence">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvRenewVendor" Name="VendorLicenseId" PropertyName="SelectedValue"
                                    Type="Object" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewInternalHearing" runat="server">
            <asp:FormView ID="fvInternalHearing" runat="server" DefaultMode="Insert" DataSourceID="ObjectDataSource2"
                OnItemInserting="fvInternalHearing_ItemInserting" meta:resourcekey="fvInternalHearingResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHeadingIns" runat="server" meta:resourcekey="lblHeadingIns" SkinID="SubHeading"
                                    Text="Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHearingDate" runat="server" meta:resourcekey="lblHearingDate" Text='Hearing Date&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHearingDateIns" runat="server" ReadOnly="True" meta:resourcekey="txtHearingDateIns"
                                    SkinID="Calendar" Text='<%# Bind("Date") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtHearingDateIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvHearingDateIns" runat="server" ControlToValidate="txtHearingDateIns"
                                    ErrorMessage="Please Enter Hearing Date" meta:resourcekey="rfvHearingDateIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblParticipantsIns" runat="server" meta:resourcekey="lblParticipantsIns"
                                    Text="Participants"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtParticipantsIns" runat="server" TextMode="MultiLine" Text='<%# Bind("Participants") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSummaryIns" runat="server" meta:resourcekey="lblSummaryIns" Text='Summary&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSummaryIns" runat="server" meta:resourcekey="txtSummaryIns" TextMode="MultiLine"
                                    Text='<%# Bind("Summary") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvRemarksIns" runat="server" ControlToValidate="txtSummaryIns"
                                    ErrorMessage="Please Enter Remarks" meta:resourcekey="rfvSummaryIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailIns" runat="server" meta:resourcekey="lblDetailIns" Text='Details&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailIns" runat="server" meta:resourcekey="txtDetailIns" TextMode="MultiLine"
                                    Text='<%# Bind("Details") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" Text="Judgement" meta:resourcekey="chkJudgement"
                                    Checked='<%# Bind("IsJudgement") %>' AutoPostBack="True" OnCheckedChanged="chkJudgement_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" Visible="False" runat="server" meta:resourcekey="lblRemarksIns"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksIns" Visible="False" runat="server" meta:resourcekey="txtRemarksIns"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHeadingIns" runat="server" meta:resourcekey="lblHeadingIns" SkinID="SubHeading"
                                    Text="Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHearingDate" runat="server" meta:resourcekey="lblHearingDate" Text="Hearing Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHearingDateIns" runat="server" ReadOnly="True" meta:resourcekey="txtHearingDateIns"
                                    SkinID="Calendar" Text='<%# Bind("Date") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtHearingDateIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvHearingDateIns" runat="server" ControlToValidate="txtHearingDateIns"
                                    ErrorMessage="Please Enter Hearing Date" meta:resourcekey="rfvHearingDateIns">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblParticipantsIns" runat="server" meta:resourcekey="lblParticipantsIns"
                                    Text="Participants"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtParticipantsIns" runat="server" meta:resourcekey="txtParticipantsIns"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSummaryIns" runat="server" meta:resourcekey="lblSummaryIns" Text="Summary"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSummaryIns" runat="server" meta:resourcekey="txtSummaryIns" TextMode="MultiLine"
                                    Text='<%# Bind("Summary") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvRemarksIns" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Please Enter Remarks" meta:resourcekey="rfvRemarksIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailIns" runat="server" meta:resourcekey="lblDetailIns" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailIns" runat="server" meta:resourcekey="txtDetailIns" TextMode="MultiLine"
                                    Text='<%# Bind("Details") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" Text="Judgement" meta:resourcekey="chkJudgement"
                                    Checked='<%# Bind("IsJudgement") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" Visible="False" runat="server" meta:resourcekey="lblRemarksIns"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksIns" Visible="False" runat="server" meta:resourcekey="txtRemarksIns"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <table width="100%">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblExistingHeadingIns" runat="server" meta:resourcekey="lblExistingHeadingIns"
                            SkinID="SubHeading" Text="Existing Hearing Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 112px">
                        <asp:GridView ID="gvExistingHearingdetails" AutoGenerateColumns="False" runat="server"
                            DataSourceID="ObjectDataSource2" meta:resourcekey="gvExistingHearingdetailsResource1">
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" meta:resourcekey="BoundFieldResource9" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary"
                                    meta:resourcekey="BoundFieldResource10" />
                                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details"
                                    meta:resourcekey="BoundFieldResource11" />
                            </Columns>
                            <EmptyDataTemplate>
                                Data Not Found!
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetVendorInspectionDetailsByOffenceID"
                TypeName="IGRSS.BusinessLogicLayer.VendorOffence" InsertMethod="AddNewvendorInvestigationDetails"
                OnInserting="ObjectDataSource2_Inserting" OnInserted="ObjectDataSource2_Inserted">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvEVendorOffenceDetails" Name="VendorOffenceID"
                        PropertyName="SelectedValue" Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:ControlParameter ControlID="gvEVendorOffenceDetails" Name="OffenceId" PropertyName="SelectedValue"
                        Type="Object" />
                    <asp:Parameter Name="InvestigationType" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCompletelicenseDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
                InsertMethod="AddNewSalseDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetCompleteLicenseDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRenewVendor" Name="LicenseApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
