<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="InspectionCheckList, App_Web_dvk3xubv" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:MultiView ID="mvInspectionDetails" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAllInspections" runat="server">
            <asp:GridView ID="gvAllInspections" runat="server" AutoGenerateColumns="False" DataKeyNames="InspectionId"
                DataSourceID="odsAllInspectionDetails" OnSelectedIndexChanged="gvAllInspections_SelectedIndexChanged" meta:resourcekey="gvAllInspectionsResource1">
                <Columns>
                    <asp:BoundField DataField="InspectionId" HeaderText="InspectionId" ReadOnly="True"
                        SortExpression="InspectionId" Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="InspectingOfficerId" HeaderText="InspectingOfficerId"
                        SortExpression="InspectingOfficerId" Visible="False" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="InspectedOfficeId" HeaderText="InspectedOfficeId" SortExpression="InspectedOfficeId"
                        Visible="False" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="Officer" HeaderText="Officer" SortExpression="Officer" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="InspectedOffice" HeaderText="Inspected Office" SortExpression="InspectedOffice" meta:resourcekey="BoundFieldResource5" />
                    <asp:BoundField DataField="InspectionType" HeaderText="Inspection Type" SortExpression="InspectionType" meta:resourcekey="BoundFieldResource6" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource7" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsAllInspectionDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllInspectionDetails" TypeName="IGRSS.BusinessLogicLayer.Inspection">
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="viewInspectionDetails" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="InspectionId"
                DataSourceID="odsInspectionDetail" Height="50px" Width="100%" meta:resourcekey="DetailsView1Resource1">
                <Fields>
                    <asp:BoundField DataField="InspectionId" HeaderText="InspectionId" ReadOnly="True"
                        SortExpression="InspectionId" Visible="False" meta:resourcekey="BoundFieldResource8" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource9" />
                    <asp:TemplateField HeaderText="IsDiscrepancyFound" SortExpression="IsDiscrepancyFound" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDiscrepancyFound") %>' meta:resourcekey="CheckBox1Resource1" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDiscrepancyFound") %>' meta:resourcekey="CheckBox1Resource2" />
                        </InsertItemTemplate>
                        <HeaderTemplate>
                            Discrepancy Found?
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" SelectedValue='<%# Bind("IsDiscrepancyFound") %>' meta:resourcekey="DropDownList1Resource1">
                                <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True">Select</asp:ListItem>
                                <asp:ListItem Value="True" meta:resourcekey="ListItemResource2">Yes</asp:ListItem>
                                <asp:ListItem Value="False" meta:resourcekey="ListItemResource3">No</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Officer" HeaderText="Officer" SortExpression="Officer" meta:resourcekey="BoundFieldResource10" />
                    <asp:BoundField DataField="InspectedOffice" HeaderText="Inspected Office" SortExpression="InspectedOffice" meta:resourcekey="BoundFieldResource11" />
                    <asp:BoundField DataField="InspectionType" HeaderText="InspectionType" SortExpression="InspectionType" meta:resourcekey="BoundFieldResource12" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" meta:resourcekey="BoundFieldResource13" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource14" />
                </Fields>
            </asp:DetailsView>
            <asp:ObjectDataSource ID="odsInspectionDetail" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInspectionDetailsById" TypeName="IGRSS.BusinessLogicLayer.Inspection">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvAllInspections" Name="InspectionId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="Label1" runat="server" SkinID="SubHeading" Text="Quries" meta:resourcekey="Label1Resource1"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QueryId"
                DataSourceID="odsInspectionQuires" meta:resourcekey="GridView1Resource1">
                <Columns>
                    <asp:BoundField DataField="QueryId" HeaderText="QueryId" ReadOnly="True" SortExpression="QueryId"
                        Visible="False" meta:resourcekey="BoundFieldResource15" />
                    <asp:BoundField DataField="InspectionId" HeaderText="InspectionId" SortExpression="InspectionId"
                        Visible="False" meta:resourcekey="BoundFieldResource16" />
                    <asp:BoundField DataField="CheckListId" HeaderText="CheckListId" SortExpression="CheckListId"
                        Visible="False" meta:resourcekey="BoundFieldResource17" />
                    <asp:BoundField DataField="Query" HeaderText="Query" SortExpression="Query" meta:resourcekey="BoundFieldResource18" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource19" />
                    <asp:CheckBoxField DataField="Received" HeaderText="Received" SortExpression="Received" meta:resourcekey="CheckBoxFieldResource1" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsInspectionQuires" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetQueriesByInspectionId" TypeName="IGRSS.BusinessLogicLayer.Inspection">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvAllInspections" Name="InspectionId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            &nbsp; &nbsp;
        </asp:View>
    </asp:MultiView>
</asp:Content>

