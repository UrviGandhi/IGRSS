<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_UploadFaq, App_Web_tbz1y0ii" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:FormView ID="fvFaq" runat="server" DefaultMode="Insert" DataSourceID="odsFaq">
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblUploadFaq" runat="server" SkinID="SubHeading" Text="Upload Faq"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblQuestionIns" runat="server" Text="Question"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtQuestionIns" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" Text='<%# Bind("Answer") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4" style="height: 26px">
                        <asp:Button ID="btnSave" Text="Save" runat="server" CommandName="Insert" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table width="100%">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblUploadFaq" runat="server" SkinID="SubHeading" Text="Upload Faq"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblQuestionIns" runat="server" Text="Question"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtQuestionIns" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" Text='<%# Bind("Answer") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="4" style="height: 26px">
                        <asp:Button ID="btnSave" Text="Save" runat="server" CommandName="Insert" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="odsFaq" runat="server" InsertMethod="AddNewFaq" SelectMethod="GetAllFaq"
        TypeName="IGRSS.BusinessLogicLayer.Faq">
        <InsertParameters>
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
