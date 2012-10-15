<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="InspectionCheckListMaster.aspx.cs" Inherits="Central_Administration_Console_InspectionCheckListMaster"
    Title="Inspection Checklist Details
" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvInspectionCheckListMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewInspectionCheckListMaster" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 931px">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" DataSourceID="odsInspectionMaster"
                            DataKeyNames="CheckListId,InspectionTypeId" OnRowDataBound="GridView1_RowDataBound" OnDataBound="GridView1_DataBound" OnDataBinding="GridView1_DataBinding" meta:resourcekey="GridView1Resource1">
                            <Columns>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" meta:resourcekey="BoundFieldResource2" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 931px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New" meta:resourcekey="Button1Resource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewCheckListMaster" runat="server">
            <asp:FormView ID="FvInspectionCheckListMaster" runat="server" DataSourceID="OdsInspectionCheckListMaster"
                DefaultMode="Insert" OnItemInserting="FvInspectionCheckListMaster_ItemInserting"
                OnItemUpdating="FvInspectionCheckListMaster_ItemUpdating" meta:resourcekey="FvInspectionCheckListMasterResource1" OnLoad="FvInspectionCheckListMaster_Load">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInspectionCheckListMasterIns" runat="server" meta:resourcekey="lblInspectionCheckListMasterIns"
                                    SkinID="SubHeading" Text="Inspection CheckList Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblInspectionTypeIns" runat="server" meta:resourcekey="lblInspectionTypeIns"
                                    Text="Inspection Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlInspectionTypeIns" runat="server" DataSourceID="OdsInspectionTypeMaster"
                                    DataTextField="Name" DataValueField="InspectionTypeId" SelectedValue='<%# Bind("InspectionTypeId") %>'
                                    Width="165px" meta:resourcekey="ddlInspectionTypeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" colspan="4" style="width: 9%">
                            </td>
                        </tr>
                        <tr>
                        <td class="labelColumn">
                            <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                Text="Inspection Description "></asp:Label>
                        </td>
                        <td class="textColumn" colspan="4" style="width: 9%">
                            <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" MaxLength="50" runat="server"
                                meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </td>
                        <td class="validationColumn" style="width: 3%">
                            <asp:RequiredFieldValidator ID="reqFldInspectionDetails" runat="server" ControlToValidate="txtDescriptionIns"
                                ErrorMessage="Please Enter Description">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsActiveIns" runat="server" meta:resourcekey="lblIsActiveIns" Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="c" runat="server" Checked='<%# Bind("IsActive") %>'
                                    meta:resourcekey="chkboxActiveIns" />
                            </td>   
                            <td class="validationColumn" colspan="4" style="width: 9%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInspectionCheckListMasterIns" CommandName="Insert" runat="server"
                                    Text="Save" meta:resourcekey="btnInspectionCheckListMasterInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancelIns_Click" meta:resourcekey="btnCancelInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblUpdpectionCheckListMasterUpd" runat="server" meta:resourcekey="lblUpdpectionCheckListMasterUpd"
                                    SkinID="SubHeading" Text="Inspection CheckList Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUpdpectionTypeUpd" runat="server" meta:resourcekey="lblUpdpectionTypeUpd"
                                    Text="Inspection Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlInspectionTypeUpd" runat="server" DataSourceID="OdsInspectionTypeMaster"
                                    DataTextField="Name" DataValueField="InspectionTypeId" SelectedValue='<%# Bind("InspectionTypeId") %>'
                                    Width="165px" AutoPostBack="True" meta:resourcekey="ddlInspectionTypeUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" colspan="4" style="width: 11%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Inspection Description "></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4" style="width: 11%">
                                <asp:TextBox ID="txtDescriptionUpd" TextMode="MultiLine" MaxLength="50" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Please Enter Description">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsActiveUpd" runat="server" meta:resourcekey="lblIsActiveUpd" Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkboxActiveUpd" runat="server" meta:resourcekey="chkboxActiveUpd" />
                            </td>
                            <td class="validationColumn" colspan="4" style="width: 11%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUpdpectionCheckListMasterUpd" CommandName="Update" runat="server"
                                    Text="Update" meta:resourcekey="btnUpdpectionCheckListMasterUpdResource1" />
                                <asp:Button ID="btnCancelUpd" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancelUpd_Click" meta:resourcekey="btnCancelUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblItmpectionCheckListMasterItm" runat="server" meta:resourcekey="lblItmpectionCheckListMasterItm"
                                    SkinID="SubHeading" Text="Itmpection CheckList Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblItmpectionTypeItm" runat="server" meta:resourcekey="lblItmpectionTypeItm"
                                    Text="Itmpection Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlItmpectionTypeItm" runat="server" DataSourceID="OdsItmpectionTypeMaster"
                                    DataTextField="Name" DataValueField="ItmpectionTypeId" SelectedValue='<%# Bind("ItmpectionTypeId") %>'
                                    Width="165px" meta:resourcekey="ddlItmpectionTypeItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Itmpection Description "></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionItm" runat="server" meta:resourcekey="txtDescriptionItm"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsActiveItm" runat="server" meta:resourcekey="lblIsActiveItm" Text="Is Active"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkboxActiveItm" runat="server" Checked='<%# Bind("IsActive") %>'
                                    meta:resourcekey="chkboxActiveItm" />
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
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" SelectMethod="GetAllInspectionTypeMaster"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" InsertMethod="AddNewInspectionAction"
        OldValuesParameterFormatString="original_{0}" UpdateMethod="UpdateInspectionItenary">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="InspectionMemoId" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsInspectionCheckListMaster" runat="server" OnInserting="OdsInspectionCheckListMaster_Inserting"
        SelectMethod="GetAllInspectionCheckListMasterByCheckListId" TypeName="IGRSS.BusinessLogicLayer.Inspection"
        UpdateMethod="UpdateInspectionCheckListMaster" OnUpdating="OdsInspectionCheckListMaster_Updating"
        InsertMethod="AddNewInspectionCheckListMaster" OnInserted="OdsInspectionCheckListMaster_Inserted"
        OnUpdated="OdsInspectionCheckListMaster_Updated">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="CheckListId" PropertyName="SelectedValue"
                Type="Object" />
            <asp:ControlParameter ControlID="GridView1" Name="InspectionTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="CheckListId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsInspectionMaster" runat="server" DeleteMethod="DeleteInspectionCheckListMaster"
        SelectMethod="GetAllInspectionCheckListMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection">
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
