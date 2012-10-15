<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Service_Service, App_Web_atprofjj" title="Service Details" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvService" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewSearchServiceNo" runat="server">
            <table id="TABLE1" width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblServiceNo" runat="server" Text="Enter Service No"></asp:Label></td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtServiceNo" runat="server" meta:resourcekey="txtServiceNo"></asp:TextBox>
                    </td>
                    <td class="validationColumn" colspan="4">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearchServiceNo" runat="server" Text="Search" OnClick="btnSearchServiceNo_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 385px">
                        <asp:GridView ID="gvServiceNo" runat="server" AutoGenerateColumns="False" DataKeyNames="ServiceID"
                            OnSelectedIndexChanged="gvServiceNo_SelectedIndexChanged" AllowPaging="True"
                            OnPageIndexChanging="gvServiceNo_PageIndexChanging" ToolTip="Select a Record to Edit or View"
                            DataSourceID="odsGV">
                            <Columns>
                                <asp:BoundField DataField="ServiceNo" HeaderText="Service No" SortExpression="ServiceNo" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ServiceDate" HeaderText="Service Date" SortExpression="ServiceDate" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VendorName" HeaderText="Vendor Name" SortExpression="VendorName" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Data Available!
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsGV" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetServiceDetailsByServiceNo" TypeName="IGRSS.BusinessLogicLayer.Service">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtServiceNo" Name="ServiceNo" PropertyName="Text"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewfvServiceDetails" runat="server">
            <asp:FormView ID="fvService" runat="server" DataSourceID="odsService" DefaultMode="Insert"
                DataKeyNames="ServiceID" OnItemInserting="fvService_ItemInserting" OnItemUpdating="fvService_ItemUpdating">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblServiceDetailsHeaderIns" runat="server" meta:resourcekey="lblServiceDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Service Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceNoIns" runat="server" meta:resourcekey="lblServiceNoIns"
                                    Text="Service No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceNoIns" MaxLength="10" runat="server" meta:resourcekey="txtServiceNoIns"
                                    Text='<%# Bind("ServiceNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RvfServiceNoIns" runat="server" ControlToValidate="txtServiceNoIns"
                                    ErrorMessage="Please Enter ServiceNo">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtServiceNoIns" runat="server" ControlToValidate="txtServiceNoIns"
                                    ErrorMessage="Please Enter Valid ServiceNo" ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorNameIns" runat="server" meta:resourcekey="lblVendorNameIns"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlVendorNameIns" runat="server" DataSourceID="odsVendorDetails"
                                    DataTextField="VendorName" DataValueField="VendorID" SelectedValue='<%# Bind("VendorID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceDateIns" runat="server" meta:resourcekey="lblServiceDateIns"
                                    Text="Service Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceDateIns" runat="server" meta:resourcekey="txtServiceDateIns"
                                    ReadOnly="true" Text='<%# Bind("ServiceDate") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <rjs:PopCalendar ID="pcServiceDate" runat="server" Control="txtServiceDateIns" meta:resourcekey="pcServiceDate"
                                    Move="True" />
                                <asp:RequiredFieldValidator ID="ReqfldServiceDateIns" runat="server" ControlToValidate="txtServiceDateIns"
                                    ErrorMessage="Service Date is Must">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmpNameIns" runat="server" meta:resourcekey="lblEmpNameIns" Text="Employee Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEmpNameIns" runat="server" DataSourceID="odsGetEmployee"
                                    DataTextField="FirstName" DataValueField="EmployeeID" SelectedValue='<%# Bind("InChargeEmpID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblInstumentRepairedIns" runat="server" meta:resourcekey="lblInstumentRepairedIns"
                                    Text="Instrument Repaired"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtInstumentRepairedIns" runat="server" meta:resourcekey="txtInstumentRepairedIns"
                                    Text='<%# Bind("InstrumentRepaired") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksIns" TextMode="MultiLine" runat="server" meta:resourcekey="txtRemarksIns"
                                    Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldtxtRemarksIns" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Please Enter Remarks">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExptxtRemarksIns" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Remarks Should be some Text" ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnServiceInsertIns" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Save" />
                                <asp:Button ID="btnTelephoneCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblServiceDetailsHeaderUpd" runat="server" meta:resourcekey="lblServiceDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Service Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceNoUpd" runat="server" meta:resourcekey="lblServiceNoUpd"
                                    Text="Service No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceNoUpd" ReadOnly="true" runat="server" meta:resourcekey="txtServiceNoUpd"
                                    Text='<%# Bind("ServiceNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RvfServiceNoUpd" runat="server" ControlToValidate="txtServiceNoUpd">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtServiceNoUpd" runat="server" ControlToValidate="txtServiceNoUpd"
                                    ErrorMessage="Not a valid Service No" ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorNameUpd" runat="server" meta:resourcekey="lblVendorNameUpd"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlVendorNameUpd" runat="server" DataSourceID="odsVendorDetails"
                                    DataTextField="VendorName" DataValueField="VendorID" SelectedValue='<%# Bind("VendorID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceDateUpd" runat="server" meta:resourcekey="lblServiceDateUpd"
                                    Text="Service Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceDateUpd" runat="server" meta:resourcekey="txtServiceDateUpd"
                                    ReadOnly="True" Text='<%# Bind("ServiceDate") %>' OnDataBinding="txtServiceDateUpd_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <rjs:PopCalendar ID="pcServiceDate" runat="server" Control="txtServiceDateUpd" meta:resourcekey="pcServiceDate"
                                    Move="True" />
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmpNameUpd" runat="server" meta:resourcekey="lblEmpNameUpd" Text="Employee Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlEmpNameUpd" runat="server" DataSourceID="odsGetEmployee"
                                    DataTextField="FirstName" DataValueField="EmployeeID" SelectedValue='<%# Bind("InChargeEmpID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUpdtumentRepairedUpd" runat="server" meta:resourcekey="lblUpdtumentRepairedUpd"
                                    Text="Updtrument Repaired"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtUpdtumentRepairedUpd" runat="server" meta:resourcekey="txtUpdtumentRepairedUpd"
                                    Text='<%# Bind("InstrumentRepaired") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemarksUpd">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExptxtRemarksUpd" runat="server" ControlToValidate="txtRemarksUpd"
                                    ErrorMessage="Remarks Should be some Text" ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnServiceUpdateUpd" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                <asp:Button ID="btnServiceCancelUpd" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblServiceDetailsHeaderItm" runat="server" meta:resourcekey="lblServiceDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Service Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceNoItm" runat="server" meta:resourcekey="lblServiceNoItm"
                                    Text="Service No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceNoItm" ReadOnly="true" runat="server" meta:resourcekey="txtServiceNoItm"
                                    Text='<%# Bind("ServiceNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RvfServiceNoItm" runat="server" ControlToValidate="txtServiceNoItm">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorNameItm" runat="server" meta:resourcekey="lblVendorNameItm"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVendorNameItm" runat="server" meta:resourcekey="txtVendorNameItm"
                                    ReadOnly="true" Text='<%# Bind("VendorName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceDateItm" runat="server" meta:resourcekey="lblServiceDateItm"
                                    Text="Service Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceDateItm" runat="server" meta:resourcekey="txtServiceDateItm"
                                    ReadOnly="true" Text='<%# Bind("ServiceDate") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmpNameItm" runat="server" meta:resourcekey="lblEmpNameItm" Text="Employee Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmpNameItm" runat="server" meta:resourcekey="txtEmpNameItm" ReadOnly="true"
                                    Text='<%# Bind("EmpName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblItmtumentRepairedItm" runat="server" meta:resourcekey="lblItmtumentRepairedItm"
                                    Text="Itmtrument Repaired"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtItmtumentRepairedItm" runat="server" meta:resourcekey="txtItmtumentRepairedItm"
                                    ReadOnly="true" Text='<%# Bind("InstrumentRepaired") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" ReadOnly="true"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="viewReadOnly" runat="server">
            <asp:FormView ID="FvReadOnly" runat="server" DataKeyNames="ServiceID" DataSourceID="odsService"
                OnPageIndexChanging="FvReadOnly_PageIndexChanging">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblServiceDetailsHeaderItm" runat="server" meta:resourcekey="lblServiceDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Service Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceNoItm" runat="server" meta:resourcekey="lblServiceNoItm"
                                    Text="Service No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceNoItm" runat="server" meta:resourcekey="txtServiceNoItm"
                                    ReadOnly="true" Text='<%# Bind("ServiceNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RvfServiceNoItm" runat="server" ControlToValidate="txtServiceNoItm">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorNameItm" runat="server" meta:resourcekey="lblVendorNameItm"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVendorNameItm" runat="server" meta:resourcekey="txtVendorNameItm"
                                    ReadOnly="true" Text='<%# Bind("VendorName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblServiceDateItm" runat="server" meta:resourcekey="lblServiceDateItm"
                                    Text="Service Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtServiceDateItm" runat="server" meta:resourcekey="txtServiceDateItm"
                                    ReadOnly="true" Text='<%# Bind("ServiceDate") %>' OnDataBinding="txtServiceDateItm_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmpNameItm" runat="server" meta:resourcekey="lblEmpNameItm" Text="Employee Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmpNameItm" runat="server" meta:resourcekey="txtEmpNameItm" ReadOnly="true"
                                    Text='<%# Bind("EmpName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblItmtumentRepairedItm" runat="server" meta:resourcekey="lblItmtumentRepairedItm"
                                    Text="Instruments Repaired"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtItmtumentRepairedItm" runat="server" meta:resourcekey="txtItmtumentRepairedItm"
                                    ReadOnly="true" Text='<%# Bind("InstrumentRepaired") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" ReadOnly="true"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
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
                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatus" Text="Status"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Status") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedBy" runat="server" Text="Created By"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCreatedBy" runat="server" Text='<%# Bind("CreatedBy") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedAt" runat="server" Text="Created At"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCreatedAt" runat="server" Text='<%# Bind("CreatedAt") %>' OnDataBinding="txtCreatedAt_DataBinding"
                                    ReadOnly="True"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblModifiedBy" runat="server" Text="Modified By"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtModifiedBy" runat="server" Text='<%# Bind("ModifiedBy") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblModifiedAt" runat="server" Text="Modified At"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtModifiedAt" runat="server" Text='<%# Bind("ModifiedAt") %>' OnDataBinding="txtModifiedAt_DataBinding"
                                    ReadOnly="True"></asp:TextBox></td>
                            <td class="validationColumn">
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
                                <asp:Button ID="btnBackToGrid" runat="server" Text="Back" OnClick="btnBackToGrid_Click" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsGetEmployee" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateEmployeeMaster">
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="Parameters" Type="Object" />
            <asp:Parameter Name="QualificationDetails" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="dtQualification" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="GetServiceDetailsByServiceID"
        TypeName="IGRSS.BusinessLogicLayer.Service" UpdateMethod="UpdateServiceDetails"
        OnInserting="odsService_Inserting" OnUpdating="odsService_Updating" OnInserted="odsService_Inserted"
        OnUpdated="odsService_Updated" InsertMethod="AddServiceDetails">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ServiceID" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvServiceNo" Name="ServiceID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsVendorDetails" runat="server" InsertMethod="InsertPurchaseRegHeader"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorMasterTableDetails"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
        <UpdateParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
