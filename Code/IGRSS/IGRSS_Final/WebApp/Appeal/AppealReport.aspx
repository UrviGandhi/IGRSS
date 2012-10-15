<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="AppealReport.aspx.cs" Inherits="Appeal_AppealReport" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblAppealReport" runat="server" SkinID="SubHeading" Text="Appeal Application Report" meta:resourcekey="lblAppealReportResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn" style="height: 29px">
                <asp:Label ID="lblFromDate" runat="server" Text="From Date" meta:resourcekey="lblFromDateResource1"></asp:Label>
            </td>
            <td class="textColumn" style="height: 29px">
                <asp:TextBox ID="txtFromdate" runat="server" SkinID="Calendar" meta:resourcekey="txtFromdateResource1"></asp:TextBox>
                <rjs:PopCalendar ID="calFromDateIns" runat="server" Control="txtFromdate" meta:resourcekey="calFromDateIns"
                    Move="True" />
            </td>
            <td class="labelColumn" align="right" style="height: 29px">
                <asp:Label ID="lblToDate" runat="server" Text="To Date" meta:resourcekey="lblToDateResource1"></asp:Label>
            </td>
            <td class="textColumn" style="height: 29px">
                <asp:TextBox ID="txtToDate" runat="server" SkinID="Calendar" meta:resourcekey="txtToDateResource1"></asp:TextBox>
                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtToDate" meta:resourcekey="PopCalendar1"
                    Move="True" />
            </td>
        </tr>
        <tr>
            <td align="right" colspan="100">
                <asp:Button ID="btnGenerateReport" Text="Generate Report" runat="server" OnClick="btnGenerateReport_Click"
                    Width="120px" meta:resourcekey="btnGenerateReportResource1" />
            </td>
        </tr>
    </table>
</asp:Content>
