<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="true" CodeFile="FileForward.ascx.cs"
    Inherits="FileManagement_FileForward" %>
<table width="100%">
    <tr>
        <td colspan="6">
            <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                SkinID="SubHeading" Text="File" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 20%">
            <asp:Label ID="lblHeading" runat="server" Text="File Options" Width="100%"></asp:Label></td>
        <td style="width: 20%">
            <asp:DropDownList ID="ddlAction" runat="server" Width="100%" OnSelectedIndexChanged="ddlAction_SelectedIndexChanged"
                AutoPostBack="True">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Forwad File</asp:ListItem>
                <asp:ListItem>Add Remark</asp:ListItem>
                <asp:ListItem>View Remarks</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDataentry" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlDataentry_SelectedIndexChanged">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Add Remark</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlReadonly" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlReadonly_SelectedIndexChanged" >
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>View Remarks</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="width: 60%">
        </td>
    </tr>
    <tr>
        <td colspan="3" style="height: 15px">
            <asp:MultiView ID="mvFileManagement" runat="server">
                <asp:View ID="ViewRemark" runat="server">
                    <asp:FormView ID="fvFileManagement" runat="server" AllowPaging="True" DataSourceID="OdsFileManagementUserCotrol"
                        DefaultMode="Insert" OnItemInserting="fvFileManagement_ItemInserting">
                        <InsertItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td  align="left" style="width: 20%">
                                        <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
                                    </td>
                                    <td  style="width: 80%">
                                        <asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;" align="left">
                                        <asp:Label ID="lblBody" runat="server" Text="Body"></asp:Label>
                                    </td>
                                    <td style="height: 100px">
                                        <asp:TextBox ID="txtBody" runat="server" Height="100px" Text='<%# Bind("Body") %>'
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right">
                                        <asp:Button ID="btnFileForward" runat="server" OnClick="btnFileForward_Click" Text="Forward"
                                            CausesValidation="False" />
                                        <asp:Button ID="btnRemark" runat="server" Text="Return" CausesValidation="False" OnClick="btnRemark_Click" Visible="False" /></td>
                                    <td align="left">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblRemarkSubject" runat="server" Text="Subject:"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtRemarkSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width:10%">
                                        <asp:Label ID="lblRemarkBody" runat="server" Text="Body:"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtRemarkBody" runat="server" Height="100px" Text='<%# Bind("Body") %>'
                                            TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td style="width:10%">
                                        <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
                                    </td>
                                    <td style="width:100%">
                                        <asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>' ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 53px">
                                        <asp:Label ID="lblBody" runat="server" Text="Body"></asp:Label>
                                    </td>
                                    <td style="height: 100px">
                                        <asp:TextBox ID="txtBody" runat="server" Height="100px" Text='<%# Bind("Body") %>'
                                            TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right">
                                        &nbsp;<asp:Button ID="btnRemarkupd" runat="server" CommandName="Insert" Text="Add"
                                            Visible="False" CausesValidation="False" /></td>
                                    <td align="left">
                                        <asp:Button ID="btnFileForward" runat="server" OnClick="btnFileForward_Click" Text="Forward"
                                            CausesValidation="False" Visible="False" />&nbsp;</td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <br />
                            <asp:Label ID="lblEmpty" runat="server" ForeColor="Red" Text="No Record Found."></asp:Label>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="OdsFileManagementUserCotrol" runat="server" InsertMethod="InsertFileRemarks"
                        SelectMethod="GetFileRemarksByFileId" TypeName="IGRSS.BusinessLogicLayer.FileManagement"
                        OnInserting="OdsFileManagementUserCotrol_Inserting">
                        <InsertParameters>
                            <asp:Parameter Name="FileId" Type="Object" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="Body" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="fldFileId" Name="FileId" PropertyName="Value" Type="Object" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </asp:View>
                <asp:View ID="ViewFileForward" runat="server">
                    <table width="100%">
                        <tr>
                            <td  style="width: 20%;" align="left">
                                <asp:Label ID="lblOfficeName" runat="server" Text="Office Name:"></asp:Label>
                            </td>
                            <td style="width: 20%;">
                                <asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="odsDepartment"
                                    DataTextField="OfficeName" DataValueField="OfficeId">
                                </asp:DropDownList><br />
                                <asp:ObjectDataSource ID="odsDepartment" runat="server" SelectMethod="GetOffices"
                                    TypeName="IGRSS.BusinessLogicLayer.FileManagement" OldValuesParameterFormatString="original_{0}"
                                    InsertMethod="InsertNewFile">
                                    <InsertParameters>
                                        <asp:Parameter Name="OfficeId" Type="Object" />
                                        <asp:Parameter Name="FileDepartment" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td style="width: 10%" >
                            </td>
                            <td  style="width: 20%">
                                <asp:Label ID="lblDesigination" runat="server" Text="Desigination:"></asp:Label>
                            </td>
                            <td  style="width: 20%">
                                <asp:DropDownList ID="ddlDesigination" runat="server" DataSourceID="odsDesignation"
                                    DataTextField="Name" DataValueField="DesignationID">
                                </asp:DropDownList><asp:ObjectDataSource ID="odsDesignation" runat="server" SelectMethod="GetDesignationDetails"
                                    TypeName="IGRSS.BusinessLogicLayer.FileManagement"></asp:ObjectDataSource>
                            </td>
                            <td style="width: 10%" >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" align="right">
                                <asp:Button ID="btnCancel" runat="server" Text="Remarks" OnClick="btnCancel_Click"
                                    CausesValidation="False" Visible="False" />
                                <asp:Button ID="btnForward" runat="server" Text="Forward" OnClick="btnSendalert_Click"
                                    Width="80px" CausesValidation="False" />&nbsp;
                            </td>
                            <td align="right" colspan="1">
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="ViewError" runat="server">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Permission Denied."></asp:Label></asp:View>
                <asp:View ID="ViewInsertRemark" runat="server">
                    <table width="100%">
                        <tr>
                            <td style="width:10%" align="left">
                                <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
                            </td>
                            <td style="width:100%">
                                <asp:TextBox ID="txtRemarkSubject" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 15%;" align="left">
                                <asp:Label ID="lblBody" runat="server" Text="Body"></asp:Label>
                            </td>
                            <td style="height: 100px">
                                <asp:TextBox ID="txtRemarkBody" runat="server" Height="100px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="right">
                                <asp:Button ID="btnFileForward" runat="server" OnClick="btnFileForward_Click" Text="Forward"
                                    CausesValidation="False" Visible="False" />
                                <asp:Button ID="btnRemark" runat="server" Text="Return" CausesValidation="False" OnClick="btnRemark_Click1" Visible="False" /></td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            <asp:HiddenField ID="fldFileId" runat="server" />
        </td>
    </tr>
</table>
