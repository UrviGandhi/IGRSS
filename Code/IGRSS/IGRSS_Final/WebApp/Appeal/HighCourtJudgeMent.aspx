<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="HighCourtJudgeMent.aspx.cs" Inherits="Appeal_HighCourtJudgeMent" Title="Untitled Page"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvHighCourtJudgeMentDetails" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearch" runat="server">
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblHighCourtJudgeMentDetails" runat="server" meta:resourcekey="lblHighCourtJudgeMentDetails"
                            SkinID="SubHeading" Text="High Court JudgeMent Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn" style="height: 26px">
                        <asp:Label ID="lblAppealNo" runat="server" Text="Enter Appeal No" meta:resourcekey="lblAppealNoResource1"></asp:Label>
                    </td>
                    <td class="textColumn" style="height: 26px">
                        <asp:TextBox ID="txtAppealNo" runat="server" meta:resourcekey="txtAppealNoResource1"></asp:TextBox>
                    </td>
                    <td class="validationColumn" style="height: 26px">
                    </td>
                    <td class="labelColumn" style="height: 26px">
                        <asp:Label ID="lblCaseNo" runat="server" Text="Case No" meta:resourcekey="lblCaseNo"></asp:Label>
                    </td>
                    <td class="textColumn" style="height: 26px">
                        <asp:TextBox ID="txtcaseNo" runat="server" meta:resourcekey="txtcaseNo"></asp:TextBox>
                    </td>
                    <td class="validationColumn" style="height: 26px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAppName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAppName" runat="server"></asp:TextBox>
                    </td>
                    <td class="validationColumn" colspan="4">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" colspan="6" style="height: 16px">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" meta:resourcekey="btnSearchResource1"
                            OnClick="btnSearch_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gvAppealHearing" runat="server" AutoGenerateColumns="False" DataKeyNames="AppealApplicationId"
                            ShowFooter="True" OnSelectedIndexChanged="gvAppealHearing_SelectedIndexChanged"
                            meta:resourcekey="gvAppealHearingResource1" DataSourceID="odsHighCourtDetails">
                            <Columns>
                                <asp:BoundField DataField="FileNo" HeaderText="File No" SortExpression="FileNo" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DocumentNo" HeaderText="Appeal No" SortExpression="DocumentNo" >
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
        
        <asp:View ID="viewHighCourtAppealDetails" runat="server">
    
            <asp:FormView ID="fvHighCourtDetails" runat="server" DataSourceID="odsHighCourt"
                DataKeyNames="AppealApplicationId" OnPageIndexChanging="fvHighCourtDetails_PageIndexChanging"
                meta:resourcekey="fvHighCourtDetailsResource1" OnDataBound="fvHighCourtDetails_DataBound"
                OnLoad="fvHighCourtDetails_Load">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCoIns" runat="server" meta:resourcekey="lblCoIns" SkinID="SubHeading"
                                    Text="High Court Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtNoIns" runat="server" meta:resourcekey="lblCourtNoIns" Text="Court No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCourtNoIns" runat="server" meta:resourcekey="txtCourtNoIns" Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearIns" runat="server" meta:resourcekey="lblYearIns" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearIns" runat="server" MaxLength="4" meta:resourcekey="txtYearIns"
                                    ReadOnly="True" Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfAppealIns" runat="server" meta:resourcekey="lblDateOfAppealIns"
                                    Text="Date Of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDateOfAppealIns" runat="server" meta:resourcekey="txtDateOfAppealIns"
                                    Text='<%# Bind("AffidavitDate") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCoItm" runat="server" meta:resourcekey="lblCoItm" SkinID="SubHeading"
                                    Text="High Court Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtNoItm" runat="server" meta:resourcekey="lblCourtNoItm" Text="Court No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCourtNoItm" runat="server" ReadOnly="True" meta:resourcekey="txtCourtNoItm"
                                    Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearItm" runat="server" meta:resourcekey="lblYearItm" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearItm" runat="server" MaxLength="4" meta:resourcekey="txtYearItm"
                                    ReadOnly="True" Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfAppealItm" runat="server" meta:resourcekey="lblDateOfAppealItm"
                                    Text="Date Of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDateOfAppealItm" runat="server" ReadOnly="True" meta:resourcekey="txtDateOfAppealItm"
                                    Text='<%# Bind("AffidavitDate", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCoUpd" runat="server" meta:resourcekey="lblCoUpd" SkinID="SubHeading"
                                    Text="High Court Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtNoUpd" runat="server" meta:resourcekey="lblCourtNoUpd" Text="Court No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCourtNoUpd" runat="server" meta:resourcekey="txtCourtNoUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearUpd" runat="server" meta:resourcekey="lblYearUpd" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearUpd" runat="server" MaxLength="4" meta:resourcekey="txtYearUpd"
                                    ReadOnly="True" Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfAppealUpd" runat="server" meta:resourcekey="lblDateOfAppealUpd"
                                    Text="Date Of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDateOfAppealUpd" runat="server" meta:resourcekey="txtDateOfAppealUpd"></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateUpd" runat="server" Control="txtHearingDateUpd"
                                    meta:resourcekey="calInwardDateUpd" Move="True" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnUpdertUpd" runat="server" CommandName="Update" Text="Save" meta:resourcekey="btnUpdertUpdResource1" />
                                <asp:Button ID="btnCancelUpd" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No Record Found!
                </EmptyDataTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsHighCourtDetails" runat="server" DataObjectTypeName="System.Guid"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHighCourtDetails"
                TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication" InsertMethod="AddHighCourtJudgementDetails">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAppealNo" Name="FileNo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtcaseNo" Name="CaseNo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtAppName" Name="ApplicantName" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <table width="100%">
                <tr>
                    <td colspan="6" align="center">
                        <asp:Button ID="btnAddHighCourtDetailsIns" runat="server" Text="Add High Court Judgement"
                            meta:resourcekey="btnAddHighCourtDetailsIns" OnClick="btnAddHighCourtDetailsIns_Click"
                            Width="182px" /></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewHighCourtJudgement" runat="server">
               <asp:FormView ID="fvAppeal" runat="server" DataKeyNames="AppealApplicationId" DataSourceID="odsAppealApplication"
                meta:resourcekey="fvAppealResource16">
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
                                <asp:Label ID="lblFileNo" runat="server" Text="File No"></asp:Label>
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
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblExistingJudgementDetails" runat="server" meta:resourcekey="lblExistingJudgementDetails"
                            SkinID="SubHeading" Text="Existing Judgement Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gvExtJugDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="AppealApplicationId"
                            DataSourceID="odsJudgementDetails" meta:resourcekey="gvExtJugDetailsResource1">
                            <Columns>
                                <asp:BoundField DataField="HearingDate" DataFormatString="{0:dd-MMM-yy}" HtmlEncode="False"
                                    HeaderText="Hearing Date" SortExpression="HearingDate" meta:resourcekey="BoundFieldResource1" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"
                                    meta:resourcekey="BoundFieldResource4" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:FormView ID="fvHighCourtJudgement" runat="server" DataSourceID="odsHighCourt"
                OnItemInserting="fvHighCourtJudgement_ItemInserting" meta:resourcekey="fvHighCourtJudgementResource1"
                OnItemInserted="fvHighCourtJudgement_ItemInserted">
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
                                    ReadOnly="True"  Width="20%"></asp:TextBox>
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
                                    ReadOnly="True" ></asp:TextBox>
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
                                <asp:TextBox ID="txtHearingDateIns" runat="server" meta:resourcekey="txtHearingDateIns"
                                    SkinID="Calendar" Text='<%# Bind("HearingDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtHearingDateIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="regPhonedate" runat="server" ControlToValidate="txtHearingDateIns"
                                    ErrorMessage="Please Enter Date" meta:resourcekey="regPhonedateResource1">
							*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Judgement Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksIns" runat="server" meta:resourcekey="txtRemarksIns" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rgvalidatedateins" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Please Enter Remarks" meta:resourcekey="rgvalidatedateinsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkJudgement" runat="server" Text="Judgement" Checked='<%# Bind("IsJudgement") %>'
                                    meta:resourcekey="chkJudgementResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelInsResource1" />
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
                                <asp:Label ID="lblHaringDate" runat="server" meta:resourcekey="lblHearingDate" Text="Hearing Date"></asp:Label>
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
                                <asp:CheckBox ID="chkudgement" runat="server" Text="Judgement" meta:resourcekey="chkJudgementResource3" />
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
            <asp:ObjectDataSource ID="odsJudgementDetails" runat="server" DataObjectTypeName="System.Guid"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHighCourtJudgeMentDetails"
                TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHighCourtDetails" Name="AppealApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsAddJudgementDetails" runat="server" InsertMethod="AddHighCourtJudgementDetails"
                SelectMethod="GetHighCourtJudgeMentDetails" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                OnInserting="odsAddJudgementDetails_Inserting" UpdateMethod="RejectAppealApplication"
                OnInserted="odsAddJudgementDetails_Inserted">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHighCourtDetails" Name="AppealApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsHighCourt" runat="server"
                InsertMethod="AddHighCourtJudgementDetails"
                SelectMethod="GetHighCourtDetailsByAppealApplicationId" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                UpdateMethod="RejectAppealApplication" OnInserted="odsHighCourt_Inserted">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvAppealHearing" Name="AppealApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            &nbsp;
            &nbsp;&nbsp;
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
        </asp:View>
        <asp:View ID="viewCCRADetails" runat="server">
            <asp:FormView ID="fvCCRADetails" runat="server" DefaultMode="Insert" meta:resourcekey="fvCCRADetailsResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="CCRADetailsIns" runat="server" meta:resourcekey="lblCCRADetailsIns"
                                    SkinID="SubHeading" Text="CCRA Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCCRADetailsIns" runat="server" meta:resourcekey="lblCCRADetailsIns"
                                    Text="CCRA Details"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtCCRADetailsIns" runat="server" meta:resourcekey="txtCCRADetailsIns"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfReferenceIns" runat="server" meta:resourcekey="lblDateOfReferenceIns"
                                    Text="Reference Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfReferenceIns" runat="server" SkinID="Calendar" meta:resourcekey="DateOfReferenceIns"></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtDateOfReferenceIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertInsResource1" />
                                <asp:Button ID="btnCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="btnCancelInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
