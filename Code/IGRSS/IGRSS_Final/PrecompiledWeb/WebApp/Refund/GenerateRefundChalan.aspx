<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_GenerateRefundChalan, App_Web_e5jlgnnw" title="Generate Refund Chalane" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table width="100%">
        <tr>
            <td style="height: 199px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RefundApplicationId"
                    DataSourceID="odsGenerateRefund">
                    <Columns>
                        <asp:BoundField DataField="RefundSlNo" HeaderText="Serial No" SortExpression="RefundSlNo" />
                        <asp:BoundField DataField="RefundYear" HeaderText="Year" SortExpression="RefundYear" />
                        <asp:BoundField DataField="TypeOfRefund" HeaderText="Refund Type" SortExpression="TypeOfRefund" />
                        <asp:BoundField DataField="TotalValueOfStamps" HeaderText="Total Value Of Stamps" SortExpression="TotalValueOfStamps" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="RefundApplicationId" Visible="False" HeaderText="RefundApplicationId"
                            ReadOnly="True" SortExpression="RefundApplicationId" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelectRefundChalan" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnGenerateRefund" runat="server" Text="Generate Refund" Width="125px" />
                <asp:ObjectDataSource ID="odsGenerateRefund" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetApprovedRefund" TypeName="IGRSS.BusinessLogicLayer.RefundApplication">
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
