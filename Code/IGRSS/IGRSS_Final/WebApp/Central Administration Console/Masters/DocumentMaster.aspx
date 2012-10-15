<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="DocumentMaster.aspx.cs" Inherits="Central_Administration_Console_DocumentMaster"
    Title="Document Master" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvDocumentMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="View2" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GvDocumentMasters" runat="server" AutoGenerateColumns="False" DataKeyNames="DocumentTypeId"
                            DataSourceID="odsDocumentMaster" OnSelectedIndexChanged="GvDocumentMasters_SelectedIndexChanged" meta:resourcekey="GvDocumentMastersResource1">
                            <Columns>
                                <asp:BoundField DataField="DocumentTypeId" HeaderText="DocumentTypeId" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource3" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvDocumentMaster" runat="server" DefaultMode="Insert" DataSourceID="odsDocumentMasterById"
                OnItemUpdating="FvDocumentMaster_ItemUpdating" OnItemInserting="FvDocumentMaster_ItemInserting"
                DataKeyNames="DocumentTypeId" meta:resourcekey="FvDocumentMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDocumentMasterHeadingsIns" runat="server" meta:resourcekey="lblDocumentMasterHeadingsIns"
                                    SkinID="SubHeading" Text="Document Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" MaxLength="25" runat="server" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" MaxLength="125" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionInsResource1">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td class="textColumn" align="right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Insert" meta:resourcekey="btnSaveResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False"
                                    OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDocumentMasterHeadingsUpd" runat="server" meta:resourcekey="lblDocumentMasterHeadingsUpd"
                                    SkinID="SubHeading" Text="Document Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" MaxLength="25" runat="server" meta:resourcekey="txtNameUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="ReqFldName" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Name Can't be Blank" Text='<%# Eval("Name") %>' meta:resourcekey="ReqFldNameResource1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexpFldName" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>" meta:resourcekey="RegexpFldNameResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" MaxLength="125" TextMode="MultiLine" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td class="textColumn" align="right">
                                <asp:Button ID="btnSave" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnSaveResource2" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource2" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView><br />
    <asp:ObjectDataSource ID="odsDocumentMaster" runat="server" SelectMethod="GetDocumentMaster"
        TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest" DeleteMethod="DeleteDocumentMaster">
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:ObjectDataSource ID="odsDocumentMasterById" runat="server" InsertMethod="AddNewDocumentMaster"
        SelectMethod="GetDocumentDetailsById" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateDocumentMaster" OnUpdating="odsDocumentMasterById_Updating"
        OnInserting="odsDocumentMasterById_Inserting" OnInserted="odsDocumentMasterById_Inserted"
        OnUpdated="odsDocumentMasterById_Updated">
        <SelectParameters>
            <asp:ControlParameter ControlID="GvDocumentMasters" Name="DocumentTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GvDocumentMasters" Name="DocumentTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
