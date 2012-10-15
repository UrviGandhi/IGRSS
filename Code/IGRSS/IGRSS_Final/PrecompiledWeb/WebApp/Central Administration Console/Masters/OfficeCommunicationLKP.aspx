<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_OfficeCommunicationLKP, App_Web_qawyqul4" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvOfficeCommunication" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewOfficeDetails" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 750px">
                        <asp:GridView ID="GvOfficeCommunication" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="OfficeId,CommunicationKey" DataSourceID="odsOfficeDetails" OnSelectedIndexChanged="GvOfficeCommunication_SelectedIndexChanged" meta:resourcekey="GvOfficeCommunicationResource1" OnDataBound="GvOfficeCommunication_DataBound">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Office Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="CKey" HeaderText="Communicating Office" SortExpression="CKey" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource3" />
                                 <asp:BoundField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" meta:resourcekey="BoundFieldResource2" />
                            
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
                                <asp:TemplateField>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right" style="height: 20px">
                        <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewFvOfficeCommunication" runat="server">
            <asp:FormView ID="FvOfficeCommunication" runat="server" DefaultMode="Edit" DataKeyNames="OfficeId,CommunicationKey"
                DataSourceID="odsOfficeCommunicationById" OnItemInserting="FvOfficeCommunication_ItemInserting"
                OnItemUpdating="FvOfficeCommunication_ItemUpdating" meta:resourcekey="FvOfficeCommunicationResource1" OnLoad="FvOfficeCommunication_Load" AllowPaging="True">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblOfficeCommunicationLookUpIns" runat="server" meta:resourcekey="lblOfficeCommunicationLookUpIns"
                                    SkinID="SubHeading" Text="Office Communication Look Up"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameIns" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="157px" meta:resourcekey="ddlOfficeNameInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCommunicationKeyIns" runat="server" meta:resourcekey="lblCommunicationKeyIns"
                                    Text="Communication Key"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCommunicationKeyIns" runat="server" MaxLength="15" meta:resourcekey="txtCommunicationKeyIns"
                                    Text='<%# Bind("CommunicationKey") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtCommunicationKeyIns" runat="server" ControlToValidate="txtCommunicationKeyIns"
                                    ErrorMessage="Communication Key Can't be Blank" meta:resourcekey="ReqfldtxtCommunicationKeyInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="CommunicatingOffice" runat="server" meta:resourcekey="lblReceiptNumberIns"
                                    Text="CommunicatingOffice"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCommunicatingOfficeIns" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("CommunicatingOffice") %>'
                                    Width="157px" meta:resourcekey="ddlCommunicatingOfficeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>' MaxLength="125"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Description Can't be Blank" meta:resourcekey="ReqfldtxtDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="IsActive" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' meta:resourcekey="CheckBox1Resource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
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
                                <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Insert" meta:resourcekey="btnSave" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" meta:resourcekey="btnCancel" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblOfficeCommunicationLookUpUpd" runat="server" meta:resourcekey="lblOfficeCommunicationLookUpUpd"
                                    SkinID="SubHeading" Text="Office Communication Look Up"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameUpd" runat="server" meta:resourcekey="lblOfficeNameUpd"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameUpd" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="157px" meta:resourcekey="ddlOfficeNameUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCommunicationKeyUpd" runat="server" meta:resourcekey="lblCommunicationKeyUpd"
                                    Text="Communication Key"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCommunicationKeyUpd" MaxLength="15" runat="server" meta:resourcekey="txtCommunicationKeyIns"
                                    Text='<%# Bind("CommunicationKey") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="CommunicatingOffice" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="CommunicatingOffice"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCommunicatingOfficeUpd" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("CommunicatingOffice") %>'
                                    Width="157px" meta:resourcekey="ddlCommunicatingOfficeUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionUpd" TextMode="MultiLine" MaxLength="125" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Description Can't be Blank" meta:resourcekey="ReqfldtxtDescriptionUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Not a Valid Description" ValidationExpression="<%$ Resources:ValidationRegx, Name %>" meta:resourcekey="RegexptxtDescriptionUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="IsActive" runat="server" meta:resourcekey="lblReceiptNumberUpd" Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="ChkIsActiveUpd" runat="server" Checked='<%# Bind("IsActive") %>' meta:resourcekey="ChkIsActiveUpdResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
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
                                <asp:Button ID="btnSave" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnSaveResource2" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" meta:resourcekey="btnCancelResource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>&nbsp;
    <asp:ObjectDataSource ID="odsOfficeDetails" runat="server" SelectMethod="GetOfficeCommunicationDetails"
        TypeName="IGRSS.BusinessLogicLayer.Administration.OfficeCommunicationLKP" DeleteMethod="DeleteOfficeCommunicationLKP" InsertMethod="AddNewOfficeCommunication" UpdateMethod="UpdateOfficeCommunication">
        <DeleteParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="CommunicationKey" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="CommunicationKey" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsOfficeCommunicationById" runat="server" SelectMethod="GetOfficeCommunicationDetailsByOfficeId"
        TypeName="IGRSS.BusinessLogicLayer.Administration.OfficeCommunicationLKP" UpdateMethod="UpdateOfficeCommunication"
        OnInserting="odsOfficeCommunicationById_Inserting" OnUpdating="odsOfficeCommunicationById_Updating" OnInserted="odsOfficeCommunicationById_Inserted"
        OnUpdated="odsOfficeCommunicationById_Updated" DeleteMethod="DeleteOfficeCommunicationLKP" OnLoad="odsOfficeCommunicationById_Load" InsertMethod="AddNewOfficeCommunication" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fldOfficeId" Name="OfficeId" PropertyName="Value"
                Type="Object" />
            <asp:ControlParameter ControlID="fldCommunicationKey" Name="CommunicationKey" PropertyName="Value"
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="CommunicationKey" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="CommunicationKey" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldOfficeId" runat="server" />
    <asp:HiddenField ID="fldCommunicationKey" runat="server" />
    <asp:ObjectDataSource ID="odsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>
