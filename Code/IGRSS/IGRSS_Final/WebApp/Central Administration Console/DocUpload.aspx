<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="DocUpload.aspx.cs" Inherits="Central_Administration_Console_DocUpload"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <table width="100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblAppealReport" runat="server" SkinID="SubHeading" Text="File Upload"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn">
                <asp:Label ID="lblNameIns" runat="server" Text="Name"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="labelColumn">
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
            </td>
            <td class="textColumn">
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Text='<%# Bind("Description") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="labelColumn">
                <asp:Label ID="lblFileUpload" runat="server" Text="Upload"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="flup" runat="server" Enabled='<%# Eval("path") %>' />
            </td>
        </tr>
        <tr>
            <td align="right" colspan="4" style="height: 26px">
                <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" CommandName="Insert" />
            </td>
        </tr>
        <tr>
            <td class="labelColumn" colspan="4">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
  
  
    <asp:ObjectDataSource ID="odsFileUpload" runat="server" InsertMethod="UploadDocument"
        SelectMethod="GetSuggestionsDetails" TypeName="IGRSS.BusinessLogicLayer.DocumentUpload">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Path" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
