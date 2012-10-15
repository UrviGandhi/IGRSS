<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="SpecimenSignature.aspx.cs" Inherits="License_SpecimenSignature" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvSpicemenSig" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieLicRenew" runat="server">
            <table width="100%">
                <tr>
                    <td align="left" colspan="5" style="height: 18px">
                        <asp:Label ID="lblLicenseCancelation" runat="server" SkinID="Heading" Text="License Renewal Process"
                            meta:resourcekey="lblLicenseCancelationResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 25%; height: 26px;">
                        <asp:Label ID="Label4" runat="server" Text="Enter License No<span >*</span></td>"
                            meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td style="width: 25%; height: 26px;">
                        <asp:TextBox ID="txtLicenseNo" runat="server" meta:resourcekey="txtLicenseNoResource1"></asp:TextBox></td>
                    <td style="width: 25%; height: 26px;">
                        <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
                    <td style="width: 25%; height: 26px;">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="2" style="height: 26px">
                    </td>
                    <td align="right" colspan="2" style="height: 26px">
                        <asp:Button ID="btnLicenseNo" runat="server" Text="Search" meta:resourcekey="btnLicenseNoResource1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvRenewVendor" runat="server" DataSourceID="odsLicenseN0" AutoGenerateColumns="False"
                DataKeyNames="LicenseApplicationId" OnSelectedIndexChanged="gvRenewVendor_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="LicenseNo" HeaderText="License No" SortExpression="LicenseNo"
                        meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Applicant Name" SortExpression="NameOfApplicant"
                        meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle CssClass="grdTextField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DateOfBirth"
                        meta:resourcekey="BoundFieldResource3" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}">
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IssuedDate" HeaderText="Issue Date" SortExpression="IssuedDate"
                        meta:resourcekey="BoundFieldResource4" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}">
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" SortExpression="ExpiryDate"
                        meta:resourcekey="BoundFieldResource5" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}">
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                </Columns>
                <EmptyDataTemplate>
                    No Records found
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsLicenseN0" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetVendorFranklineDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
                DataObjectTypeName="System.Guid" DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses"
                UpdateMethod="CancelVendorLicenses">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtName" Name="NameOfApplicant" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
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
            &nbsp;
        </asp:View>
        <asp:View ID="viewfranklinDetails" runat="server">
            <asp:FormView ID="fvfranklinDetail" runat="server" DataSourceID="odsFrankingMachineDetails"
                DataKeyNames="LicenseApplicationId">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="LBlLicenseHeading" runat="server" meta:resourcekey="LBlLicenseHeadingResource2"
                                    SkinID="Heading" Text="Vendor Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblappno" runat="server" meta:resourcekey="lblappnoResource2" Text="License No"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="ApplnNumberTextBox" runat="server" meta:resourcekey="ApplnNumberTextBoxResource2"
                                    Text='<%# Bind("LicenseNo") %>' MaxLength="15"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblapname" runat="server" meta:resourcekey="lblapnameResource2" Text="Bank Name"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="NameOfApplicantTextBox" runat="server" meta:resourcekey="NameOfApplicantTextBoxResource2"
                                    Text='<%# Bind("NameOfApplicant") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpresentaddress" runat="server" meta:resourcekey="lblpresentaddressResource2"
                                    Text="Zonal Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PresentAddressTextBox" runat="server" meta:resourcekey="PresentAddressTextBoxResource2"
                                    Text='<%# Bind("PresentAddress") %>' TextMode="MultiLine" Columns="250"></asp:TextBox></td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblpermanentaddress" runat="server" meta:resourcekey="lblpermanentaddressResource2"
                                    Text="Main Branch Address"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="PermanentAddressTextBox" runat="server" meta:resourcekey="PermanentAddressTextBoxResource2"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" Columns="250"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblpjone" runat="server" meta:resourcekey="lblpjoneResource2" Text="Phone"></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtphone" runat="server" meta:resourcekey="txtphoneResource2" Text='<%# Bind("HomePhone") %>'
                                    Width="131px" MaxLength="11"></asp:TextBox>
                            </td>
                            <td colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4" style="height: 18px">
                                <asp:Label ID="LBlLicenseHg" runat="server" meta:resourcekey="LBlLicenseHgResource1"
                                    SkinID="Heading" Text="License Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblissuedate" runat="server" meta:resourcekey="lblissuedateResource1"
                                    Text="Issue Date"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtIssueDate" runat="server" meta:resourcekey="txtIssueDateResource1"
                                    ReadOnly="True" Text='<%# Bind("IssuedDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lbleffectivedate" runat="server" meta:resourcekey="lbleffectivedateResource1"
                                    Text="Valid From"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtEffectiveDate" runat="server" meta:resourcekey="txtEffectiveDateResource1"
                                    ReadOnly="True" Width="131px" Text='<%# Bind("EffectiveDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblexpirydate" runat="server" meta:resourcekey="lblexpirydateResource1"
                                    Text="Valid Till"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtExpiryDate" runat="server" meta:resourcekey="txtExpiryDateResource1"
                                    ReadOnly="True" Width="131px" Text='<%# Bind("ExpiryDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsFrankingMachineDetails" runat="server" InsertMethod="NewFrankingApplication"
                SelectMethod="GetCompleteLicenseDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication"
                UpdateMethod="updateFrankingDetails" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRenewVendor" Name="LicenseApplicationId" PropertyName="SelectedValue"
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
            <asp:FormView ID="viewviewSignature" runat="server" DefaultMode="Insert" Height="71px"
                DataSourceID="odsSpicemendetails" OnItemInserting="viewviewSignature_ItemInserting"
                OnDataBound="viewviewSignature_DataBound" OnLoad="gvSignatureDetails_SelectedIndexChanged"
                DataKeyNames="LicenseApplicationId">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblLeaveDetailsHeaderIns" runat="server" meta:resourcekey="lblLeaveDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Authorised Signature Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNameIns" runat="server" meta:resourcekey="lblEmployeeNameIns"
                                    Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtLeaveToIns" runat="server" meta:resourcekey="txtLeaveToIns" Text='<%# Bind("FullName") %>'></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDesignation" runat="server" meta:resourcekey="lblDesignation" Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDesignation" runat="server" meta:resourcekey="txtDesignation"
                                    Text='<%# Bind("Designation") %>'></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnTelephoneInsertIns" runat="server" Text="Add" OnClick="btnTelephoneInsertIns_Click" />
                                <asp:Button ID="btnTelephoneCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                                <asp:Button ID="btnUpdateIns" runat="server" Text="Update" meta:resourcekey="btnTelephoneCancelIns" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvSignatureDetails" AutoGenerateColumns="false" runat="server"
                                    AllowPaging="true" PageSize="20" OnDataBound="gvSignatureDetails_DataBound" DataKeyNames="SignatureID"
                                    OnPageIndexChanging="gvSignatureDetails_PageIndexChanging" OnSelectedIndexChanged="gvSignatureDetails_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCurrentAuthoritySignatry" runat="server" meta:resourcekey="lblCurrentAuthoritySignatry"
                                    SkinID="SubHeading" Text=" Current Authorised Signature Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvCurrentAuthoritySignatry" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Insert" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsSpicemendetails" runat="server" InsertMethod="AddSpicemenDetails"
                SelectMethod="GetSpicemendetailsByLicenseId" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication"
                OnInserting="odsSpicemendetails_Inserting">
                <SelectParameters>
                    <asp:ControlParameter PropertyName="SelectedValue" Type="Object" Name="LicenseApplicationId"
                        ControlID="fvfranklinDetail"></asp:ControlParameter>
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter PropertyName="SelectedValue" Type="Object" Name="LicenseAplicationId"
                        ControlID="fvfranklinDetail"></asp:ControlParameter>
                    <%--  <asp:Parameter Type="String" Name="FullName"></asp:Parameter>--%>
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
