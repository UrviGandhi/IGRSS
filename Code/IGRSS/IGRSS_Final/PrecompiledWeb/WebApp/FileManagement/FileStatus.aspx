<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="FileManagement_FileStatus, App_Web_etybu2jq" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                    SkinID="SubHeading" Text="File Status" ></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%; height: 26px;">
                <asp:Label ID="lblFileNumber" runat="server" Text="File Number"></asp:Label></td>
            <td class="textColumn">
                <asp:TextBox ID="txtRefundPrefixIns" runat="server" MaxLength="5" Text='<%# Bind("RefundPrefix") %>'
                    Width="15%" meta:resourcekey="txtRefundPrefixInsResource1"></asp:TextBox>
                /
                <asp:RequiredFieldValidator ID="ReqfldtxtFilePrefixIns" runat="server" ControlToValidate="txtRefundPrefixIns"
                    ErrorMessage="Please Enter File Prefix" meta:resourcekey="ReqfldtxtFilePrefixInsResource1">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExptxtFilePrefixIns" runat="server" ControlToValidate="txtRefundPrefixIns"
                    ErrorMessage="Please Enter Valid File Prefix" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>"
                    meta:resourcekey="RegExptxtFilePrefixInsResource1">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="txtRefundSlNoIns" runat="server" MaxLength="5" Text='<%# Bind("RefundSlNo") %>'
                    Width="15%" meta:resourcekey="txtRefundSlNoInsResource1"></asp:TextBox>
                /
                <asp:RequiredFieldValidator ID="ReqtxtFileNoIns" runat="server" ControlToValidate="txtRefundSlNoIns"
                    ErrorMessage="Please Enter File No" meta:resourcekey="ReqtxtFileNoInsResource1">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regFileNoIns" runat="server" ControlToValidate="txtRefundSlNoIns"
                    ErrorMessage="Please Enter Valid File No" ValidationExpression="<%$ Resources:ValidationRegx, FileNo %>"
                    meta:resourcekey="regFileNoInsResource1">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="txtRefundYearIns" runat="server" MaxLength="4" Text='<%# Bind("RefundYear") %>'
                    Width="15%" meta:resourcekey="txtRefundYearInsResource1"></asp:TextBox>
            </td>
            <td style="width: 20%; height: 26px;">
                <asp:Label ID="lblOffice" runat="server" Text="File Number"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlOffice" runat="server" DataSourceID="OdsOfficeMaster" DataTextField="OfficeName" DataValueField="OfficeId"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td align="right">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" SelectMethod="GetOffices"
        TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices" OldValuesParameterFormatString="original_{0}" DataObjectTypeName="System.Guid" DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
