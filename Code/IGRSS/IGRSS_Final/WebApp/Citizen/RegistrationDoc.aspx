<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="RegistrationDoc.aspx.cs" Inherits="Citizen_RegistrationDoc" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvregistrationType" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSelectRegistrationType" runat="server">
            <table width="100%">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblRegistrationTypeDocIns" runat="server" SkinID="SubHeading" Text="Document Required For Registration"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblRegistrationTypeName" runat="server" Text="Registration Type"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:DropDownList ID="ddlRegistrationTypeName" runat="server" DataSourceID="odsRegistrationType"
                            DataTextField="RegistartionName" DataValueField="RegistrationTypeId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewDocType" runat="server">
            <table width="100%">
                <tr>
                    <td colspan="4" align="left">
                        <asp:BulletedList ID="bulDocument" runat="server" DataSourceID="odsDocType" DataTextField="Name"
                            DataValueField="RegistrationTypeId" BulletStyle="UpperAlpha" DisplayMode="text"
                            Font-Bold="True" Font-Size="Medium" ForeColor="#000040">
                        </asp:BulletedList>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsRegistrationType" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetRegistrationTypeMaster"
        TypeName="IGRSS.DataAccessLayer.RegistrationDocReqTableAdapters.RegistrationTypeMasterTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="RegistrationTypeId" Type="Object" />
            <asp:Parameter Name="RegistartionName" Type="String" />
            <asp:Parameter Name="RegistrationTypeDesc" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDocType" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDocumentByRegistrationType" TypeName="IGRSS.DataAccessLayer.RegistrationDocReqTableAdapters.RegistrationTypeDoc_MapMasterTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlRegistrationTypeName" Name="RegistrationTypeId"
                PropertyName="SelectedValue" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
