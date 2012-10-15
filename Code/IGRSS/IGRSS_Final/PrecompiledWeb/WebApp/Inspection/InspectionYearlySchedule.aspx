<%@ page autoeventwireup="true" inherits="Inspection_InspectionYearlySchedule, App_Web_dvk3xubv" language="C#" masterpagefile="~/IGRSS_Default.master" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
    <asp:MultiView ID="MvYearlySchedule" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewScheduleSearch" runat="server">
            <table width="100%">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblOfficeSearch" runat="server" Text="Scheduling Officer" meta:resourcekey="lblOfficeSearchResource1"></asp:Label></td>
                    <td align="left">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OdsEmployeeMaster"
                            DataTextField="FirstName" DataValueField="EmployeeID" Width="159px" meta:resourcekey="DropDownList1Resource1">
                        </asp:DropDownList>&nbsp;</td>
                    <td align="left">
                        <asp:Label ID="lblYearSerach" runat="server" Text="Enter Year" meta:resourcekey="lblYearSerachResource1"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="txtYearSearch" runat="server" Width="165px" meta:resourcekey="txtYearSearchResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="6" style="height: 26px">
                        <asp:Button ID="btnSearchAppNo" runat="server" Text="Search" Width="61px" meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GvYearlyInspection" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ScheduleId" DataSourceID="OdsSearch" OnSelectedIndexChanged="GvYearlyInspection_SelectedIndexChanged"
                Width="100%" meta:resourcekey="GvYearlyInspectionResource1">
                <Columns>
                    <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="Year" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource3" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                </Columns>
                <EmptyDataTemplate>
                    Record Not Found
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="YearlySchedule" runat="server">
            <asp:FormView ID="FvYearlySchedule" runat="server" DataKeyNames="ScheduleId" DataSourceID="OdsFvInspection"
                DefaultMode="Insert" OnDataBound="FvYearlySchedule_DataBound" OnItemInserting="FvYearlySchedule_ItemInserting"
                OnPageIndexChanging="FvYearlySchedule_PageIndexChanging" OnItemInserted="FvYearlySchedule_ItemInserted" OnItemUpdating="FvYearlySchedule_ItemUpdating" meta:resourcekey="FvYearlyScheduleResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblScheduleHeaderIns" runat="server" meta:resourcekey="lblScheduleHeaderIns"
                                    SkinID="SubHeading" Text="Yearly Schedule Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblOfficerIdIns" runat="server" meta:resourcekey="lblOfficerIdIns"
                                    Text="Scheduling Officer"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlEmployeeIDIns" runat="server" DataSourceID="OdsEmployeeMaster"
                                    DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlOfficerIdIns"
                                    SelectedValue='<%# Bind("OfficerId") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblYearIns" runat="server" meta:resourcekey="lblYearIns" Text="Schedule year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlYear" runat="server" DataValueField='<%# Bind("Year") %>' SelectedValue='<%# Bind("Year") %>' meta:resourcekey="ddlYearResource1">
                                <asp:ListItem Text="2005" Value="2005" meta:resourcekey="ListItemResource1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2005" Value="2005" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    <asp:ListItem Text="2006" Value="2006" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                    <asp:ListItem Text="2007" Value="2007" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                    <asp:ListItem Text="2008" Value="2008" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                    <asp:ListItem Text="2009" Value="2009" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                </asp:DropDownList>
                                <rjs:PopCalendar ID="PoptxtYearIns" runat="server" Control="txtYearIns" meta:resourcekey="PoptxtYearInsResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="lblAddScheduleDetails" runat="server" SkinID="Heading" Text="Schedule Details" meta:resourcekey="lblAddScheduleDetailsResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblMonthIns" runat="server" meta:resourcekey="lblMonthIns" Text="Month"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 61px">
                                <asp:DropDownList ID="ddlMonthIns" runat="server" meta:resourcekey="ddlMonth">
                                    <asp:ListItem Text="January" Value="1" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                    <asp:ListItem Text="April" Value="4" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                    <asp:ListItem Text="May" Value="5" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                    <asp:ListItem Text="June" Value="6" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                            <td align="left" class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblInspectingOfficeIdIns" runat="server" meta:resourcekey="lblInspectingOfficeIdIns"
                                    Text="Inspecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" style="height: 61px">
                                <asp:ListBox ID="lstInspectingOfficeIns" runat="server" DataSourceID="OdsOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlInspectingOfficeId"
                                    SelectionMode="Multiple" Text='<%# Bind("OfficeId") %>'></asp:ListBox>
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksIns" runat="server" meta:resourcekey="lblDetailRemarks" Text="Detail Remarks"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDetailRemarksIns" runat="server" meta:resourcekey="txtDetailRemarksIns" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDetailRemarksIns" runat="server" ControlToValidate="txtDetailRemarksIns"
                                    ErrorMessage="Remarks Can't be blank" meta:resourcekey="ReqfldtxtDetailRemarksInsResource1" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnAddInspectionDetailIns" runat="server" OnClick="btnAddDetail_Click"
                                    Text="Add" meta:resourcekey="btnAddInspectionDetailInsResource1" />
                                <asp:Button ID="btnUpdateInspectionDetailIns" runat="server" OnClick="btnUpdateInspectionDetail_Click"
                                    Text="Update" meta:resourcekey="btnUpdateInspectionDetailInsResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvInspectionDetailsIns" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="DetailScheduleId" OnRowDeleting="GvInspectionDetailsIns_RowDeleting"
                                    OnSelectedIndexChanged="GvInspectionDetailsIns_SelectedIndexChanged" meta:resourcekey="GvInspectionDetailsInsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="Month" HeaderText="Month" meta:resourcekey="BoundFieldResource4" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource5" />
                                        <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" meta:resourcekey="BoundFieldResource6" />
                                        <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" meta:resourcekey="BoundFieldResource7" />
                                        <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                                        <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource3" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtRemarksIns" runat="server" meta:resourcekey="txtRemarksIns" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInspYearlySaveIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInspYearlySaveInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblScheduleHeaderUpd" runat="server" meta:resourcekey="lblScheduleHeaderUpd"
                                    SkinID="SubHeading" Text="Yearly Schedule Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblOfficerIdUpd" runat="server" meta:resourcekey="lblOfficerIdUpd"
                                    Text="Scheduling Officer"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                               <asp:DropDownList ID="ddlEmployeeIDUpd" runat="server" DataSourceID="OdsEmployeeMaster"
									DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlEmployeeIDUpd" SelectedValue='<%# Bind("OfficerId") %>'>
								</asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblYearUpd" runat="server" meta:resourcekey="lblYearUpd" Text="Schedule year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlYearUpd" runat="server" Enabled="False" DataValueField='<%# Bind("Year") %>' SelectedValue='<%# Bind("Year") %>' meta:resourcekey="ddlYearUpdResource1"  >
                                <asp:ListItem Text="2005" Value="2005" meta:resourcekey="ListItemResource13" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="2005" Value="2005" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                    <asp:ListItem Text="2006" Value="2006" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                    <asp:ListItem Text="2007" Value="2007" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                    <asp:ListItem Text="2008" Value="2008" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                    <asp:ListItem Text="2009" Value="2009" meta:resourcekey="ListItemResource18"></asp:ListItem>
                                </asp:DropDownList>
								
								
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="lblAddScheduleDetails" runat="server" SkinID="Heading" Text="Schedule Details" meta:resourcekey="lblAddScheduleDetailsResource2"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblMonthUpd" runat="server" meta:resourcekey="lblMonthUpd" Text="Month"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 61px">
                                <asp:DropDownList ID="ddlMonthUpd" runat="server"  meta:resourcekey="ddlMonth">
                                    <asp:ListItem Text="January" Value="1" meta:resourcekey="ListItemResource19"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2" meta:resourcekey="ListItemResource20"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3" meta:resourcekey="ListItemResource21"></asp:ListItem>
                                    <asp:ListItem Text="April" Value="4" meta:resourcekey="ListItemResource22"></asp:ListItem>
                                    <asp:ListItem Text="May" Value="5" meta:resourcekey="ListItemResource23"></asp:ListItem>
                                    <asp:ListItem Text="June" Value="6" meta:resourcekey="ListItemResource24"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                            <td align="left" class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblInspectingOfficeIdUpd" runat="server" meta:resourcekey="lblInspectingOfficeIdUpd"
                                    Text="Inspecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" style="height: 61px">
                                <asp:ListBox ID="lstInspectingOfficeUpd" runat="server" DataSourceID="OdsOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" meta:resourcekey="ddlInspectingOfficeId"
                                    SelectionMode="Multiple"></asp:ListBox>
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksUpd" runat="server" meta:resourcekey="lblDetailRemarks" Text="Detail Remarks"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksUpd" runat="server" meta:resourcekey="txtDetailRemarksUpd" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnAddInspectionDetailUpd" runat="server" OnClick="btnAddDetail_Click"
                                    Text="Add" meta:resourcekey="btnAddInspectionDetailUpdResource1" />
                                <asp:Button ID="btnUpdateInspectionDetailUpd" runat="server" OnClick="btnUpdateInspectionDetail_Click"
                                    Text="Update" meta:resourcekey="btnUpdateInspectionDetailUpdResource1" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvInspectionDetailsUpd" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="DetailScheduleId" OnRowDeleting="GvInspectionDetailsIns_RowDeleting"
                                    OnSelectedIndexChanged="GvInspectionDetailsIns_SelectedIndexChanged" meta:resourcekey="GvInspectionDetailsUpdResource1">
                                    <Columns>
                                        <asp:BoundField DataField="Month" HeaderText="Month" meta:resourcekey="BoundFieldResource8" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource9" />
                                        <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" meta:resourcekey="BoundFieldResource10" />
                                        <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" meta:resourcekey="BoundFieldResource11" />
                                        <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource4" />
                                        <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource5" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
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
                                <asp:Button ID="btnUpdpYearlySaveUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdpYearlySaveUpdResource1" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvInspectionYearlyScheduleReadOnly" runat="server" DataKeyNames="ScheduleId" meta:resourcekey="FvInspectionYearlyScheduleReadOnlyResource1">
                <InsertItemTemplate>
                </InsertItemTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblScheduleHeaderReadOnly" runat="server" meta:resourcekey="lblScheduleHeaderReadOnly"
                                    SkinID="SubHeading" Text="Yearly Schedule Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblOfficerIdReadOnly" runat="server" meta:resourcekey="lblOfficerIdReadOnly"
                                    Text="Scheduling Officer"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlEmployeeIDReadOnly" runat="server" DataSourceID="OdsEmployeeMaster"
                                    DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlOfficerIdReadOnly"
                                    SelectedValue='<%# Bind("OfficerId") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblYearReadOnly" runat="server" meta:resourcekey="lblYearReadOnly"
                                    Text="Schedule year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearReadOnly" runat="server" meta:resourcekey="txtYearReadOnly"
                                    SkinID="Calendar" Text='<%# Bind("Year") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td align="left" colspan="6">
                                <asp:Label ID="lblAddScheduleDetails" runat="server" SkinID="Heading" Text="Schedule Details" meta:resourcekey="lblAddScheduleDetailsResource3"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblMonthReadOnly" runat="server" meta:resourcekey="lblMonthReadOnly"
                                    Text="Month"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 61px">
                                <asp:DropDownList ID="ddlMonthReadOnly" runat="server" meta:resourcekey="ddlMonth">
                                    <asp:ListItem Text="January" Value="1" meta:resourcekey="ListItemResource25"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2" meta:resourcekey="ListItemResource26"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3" meta:resourcekey="ListItemResource27"></asp:ListItem>
                                    <asp:ListItem Text="April" Value="4" meta:resourcekey="ListItemResource28"></asp:ListItem>
                                    <asp:ListItem Text="May" Value="5" meta:resourcekey="ListItemResource29"></asp:ListItem>
                                    <asp:ListItem Text="June" Value="6" meta:resourcekey="ListItemResource30"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                            <td align="left" class="labelColumn" style="height: 61px">
                                <asp:Label ID="lblReadOnlypectingOfficeIdReadOnly" runat="server" meta:resourcekey="lblReadOnlypectingOfficeIdReadOnly"
                                    Text="ReadOnlypecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" style="height: 61px">
                            </td>
                            <td class="validationColumn" style="height: 61px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksReadOnly" runat="server" meta:resourcekey="lblDetailRemarks" Text="Detail Remarks"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksReadOnly" runat="server" meta:resourcekey="txtDetailRemarksReadOnly" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnAddReadOnlypectionDetailReadOnly" runat="server" OnClick="btnAddDetail_Click"
                                    Text="Add" meta:resourcekey="btnAddReadOnlypectionDetailReadOnlyResource1" />
                                <asp:Button ID="btnUpdateReadOnlypectionDetailReadOnly" runat="server" Text="Update" meta:resourcekey="btnUpdateReadOnlypectionDetailReadOnlyResource1" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvReadOnlypectionDetailsReadOnly" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="DetailScheduleId" meta:resourcekey="GvReadOnlypectionDetailsReadOnlyResource1">
                                    <Columns>
                                        <asp:BoundField DataField="Month" HeaderText="Month" meta:resourcekey="BoundFieldResource12" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource13" />
                                        <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" meta:resourcekey="BoundFieldResource14" />
                                        <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" meta:resourcekey="BoundFieldResource15" />
                                        <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource6" />
                                        <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource7" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksReadOnly" runat="server" meta:resourcekey="lblRemarksReadOnly"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtRemarksReadOnly" runat="server" meta:resourcekey="txtRemarksReadOnly"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblCreatedByReadOnly" runat="server" meta:resourcekey="lblCreatedByReadOnly"
                                    Text="Created By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedByReadOnly" runat="server" meta:resourcekey="txtCreatedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedAtReadOnly" runat="server" meta:resourcekey="lblCreatedAtReadOnly"
                                    Text="Created At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedAtReadOnly" runat="server" meta:resourcekey="txtCreatedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedAt") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblModifiedByReadOnly" runat="server" meta:resourcekey="lblModifiedByReadOnly"
                                    Text="Modified By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedByReadOnly" runat="server" meta:resourcekey="txtModifiedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblModifiedAtReadOnly" runat="server" meta:resourcekey="lblModifiedAtReadOnly"
                                    Text="Modified At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedAtReadOnly" runat="server" meta:resourcekey="txtModifiedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedAt") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <br />
    <asp:ObjectDataSource ID="OdsOffices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetEmployeeDetails" TypeName="IGRSS.BusinessLogicLayer.Employee"></asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsFvInspection" runat="server"
        OnInserting="OdsFvInspection_Inserting" SelectMethod="GetInspectionYearlySchedule"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateYearlyInspection" DeleteMethod="DeleteInspectionCheckListMaster" InsertMethod="AddNewYearlyInspection" OnUpdating="OdsFvInspection_Updating">
        <SelectParameters>
            <asp:ControlParameter ControlID="GvYearlyInspection" Name="ScheduleId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleDetails" Type="Object" />
            <asp:Parameter Name="SelectedOffices" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleDetails" Type="Object" />
            <asp:Parameter Name="SelectedOffices" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsFvInspectionById" runat="server" InsertMethod="AddNewYearlyInspection"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetYearlyInspectionDetailsById"
        TypeName="IGRSS.BusinessLogicLayer.InspectionBLL" UpdateMethod="UpdateYearlyInspection">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleDetails" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleDetails" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvYearlyInspection" Name="ScheduleId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;<br />
    <asp:ObjectDataSource ID="OdsSearch" runat="server" InsertMethod="AddNewInspectionIternary"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetInspectionYearlyDetailsByOfficeName"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary" DeleteMethod="DeleteInspectionCheckListMaster">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="OfficerId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    &nbsp;<br />
    <br />
    <br />
</asp:Content>
