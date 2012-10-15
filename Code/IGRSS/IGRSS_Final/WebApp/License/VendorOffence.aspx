<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="VendorOffence.aspx.cs" Inherits="License_VendorOffence" Title="Untitled Page"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvVendorOffence" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieLicRenew" runat="server">
            <table width="100%">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                            SkinID="SubHeading" Text="Search File" Width="100%"></asp:Label></td>
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
                    <td class="textColumn" style="height: 26px">
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
                        HeaderText="Application Date" Visible="False" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameOfApplicant" HeaderText="Name" meta:resourcekey="BoundFieldResource3" >
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" DataFormatString="{0:dd/MM/yyyy}"
                        HtmlEncode="False" Visible="False" meta:resourcekey="BoundFieldResource4" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDaetField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HomePhone" HeaderText="Phone" Visible="False" meta:resourcekey="BoundFieldResource5" />
                    <asp:BoundField DataField="IssuedDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Issued Date" meta:resourcekey="BoundFieldResource6" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EffectiveDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Valid From" meta:resourcekey="BoundFieldResource7" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ExpiryDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Valid Till" meta:resourcekey="BoundFieldResource8" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
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
        </asp:View>
        <asp:View ID="viewOffenceDetails" runat="server">
            <asp:FormView runat="server" ID="FvVendorOffence" DefaultMode="Insert" DataSourceID="odsVendorOffence"
                OnItemInserting="FvVendorOffence_ItemInserting" OnItemInserted="FvVendorOffence_ItemInserted"
                meta:resourcekey="FvVendorOffenceResource1" OnDataBound="FvVendorOffence_DataBound"
                OnLoad="FvVendorOffence_Load">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblendorOffenceHeaderIns" runat="server" meta:resourcekey="lblendorOffenceHeaderIns"
                                    SkinID="SubHeading" Text="Vendor Offence Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficeIdIns" runat="server" meta:resourcekey="ddlOfficeIdIns"
                                    Text='<%# Bind("OfficeId") %>' DataTextField="OfficeName" DataValueField="OfficeId"
                                    SelectedValue='<%# Bind("OfficeId") %>' DataSourceID="odsGetOffices">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOffenceDateIns" runat="server" meta:resourcekey="lblOffenceDateIns"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOffenceDateIns" runat="server" ReadOnly="True" meta:resourcekey="txtOffenceDateIns"
                                    SkinID="Calendar" Text='<%# Bind("OffenceDate") %>'></asp:TextBox><rjs:PopCalendar
                                        ID="calDocumentDate" runat="server" Control="txtOffenceDateIns" meta:resourcekey="txtOffenceDateIns" />
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="rfvOffenceDateIns" runat="server" ControlToValidate="txtOffenceDateIns"
                                    ErrorMessage="Please Enter Offence Date" meta:resourcekey="rfvOffenceDateInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSummaryIns" runat="server" meta:resourcekey="lblSummaryIns" Text="Summary"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSummaryIns" runat="server" meta:resourcekey="txtSummaryIns" Text='<%# Bind("Summary") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
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
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lbleOffenceDetailsIns" runat="server" meta:resourcekey="lbleOffenceDetailsIns"
                                    SkinID="SubHeading" Text="Existing Offence Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvEVendorOffenceDetails" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="VendorOffenceId" DataSourceID="odsOffenceDetails" meta:resourcekey="gvEVendorOffenceDetailsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="OffenceDate" HeaderText="Offence Date" SortExpression="OffenceDate"
                                            DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource9" >
                                            <HeaderStyle CssClass="grdDateField" />
                                            <ItemStyle CssClass="grdDateField" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" meta:resourcekey="BoundFieldResource10" >
                                            <HeaderStyle CssClass="grdTextField" />
                                            <ItemStyle CssClass="grdTextField" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" meta:resourcekey="BoundFieldResource11" >
                                            <HeaderStyle CssClass="grdTextField" />
                                            <ItemStyle CssClass="grdTextField" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Data Not Found!" meta:resourcekey="Label1Resource2"></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblendorOffenceHeaderUpd" runat="server" meta:resourcekey="lblendorOffenceHeaderUpd"
                                    SkinID="SubHeading" Text="Vendor Offence Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" meta:resourcekey="txtNameUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameUpd" runat="server" meta:resourcekey="lblOfficeNameUpd"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficeIdUpd" runat="server" meta:resourcekey="ddlOfficeIdUpd"
                                    Text='<%# Bind("OfficeId") %>' DataTextField="OfficeName" DataValueField="OfficeId"
                                    SelectedValue='<%# Bind("OfficeId") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOffenceDateUpd" runat="server" meta:resourcekey="lblOffenceDateUpd"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOffenceDateUpd" runat="server" ReadOnly="True" meta:resourcekey="txtOffenceDateUpd"></asp:TextBox>&nbsp;<rjs:PopCalendar
                                    ID="calDocumentDate" runat="server" Control="txtOffenceDateUpd" meta:resourcekey="txtOffenceDateUpd" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSummaryUpd" runat="server" meta:resourcekey="lblSummaryUpd" Text="Summary"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSummaryUpd" runat="server" meta:resourcekey="txtSummaryUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsUpd" runat="server" meta:resourcekey="lblDetailsUpd" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailsUpd" runat="server" meta:resourcekey="txtDetailsUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblendorOffenceHeaderItm" runat="server" meta:resourcekey="lblendorOffenceHeaderItm"
                                    SkinID="SubHeading" Text="Vendor Offence Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameItm" runat="server" meta:resourcekey="lblNameItm" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameItm" runat="server" meta:resourcekey="txtNameItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameItm" runat="server" meta:resourcekey="lblOfficeNameItm"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficeIdItm" runat="server" meta:resourcekey="ddlOfficeIdItm"
                                    Text='<%# Bind("OfficeId") %>' DataTextField="OfficeName" DataValueField="OfficeId"
                                    SelectedValue='<%# Bind("OfficeId") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOffenceDateItm" runat="server" meta:resourcekey="lblOffenceDateItm"
                                    Text="Offence Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOffenceDateItm" runat="server" ReadOnly="True" meta:resourcekey="txtOffenceDateItm"></asp:TextBox>&nbsp;<rjs:PopCalendar
                                    ID="calDocumentDate" runat="server" Control="txtOffenceDateItm" meta:resourcekey="txtOffenceDateItm" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSummaryItm" runat="server" meta:resourcekey="lblSummaryItm" Text="Summary"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSummaryItm" runat="server" meta:resourcekey="txtSummaryItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsItm" runat="server" meta:resourcekey="lblDetailsItm" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailsItm" runat="server" meta:resourcekey="txtDetailsItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsVendorOffence" runat="server" InsertMethod="AddVendorOffence"
                SelectMethod="GetData" TypeName="IGRSS.BusinessLogicLayer.VendorOffence" OldValuesParameterFormatString="original_{0}"
                OnInserting="odsVendorOffence_Inserting">
                <InsertParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="LicenseId" Type="Object" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsOffenceDetails" runat="server" SelectMethod="GetVendorOffenceDetailsByLicenseAppId"
                TypeName="IGRSS.BusinessLogicLayer.VendorOffence">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvRenewVendor" Name="VendorLicenseId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="viewFileNoDetails" runat="server">
            <asp:Label ID="lblFileNoIns" runat="server" Width="96px" meta:resourcekey="lblFileNoInsResource1"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>
