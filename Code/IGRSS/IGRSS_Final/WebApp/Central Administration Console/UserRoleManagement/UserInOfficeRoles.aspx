<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="UserInOfficeRoles.aspx.cs" Inherits="Central_Administration_Console_UserRoleManagement_UserInOfficeRoles"
    Title="Assign Offices to the User" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvUserInOfficeRoles" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearch" runat="server">
            <table width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserName" Text="User Name"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtUserName" runat="server" meta:resourcekey="txtUserName"></asp:TextBox>
                    </td>
                    <td class="validationColumn" colspan="3">
                        <asp:RequiredFieldValidator ID="ReqfldtxtUserName" runat="server" ControlToValidate="txtUserName"
                            ErrorMessage="User Name Can't be Blank" meta:resourcekey="ReqfldtxtUserNameResource1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" meta:resourcekey="btnSearchResource1" /></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gvUsersList" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyNames="UserName" OnSelectedIndexChanged="gvUsersList_SelectedIndexChanged" OnDataBound="gvUsersList_DataBound" meta:resourcekey="gvUsersListResource1">
                            <Columns>
                                <asp:TemplateField HeaderText="Username" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update"
                                            Text="Update" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text='<%# Bind("UserName") %>' meta:resourcekey="LinkButton1Resource2"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="IsOnline" HeaderText="Is Online" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="IsLockedOut" HeaderText="Is LockedOut" meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment" Visible="False" meta:resourcekey="BoundFieldResource5" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewUserInOfficeRoles" runat="server">
            <asp:Label ID="lblUsernameDisplay" runat="server" meta:resourcekey="lblUsernameDisplay"
                Width="100%"></asp:Label>
            <asp:FormView ID="FvUserInOfficeRoles" runat="server" DataKeyNames="UserName" DataSourceID="odsUserInOfficeRolesByUserName"
                DefaultMode="Insert" OnItemInserting="FvUserInOfficeRoles_ItemInserting" OnItemInserted="FvUserInOfficeRoles_ItemInserted" meta:resourcekey="FvUserInOfficeRolesResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblUserInOfficeManagementIns" runat="server" meta:resourcekey="lblUserInOfficeManagement"
                                    SkinID="SubHeading" Text="Manage Roles"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblDesignationIdInsIns" runat="server" meta:resourcekey="lblDesignationIdIns"
                                    Text="Designation"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDesignationIdInsIns" runat="server" DataSourceID="odsDesignationMaster"
                                    DataTextField="Name" DataValueField="DesignationID" meta:resourcekey="ddlOfficeIdIns"
                                    SelectedValue='<%# Bind("DesignationID") %>' Text='<%# Bind("DesignationID") %>'>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdInsIns" runat="server" meta:resourcekey="lblOfficeIdIns"
                                    Text="Office"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dddOfficeIdInsIns" runat="server" DataSourceID="odsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="dddOfficeIdIns"
                                    SelectedValue='<%# Bind("OfficeId") %>' Text='<%# Bind("OfficeId") %>'>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCommentsInsIns" runat="server" meta:resourcekey="lblCommentsIns"
                                    Text="Comments"></asp:Label>
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtCommentsInsIns" runat="server" meta:resourcekey="txtCommentsIns"
                                    Text='<%# Bind("Comments") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsActiveInsIns" runat="server" meta:resourcekey="lblIsActiveIns"
                                    Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkIsActiveInsIns" runat="server" Checked='<%# Bind("IsActive") %>'
                                    meta:resourcekey="chkIsActiveIns" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2" style="text-align: right">
                                <asp:Button ID="btnSaveIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnSaveInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" Text="Cancel" meta:resourcekey="btnCancelInsResource1" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblUserInOfficeManagementUpd" runat="server" meta:resourcekey="lblUserInOfficeManagement"
                                    SkinID="SubHeading" Text="Manage Roles"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblDesignationIdInsUpd" runat="server" meta:resourcekey="lblDesignationIdIns"
                                    Text="Designation"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDesignationIdInsUpd" runat="server" DataSourceID="odsDesignationMaster"
                                    DataTextField="Name" DataValueField="DesignationID" meta:resourcekey="ddlOfficeIdIns"
                                    SelectedValue='<%# Bind("DesignationID") %>' Text='<%# Bind("DesignationID") %>'>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdInsUpd" runat="server" meta:resourcekey="lblOfficeIdIns"
                                    Text="Office"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dddOfficeIdInsUpd" runat="server" DataSourceID="odsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="dddOfficeIdIns"
                                    SelectedValue='<%# Bind("OfficeId") %>' Text='<%# Bind("OfficeId") %>'>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCommentsInsUpd" runat="server" meta:resourcekey="lblCommentsIns"
                                    Text="Comments"></asp:Label>
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtCommentsInsUpd" runat="server" meta:resourcekey="txtCommentsIns"
                                    Text='<%# Bind("Comments") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsActiveInsUpd" runat="server" meta:resourcekey="lblIsActiveIns"
                                    Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkIsActiveInsUpd" runat="server" Checked='<%# Bind("IsActive") %>'
                                    meta:resourcekey="chkIsActiveIns" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2" style="text-align: right">
                                <asp:Button ID="btnSaveUpd" runat="server" CommandName="Update" Text="Save" meta:resourcekey="btnSaveUpdResource1" />
                                <asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" Text="Cancel" meta:resourcekey="btnCancelUpdResource1" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
            <asp:GridView ID="GvuserDetailsSearch" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Username,DesignationID" DataSourceID="odsUserInOfficeRolesByUserName" OnSelectedIndexChanged="GvuserDetailsSearch_SelectedIndexChanged" OnRowDeleting="GvuserDetailsSearch_RowDeleting" OnDataBound="GvuserDetailsSearch_DataBound" meta:resourcekey="GvuserDetailsSearchResource1">
                <Columns>
                    <asp:TemplateField HeaderText="Username" SortExpression="Username" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Username") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Bind("Username") %>' meta:resourcekey="LinkButton3Resource1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" meta:resourcekey="BoundFieldResource6">
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" SortExpression="OfficeName" meta:resourcekey="BoundFieldResource7">
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" ReadOnly="True" SortExpression="Comments" meta:resourcekey="BoundFieldResource8" />
                    <asp:BoundField DataField="IsActive" HeaderText="IsActive" ReadOnly="True" SortExpression="IsActive" meta:resourcekey="BoundFieldResource9" />
                    <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" />
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsUserInOfficeRolesByUserName" runat="server" InsertMethod="AddNewUserInOfficeRoles"
        SelectMethod="GetUserInRolesByUserName" TypeName="IGRSS.BusinessLogicLayer.ManageUserRoles" OnInserting="odsUserInOfficeRolesByUserName_Inserting" DeleteMethod="DeleteUserInRolesbyUserName" UpdateMethod="AddNewUserInOfficeRoles" OnDeleting="odsUserInOfficeRolesByUserName_Deleting">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvUsersList" Name="userName" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="userName" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsOfficeMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDesignationMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDesignationMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Employee">
    </asp:ObjectDataSource>
</asp:Content>
