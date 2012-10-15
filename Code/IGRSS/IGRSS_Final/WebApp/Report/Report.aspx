<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="Report.aspx.cs" Inherits="Report_Report" Title="Untitled Page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        ProcessingMode="Remote" Width="100%" ShowCredentialPrompts="False" ShowDocumentMapButton="False"
        ShowExportControls="False" ShowFindControls="False" ShowParameterPrompts="False"
        ShowRefreshButton="False" Height="400px">
        <ServerReport ReportPath="/IgrssReports/EmployeeMaster" />
    </rsweb:ReportViewer>
</asp:Content>
 