<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="GridViewTest.aspx.cs" Inherits="Test_GridViewTest" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="odsGetOffices">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text="xxxx"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
</asp:Content>

