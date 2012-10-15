<%@ Page AutoEventWireup="true" CodeFile="AssignUserPermissions.aspx.cs" Inherits="Central_Administration_Console_UserRoleManagement_AssignUserPermissions"
    Language="C#" MasterPageFile="~/IGRSS_Default.master" Title="Assign Permissions" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
    <asp:MultiView ID="mvAssignPermissions" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewUsersList" runat="server">
            <asp:GridView ID="gvUsersList" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName"
                OnSelectedIndexChanged="gvUsersList_SelectedIndexChanged" OnRowDeleting="gvUsersList_RowDeleting"
                AllowSorting="True" OnPageIndexChanging="gvUsersList_PageIndexChanging" PageSize="5" OnRowDataBound="gvUsersList_RowDataBound" OnRowCommand="gvUsersList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Username" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                Text='<%# Bind("Username") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity" />
                    <asp:BoundField DataField="IsLockedOut" HeaderText="Is LockedOut" />
                    <asp:BoundField DataField="IsApproved" HeaderText="Deleted" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="viewModules" runat="server">
            <asp:Wizard ID="wizPermission" runat="server" DisplaySideBar="False" ActiveStepIndex="1"
                OnNextButtonClick="wizPermission_NextButtonClick" OnLoad="wizPermission_Load"
                OnFinishButtonClick="wizPermission_FinishButtonClick">
                <WizardSteps>
                    <asp:WizardStep ID="stepMenuPermission" runat="server" Title="Menu Permission">
                        <table width="100%">
                            <tr>
                                <td style="width: 100px; text-align: left">
                                    <asp:TreeView ID="trvModules" runat="server" DataSourceID="xdsModules" ShowCheckBoxes="Leaf"
                                        ShowLines="True" OnTreeNodeDataBound="trvModules_TreeNodeDataBound">
                                        <DataBindings>
                                            <asp:TreeNodeBinding DataMember="Module" TextField="Name" ValueField="Code" />
                                            <asp:TreeNodeBinding DataMember="View" TextField="Name" ValueField="Mode" NavigateUrlField="Url" />
                                        </DataBindings>
                                    </asp:TreeView>
                                    <asp:XmlDataSource ID="xdsModules" runat="server" DataFile="~/XMLFile.xml"></asp:XmlDataSource>
                                </td>
                                <td style="text-align: left" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblUsername" runat="server" Text="Username : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litUsername" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblLastLogin" runat="server" Text="LastLogin : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litLastLogin" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblIsOnline" runat="server" Text="Is Online : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litIsOnline" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblLastActivity" runat="server" Text="Last Activity : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litLastActivity" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblIsLockedOut" runat="server" Text="Is LockedOut : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litIsLockedOut" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblLastLockoutDate" runat="server" Text="Last LockOut : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litLastLockoutDate" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblComment" runat="server" Text="Comments : "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litComment" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="stepOfficePermission" runat="server" Title="Office Permission">
                        <table width="100%">
                            <tr>
                                <td style="width: 100px; text-align: left">
                                    <asp:TreeView ID="trvOfficePermissions" runat="server" DataSourceID="xdsOfficePermissions"
                                        OnTreeNodeDataBound="trvOfficePermissions_TreeNodeDataBound" ShowLines="True"
                                        OnSelectedNodeChanged="trvOfficePermissions_SelectedNodeChanged" ImageSet="Msdn" OnLoad="trvOfficePermissions_Load">
                                        <DataBindings>
                                            <asp:TreeNodeBinding DataMember="Module" TextField="Name" ValueField="Code" />
                                            <asp:TreeNodeBinding DataMember="View" TextField="Name" ShowCheckBox="False" ValueField="Mode"
                                                TargetField="Url" />
                                        </DataBindings>
                                        <SelectedNodeStyle BorderColor="#FFC080" BorderStyle="Solid" Font-Bold="True" Font-Underline="False" />
                                    </asp:TreeView>
                                    <asp:XmlDataSource ID="xdsOfficePermissions" runat="server" EnableCaching="False"></asp:XmlDataSource>
                                </td>
                                <td style="text-align: left" valign="top">
                                    <table>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="pnlAssignOffices" runat="server" Height="100%" Width="100%">
                                        <asp:ObjectDataSource ID="odsOffices" runat="server" SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
                                        </asp:ObjectDataSource>
                                        <asp:CheckBoxList ID="cblOffices" runat="server" DataSourceID="odsOffices" DataTextField="OfficeName"
                                            DataValueField="OfficeId" OnDataBound="cblOffices_DataBound" RepeatColumns="2"
                                            RepeatDirection="Horizontal">
                                        </asp:CheckBoxList>
                                        <asp:LinkButton ID="lnkAssignOffices" runat="server" OnClick="lnkAssignOffices_Click">Assign Offices</asp:LinkButton>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </asp:View>
    </asp:MultiView>
</asp:Content>
