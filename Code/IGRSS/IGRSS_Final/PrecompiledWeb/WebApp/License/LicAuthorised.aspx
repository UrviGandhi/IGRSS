<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_LicAuthorised, App_Web_syjfv0ab" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:DropDownList ID="ddlLicensce" runat="server">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewSalseDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetLicenseAuthrorised" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
    </asp:ObjectDataSource>
</asp:Content>

