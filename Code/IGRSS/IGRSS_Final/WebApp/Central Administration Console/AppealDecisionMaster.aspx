<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="AppealDecisionMaster.aspx.cs" Inherits="Central_Administration_Console_AppealDecisionMaster"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvAppealDecisionMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAppealDecisionMaster" runat="server">
            <asp:GridView ID="gvAppealDecisionMaster" runat="server" AutoGenerateColumns="False" DataSourceID="odsGv" OnSelectedIndexChanged="gvAppealDecisionMaster_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="AppealDecisionType" HeaderText="AppealDecisionType" SortExpression="AppealDecisionType" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="viewDepartmentMaster" runat="server">
            <asp:FormView ID="fvAppealDecisionMaster" runat="server" DefaultMode="Insert" DataSourceID="odsAppealDecision">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDecisionMasterIns" runat="server" meta:resourcekey="lblAppealDecisionMasterIns"
                                    SkinID="SubHeading" Text="Appeal Decision Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDecisionTypeIns" runat="server" meta:resourcekey="lblDecisionTypeIns"
                                    Text="Decision Type">
                                </asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDecisionTypeIns" runat="server" meta:resourcekey="txtDecisionTypeIns" Text='<%# Bind("AppealDecisionType") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDecisionMasterUpd" runat="server" meta:resourcekey="lblAppealDecisionMasterUpd"
                                    SkinID="SubHeading" Text="Appeal Decision Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDecisionTypeUpd" runat="server" meta:resourcekey="lblDecisionTypeUpd"
                                    Text="Decision Type">
                                </asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDecisionTypeUpd" runat="server" meta:resourcekey="txtDecisionTypeUpd" Text='<%# Bind("AppealDecisionType") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" meta:resourcekey="txtDescriptionUpd"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDecisionMasterItm" runat="server" meta:resourcekey="lblAppealDecisionMasterItm"
                                    SkinID="SubHeading" Text="Appeal Decision Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDecisionTypeItm" runat="server" meta:resourcekey="lblDecisionTypeItm"
                                    Text="Decision Type">
                                </asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDecisionTypeItm" runat="server" meta:resourcekey="txtDecisionTypeItm">
                                </asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionItm" runat="server" meta:resourcekey="txtDescriptionItm"
                                    Text='<%# Bind("Description") %>'>
                                </asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsAppealDecision" runat="server" InsertMethod="AddNewAppealDecision"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealDecisionMaster"
                TypeName="IGRSS.BusinessLogicLayer.AppealType" UpdateMethod="UpdateAppealDecisionMaster">
                <UpdateParameters>
                    <asp:Parameter Name="AppealDecisionType" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="AppealDecisionTypeId" Type="Object" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealDecisionType" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGv" runat="server" InsertMethod="AddNewAppealDecision"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealDecisionMaster"
                TypeName="IGRSS.BusinessLogicLayer.AppealType" UpdateMethod="UpdateAppealDecisionMaster">
                <UpdateParameters>
                    <asp:Parameter Name="AppealDecisionType" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="AppealDecisionTypeId" Type="Object" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealDecisionType" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
