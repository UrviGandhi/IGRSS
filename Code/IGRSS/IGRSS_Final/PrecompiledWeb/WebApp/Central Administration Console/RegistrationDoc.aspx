<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_RegistrationDoc, App_Web_tbz1y0ii" title="Document Required for Registration" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:FormView ID="fvRegistrationDoc" runat="server" DefaultMode="Insert" DataSourceID="odsRegistrationDocReq">
        <InsertItemTemplate>
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
                        <asp:DropDownList ID="ddlRegistrationTypeName" runat="server" DataSourceID="odsRegistrationType" DataTextField="RegistrationTypeDesc" DataValueField="RegistrationTypeId" SelectedValue='<%# Bind("RegistrationTypeId") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblDocumentTypeName" runat="server" Text="Document Type"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:DropDownList ID="ddlDocumentTypeName" runat="server" DataSourceID="odsDocumentType" DataTextField="Name" DataValueField="DocumentTypeId" SelectedValue='<%# Bind("DocumentTypeId") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="btnSave" Text="Save" runat="server" CommandName="Insert" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
       <ItemTemplate>
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
                        <asp:DropDownList ID="ddlRegistrationTypeName" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblDocumentTypeName" runat="server" Text="Document Type"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:DropDownList ID="ddlDocumentTypeName" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4">
                        <asp:Button ID="btnSave" Text="Save" runat="server" CommandName="Insert" />
                    </td>
                </tr>
            </table>
       
       </ItemTemplate> 
    </asp:FormView>
    <asp:ObjectDataSource ID="odsRegistrationType" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.RegistrationDocReqTableAdapters.RegistrationTypeMasterTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="RegistrationTypeId" Type="Object" />
            <asp:Parameter Name="RegistartionName" Type="String" />
            <asp:Parameter Name="RegistrationTypeDesc" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDocumentType" runat="server" DataObjectTypeName="System.Guid" InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocumentMaster" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest" UpdateMethod="UpdatePhysicalVerification">
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRegistrationDocReq" runat="server" InsertMethod="InsertRegistrationTypeDoc" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.RegistrationDocReqTableAdapters.RegistrationTypeDoc_MapMasterTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="RegistrationTypeId" Type="Object" />
            <asp:Parameter Name="DocumentTypeId" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
