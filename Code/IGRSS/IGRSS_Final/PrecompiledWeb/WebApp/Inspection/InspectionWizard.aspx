<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionWizard, App_Web_dvk3xubv" title="Inspection Wizard" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    &nbsp;<br />
    <asp:MultiView ID="mvInspectionDetails" runat="server" ActiveViewIndex="0">
        <asp:View ID="WzInspectionIns" runat="server">
            <asp:Wizard ID="WzInspection" runat="server" ActiveStepIndex="0" Height="100px" OnFinishButtonClick="WzInspection_FinishButtonClick"
                OnNextButtonClick="WzInspection_NextButtonClick" Width="756px" OnActiveStepChanged="WzInspection_ActiveStepChanged"
                OnInit="WzInspection_Init" DisplaySideBar="False" OnDataBinding="WzInspection_DataBinding">
                <WizardSteps>
                    <asp:WizardStep runat="server" Title="Inspection Office Details">
                        <table width="100%">
                            <tr>
                                <td colspan="6" style="height: 18px">
                                    <asp:Label ID="lblInspectionDetailHeaderIns" runat="server" meta:resourcekey="lblInspectionDetailHeaderIns"
                                        SkinID="SubHeading" Text="Inspection Details"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectionTypeIdIns" runat="server" meta:resourcekey="lblInspectionTypeIdIns"
                                        Text="Inspection Type"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectionTypeIdIns" runat="server" DataSourceID="OdsInspectionTypeMaster"
                                        DataTextField="Name" DataValueField="InspectionTypeId" meta:resourcekey="ddlInspectionTypeIdIns">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectingOfficerIdIns" runat="server" meta:resourcekey="lblInspectingOfficerIdIns"
                                        Text="Inspecting staff"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectingOfficerIdIns" runat="server" DataSourceID="OdsEmployeeMaster"
                                        DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlInspectingOfficerIdIns">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn" style="height: 40px">
                                    <asp:Label ID="lblInspectorOfficeNameIns" runat="server" meta:resourcekey="lblInspectorOfficeNameIns"
                                        Text="Inspector Office Name"></asp:Label>
                                </td>
                                <td align="left" colspan="4" style="width: 25%; height: 40px;">
                                    <asp:TextBox ID="txtInspectorOfficeNameIns" runat="server" meta:resourcekey="txtInspectorOfficeNameIns"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn" style="height: 40px">
                                    <asp:RequiredFieldValidator ID="ReqFldInspectorOfficeNameIns" runat="server" ControlToValidate="txtInspectorOfficeNameIns"
                                        ErrorMessage="Inspecting Office Name Can't be Blank">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegExprValtxtInspectorOfficeNameIns" runat="server"
                                        ErrorMessage="Enter a valid Office Name" ControlToValidate="txtInspectorOfficeNameIns"
                                        ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectedOfficeIdIns" runat="server" meta:resourcekey="lblInspectedOfficeIdIns"
                                        Text="Inspected Office"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectedOfficeIdIns" runat="server" DataSourceID="OdsOffice"
                                        DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlInspectedOfficeIdIns">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn">
                                    <asp:Label ID="lblLicenseIdIns" runat="server" meta:resourcekey="lblLicenseIdIns"
                                        Text="Vendor License"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlLicenseIdIns" runat="server" DataSourceID="OdsLicenseMaster"
                                        DataTextField="LicenseNo" DataValueField="LicenseApplicationId" meta:resourcekey="ddlLicenseIdIns">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Query List Details" StepType="Finish">
                        <table width="100%">
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="lblInspectionDetailHeader" runat="server" meta:resourcekey="lblInspectionDetailHeaderIns"
                                        SkinID="SubHeading" Text="Query List "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblQueryChecklistIns" runat="server" meta:resourcekey="lblQueryChecklistIns"
                                        Text="CheckList"></asp:Label>
                                </td>
                                <td colspan="4">
                                    <asp:DropDownList ID="ddlCheckListIdIns" runat="server" DataSourceID="OdsInspectionCheckListMaster"
                                        DataTextField="Description" DataValueField="CheckListId" meta:resourcekey="ddlCheckListId">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblQueryIns" runat="server" meta:resourcekey="lblQueryIns" Text="Query"></asp:Label>
                                </td>
                                <td align="left" colspan="4">
                                    <asp:TextBox ID="txtQueryIns" runat="server" meta:resourcekey="txtQueryIns" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                    <asp:RequiredFieldValidator ID="ReqfldtxtQueryIns" runat="server" ControlToValidate="txtQueryIns"
                                        ValidationGroup="QueryGroup" ErrorMessage="Query Field Can't be blank">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegexptxtQueryIns" runat="server" ControlToValidate="txtQueryIns"
                                        ErrorMessage="Query Field Is not in Correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                        ValidationGroup="QueryGroup">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblQueryRemarksIns" runat="server" meta:resourcekey="lblQueryRemarksIns"
                                        Text="Compliance"></asp:Label>
                                </td>
                                <td align="left" colspan="4">
                                    <asp:TextBox ID="txtQueryRemarksIns" runat="server" meta:resourcekey="txtRemarksIns"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                    <asp:RequiredFieldValidator ID="ReqfldtxtQueryRemarksIns" runat="server" ControlToValidate="txtQueryRemarksIns"
                                        ErrorMessage="Remarks Field Can't be blank" ValidationGroup="QueryGroup">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegexptxtQueryRemarksIns" runat="server" ControlToValidate="txtQueryRemarksIns"
                                        ErrorMessage="Remark Field Is not in Correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                        ValidationGroup="QueryGroup">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="6">
                                    <asp:Button ID="btnQueryAddIns" runat="server" meta:resourcekey="btnQueryAddIns"
                                        OnClick="btnQueryAddIns_Click" Text="Add" ValidationGroup="QueryGroup" />
                                    <asp:Button ID="btnQueryUpdateIns" runat="server" meta:resourcekey="btnQueryUpdateIns"
                                        Text="Update" OnClick="btnQueryUpdateIns_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:GridView ID="GvInspectionQueriesIns" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" DataKeyNames="QueryId" ForeColor="#333333" GridLines="None" Width="100%"
                                        OnRowDeleting="GvInspectionQueriesIns_RowDeleting" OnSelectedIndexChanged="GvInspectionQueriesIns_SelectedIndexChanged">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="CheckListId" HeaderText="CheckList Id" Visible="False" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("InspectionId") %>'></asp:LinkButton>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Description" HeaderText="Description" />
                                            <asp:BoundField DataField="Query" HeaderText="Query" />
                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                            <asp:CommandField ShowSelectButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="lblIsDiscrepancyFoundIns" runat="server" meta:resourcekey="lblIsDiscrepancyFoundIns"
                                        SkinID="SubHeading" Text="Compliance"></asp:Label>
                                    <asp:CheckBox ID="chkIsDiscrepancyFoundIns" runat="server" meta:resourcekey="chkIsDiscrepancyFoundIns"
                                        Text="Discrepancy Found" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn" style="width: 5%">
                                    <asp:Label ID="lblInspectionRemarksIns" runat="server" meta:resourcekey="lblInspectionRemarksIns"
                                        Text="Inspection Remarks"></asp:Label>
                                </td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtInspectionRemarksIns" runat="server" meta:resourcekey="txtInspectionRemarksIns"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Wizard ID="WzInspectionUpd" runat="server" ActiveStepIndex="1" DisplaySideBar="False"
                Height="100px" Width="756px" FinishCompleteButtonText="Update" OnInit="WzInspectionUpd_Init"
                OnDataBinding="WzInspectionUpd_DataBinding" OnLoad="WzInspectionUpd_Load" OnFinishButtonClick="WzInspectionUpd_FinishButtonClick">
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Inspection Office Details">
                        <table width="100%">
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="lblInspectionDetailHeaderUpd" runat="server" meta:resourcekey="lblInspectionDetailHeaderUpd"
                                        SkinID="SubHeading" Text=" Update Inspection Details "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectionTypeIdUpd" runat="server" meta:resourcekey="lblInspectionTypeIdUpd"
                                        Text="Inspection Type"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectionTypeIdUpd" runat="server" DataSourceID="OdsInspectionTypeMaster"
                                        DataTextField="Name" DataValueField="InspectionTypeId" meta:resourcekey="ddlInspectionTypeIdUpd">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectingOfficerIdUpd" runat="server" meta:resourcekey="lblInspectingOfficerIdUpd"
                                        Text="Inspecting staff"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectingOfficerIdUpd" runat="server" meta:resourcekey="ddlInspectingOfficerIdUpd"
                                        DataSourceID="OdsEmployeeMaster" DataTextField="FirstName" DataValueField="EmployeeID">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                            <tr>    
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectorOfficeNameUpd" runat="server" meta:resourcekey="lblInspectorOfficeNameUpd"
                                        Text="Inspector Office Name"></asp:Label>
                                </td>
                                <td align="left" colspan="4">
                                    <asp:TextBox ID="txtInspectorOfficeNameUpd" runat="server" meta:resourcekey="txtInspectorOfficeNameUpd"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectedOfficeIdUpd" runat="server" meta:resourcekey="lblInspectedOfficeIdUpd"
                                        Text="Inspected Office"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlInspectedOfficeIdUpd" runat="server" meta:resourcekey="ddlInspectedOfficeIdUpd"
                                        DataSourceID="OdsOffice" DataTextField="OfficeName" DataValueField="OfficeId">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn">
                                    <asp:Label ID="lblLicenseIdUpd" runat="server" meta:resourcekey="lblLicenseIdUpd"
                                        Text="Vendor License"></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:DropDownList ID="ddlLicenseIdUpd" runat="server" DataSourceID="OdsLicenseMaster"
                                        meta:resourcekey="ddlLicenseIdIns" DataTextField="LicenseNo" DataValueField="LicenseApplicationId"
                                        OnSelectedIndexChanged="ddlLicenseIdUpd_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" StepType="Finish" Title=" Query List">
                        <table width="100%">
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="lblInspectionDetailHeaderUpd"
                                        SkinID="SubHeading" Text=" Update Query List "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblQueryChecklistUpd" runat="server" meta:resourcekey="lblQueryChecklistUpd"
                                        Text="CheckList"></asp:Label>
                                </td>
                                <td colspan="4">
                                    <asp:DropDownList ID="ddlCheckListIdUpd" runat="server" DataSourceID="OdsInspectionCheckListMaster"
                                        DataTextField="Description" DataValueField="CheckListId" meta:resourcekey="ddlCheckListId">
                                    </asp:DropDownList>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn" style="height: 40px">
                                    <asp:Label ID="lblQueryUpd" runat="server" meta:resourcekey="lblQueryUpd" Text="Query"></asp:Label>
                                </td>
                                <td align="left" colspan="4" style="height: 40px">
                                    <asp:TextBox ID="txtQueryUpd" runat="server" meta:resourcekey="txtQueryUpd" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn" style="height: 40px">
                                    <asp:RequiredFieldValidator ID="ReqfldtxtQueryUpd" runat="server" ControlToValidate="txtQueryUpd"
                                        ErrorMessage="Query Field Can't be blank">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexptxtQueryUpd" runat="server" ControlToValidate="txtQueryUpd"
                                        ErrorMessage="Query Field Is not in Correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblQueryRemarksUpd" runat="server" meta:resourcekey="lblQueryRemarksUpd"
                                        Text="Compliance"></asp:Label>
                                </td>
                                <td align="left" colspan="4">
                                    <asp:TextBox ID="txtQueryRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                    <asp:RequiredFieldValidator ID="ReqfldtxtQueryRemarksUpd" runat="server" ControlToValidate="txtQueryRemarksUpd"
                                        ErrorMessage="Remarks Field Can't be blank">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegexptxtQueryRemarksUpd" runat="server" ControlToValidate="txtQueryRemarksUpd"
                                        ErrorMessage="Remark Field Is not in Correct Format" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="6" style="height: 26px">
                                    <asp:Button ID="btnQueryAddUpd" runat="server" meta:resourcekey="btnQueryAddUpd"
                                        Text="Add" OnClick="btnQueryAddUpd_Click" />
                                    <asp:Button ID="btnQueryUpdate" runat="server" meta:resourcekey="btnQueryUpdateUpd"
                                        Text="Update" OnClick="btnQueryUpdate_Click" />&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:GridView ID="GvInspectionQueriesUpd" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" DataKeyNames="QueryId" ForeColor="#333333" GridLines="None" Width="100%"
                                        OnSelectedIndexChanged="GvInspectionQueriesUpd_SelectedIndexChanged" OnRowDeleting="GvInspectionQueriesUpd_RowDeleting">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="CheckListId" HeaderText="CheckList Id" Visible="False" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
									Text='<%# Bind("InspectionId") %>'></asp:LinkButton>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Description" HeaderText="Description" />
                                            <asp:BoundField DataField="Query" HeaderText="Query" />
                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                            <asp:CommandField ShowDeleteButton="True" />
                                            <asp:CommandField ShowSelectButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="lblIsDiscrepancyFoundUpd" runat="server" meta:resourcekey="lblIsDiscrepancyFoundIns"
                                        SkinID="SubHeading" Text="Compliance"></asp:Label>
                                    <asp:CheckBox ID="IsdescripancyFoundUpd" runat="server" meta:resourcekey="chkIsDiscrepancyFoundUpd"
                                        Text="Discrepancy Found" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInspectionRemarksUpd" runat="server" meta:resourcekey="lblInspectionRemarksUpd"
                                        Text="Compliance"></asp:Label>
                                </td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtInspectionRemarksUpd" runat="server" meta:resourcekey="txtInspectionRemarksUpd"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="validationColumn">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </asp:View>
        <asp:View ID="ViewInspectionDetails" runat="server">
            <table width="100%">
                <tr>
                    <td align="left" colspan="6">
                        <asp:GridView ID="GvInspectionDetails" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="InspectionId" DataSourceID="odsInspectionDetails" OnSelectedIndexChanged="GvInspectionDetails_SelectedIndexChanged">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Description" HeaderText="InspectionName" />
                                <asp:BoundField DataField="InspectedOffice" HeaderText="InspectedOffice" />
                                <asp:BoundField DataField="InspectionId" HeaderText="InspectionId" Visible="False" />
                                <asp:BoundField DataField="InspectorDCName" HeaderText="InspectorDCName" Visible="False" />
                                <asp:BoundField DataField="InspectionTypeId" HeaderText="InspectionTypeId" Visible="False">
                                </asp:BoundField>
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks"></asp:BoundField>
                                <asp:BoundField DataField="InspectionOfficeSI" HeaderText="InspectionOfficeSI" Visible="False">
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" ShowEditButton="True" EditText="" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsInspectionCheckListMaster" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewInspectionDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllInspectionCheckListMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldSelectedKey" runat="server" />
    <asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" DataObjectTypeName="System.Guid"
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
    <asp:ObjectDataSource ID="OdsOffice" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices"
        OnSelecting="OdsOffice_Selecting"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsLicenseMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetLicenses" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
        UpdateMethod="CancelVendorLicenses">
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
    <asp:ObjectDataSource ID="odsInspectionDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewInspectionTypeMaster" OldValuesParameterFormatString="{0}"
        SelectMethod="InspectionDetails" TypeName="IGRSS.BusinessLogicLayer.Inspection"
        UpdateMethod="UpdateInspectionItenary">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
