<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="ConfidentialComplainReport.aspx.cs" Inherits="Complain_ConfidentialComplainReport"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
<asp:MultiView ID="mvComplainDetails" runat="server" ActiveViewIndex="0">
<asp:View ID="viewSearch" runat="server">
    <table width="100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblAppealReport" runat="server" SkinID="SubHeading" Text="Complain Report" meta:resourcekey="lblAppealReportResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="labelColumn" style="width: 215px">
                <asp:Label ID="lblOfficeIdIns" runat="server" Text="OfficeName" meta:resourcekey="lblOfficeIdInsResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="odsOffices" DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlOfficeNameResource1">
                </asp:DropDownList>
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
                <asp:Label ID="lblToDate" runat="server" Text="To Date" Width="52px" meta:resourcekey="lblToDateResource1"></asp:Label>
            </td>
            <td class="textColumn" style="height: 29px">
                <asp:TextBox ID="txtToDate" runat="server" SkinID="Calendar" meta:resourcekey="txtToDateResource1"></asp:TextBox>
                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtToDate" meta:resourcekey="PopCalendar1"
                    Move="True" />
            </td>
        </tr>
        <tr>
            <td align="right" colspan="100">
                <asp:Button ID="btnGenerateReport" Text="Search" runat="server" 
                    Width="120px" OnClick="btnGenerateReport_Click1" meta:resourcekey="btnGenerateReportResource1" />
            </td>
        </tr>
        </table>
        </asp:View>
        <asp:View ID="viewComplainDetails" runat="server">
        <table width="100%">
        <tr>
            <td colspan="4">
                <asp:GridView ID="gvConfidentialComReport" runat="server" AutoGenerateColumns="False" DataKeyNames="ComplainId" DataSourceID="odsComplainDetails" meta:resourcekey="gvConfidentialComReportResource1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                        <asp:BoundField DataField="ComplaintNo" HeaderText="ComplaintNo" SortExpression="ComplaintNo" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="ComplainantName" HeaderText="ComplainantName" SortExpression="ComplainantName" meta:resourcekey="BoundFieldResource2" />
                        <asp:BoundField DataField="ComplainantAddress" HeaderText="ComplainantAddress" SortExpression="ComplainantAddress" meta:resourcekey="BoundFieldResource3" />
                        <asp:BoundField DataField="ComplaintDate" HeaderText="ComplaintDate" SortExpression="ComplaintDate" meta:resourcekey="BoundFieldResource4" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" meta:resourcekey="BoundFieldResource5" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsComplainDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetComplainReport" TypeName="IGRSS.DataAccessLayer.ComplainTableAdapters.ComplainDetailsTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ComplainId" Type="Object" />
                        <asp:Parameter Name="Original_ComplaintNo" Type="String" />
                        <asp:Parameter Name="Original_ComplaintType" Type="Object" />
                        <asp:Parameter Name="Original_AgainstEmpID" Type="Object" />
                        <asp:Parameter Name="Original_ComplainingEmpID" Type="Object" />
                        <asp:Parameter Name="Original_ComplainantName" Type="String" />
                        <asp:Parameter Name="Original_ComplainantAddress" Type="String" />
                        <asp:Parameter Name="Original_ComplaintDate" Type="DateTime" />
                        <asp:Parameter Name="Original_ReceivingOfficeId" Type="Object" />
                        <asp:Parameter Name="Original_Subject" Type="String" />
                        <asp:Parameter Name="Original_Detail" Type="String" />
                        <asp:Parameter Name="Original_InvestigatingOfficer" Type="Object" />
                        <asp:Parameter Name="Original_StartDate" Type="DateTime" />
                        <asp:Parameter Name="Original_EndDate" Type="DateTime" />
                        <asp:Parameter Name="Original_Report" Type="String" />
                        <asp:Parameter Name="Original_Remarks" Type="String" />
                        <asp:Parameter Name="Original_Status" Type="Object" />
                        <asp:Parameter Name="Original_CreatedBy" Type="String" />
                        <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                        <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                        <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                        <asp:Parameter Name="Original_WfInstanceId" Type="Object" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ComplainId" Type="Object" />
                        <asp:Parameter Name="ComplaintNo" Type="String" />
                        <asp:Parameter Name="ComplaintType" Type="Object" />
                        <asp:Parameter Name="AgainstEmpID" Type="Object" />
                        <asp:Parameter Name="ComplainingEmpID" Type="Object" />
                        <asp:Parameter Name="ComplainantName" Type="String" />
                        <asp:Parameter Name="ComplainantAddress" Type="String" />
                        <asp:Parameter Name="ComplaintDate" Type="DateTime" />
                        <asp:Parameter Name="ReceivingOfficeId" Type="Object" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="InvestigatingOfficer" Type="Object" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="Report" Type="String" />
                        <asp:Parameter Name="Remarks" Type="String" />
                        <asp:Parameter Name="Status" Type="Object" />
                        <asp:Parameter Name="CreatedBy" Type="String" />
                        <asp:Parameter Name="CreatedAt" Type="DateTime" />
                        <asp:Parameter Name="ModifiedBy" Type="String" />
                        <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                        <asp:Parameter Name="WfInstanceId" Type="Object" />
                        <asp:Parameter Name="WfInfo" Type="Object" />
                        <asp:Parameter Name="Original_ComplainId" Type="Object" />
                        <asp:Parameter Name="Original_ComplaintNo" Type="String" />
                        <asp:Parameter Name="Original_ComplaintType" Type="Object" />
                        <asp:Parameter Name="Original_AgainstEmpID" Type="Object" />
                        <asp:Parameter Name="Original_ComplainingEmpID" Type="Object" />
                        <asp:Parameter Name="Original_ComplainantName" Type="String" />
                        <asp:Parameter Name="Original_ComplainantAddress" Type="String" />
                        <asp:Parameter Name="Original_ComplaintDate" Type="DateTime" />
                        <asp:Parameter Name="Original_ReceivingOfficeId" Type="Object" />
                        <asp:Parameter Name="Original_Subject" Type="String" />
                        <asp:Parameter Name="Original_Detail" Type="String" />
                        <asp:Parameter Name="Original_InvestigatingOfficer" Type="Object" />
                        <asp:Parameter Name="Original_StartDate" Type="DateTime" />
                        <asp:Parameter Name="Original_EndDate" Type="DateTime" />
                        <asp:Parameter Name="Original_Report" Type="String" />
                        <asp:Parameter Name="Original_Remarks" Type="String" />
                        <asp:Parameter Name="Original_Status" Type="Object" />
                        <asp:Parameter Name="Original_CreatedBy" Type="String" />
                        <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                        <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                        <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                        <asp:Parameter Name="Original_WfInstanceId" Type="Object" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFromdate" Name="FromDate" PropertyName="Text"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtToDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="ddlOfficeName" Name="OfficeId" PropertyName="SelectedValue" Type="Object" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ComplainId" Type="Object" />
                        <asp:Parameter Name="ComplaintNo" Type="String" />
                        <asp:Parameter Name="ComplaintType" Type="Object" />
                        <asp:Parameter Name="AgainstEmpID" Type="Object" />
                        <asp:Parameter Name="ComplainingEmpID" Type="Object" />
                        <asp:Parameter Name="ComplainantName" Type="String" />
                        <asp:Parameter Name="ComplainantAddress" Type="String" />
                        <asp:Parameter Name="ComplaintDate" Type="DateTime" />
                        <asp:Parameter Name="ReceivingOfficeId" Type="Object" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="InvestigatingOfficer" Type="Object" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="Report" Type="String" />
                        <asp:Parameter Name="Remarks" Type="String" />
                        <asp:Parameter Name="Status" Type="Object" />
                        <asp:Parameter Name="CreatedBy" Type="String" />
                        <asp:Parameter Name="CreatedAt" Type="DateTime" />
                        <asp:Parameter Name="ModifiedBy" Type="String" />
                        <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                        <asp:Parameter Name="WfInstanceId" Type="Object" />
                        <asp:Parameter Name="WfInfo" Type="Object" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsOffices" runat="server" DataObjectTypeName="System.Guid"
                    DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
   </asp:View>
   </asp:MultiView>
</asp:Content>
