<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="PostalDeliveryTypeLKP.aspx.cs" Inherits="Central_Administration_Console_Masters_PostalDeliveryTypeLKP"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvPostalDeliveryTypeLkp" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GVPostalDeliveryTypeLkp" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="PostalDeliveryType_Id" OnSelectedIndexChanged="GVPostalDeliveryTypeLkp_SelectedIndexChanged"
                            DataSourceID="odsPostalDeliveryDetails" meta:resourcekey="GVPostalDeliveryTypeLkpResource1">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
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
        <asp:View ID="viewDepartmentMaster" runat="server">
            <asp:FormView ID="fvDepartmentMaster" runat="server" DefaultMode="Insert" DataSourceID="odsPostalDelivery"
                OnItemInserting="fvDepartmentMaster_ItemInserting" OnItemUpdating="fvDepartmentMaster_ItemUpdating" meta:resourcekey="fvDepartmentMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterIns" runat="server" meta:resourcekey="lblQualificationMasterIns"
                                    SkinID="SubHeading" Text="Postal Delivery Type Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" MaxLength="25" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" runat="server" TextMode="MultiLine" MaxLength="150"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                         
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterUpd" runat="server" meta:resourcekey="lblQualificationMasterUpd"
                                    SkinID="SubHeading" Text="Department Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" MaxLength="25" meta:resourcekey="txtNameUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" TextMode="MultiLine" MaxLength="150"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource2" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsPostalDelivery" runat="server" InsertMethod="AddNewPostalDeliveryType"
        OnInserting="odsPostalDelivery_Inserting" OnUpdated="odsPostalDelivery_Updated"
        SelectMethod="GetPostalDeliveryLkpById" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
        UpdateMethod="UpdatePostalDeliveryType" OnUpdating="odsPostalDelivery_Updating"
        OnInserted="odsPostalDelivery_Inserted">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GVPostalDeliveryTypeLkp" Name="PostalDeliveryType_Id"
                PropertyName="SelectedValue" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GVPostalDeliveryTypeLkp" Name="PostalDeliveryType_Id"
                PropertyName="SelectedValue" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPostalDeliveryDetails" runat="server" DeleteMethod="DeletePostalDeliveryType"
        SelectMethod="GetPostalDeliveryLkp" TypeName="IGRSS.BusinessLogicLayer.InwardOutward">
    </asp:ObjectDataSource>
</asp:Content>
