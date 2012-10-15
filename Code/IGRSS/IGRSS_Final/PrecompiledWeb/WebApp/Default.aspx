<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="_Default, App_Web_4wv3tozb" title="Default Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:GridView ID="grdAlerts" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="AlertId" DataSourceID="odsAlerts" OnRowCommand="grdAlerts_RowCommand" OnSelectedIndexChanged="grdAlerts_SelectedIndexChanged" OnRowDataBound="grdAlerts_RowDataBound" 
        >
        <Columns>
            <asp:BoundField DataField="AlertId" HeaderText="AlertId" SortExpression="AlertId"
                Visible="False" />
            <asp:TemplateField HeaderText="Message" ShowHeader="False" SortExpression="Message">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkMessage" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Link") %>'
                        CommandName="Select" Text='<%# Bind("Message") %>'></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="SentAt" HeaderText="Sent On" SortExpression="SentAt" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False">
                <ItemStyle Width="15%" CssClass="grdDateField" />
                <HeaderStyle CssClass="grdDateField" />
            </asp:BoundField>
            <asp:BoundField DataField="SentBy" HeaderText="Sent By" SortExpression="SentBy">
                <ItemStyle Width="15%" CssClass="grdTextField" />
                <HeaderStyle HorizontalAlign="Left" CssClass="grdTextField" />
            </asp:BoundField>
            <asp:BoundField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive"
                Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsAlerts" runat="server" SelectMethod="GetAlertsForUser"
        TypeName="IGRSS.BusinessLogicLayer.WorkflowSupport" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ProfileParameter Name="username" PropertyName="UserName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
