<%@ control language="C#" autoeventwireup="true" inherits="UserControls_DocumentUpload, App_Web_ljp04ovk" %>
<table width="100%">
    <tr>
        <td colspan="3">
            <asp:FormView ID="fvDocuments" runat="server" DefaultMode="Insert">
                <EditItemTemplate>
                    FileID:
                    <asp:TextBox ID="FileIDTextBox" runat="server" Text='<%# Bind("FileID") %>'>
                    </asp:TextBox><br />
                    DocId:
                    <asp:TextBox ID="DocIdTextBox" runat="server" Text='<%# Bind("DocId") %>'>
                    </asp:TextBox><br />
                    DocContent:
                    <asp:TextBox ID="DocContentTextBox" runat="server" Text='<%# Bind("DocContent") %>'>
                    </asp:TextBox><br />
                    UploadedBy:
                    <asp:TextBox ID="UploadedByTextBox" runat="server" Text='<%# Bind("UploadedBy") %>'>
                    </asp:TextBox><br />
                    DocName:
                    <asp:TextBox ID="DocNameTextBox" runat="server" Text='<%# Bind("DocName") %>'>
                    </asp:TextBox><br />
                    UploadedAt:
                    <asp:TextBox ID="UploadedAtTextBox" runat="server" Text='<%# Bind("UploadedAt") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 20%">
                                <asp:Label ID="lblFileID" runat="server" Text="File ID" Visible="False"></asp:Label>
                            </td >
                            <td style="width: 20%">
                                <asp:TextBox ID="FileIDTextBox" runat="server" Text='<%# Bind("FileID") %>' Visible="False"></asp:TextBox>
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 20%">
                                <asp:Label ID="lblDocId" runat="server" Text="DocId: " Visible="False"></asp:Label>
                            </td>
                            <td style="width: 20%">
                                <asp:TextBox ID="DocIdTextBox" runat="server" Text='<%# Bind("DocId") %>' Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDocName" runat="server" Text="Name:"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="DocNameTextBox" runat="server" Text='<%# Bind("DocName") %>'></asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblUploadedBy" runat="server" Text="UploadedBy:" Visible="False"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="UploadedByTextBox" runat="server" Text='<%# Bind("UploadedBy") %>' Visible="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDocContent" runat="server" Text="Path"></asp:Label></td>
                            <td colspan="4">
                                <asp:FileUpload ID="fulDocuments" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="right" colspan="3">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" /></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:GridView ID="gvAttachments" runat="server">
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="5">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" /></td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert" Visible="False"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" Visible="False"></asp:LinkButton>
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    FileID:
                    <asp:Label ID="FileIDLabel" runat="server" Text='<%# Bind("FileID") %>'></asp:Label><br />
                    DocId:
                    <asp:Label ID="DocIdLabel" runat="server" Text='<%# Bind("DocId") %>'></asp:Label><br />
                    DocContent:
                    <asp:Label ID="DocContentLabel" runat="server" Text='<%# Bind("DocContent") %>'></asp:Label><br />
                    UploadedBy:
                    <asp:Label ID="UploadedByLabel" runat="server" Text='<%# Bind("UploadedBy") %>'></asp:Label><br />
                    DocName:
                    <asp:Label ID="DocNameLabel" runat="server" Text='<%# Bind("DocName") %>'></asp:Label><br />
                    UploadedAt:
                    <asp:Label ID="UploadedAtLabel" runat="server" Text='<%# Bind("UploadedAt") %>'></asp:Label><br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td style="height: 39px" colspan="3">
            <asp:ObjectDataSource ID="odsDocuments" runat="server" InsertMethod="AddDocumentToFile" SelectMethod="GetAttachmentByFileId" TypeName="IGRSS.BusinessLogicLayer.FileManagement">
                <InsertParameters>
                    <asp:Parameter Name="FileId" Type="Object" />
                    <asp:Parameter Name="Document" Type="Object" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="FileId" Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
<asp:HiddenField ID="fldFileId" runat="server" />
<asp:HiddenField ID="fldContent" runat="server" />
&nbsp;
