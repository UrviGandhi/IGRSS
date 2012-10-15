<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionQueryReply, App_Web_dvk3xubv" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblFileNumber" runat="server" Text="File Number"></asp:Label></td>
            <td class="textColumn" style="width: 20%">
                <asp:TextBox ID="txtFilePrefix" runat="server" MaxLength="5" meta:resourcekey="txtRefundPrefixInsResource1"
                    Text='<%# Bind("RefundPrefix") %>' Width="22%"></asp:TextBox>
                / &nbsp;
                <asp:TextBox ID="txtFileSlNo" runat="server" MaxLength="5" meta:resourcekey="txtRefundSlNoInsResource1"
                    Text='<%# Bind("RefundSlNo") %>' Width="19%"></asp:TextBox>
                / &nbsp;
                <asp:TextBox ID="txtFileYear" runat="server" MaxLength="4" meta:resourcekey="txtRefundYearInsResource1"
                    Text='<%# Bind("RefundYear") %>' Width="21%"></asp:TextBox></td>
            <td style="width: 10%">
            </td>
            <td style="width: 20%">
                <asp:Label ID="lblOffice" runat="server" Text="Office"></asp:Label></td>
            <td style="width: 20%">
                <asp:DropDownList ID="ddlOffice" runat="server" DataSourceID="OdsOfficeMaster" DataTextField="OfficeName"
                    DataValueField="OfficeId">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="View" />
                <asp:Button ID="btnAddDocs" runat="server" OnClick="btnAddDocs_Click" Text="Add " /></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;&nbsp;
            </td>
            <td>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:MultiView ID="mvQueryReplies" runat="server">
        <asp:View ID="View" runat="server">
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="fldReplyId" runat="server" />
</asp:Content>

