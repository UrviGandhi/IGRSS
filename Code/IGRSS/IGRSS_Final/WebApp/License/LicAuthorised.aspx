<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="LicAuthorised.aspx.cs" Inherits="License_LicAuthorised" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:DropDownList ID="ddlLicensce" runat="server">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewSalseDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetLicenseAuthrorised" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
    </asp:ObjectDataSource>
</asp:Content>

