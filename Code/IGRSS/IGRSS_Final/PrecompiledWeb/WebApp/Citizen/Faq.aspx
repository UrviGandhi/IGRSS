<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Citizen_Faq, App_Web_dyccx3yb" title="Frequently Asked Questions" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:ObjectDataSource ID="odsFaq" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetFaqDetails" TypeName="IGRSS.DataAccessLayer.FaqTableAdapters.FAQTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="FaqId" Type="Object" />
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsFaq">
        <HeaderTemplate>
            <h4 style="text-align: center; color: Blue">
                Frequently Asked Questions</h4>
        </HeaderTemplate>
        <ItemTemplate>
            <h3 style="text-align: left; background-color: Teal; color: White">
                Question:<%# DataBinder.Eval(Container.DataItem, "Question") %>
            </h3>
            <h2 style="text-align: left">
                Answer:
                <%# DataBinder.Eval(Container.DataItem, "Answer") %>
            </h2>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
