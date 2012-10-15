<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="EmployeeReport.aspx.cs" Inherits="Employee_EmployeeReport" Title="Untitled Page" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblAppealReport" runat="server" SkinID="SubHeading" Text="Employee Details" meta:resourcekey="lblAppealReportResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn" align="right">
                <asp:Label ID="lblFromDate" runat="server" Text="Office Name" meta:resourcekey="lblFromDateResource1"></asp:Label>
            </td>
            <td>
            <asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="odsGetOffices" DataTextField="OfficeName" DataValueField="OfficeId"></asp:DropDownList>
            </td>
          
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 26px" >
                <asp:Button ID="btnGenerateReport" Text="Generate Report" runat="server" OnClick="btnGenerateReport_Click"
                    Width="120px" meta:resourcekey="btnGenerateReportResource1" />
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

