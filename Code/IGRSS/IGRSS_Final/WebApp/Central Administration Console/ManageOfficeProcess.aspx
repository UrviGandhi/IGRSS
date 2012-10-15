<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" 
    AutoEventWireup="true" CodeFile="ManageOfficeProcess.aspx.cs" Inherits="Central_Administration_Console_ManageOfficeProcess"
    Title="Manage Office Process" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="6" style="height: 18px">
                <asp:Label ID="lblOfficeProcessDetails" runat="server" meta:resourcekey="lblOfficeProcessDetails"
                    SkinID="SubHeading" Text="Office Process"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn" style="width: 77px; height: 28px;">
                <asp:Label ID="lblOfficeName" runat="server" meta:resourcekey="lblOfficeNameIns"
                    Text="Office Name"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="odsOfficeMaster"
                    DataTextField="OfficeName" DataValueField="OfficeId" AutoPostBack="True" OnSelectedIndexChanged="ddlOfficeName_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="validationColumn">
            </td>
            <td class="labelColumn">
                <asp:Label ID="lblProcessName" runat="server" meta:resourcekey="lblProcessName" Text="Process Name"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:DropDownList ID="ddlProcess" runat="server" OnSelectedIndexChanged="ddlProcess_SelectedIndexChanged"
                    AutoPostBack="True">
                    <asp:ListItem Value="APL">Appeal</asp:ListItem>
                    <asp:ListItem Value="LIC">License</asp:ListItem>
                    <asp:ListItem Value="REF">Refund</asp:ListItem>
                    <asp:ListItem Value="COM">Compalin</asp:ListItem>
                    <asp:ListItem Value="ADJ">Adjudication</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="validationColumn" style="width: 2%">
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Label ID="lblVerificationItems" runat="server" meta:resourcekey="lblVerificationItems"
                    SkinID="SubHeading" Text="Verification Office Roles"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn" style="height: 24px">
                <asp:Label ID="lblVerificationOffice" runat="server" meta:resourcekey="lblVerificationOffice"
                    Text="Communicating Office"></asp:Label>
            </td>
            <td class="textColumn" style="height: 24px">
                <asp:DropDownList ID="ddlVerificationOffice" runat="server" DataSourceID="odsCommunicatingOffice"
                    DataTextField="CommunicationKey" DataValueField="CommunicationKey">
                </asp:DropDownList>
            </td>
            <td class="validationColumn" style="height: 24px">
            </td>
            <td class="labelColumn" style="height: 24px">
                <asp:Label ID="lblVerificationRole" runat="server" meta:resourcekey="lblVerificationRole"
                    Text="Verification Role"></asp:Label>
            </td>
            <td class="textColumn" style="height: 24px">
                <asp:DropDownList ID="ddlVerificationRole" runat="server" DataSourceID="odsDesignations"
                    DataTextField="Name" DataValueField="DesignationID">
                </asp:DropDownList>
            </td>
            <td class="validationColumn" style="width: 2%; height: 24px;">
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: right">
                <asp:Button ID="btnAddVerification" runat="server" OnClick="btnAddVerification_Click"
                    Text="Add Verification" Width="125px" /></td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:XmlDataSource ID="xdsVerificationList" runat="server" EnableCaching="False"
                    OnDataBinding="xdsVerificationList_DataBinding">
                    <Data>
<VerificationList/></Data>
                </asp:XmlDataSource>
                <asp:GridView ID="gvVerificationList" runat="server" DataSourceID="xdsVerificationList"
                    OnDataBinding="gvVerificationList_DataBinding" OnPageIndexChanging="gvVerificationList_PageIndexChanging"
                    OnRowDeleting="gvVerificationList_RowDeleting"
                    OnDataBound="gvVerificationList_DataBound" AutoGenerateColumns="False" OnSelectedIndexChanged="gvVerificationList_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Role") %>' Visible="False"></asp:Label>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ForwardingOffice" HeaderText="Forwarding Office" />
                        <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                    </Columns>
                    <EmptyDataTemplate>
                        Data Not Available
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Label ID="lblApprovalItems" runat="server" meta:resourcekey="lblApprovalItems"
                    SkinID="SubHeading" Text="Approval Office Roles"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn">
                <asp:Label ID="lblApprovalOffice" runat="server" meta:resourcekey="lblApprovalOffice"
                    Text="Approval Office"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:DropDownList ID="ddlApprovalOffice" runat="server" DataSourceID="odsCommunicatingOffice"
                    DataTextField="CommunicationKey" DataValueField="CommunicationKey">
                </asp:DropDownList>
            </td>
            <td class="validationColumn">
            </td>
            <td class="labelColumn">
                <asp:Label ID="lblApprovalRole" runat="server" meta:resourcekey="lblApprovalRole"
                    Text="Approval Role"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:DropDownList ID="ddlApprovalRole" runat="server" DataSourceID="odsDesignations"
                    DataTextField="Name" DataValueField="DesignationID">
                </asp:DropDownList>
            </td>
            <td class="validationColumn" style="width: 2%">
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: right">
                <asp:Button ID="btnAddApproval" runat="server" Text="Add Approval" Width="125px"
                    OnClick="btnAddApproval_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="gvApprovalList" runat="server" DataSourceID="xdsApprovalList" OnRowDeleting="gvApprovalList_RowDeleting"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Role") %>' Visible="False"></asp:Label>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ForwardingOffice" HeaderText="Forwarding Office" />
                        <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                    </Columns>
                    <EmptyDataTemplate>
                        Data Not Available!
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:XmlDataSource ID="xdsApprovalList" runat="server" EnableCaching="False">
                    <Data>
<ApprovalList/></Data>
                </asp:XmlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: right; height: 26px;">
                <asp:Button ID="btnSaveProcess" runat="server" Text="Save Process" OnClick="btnSaveProcess_Click"
                    Width="125px" />
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCommunicatingOffice" runat="server"
        SelectMethod="GetCommunicatingOfficesByOfficeId" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlOfficeName" Name="OfficeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDesignations" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDesignationMasterDetails"
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
</asp:Content>
