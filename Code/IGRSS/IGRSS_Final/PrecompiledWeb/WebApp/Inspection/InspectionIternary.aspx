<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inspection_InspectionIternary, App_Web_dvk3xubv" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvInspectionIternary" runat="server" ActiveViewIndex="4">
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvInspectionIternary" runat="server"
                DataSourceID="OdsIternaryById" OnItemInserting="FvInspectionIternary_ItemInserting"
                OnItemUpdating="FvInspectionIternary_ItemUpdating" DefaultMode="Insert" meta:resourcekey="FvInspectionIternaryResource1" OnDataBound="FvInspectionIternary_DataBound" OnItemInserted="FvInspectionIternary_ItemInserted">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInspectionIternaryIns" runat="server" meta:resourcekey="lblInspectionIternaryIns"
                                    SkinID="SubHeading" Text="Inspection Iternary Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblYearIns" runat="server" meta:resourcekey="lblMonthIns" Text="Month"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlMonthIns" runat="server" SelectedValue='<%# Bind("Month") %>' meta:resourcekey="ddlMonthInsResource1">
                                    <asp:ListItem Value="01" Selected="True" meta:resourcekey="ListItemResource1">January</asp:ListItem>
                                    <asp:ListItem Value="02" meta:resourcekey="ListItemResource2">February</asp:ListItem>
                                    <asp:ListItem Value="03" meta:resourcekey="ListItemResource3">March</asp:ListItem>
                                    <asp:ListItem Value="04" meta:resourcekey="ListItemResource4">April</asp:ListItem>
                                    <asp:ListItem Value="05" meta:resourcekey="ListItemResource5">May</asp:ListItem>
                                    <asp:ListItem Value="06" meta:resourcekey="ListItemResource6">June</asp:ListItem>
                                    <asp:ListItem Value="07" meta:resourcekey="ListItemResource7">July</asp:ListItem>
                                    <asp:ListItem Value="08" meta:resourcekey="ListItemResource8">August</asp:ListItem>
                                    <asp:ListItem Value="09" meta:resourcekey="ListItemResource9">September</asp:ListItem>
                                    <asp:ListItem Value="10" meta:resourcekey="ListItemResource10">October</asp:ListItem>
                                    <asp:ListItem Value="11" meta:resourcekey="ListItemResource11">November</asp:ListItem>
                                    <asp:ListItem Value="12" meta:resourcekey="ListItemResource12">December</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblInspectingDateIns" runat="server" meta:resourcekey="lblInspectingDateIns"
                                    Text="Inspecting Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInspectingDateIns" runat="server" meta:resourcekey="txtYearIns"
                                    ReadOnly="True" SkinID="Calendar" Text='<%# Bind("InspectingDate") %>'></asp:TextBox>&nbsp;
                                <rjs:PopCalendar ID="popInspectingDateIns" runat="server" Control="txtInspectingDateIns" meta:resourcekey="popInspectingDateInsResource1" From-Date="2008-01-01" To-Date="2008-12-31" WeekendMessage="Weekend!!!">
                                </rjs:PopCalendar>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateIns" runat="server" meta:resourcekey="lblEndDateIns" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEndDateIns" runat="server" meta:resourcekey="txtEndDateIns" SkinID="Calendar"
                                    ReadOnly="True" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="popEndDateIns" runat="server" Control="txtEndDateIns" meta:resourcekey="popEndDateInsResource1"></rjs:PopCalendar>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblInspectingOfficeIns" runat="server" meta:resourcekey="lblInspectingOfficeIns"
                                    Text="Inspecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlInspectingOfficeIns" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("InspectingOfficeId") %>' meta:resourcekey="ddlInspectingOfficeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksIns" runat="server" meta:resourcekey="lblDetailRemarks"
                                    Text="Iternary Details"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksIns" runat="server" meta:resourcekey="txtDetailRemarksIns" Text='<%# Bind("ItenaryDetails") %>' TextMode="MultiLine" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width: 3px">
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnInspIternarySaveIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInspIternarySaveInsResource1" /></td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblUpdpectionIternaryUpd" runat="server" meta:resourcekey="lblUpdpectionIternaryUpd"
                                    SkinID="SubHeading" Text="Updpection Iternary Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblMonthUpd" runat="server" meta:resourcekey="lblMonthUpd" Text="Month"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                 <asp:DropDownList ID="ddlMonthUpd" runat="server" SelectedValue='<%# Bind("Month") %>' meta:resourcekey="ddlMonthUpdResource2">
                                    <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource25">January</asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource26">February</asp:ListItem>
                                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource27">March</asp:ListItem>
                                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource28">April</asp:ListItem>
                                    <asp:ListItem Value="5" meta:resourcekey="ListItemResource29">May</asp:ListItem>
                                    <asp:ListItem Value="6" meta:resourcekey="ListItemResource30">June</asp:ListItem>
                                    <asp:ListItem Value="7" meta:resourcekey="ListItemResource31">July</asp:ListItem>
                                    <asp:ListItem Value="8" meta:resourcekey="ListItemResource32">August</asp:ListItem>
                                    <asp:ListItem Value="9" meta:resourcekey="ListItemResource33">September</asp:ListItem>
                                    <asp:ListItem Value="10 " meta:resourcekey="ListItemResource34">October</asp:ListItem>
                                    <asp:ListItem Value="11 " meta:resourcekey="ListItemResource35">November</asp:ListItem>
                                    <asp:ListItem Value="12 " meta:resourcekey="ListItemResource36">December</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn" >
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblUpdpectingDateUpd" runat="server" meta:resourcekey="lblUpdpectingDateUpd"
                                    Text="Updpecting Date"></asp:Label>
                            </td>
                            <td class="textColumn" >
                            <asp:TextBox ID="txtInspectingDateUpd" runat="server" meta:resourcekey="txtYearIns"
                                    ReadOnly="True" SkinID="Calendar" Text='<%# Bind("InspectingDate","{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="popInspectingDateUpd" runat="server" Control="txtInspectingDateUpd" meta:resourcekey="popInspectingDateInsResource1">
                                </rjs:PopCalendar>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateUpd" runat="server" meta:resourcekey="lblEndDateUpd" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                            <asp:TextBox ID="txtEndDateUpd" runat="server" meta:resourcekey="txtEndDateIns" SkinID="Calendar"
                                    ReadOnly="True" Text='<%# Bind("EndDate","{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="popEndDateUpd" runat="server" Control="txtEndDateUpd" meta:resourcekey="popEndDateInsResource1"></rjs:PopCalendar>
                            </td>
                            <td class="validationColumn" >
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblUpdpectingOfficeUpd" runat="server" meta:resourcekey="lblUpdpectingOfficeUpd"
                                    Text="Updpecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" >
                                <asp:DropDownList ID="ddlUpdpectingOfficeUpd" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("InspectingOfficeId") %>' meta:resourcekey="ddlUpdpectingOfficeUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksUpd" runat="server" meta:resourcekey="lblDetailRemarks"
                                    Text="Iternary Details"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksUpd" runat="server" meta:resourcekey="txtDetailRemarksUpd"
                                    Text='<%# Bind("ItenaryDetails") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td >
                            </td>
                            <td>
                            </td>
                            <td >
                                <asp:Button ID="btnIternaryUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnIternaryUpdResource1" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblItmpectionIternaryItm" runat="server" meta:resourcekey="lblItmpectionIternaryItm"
                                    SkinID="SubHeading" Text="Inspection Iternary Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblMonthItm" runat="server" meta:resourcekey="lblMonthItm" Text="Month"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                 <asp:DropDownList ID="ddlMonthUpd" runat="server" SelectedValue='<%# Bind("Month") %>' meta:resourcekey="ddlMonthUpdResource1">
                                    <asp:ListItem Value="01 " meta:resourcekey="ListItemResource13" Selected="True">January</asp:ListItem>
                                    <asp:ListItem Value="02 " meta:resourcekey="ListItemResource14">February</asp:ListItem>
                                    <asp:ListItem Value="03 " meta:resourcekey="ListItemResource15">March</asp:ListItem>
                                    <asp:ListItem Value="04 " meta:resourcekey="ListItemResource16">April</asp:ListItem>
                                    <asp:ListItem Value="05 " meta:resourcekey="ListItemResource17">May</asp:ListItem>
                                    <asp:ListItem Value="06 " meta:resourcekey="ListItemResource18">June</asp:ListItem>
                                    <asp:ListItem Value="07 " meta:resourcekey="ListItemResource19">July</asp:ListItem>
                                    <asp:ListItem Value="08 " meta:resourcekey="ListItemResource20">August</asp:ListItem>
                                    <asp:ListItem Value="09 " meta:resourcekey="ListItemResource21">September</asp:ListItem>
                                    <asp:ListItem Value="10 " meta:resourcekey="ListItemResource22">October</asp:ListItem>
                                    <asp:ListItem Value="11 " meta:resourcekey="ListItemResource23">November</asp:ListItem>
                                    <asp:ListItem Value="12 " meta:resourcekey="ListItemResource24">December</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="width: 3px">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblItmpectingDateItm" runat="server" meta:resourcekey="lblItmpectingDateItm"
                                    Text="Itmpecting Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtItmpectingDateItm" runat="server" meta:resourcekey="txtYearItm"
                                    SkinID="Calendar" Text='<%# Bind("InspectingDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 3px">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateItm" runat="server" meta:resourcekey="lblEndDateItm" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEndDateItm" runat="server" meta:resourcekey="txtEndDateItm" SkinID="Calendar"
                                    Text='<%# Bind("EndDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" >
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblItmpectingOfficeItm" runat="server" meta:resourcekey="lblItmpectingOfficeItm"
                                    Text="Itmpecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlItmpectingOfficeItm" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("InspectingOfficeId") %>' meta:resourcekey="ddlItmpectingOfficeItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" >
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksItm" runat="server" meta:resourcekey="lblDetailRemarks"
                                    Text="Iternary Details"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksItm" runat="server" meta:resourcekey="txtDetailRemarksItm" Text='<%# Bind("ItenaryDetails") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td >
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnItmpIternarySaveItm" runat="server" CommandName="Itmert" Text="Save"
                                    OnClick="btnItmpIternarySaveItm_Click" meta:resourcekey="btnItmpIternarySaveItmResource1" Visible="False"/>
                            </td>
                            <td >
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        <asp:GridView ID="GvInspectionIternaryIns" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ItenaryId" DataSourceID="odsitenaryIns"  meta:resourcekey="GvInspectionIternaryResource1" OnSelectedIndexChanged="GvInspectionIternaryIns_SelectedIndexChanged" EmptyDataText="No Data to Display!">
                        <Columns>
                            <asp:TemplateField HeaderText="Office" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OfficeName") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" Text='<%# Bind("OfficeName") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="InspectingDate" HeaderText="From Date" meta:resourcekey="BoundFieldResource1" />
                            <asp:BoundField DataField="EndDate" HeaderText="To Date" meta:resourcekey="BoundFieldResource2" />
                            <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" />
                            <asp:BoundField DataField="ItenaryId" Visible="False" meta:resourcekey="BoundFieldResource3" />
                        </Columns>
                    </asp:GridView>
        </asp:View>
        <asp:View ID="InspectionIternaryView" runat="server">
            <asp:GridView ID="GvInspectionIternaryView" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ScheduleId" DataSourceID="OdsYearlySchedule" OnSelectedIndexChanged="GvInspectionIternaryView_SelectedIndexChanged" meta:resourcekey="GvInspectionIternaryViewResource1">
                <Columns>
                    <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" meta:resourcekey="BoundFieldResource1" Visible="False" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="Year" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False"
                        HeaderText="Year" meta:resourcekey="BoundFieldResource3" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1">
                        <HeaderStyle Font-Bold="True" />
                    </asp:CommandField>
                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource2" ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItenaryId" runat="server" meta:resourcekey="lblItenaryIdResource1" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="GvInspectionIternary" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ItenaryId" DataSourceID="OdsInspectionIternary" OnSelectedIndexChanged="GvInspectionIternary_SelectedIndexChanged" meta:resourcekey="GvInspectionIternaryResource1">
                <Columns>
                    <asp:BoundField DataField="Month" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Day"
                        HtmlEncode="False" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="ItenaryDetails" HeaderText="ItenaryDetails" meta:resourcekey="BoundFieldResource5" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ItenaryId") %>' meta:resourcekey="TextBox1Resource3"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItenaryId") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:FormView ID="FvInspectionItenaryReadOnly" runat="server" DataSourceID="OdsInspectionIternary" meta:resourcekey="FvInspectionItenaryReadOnlyResource1">
                <InsertItemTemplate>
                </InsertItemTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblReadOnlypectionIternaryReadOnly" runat="server" meta:resourcekey="lblReadOnlypectionIternaryReadOnly"
                                    SkinID="SubHeading" Text="ReadOnlypection Iternary Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblMonthReadOnly" runat="server" meta:resourcekey="lblMonthReadOnly"
                                    Text="Month"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlMonthRo" runat="server" SelectedValue='<%# Bind("Month") %>' Enabled="False" meta:resourcekey="ddlMonthRoResource1">
                                    <asp:ListItem Value="01 " meta:resourcekey="ListItemResource37" Selected="True">January</asp:ListItem>
                                    <asp:ListItem Value="02 " meta:resourcekey="ListItemResource38">February</asp:ListItem>
                                    <asp:ListItem Value="03 " meta:resourcekey="ListItemResource39">March</asp:ListItem>
                                    <asp:ListItem Value="04 " meta:resourcekey="ListItemResource40">April</asp:ListItem>
                                    <asp:ListItem Value="05 " meta:resourcekey="ListItemResource41">May</asp:ListItem>
                                    <asp:ListItem Value="06 " meta:resourcekey="ListItemResource42">June</asp:ListItem>
                                    <asp:ListItem Value="07 " meta:resourcekey="ListItemResource43">July</asp:ListItem>
                                    <asp:ListItem Value="08 " meta:resourcekey="ListItemResource44">August</asp:ListItem>
                                    <asp:ListItem Value="09 " meta:resourcekey="ListItemResource45">September</asp:ListItem>
                                    <asp:ListItem Value="10 " meta:resourcekey="ListItemResource46">October</asp:ListItem>
                                    <asp:ListItem Value="11 " meta:resourcekey="ListItemResource47">November</asp:ListItem>
                                    <asp:ListItem Value="12 " meta:resourcekey="ListItemResource48">December</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn" style="width: 3px">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblReadOnlypectingDateReadOnly" runat="server" meta:resourcekey="lblReadOnlypectingDateReadOnly"
                                    Text="ReadOnlypecting Date"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtReadOnlypectingDateReadOnly" runat="server" meta:resourcekey="txtYearReadOnly"
                                    SkinID="Calendar" Text='<%# Bind("InspectingDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateReadOnly" runat="server" meta:resourcekey="lblEndDateReadOnly"
                                    Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEndDateReadOnly" runat="server" meta:resourcekey="txtEndDateReadOnly"
                                    SkinID="Calendar" Text='<%# Bind("EndDate","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 61px; width: 3px;">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblReadOnlypectingOfficeReadOnly" runat="server" meta:resourcekey="lblReadOnlypectingOfficeReadOnly"
                                    Text="ReadOnlypecting Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" style="width: 25%">
                                <asp:DropDownList ID="ddlReadOnlypectingOfficeReadOnly" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("InspectingOfficeId") %>' meta:resourcekey="ddlReadOnlypectingOfficeReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblDetailRemarksReadOnly" runat="server" meta:resourcekey="lblDetailRemarks"
                                    Text="Iternary Details"></asp:Label>
                            </td>
                            <td align="left" class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailRemarksReadOnly" runat="server" meta:resourcekey="txtDetailRemarksReadOnly" Text='<%# Bind("ItenaryDetails") %>' TextMode="MultiLine"></asp:TextBox>
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtCreatedAtReadOnly" runat="server" meta:resourcekey="txtCreatedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedAt","{0:d}") %>'></asp:TextBox>
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtModifiedAtReadOnly" runat="server" meta:resourcekey="txtModifiedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedAt","{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblIsDeletedReadOnly" runat="server" meta:resourcekey="lblIsDeletedReadOnly"
                                    Text="Is Deleted" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeletedByReadOnly" runat="server" meta:resourcekey="lblDeletedByReadOnly"
                                    Text="Deleted By"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtDeletedByReadOnly" runat="server" meta:resourcekey="txtDeletedByReadOnly"
                                    ReadOnly="True" ></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblDeletedAtReadOnly" runat="server" meta:resourcekey="lblDeletedAtReadOnly"
                                    Text="Deleted At" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeletedAtReadOnly" runat="server" meta:resourcekey="txtDeletedAtReadOnly"
                                    ></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn" style="width: 25%">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
        </asp:View>
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
                        &nbsp;<asp:Button ID="btnSearchAppNo" runat="server" Text="Search" Width="61px" meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GvYearlyInspection" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ScheduleId" DataSourceID="OdsSearch" OnSelectedIndexChanged="GvYearlyInspection_SelectedIndexChanged"
                Width="100%" meta:resourcekey="GvYearlyInspectionResource1">
                <Columns>
                    <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" Visible="False" meta:resourcekey="BoundFieldResource6" />
                    <asp:BoundField DataField="Year" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource7" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource8" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource3" />
                </Columns>
                <EmptyDataTemplate>
                    Record Not Found
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:ObjectDataSource ID="OdsSearch" runat="server" DeleteMethod="DeleteInspectionCheckListMaster"
                InsertMethod="AddNewInspectionIternary" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInspectionYearlyDetailsByOfficeName" TypeName="IGRSS.BusinessLogicLayer.Inspection"
                UpdateMethod="UpdateInspectionItenary">
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
            <asp:GridView ID="GvInspectionDetails" runat="server" AutoGenerateColumns="False"
                DataKeyNames="DetailScheduleId" OnSelectedIndexChanged="GvInspectionDetailsIns_SelectedIndexChanged" meta:resourcekey="GvInspectionDetailsResource1">
                <Columns>
                    <asp:BoundField DataField="MonthText" HeaderText="Month" meta:resourcekey="BoundFieldResource9" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" meta:resourcekey="BoundFieldResource10" />
                    <asp:BoundField DataField="OfficeName" HeaderText="OfficeName" meta:resourcekey="BoundFieldResource11" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource4" />
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView><br />
    <asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster" SelectMethod="GetEmployeeDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateEmployeeMaster">
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="Parameters" Type="Object" />
            <asp:Parameter Name="QualificationDetails" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="dtQualification" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsYearlySchedule" runat="server"
        InsertMethod="AddNewInspectionTypeMaster"
        SelectMethod="GetYearlyInspectionDetails" TypeName="IGRSS.BusinessLogicLayer.Inspection" DeleteMethod="DeleteInspectionCheckListMaster" UpdateMethod="UpdateInspectionItenary">
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsIternaryById" runat="server" InsertMethod="AddNewInspectionIternary"
        OnInserting="OdsIternaryById_Inserting" SelectMethod="GetInspectionIternaryByScheduleItenId"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" OnUpdating="OdsIternaryById_Updating"
        UpdateMethod="UpdateInspectionItenary" DeleteMethod="DeleteInspectionCheckListMaster" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldScheduleId" Name="ScheduleId" PropertyName="Value"
                Type="Object" />
            <asp:ControlParameter ControlID="fldItenaryId" Name="IternaryId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    &nbsp;<br />
    <asp:ObjectDataSource ID="OdsInspectionIternary" runat="server" InsertMethod="AddNewInspectionIternary" SelectMethod="GetInspectionIternaryByScheduleID"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" DeleteMethod="DeleteInspectionCheckListMaster" UpdateMethod="UpdateInspectionItenary">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvInspectionIternaryView" Name="ScheduleID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource><asp:ObjectDataSource ID="odsitenaryIns" runat="server" InsertMethod="AddNewInspectionIternary" SelectMethod="GetInspectionIternaryByScheduleId"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" DeleteMethod="DeleteInspectionCheckListMaster" UpdateMethod="UpdateInspectionItenary" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="CheckListId" Type="Object" />
            <asp:Parameter Name="InspectionTypeId" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ItenaryId" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="fldScheduleId" Name="ScheduleID" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ScheduleId" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldScheduleId" runat="server" />
    <asp:HiddenField ID="fldItenaryId" runat="server" />
</asp:Content>
