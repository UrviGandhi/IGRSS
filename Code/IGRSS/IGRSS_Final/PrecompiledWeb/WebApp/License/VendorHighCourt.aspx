<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_VendorHighCourt, App_Web_syjfv0ab" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvInspectionDetails" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieLicRenew" runat="server">
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
                        <asp:Label ID="lblNameOfApplicant" runat="server" Text="Vendor Name" meta:resourcekey="lblNameOfApplicantResource1"></asp:Label></td>
                    <td class="textColumn" style="width: 25%; height: 26px;">
                        <asp:TextBox ID="txtApplicantName" runat="server" MaxLength="30" meta:resourcekey="txtApplicantNameResource1"></asp:TextBox></td>
                    <td class="validationColumn" style="height: 26px">
                        <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtApplicantName"
                            ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>" meta:resourcekey="regAppnametResource1">*</asp:RegularExpressionValidator>
                    </td>
                    <td style="height: 26px">
                    </td>
                    <td align="right" style="height: 26px">
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
                AutoGenerateColumns="False" OnSelectedIndexChanged="gvRenewVendor_SelectedIndexChanged" DataKeyNames="LicenseApplicationId" meta:resourcekey="gvRenewVendorResource1">
                <Columns>
                    <asp:BoundField DataField="ApplnNumber" HeaderText="App No" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False"
                        HeaderText="Application Date" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Name" meta:resourcekey="BoundFieldResource3" >
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" DataFormatString="{0:dd/MM/yyyy}"
                        HtmlEncode="False" meta:resourcekey="BoundFieldResource4" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HomePhone" HeaderText="Phone" meta:resourcekey="BoundFieldResource5" >
                        <HeaderStyle CssClass="grdMoneyField" />
                        <ItemStyle CssClass="grdMoneyField" />
                    </asp:BoundField>
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
            <asp:ObjectDataSource ID="odsCompletelicenseDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
                InsertMethod="AddNewSalseDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetCompleteLicenseDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRenewVendor" Name="LicenseApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsOffenceDetails" runat="server" SelectMethod="GetVendorOffenceDetailsByLicenseAppId"
                TypeName="IGRSS.BusinessLogicLayer.VendorOffence">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRenewVendor" Name="VendorLicenseId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="viewInsvestigationDetails" runat="server">
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
                        <asp:Label ID="Label1" runat="server" meta:resourcekey="lblAppDetailItm" SkinID="SubHeading"
                            Text="Vendor Offence Details"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 198px">
                        <asp:GridView ID="gvEVendorOffenceDetails" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="VendorOffenceId" DataSourceID="odsOffenceDetails" OnSelectedIndexChanged="gvEVendorOffenceDetails_SelectedIndexChanged" meta:resourcekey="gvEVendorOffenceDetailsResource1">
                            <Columns>
                                <asp:BoundField DataField="OffenceDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Offence Date"
                                    HtmlEncode="False" SortExpression="OffenceDate" meta:resourcekey="BoundFieldResource6" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" meta:resourcekey="BoundFieldResource7" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" meta:resourcekey="BoundFieldResource8" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:CommandField InsertText="Add High Court Details" ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Data Not Found!" meta:resourcekey="Label1Resource2"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6" style="height: 15px">
                        </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            &nbsp;
        </asp:View>
        <asp:View ID="viewHighCourrtDetails" runat="server">
            <asp:FormView ID="fvHighCourtdetails" runat="server" DataSourceID="odsHighCourtAppeal"
                DefaultMode="Insert" OnItemInserting="fvHighCourtdetails_ItemInserting" meta:resourcekey="fvHighCourtdetailsResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHighCourtHeaderIns" runat="server" meta:resourcekey="lblHighCourtHeaderIns"
                                    SkinID="SubHeading" Text="Vendor High Court Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileNoIns" runat="server" meta:resourcekey="lblFileNoIns" Text="High Court File No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFileNoIns" runat="server" meta:resourcekey="txtFileNoIns" Text='<%# Bind("HighCourtFileNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealDateIns" runat="server" meta:resourcekey="lblOffenceDateIns"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAppealDateIns" runat="server" ReadOnly="True" meta:resourcekey="txtAppealDateIns"
                                    Text='<%# Bind("Date") %>'></asp:TextBox>&nbsp;<rjs:PopCalendar ID="pcAppealdateIns"
                                        runat="server" Control="txtAppealDateIns" meta:resourcekey="pcAppealdateIns" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsIns" runat="server" meta:resourcekey="lblDetailsIns" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailsIns" runat="server" meta:resourcekey="txtDetailsIns" Text='<%# Bind("Details") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertIns" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHighCourtHeaderItm" runat="server" meta:resourcekey="lblHighCourtHeaderItm"
                                    SkinID="SubHeading" Text="Vendor High Court Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileNoItm" runat="server" meta:resourcekey="lblFileNoItm" Text="High Court File No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFileNoItm" runat="server" meta:resourcekey="txtFileNoItm" Text='<%# Bind("HighCourtFileNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealDateItm" runat="server" meta:resourcekey="lblOffenceDateItm"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAppealDateItm" runat="server" ReadOnly="True" meta:resourcekey="txtAppealDateItm"
                                    Text='<%# Bind("Date") %>'></asp:TextBox>&nbsp;<rjs:PopCalendar ID="pcAppealdateItm"
                                        runat="server" Control="txtAppealDateItm" meta:resourcekey="pcAppealdateItm" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsItm" runat="server" meta:resourcekey="lblDetailsItm" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailsItm" runat="server" meta:resourcekey="txtDetailsItm" Text='<%# Bind("Details") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHighCourtHeaderUpd" runat="server" meta:resourcekey="lblHighCourtHeaderUpd"
                                    SkinID="SubHeading" Text="Vendor High Court Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileNoUpd" runat="server" meta:resourcekey="lblFileNoUpd" Text="High Court File No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFileNoUpd" runat="server" meta:resourcekey="txtFileNoUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealDateUpd" runat="server" meta:resourcekey="lblOffenceDateUpd"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAppealDateUpd" runat="server" ReadOnly="True" meta:resourcekey="txtAppealDateUpd"></asp:TextBox>&nbsp;<rjs:PopCalendar
                                    ID="pcAppealdateUpd" runat="server" Control="txtAppealDateUpd" meta:resourcekey="pcAppealdateUpd" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsUpd" runat="server" meta:resourcekey="lblDetailsUpd" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailsUpd" runat="server" meta:resourcekey="txtDetailsUpd" Text='<%# Bind("Details") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUpdertUpd" runat="server" CommandName="Updert" Text="Save" meta:resourcekey="btnUpdertUpd" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsHighCourtAppeal" runat="server" InsertMethod="AddNewHighCourtDetails"
                SelectMethod="AddNewHighCourtDetails" TypeName="IGRSS.BusinessLogicLayer.VendorOffence"
                OldValuesParameterFormatString="original_{0}" OnInserted="odsHighCourtAppeal_Inserted">
                <InsertParameters>
                    <asp:Parameter Name="HighCourtFileNo" Type="String" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="VendorOffenceId" Type="Object" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="HighCourtFileNo" Type="String" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="VendorOffenceId" Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            x
            <asp:HiddenField ID="fldVendorOffenceId" runat="server" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
