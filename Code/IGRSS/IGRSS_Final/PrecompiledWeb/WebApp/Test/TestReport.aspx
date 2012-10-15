<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" Title="Untitled Page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
		Height="400px" ProcessingMode="Remote" Width="870px">
		<ServerReport ReportPath="/IgrssReports/RefundReport" ReportServerUrl="http://blrserver/ReportServer" />
	</rsweb:ReportViewer>
</asp:Content>

