<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_ActMaster, App_Web_qawyqul4" title="Act Details Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvActMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewActMaster" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="OdsActMaster"
                            AutoGenerateColumns="False" DataKeyNames="ActId" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" meta:resourcekey="GridView1Resource1">
                            <Columns>
                                <asp:BoundField DataField="NameOfAct" HeaderText="Act Name" SortExpression="NameOfAct" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="DescriptionOfAct" HeaderText="Description" SortExpression="DescriptionOfAct" meta:resourcekey="BoundFieldResource2" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New" Width="95px" meta:resourcekey="Button1Resource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewActDetails" runat="server">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="odsSelectedActDetails"
                DataKeyNames="ActId" DefaultMode="Edit" OnPageIndexChanging="FormView1_PageIndexChanging"
                OnItemInserted="FormView1_ItemInserted" meta:resourcekey="FormView1Resource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td class="labelColumn" colspan="6">
                                <asp:Label ID="lblActMasterHeaderIns" runat="server" SkinID="Heading" Text="Act Master Details" meta:resourcekey="lblActMasterHeaderInsResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblName" runat="server" Text="Name" meta:resourcekey="lblNameResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" MaxLength="25" runat="server" Text='<%# Bind("NameOfAct") %>' meta:resourcekey="txtNameInsResource1"></asp:TextBox></td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescription" runat="server" Text="Description" meta:resourcekey="lblDescriptionResource1"></asp:Label></td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" MaxLength="50" runat="server"
                                    Text='<%# Bind("DescriptionOfAct") %>' meta:resourcekey="txtDescriptionInsResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RequiredFieldValidator2Resource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnActMasterSave" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnActMasterSaveResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblActMasterHeader" runat="server" SkinID="Heading" Text="Act Master" meta:resourcekey="lblActMasterHeaderResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblName" runat="server" Text="Name" meta:resourcekey="lblNameResource2"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtName" MaxLength="25" runat="server" Text='<%# Bind("NameOfAct") %>' meta:resourcekey="txtNameResource1"></asp:TextBox></td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RequiredFieldValidator2Resource2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescription" runat="server" Text="Description" meta:resourcekey="lblDescriptionResource2"></asp:Label></td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescription" MaxLength="50" TextMode="MultiLine" runat="server"
                                    Text='<%# Bind("DescriptionOfAct") %>' meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RequiredFieldValidator3Resource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnActMasterSave" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnActMasterSaveResource2" />
                                <asp:Button ID="Button3" CommandName="Cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="Button3_Click" meta:resourcekey="Button3Resource1" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsSelectedActDetails" runat="server" InsertMethod="InsertNewActMaster"
        SelectMethod="GetActDetailsById" TypeName="IGRSS.BusinessLogicLayer.RefundActMaster"
        UpdateMethod="UpdateActMaster" OnInserted="odsSelectedActDetails_Inserted" OnUpdated="odsSelectedActDetails_Updated">
        <UpdateParameters>
            <asp:Parameter Name="ActId" Type="Object" />
            <asp:Parameter Name="DescriptionOfAct" Type="String" />
            <asp:Parameter Name="NameOfAct" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ActId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="DescriptionOfAct" Type="String" />
            <asp:Parameter Name="NameOfAct" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsActMaster" runat="server" SelectMethod="GetActMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.RefundActMaster" DeleteMethod="DeleteActMaster">
    </asp:ObjectDataSource>
</asp:Content>
