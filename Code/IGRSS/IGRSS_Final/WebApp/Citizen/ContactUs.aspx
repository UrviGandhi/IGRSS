<%@ Page Language="C#" MasterPageFile="~/Citizen/Citizen.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="Citizen_ContactUs" Title="Contact Details" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
    <table style="width: 100%; text-align: left;">
        <tr>
            <td colspan="6" style="width: 785px">
                <asp:Label ID="lblOfficeDetails" runat="server" meta:resourcekey="lblOfficeDetails"
                    SkinID="SubHeading" Text="Offices Details"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 338px; width: 785px;">
                <asp:GridView ID="gvOfficeDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="OfficeId" DataSourceID="odsOffices">
                    <Columns>
                        <asp:BoundField DataField="OfficeName" HeaderText="Office Name" SortExpression="OfficeName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="TypeName" HeaderText="Office Type" ReadOnly="True" SortExpression="TypeName" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetOfficeDetails" TypeName="IGRSS.BusinessLogicLayer.OfficeMaster">
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
