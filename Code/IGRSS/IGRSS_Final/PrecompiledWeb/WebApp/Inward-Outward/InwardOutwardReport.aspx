<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_InwardOutwardReport, App_Web_dhxbsoqy" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<table width="100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblAppealReport" runat="server" SkinID="SubHeading" Text="Inward Report" meta:resourcekey="lblAppealReportResource1"></asp:Label>
            </td>
        </tr>
   
        <tr>
             <td class="labelColumn" align="right" style="height: 31px">
                <asp:Label ID="lblOfficeName" runat="server" Text="Office Name" meta:resourcekey="lblToDateResource1"></asp:Label>
            </td>
            <td class="textColumn" style="height: 31px">
             <asp:DropDownList ID="ddlOfficeName" runat="server"  OnLoad="ddlOfficeName_Load"></asp:DropDownList>
             </td>
            <td align="right" colspan="2" style="height: 31px">
                <asp:Button ID="btnGenerateReport" Text="Generate Report" runat="server" OnClick="btnGenerateReport_Click"
                    Width="120px" meta:resourcekey="btnGenerateReportResource1" />
            </td>
        </tr>
    </table>
</asp:Content>

