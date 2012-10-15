<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Citizen_DocumentDownload, App_Web_dyccx3yb" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsDocDownload">
        <HeaderTemplate>
            <h4 style="text-align: center; color: Blue">
                Download Document</h4>
        </HeaderTemplate>
        <ItemTemplate>
            <h2 style="text-align: left; background-color: Teal; color: White">
                Name:<%# DataBinder.Eval(Container.DataItem, "Name") %>
            </h2>
            <h2 style="text-align: left">
                Description:
                <%# DataBinder.Eval(Container.DataItem, "Description") %>
            </h2>
            <asp:LinkButton ID="lnkDocDownload" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:LinkButton>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="odsDocDownload" runat="server" SelectMethod="GetSuggestionsDetails"
        TypeName="IGRSS.BusinessLogicLayer.DocumentUpload"></asp:ObjectDataSource>
</asp:Content>
