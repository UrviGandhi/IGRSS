<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Appeal_AppealHearing, App_Web_xbkidt4g" title="Appeal Hearing Process" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvAppealHearing" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearch" runat="server">
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblAppealHearing" runat="server" meta:resourcekey="lblAppealHearing"
                            SkinID="SubHeading" Text="Appeal Hearing Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblAppealNo" runat="server" Text="Enter Appeal No" meta:resourcekey="lblAppealNoResource1"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtAppealNo" runat="server" meta:resourcekey="txtAppealNoResource1"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                    </td>
                    <td class="labelColumn">
                        <asp:Label ID="lblApplicantName" runat="server" Text="Name" meta:resourcekey="lblAppealNoResource11"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtlApplicantName" runat="server" meta:resourcekey="txtAppealNoResource11"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                            meta:resourcekey="btnSearchResource1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gvAppealHearing" runat="server" AutoGenerateColumns="False" DataKeyNames="AppealApplicationId"
                            ShowFooter="True" OnSelectedIndexChanged="gvAppealHearing_SelectedIndexChanged"
                            meta:resourcekey="gvAppealHearingResource1" DataSourceID="odsSearch">
                            <Columns>
                                <asp:BoundField DataField="FileNo" HeaderText="Appeal No" SortExpression="FileNo" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DocumentNo" HeaderText="Appeal No" SortExpression="DocumentNo" Visible="False" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ApplicantName" HeaderText="Name" SortExpression="ApplicantName"
                                    meta:resourcekey="BoundFieldResource1" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppealYear" HeaderText="Appeal Year" SortExpression="AppealYear"
                                    meta:resourcekey="BoundFieldResource4" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InwardDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"
                                    HtmlEncode="False" SortExpression="InwardDate" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1">
                                    <ControlStyle Font-Bold="True" ForeColor="#C00000" />
                                </asp:CommandField>
                            </Columns>
                            <EmptyDataTemplate>
                                Record Not Found
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewAppealHearing" runat="server">
            <asp:FormView ID="fvAppeal" runat="server" DataKeyNames="AppealApplicationId" DataSourceID="odsAppealApplication"
                meta:resourcekey="fvAppealResource16" OnLoad="fvAppeal_Load">
                <ItemTemplate>
                    <table style="width: 100%; text-align: left;">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHVendorDetailItm" runat="server" meta:resourcekey="lblHVendorDetailItm"
                                    SkinID="SubHeading" Text="Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileNo" runat="server" Text="Appeal No"></asp:Label>
                            </td>
                            <td class="labelColumn" style="width: 92px">
                                <asp:Label ID="lblDisFileNo" runat="server" OnDataBinding="lblDisFileNo_DataBinding"></asp:Label>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameItm" runat="server" meta:resourcekey="lblApplicantNameItm"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td style="width: 92px">
                                <asp:TextBox ID="txtApplicantNameItm" runat="server" meta:resourcekey="txtApplicantNameItm"
                                    ReadOnly="True" Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label4" runat="server" meta:resourcekey="lblInwardDateItm" Text="Appeal Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="txtInwardDateItm" ReadOnly="True"
                                    SkinID="Calendar" Text='<%# Bind("InwardDate", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressItm" runat="server" meta:resourcekey="lblApplicantAddressItm"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtApplicantAddressItm" runat="server" meta:resourcekey="txtApplicantAddressItm"
                                    ReadOnly="True" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:FormView ID="fvAppealHearing" runat="server" DefaultMode="Insert" DataSourceID="odsFormview"
                OnItemInserting="fvAppealHearing_ItemInserting" meta:resourcekey="fvAppealHearingResource1"
                OnItemInserted="fvAppealHearing_ItemInserted">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHeadingItm" runat="server" meta:resourcekey="lblHeadingItm" SkinID="SubHeading"
                                    Text="Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHearingDate" runat="server" meta:resourcekey="lblHearingDate" Text="Hearing Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHearingDateItm" runat="server" meta:resourcekey="txtHearingDateItm"
                                    ReadOnly="True" Text='<%# Bind("HearingDate") %>' Width="20%"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksItm" TextMode="MultiLine" runat="server" meta:resourcekey="txtRemarksItm"
                                    ReadOnly="True" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" meta:resourcekey="chkJudgementResource2" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHeadingIns" runat="server" meta:resourcekey="lblHeadingIns" SkinID="SubHeading"
                                    Text="Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHearingDate" runat="server" meta:resourcekey="lblHearingDate" Text="Hearing Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHearingDateIns" runat="server" ReadOnly="True" meta:resourcekey="txtHearingDateIns"
                                    SkinID="Calendar" Text='<%# Bind("HearingDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtHearingDateIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="rfvHearingDateIns" runat="server" ControlToValidate="txtHearingDateIns"
                                    ErrorMessage="Please Enter Hearing Date" meta:resourcekey="rfvHearingDateIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksIns" runat="server" meta:resourcekey="txtRemarksIns" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvRemarksIns" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Please Enter Remarks" meta:resourcekey="rfvRemarksIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" Text="Judgement" Checked='<%# Bind("IsJudgement") %>'
                                    meta:resourcekey="chkJudgementResource1" OnCheckedChanged="chkJudgement_CheckedChanged"
                                    AutoPostBack="True" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDecisionType" runat="server" meta:resourcekey="lblDecisionType"
                                    Text="Decision Type" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDecisionType" runat="server" DataSourceID="odsDecisionType"
                                    DataTextField="AppealDecisionType" DataValueField="AppealDecisionTypeId" SelectedValue='<%# Bind("AppealDecisionType") %>'
                                    Visible="False" meta:resourcekey="ddlDecisionTypeResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelInsResource1" OnClick="btnCancelIns_Click" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblHeadingUpd" runat="server" meta:resourcekey="lblHeadingUpd" SkinID="SubHeading"
                                    Text="Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHearingDate" runat="server" meta:resourcekey="lblHearingDate" Text="Hearing Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHearingDateUpd" runat="server" meta:resourcekey="txtHearingDateUpd"
                                    ReadOnly="True" Text='<%# Bind("HearingDate") %>' Width="20%"></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateUpd" runat="server" Control="txtHearingDateUpd"
                                    meta:resourcekey="calInwardDateUpd" Move="True" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" ReadOnly="True"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" Text="Judgement" meta:resourcekey="chkJudgementResource3" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Button ID="btnUpdatetUpd" runat="server" CommandName="Update" Text="Update"
                                    meta:resourcekey="btnUpdatetUpdResource1" />
                                <asp:Button ID="btnCancelUpd" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
            <asp:GridView ID="viewHearingDetails" runat="server" AutoGenerateColumns="False"
                DataSourceID="odsHearingDetails" meta:resourcekey="viewHearingDetailsResource1">
                <Columns>
                    <asp:BoundField DataField="HearingDate" HeaderText="Hearing Date" DataFormatString="{0:dd/MM/yyyy}"
                        HtmlEncode="False" SortExpression="HearingDate" meta:resourcekey="BoundFieldResource5" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"
                        meta:resourcekey="BoundFieldResource6" >
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    Data Not Available
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>&nbsp;
    <asp:ObjectDataSource ID="odsSearch" runat="server" DataObjectTypeName="System.Guid"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealApplicationByAppealNo"
        TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication" InsertMethod="AddHighCourtJudgementDetails">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtlApplicantName" Name="ApplicantName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtAppealNo" Name="FileNo" PropertyName="Text" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="AppealApplicationId" Type="Object" />
            <asp:Parameter Name="HearingDate" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="IsJudgement" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFormview" runat="server" InsertMethod="AddAppealHearing"
        SelectMethod="GetAllHearingDetails" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
        OnInserting="odsFormview_Inserting" OldValuesParameterFormatString="original_{0}"
        OnInserted="odsFormview_Inserted" UpdateMethod="RejectAppealApplication">
        <InsertParameters>
            <asp:Parameter Name="AppealApplicationId" Type="Object" />
            <asp:Parameter Name="HearingDate" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="IsJudgement" Type="Boolean" />
            <asp:Parameter Name="AppealDecisionType" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsHearingDetails" runat="server" DataObjectTypeName="System.Guid"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHearingDetailsByAppealID"
        TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvAppealHearing" Name="AppealApplicationId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDecisionType" runat="server" InsertMethod="AddNewAppealDecision"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealDecisionMaster"
        TypeName="IGRSS.BusinessLogicLayer.AppealType" UpdateMethod="UpdateAppealDecisionMaster">
        <UpdateParameters>
            <asp:Parameter Name="AppealDecisionType" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="AppealDecisionTypeId" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="AppealDecisionType" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAppealApplication" runat="server" InsertMethod="AddAppealAplication"
        OldValuesParameterFormatString="{0}" SelectMethod="GetAppealApplicationByAppealID"
        TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="UpdateAppealAplication">
        <UpdateParameters>
            <asp:Parameter Name="parameter" Type="Object" />
            <asp:Parameter Name="dtAct" Type="Object" />
            <asp:Parameter Name="AppealApplicationId" Type="Object" />
            <asp:Parameter Name="AlertId" Type="Object" />
            <asp:Parameter Name="Verified" Type="Boolean" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvAppealHearing" Name="AppealApplicationId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="parameter" Type="Object" />
            <asp:Parameter Name="dtAct" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
