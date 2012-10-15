<%@ Page AutoEventWireup="true" CodeFile="AppealApplication.aspx.cs" Culture="auto"
    Inherits="Appeal_AppealApplication" Language="C#" MasterPageFile="~/IGRSS_Default.master"
    meta:resourcekey="PageAppealApplication" Title="Appeal Application" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">

    <script type="text/javascript">
function ShowAppealFeesDetails(checkboxId){
        
        var chkAppealFeesDetails=document.getElementById(checkboxId);
        if(chkAppealFeesDetails.checked){
        document.getElementById("trAppeaFeesetails").style.display="inline-block";
        }
       else
       {
         document.getElementById("trAppeaFeesetails").style.display="none";
     
       }
      }
    </script>

    <asp:MultiView ID="mvAppealType" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewSearch" runat="server">
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblAppealRegistartion" runat="server" meta:resourcekey="lblAppealRegistartion"
                            SkinID="SubHeading" Text="Appeal Registration Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblAppealNo" runat="server" Text="Enter Appeal No" meta:resourcekey="lblAppealNoResource1"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtAppealNo" runat="server" meta:resourcekey="txtAppealNoResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6" style="height: 26px">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                            meta:resourcekey="btnSearchResource1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvAppeal" runat="server" AutoGenerateColumns="False" DataKeyNames="AppealApplicationId"
                OnSelectedIndexChanged="gvAppeal_SelectedIndexChanged" ShowFooter="True" OnPageIndexChanging="gvAppeal_PageIndexChanging"
                meta:resourcekey="gvAppealResource1" DataSourceID="odsGetApplicantDtl">
                <Columns>
                    <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" SortExpression="ApplicantName"
                        meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"
                        meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="RegistrationNo" HeaderText="Appeal No" SortExpression="RegistrationNo"
                        meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="AppealYear" HeaderText="Appeal Year" SortExpression="AppealYear"
                        meta:resourcekey="BoundFieldResource4" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1">
                        <ControlStyle Font-Bold="True" ForeColor="#C00000" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:HiddenField ID="fldAppealApplicationId" runat="server" />
        </asp:View>
        <asp:View ID="viewFormView" runat="server">
            <asp:FormView ID="fvAppeal" runat="server" DataKeyNames="AppealApplicationId" DataSourceID="odsAppealApplication"
                DefaultMode="Insert" OnItemCommand="fvAppeal_ItemCommand" OnItemInserting="fvAppeal_ItemInserting"
                OnItemUpdated="fvAppeal_ItemUpdated" OnItemUpdating="fvAppeal_ItemUpdating" OnPageIndexChanging="fvAppeal_PageIndexChanging"
                OnLoad="fvAppeal_Load" meta:resourcekey="fvAppealResource1" OnItemInserted="fvAppeal_ItemInserted1">
                <ItemTemplate>
                    <table style="width: 100%; text-align: left;">
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblFileDetailsHeaderItm" runat="server" meta:resourcekey="lblFileDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Appeal Application Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 26px">
                                <asp:Label ID="lblFileNoItm" runat="server" meta:resourcekey="lblFileNoItm" Text="Appeal
    No"></asp:Label>
                            </td>
                            <td class="textColumn" align="left" style="height: 26px">
                                <asp:Label ID="lblFileNoRO" runat="server" Text='<%# Eval("FileNo") %>' meta:resourcekey="lblFileNoROResource1"></asp:Label></td>
                            <td class="validationColumn" style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdItm" runat="server" meta:resourcekey="lblOfficeIdItm" Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOfficeIdItm" runat="server" meta:resourcekey="txtOfficeIdItm"
                                    ReadOnly="True" Text='<%# Bind("OfficeName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantDetailsHeaderItm" runat="server" meta:resourcekey="lblApplicantDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameItm" runat="server" meta:resourcekey="lblApplicantNameItm"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtApplicantNameItm" runat="server" meta:resourcekey="txtApplicantNameItm"
                                    ReadOnly="True" Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressItm" runat="server" meta:resourcekey="lblApplicantAddressItm"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtApplicantAddressItm" runat="server" meta:resourcekey="txtApplicantAddressItm"
                                    ReadOnly="True" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkIsPaidAppealFeeItm" Enabled="False" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                                    meta:resourcekey="chkIsPaidAppealFeeItm" SkinID="SubHeading" Text="Is Appeal Fee Paid" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeReceiptNoItm" runat="server" meta:resourcekey="lblFeeReceiptNoItm"
                                    Text="Receipt Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFeeReceiptNoItm" runat="server" meta:resourcekey="txtFeeReceiptNoItm"
                                    ReadOnly="True" Text='<%# Bind("FeeReceiptNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountItm" runat="server" meta:resourcekey="lblAmountItm" Text="Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmountItm" runat="server" meta:resourcekey="txtAmountItm" ReadOnly="True"
                                    Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDetailsHeaderItm" runat="server" meta:resourcekey="lblAppealDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfAppealItm" runat="server" meta:resourcekey="lblTypeOfAppealItm"
                                    Text="Type of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAppealItm" ReadOnly="True" runat="server" meta:resourcekey="txtAppealItm"
                                    Text='<%# Bind("AppealName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoItm" runat="server" meta:resourcekey="lblRegistrationNoItm"
                                    Text="Appeal No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoItm" runat="server" meta:resourcekey="txtRegistrationNoItm"
                                    ReadOnly="True" Text='<%# Bind("RegistrationNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalculatedAmountItm" runat="server" meta:resourcekey="lblCalculatedAmountItm"
                                    Text="Calculated Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCalculatedAmountItm" runat="server" meta:resourcekey="txtCalculatedAmountItm"
                                    ReadOnly="True" Text='<%# Bind("CalculatedAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepositAmountItm" runat="server" meta:resourcekey="lblDepositAmountItm"
                                    Text="Deposit Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDepositAmountItm" runat="server" meta:resourcekey="txtDepositAmountItm"
                                    ReadOnly="True" Text='<%# Bind("DepositAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblInwardDateItm" runat="server" meta:resourcekey="lblInwardDateItm"
                                    Text="Inward Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInwardDateItm" runat="server" meta:resourcekey="txtInwardDateItm"
                                    ReadOnly="True" SkinID="Calendar" Text='<%# Bind("InwardDate", "{0:d}") %>' OnDataBinding="txtInwardDateItm_DataBinding"
                                    OnTextChanged="txtInwardDateItm_TextChanged"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtFeeTicketItm" runat="server" meta:resourcekey="lblCourtFeeTicketItm"
                                    Text="Court Fee Ticket Pasted?"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkCourtFeeTicketItm" Enabled="False" runat="server" meta:resourcekey="chkCourtFeeTicketItm"
                                    Checked='<%# Bind("CourtFeeTicket") %>' />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPaperFromToItm" runat="server" meta:resourcekey="lblPaperFromToItm"
                                    Text="Paper From To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPaperFromToItm" runat="server" meta:resourcekey="txtPaperFromToItm"
                                    ReadOnly="True" Text='<%# Bind("PaperFromTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealIntimeItm" runat="server" meta:resourcekey="lblAppealIntimeItm"
                                    Text="Appeal In Time"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="5">
                                <asp:CheckBox ID="ChkAppealIntimeItm" runat="server" Checked='<%# Bind("AppealInTime") %>'
                                    meta:resourcekey="ChkAppealIntimeItm" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealActsHeadingItm" runat="server" meta:resourcekey="lblAppealActsHeadingItm"
                                    SkinID="SubHeading" Text="Appeal Section"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 37px">
                                <asp:Label ID="lblAppealActItm" runat="server" Text="Appeal Act" meta:resourcekey="lblAppealActItmResource1"></asp:Label></td>
                            <td style="height: 37px">
                                <asp:ListBox ID="liAppealActItm" runat="server" Enabled="False" Width="140px" DataSourceID="odsGetAppealActs"
                                    DataTextField="ActName" DataValueField="ActId" meta:resourcekey="liAppealActItmResource1">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealRemarksHeadingItm" runat="server" meta:resourcekey="lblAppealRemarksHeadingItm"
                                    SkinID="SubHeading" Text="Appeal Application Remarks"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:TextBox ID="txtAppealRemarksHeadingItm" runat="server" meta:resourcekey="txtAppealRemarksHeadingItm"
                                    ReadOnly="True" TextMode="MultiLine" Text='<%# Bind("AppealRemarks") %>' Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <uc1:FileForward ID="FileForward1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4" style="height: 26px">
                                <asp:Button ID="InsertButton" runat="server" CommandName="ApproveAppealApplication"
                                    Text="Approve" meta:resourcekey="InsertButtonResource1" />
                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="RejectAppealApplication"
                                    Text="Reject" meta:resourcekey="InsertCancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table style="width: 100%; text-align: left;">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" SkinID="SubHeading" Text="Appeal Application Details"
                                    meta:resourcekey="lblFileDetailsHeaderInsResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblFIle" runat="server" Text="File Number" meta:resourcekey="lblFIleResource1"></asp:Label></td>
                            <td align="left" class="textColumn">
                                <asp:Label ID="lblaplFileNo" runat="server" Text='<%# Eval("FileNo") %>' meta:resourcekey="lblaplFileNoResource1"></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                            </td>
                            <td align="left" class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblDocumentNo" runat="server" Text="Document No" meta:resourcekey="lblDocumentNoResource2"></asp:Label></td>
                            <td align="left" class="textColumn">
                                <asp:TextBox ID="txtDocumentNo" runat="server" Text='<%# Bind("DocumentNo") %>' meta:resourcekey="txtDocumentNoResource2"
                                    MaxLength="30"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td align="left" class="labelColumn">
                                <asp:Label ID="lblOfficeIdIns" runat="server" meta:resourcekey="lblOfficeIdIns" Text="Office Id"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:DropDownList ID="ddlOfficeIdIns" runat="server" meta:resourcekey="ddlOfficeIdInsResource1"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
                                    OnLoad="ddlOfficeIdIns_Load1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOriginalSRO" runat="server" Text="Original SRO" meta:resourcekey="lblOriginalSROResource2"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOriginalSRO" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OriginalSRO") %>'
                                    meta:resourcekey="ddlOriginalSROResource2">
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblDocumentDate" runat="server" Text="Document Date" meta:resourcekey="lblDocumentDateResource2"></asp:Label></td>
                            <td align="left" class="textColumn">
                                <asp:TextBox ID="txtDocumentdate" runat="server" Text='<%# Bind("DocumentDate", "{0:d}") %>'
                                    ReadOnly="True" Width="80%" meta:resourcekey="txtDocumentdateResource2"></asp:TextBox>&nbsp;<rjs:PopCalendar
                                        ID="calDocumentDate" runat="server" Control="txtDocumentdate" meta:resourcekey="calDocumentDateResource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" Text="Document Date" meta:resourcekey="lblDocumentDateResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" meta:resourcekey="txtDocumentdateResource1"
                                    Text='<%# Bind("DaTeOffOrderFromCollector", "{0:d}") %>'></asp:TextBox>&nbsp;<rjs:PopCalendar
                                        ID="PopCalendar2" runat="server" Control="TextBox1" meta:resourcekey="calDocumentDateResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantDetailsHeaderIns" runat="server" meta:resourcekey="lblApplicantDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
                                    Text='<%# Bind("ApplicantName") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressIns" runat="server" meta:resourcekey="lblApplicantAddressIns"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtApplicantAddressIns" runat="server" meta:resourcekey="txtApplicantAddressIns"
                                    Text='<%# Bind("Address") %>' TextMode="MultiLine" MaxLength="150"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkIsPaidAppealFeeIns" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                                    meta:resourcekey="chkIsPaidAppealFeeIns" SkinID="SubHeading" Text="Is Appeal Fee Paid" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeReceiptNoIns" runat="server" meta:resourcekey="lblFeeReceiptNoIns"
                                    Text="Receipt Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFeeReceiptNoIns" runat="server" meta:resourcekey="txtFeeReceiptNoIns"
                                    Text='<%# Bind("FeeReceiptNo") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountIns" runat="server" meta:resourcekey="lblAmountIns" Text="Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmountIns" runat="server" meta:resourcekey="txtAmountIns" Text='<%# Bind("Amount") %>'
                                    MaxLength="9"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDetailsHeaderIns" runat="server" meta:resourcekey="lblAppealDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfAppealIns" runat="server" meta:resourcekey="lblTypeOfAppealIns"
                                    Text="Type of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTypeOfAppealIns" runat="server" DataSourceID="odsGetAppealType"
                                    SelectedValue='<%# Bind("TypeOfAppeal") %>' DataTextField="AppealName" DataValueField="AppealTypeId"
                                    meta:resourcekey="ddlTypeOfAppealInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblRegistrationNoIns" runat="server" meta:resourcekey="lblRegistrationNoIns"
                                    Text="Appeal No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoIns" runat="server" meta:resourcekey="txtRegistrationNoIns"
                                    Text='<%# Bind("RegistrationNo") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 28px">
                                <asp:Label ID="lblCalculatedAmountIns" runat="server" meta:resourcekey="lblCalculatedAmountIns"
                                    Text="Calculated Amount"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 28px">
                                <asp:TextBox ID="txtCalculatedAmountIns" runat="server" meta:resourcekey="txtCalculatedAmountIns"
                                    Text='<%# Bind("CalculatedAmount") %>' MaxLength="9"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%; height: 28px">
                            </td>
                            <td class="labelColumn" style="width: 23%; height: 28px;">
                                <asp:Label ID="lblDepositAmountIns" runat="server" meta:resourcekey="lblDepositAmountIns"
                                    Text="Deposit Amount"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 28px">
                                <asp:TextBox ID="txtDepositAmountIns" runat="server" meta:resourcekey="txtDepositAmountIns"
                                    Text='<%# Bind("DepositAmount") %>' MaxLength="9"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%; height: 28px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeficitAmountIns" runat="server" meta:resourcekey="lblDeficitAmountIns"
                                    Text="Deficit Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeficitAmountIns" runat="server" meta:resourcekey="txtDeficitAmountIns"
                                    Text='<%# Bind("DficitAmount") %>' MaxLength="9"></asp:TextBox>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn" style="height: 50px">
                                    <asp:Label ID="lblInwardDateIns" runat="server" meta:resourcekey="lblInwardDateIns"
                                        Text="Received  Date"></asp:Label>
                                </td>
                                <td class="textColumn" style="height: 50px">
                                    <asp:TextBox ID="txtInwardDateIns" runat="server" meta:resourcekey="txtInwardDateIns"
                                        SkinID="Calendar" Text='<%# Bind("InwardDate", "{0:d}") %>' OnDataBinding="txtInwardDateIns_DataBinding"
                                        ReadOnly="True"></asp:TextBox>
                                    <rjs:PopCalendar ID="calInwardDateIns" runat="server" meta:resourcekey="calInwardDateIns"
                                        Move="True" Control="txtInwardDateIns" />
                                </td>
                                <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label2" runat="server" Text="Receipt Number" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtreciptNo" runat="server" Text='<%# Bind("ReceiptNo") %>' MaxLength="15"
                                    meta:resourcekey="txtreciptNoResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="height: 50px">
                                <asp:Label ID="Label3" runat="server" Text="Receipt Date" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td class="textColumn" style="height: 50px">
                                <asp:TextBox ID="txtRecieptDate" runat="server" ReadOnly="True" Text='<%# Bind("ReceiptDate", "{0:d}") %>'
                                    Width="79%" meta:resourcekey="txtRecieptDateResource1"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" meta:resourcekey="calInwardDateIns"
                                    Move="True" Control="txtRecieptDate" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 35px">
                                <asp:Label ID="lblCourtFeeTicketIns" runat="server" meta:resourcekey="lblCourtFeeTicketIns"
                                    Text="Court Fee Ticket Pasted?"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 35px">
                                <asp:CheckBox ID="chkCourtFeeTicketIns" runat="server" meta:resourcekey="chkCourtFeeTicketIns"
                                    Checked='<%# Bind("CourtFeeTicket") %>' />
                            </td>
                            <td class="validationColumn" style="width: 2%; height: 35px;">
                            </td>
                            <td class="labelColumn" style="width: 23%; height: 35px;">
                                <asp:Label ID="lblPaperFromToIns" runat="server" meta:resourcekey="lblPaperFromToIns"
                                    Text="Paper From To"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 35px">
                                <asp:TextBox ID="txtPaperFromToIns" runat="server" meta:resourcekey="txtPaperFromToIns"
                                    Text='<%# Bind("PaperFromTo") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%; height: 35px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealIntimeUpd" runat="server" meta:resourcekey="lblAppealIntimeUpd"
                                    Text="Appeal In Time"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="5">
                                <asp:CheckBox ID="ChkAppealIntimeUpd" runat="server" Checked='<%# Bind("AppealInTime") %>'
                                    meta:resourcekey="ChkAppealIntimeUpd" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealActsHeadingIns" runat="server" meta:resourcekey="lblAppealActsHeadingIns"
                                    SkinID="SubHeading" Text="Appeal Act"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 37px">
                                <asp:Label ID="lblAppealAct" runat="server" Text="Select Appeal Act" meta:resourcekey="lblAppealActResource2"></asp:Label></td>
                            <td style="height: 37px">
                                <asp:ListBox ID="liActUpd" runat="server" SelectionMode="Multiple" Width="140px"
                                    DataSourceID="odsGetAct" DataTextField="NameOfAct" DataValueField="ActId" OnDataBound="liActUpd_DataBound"
                                    meta:resourcekey="liActUpdResource1"></asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHighCourtdecision" runat="server" Text="High Court Decision/Details"
                                    meta:resourcekey="lblHighCourtdecision"></asp:Label></td>
                            <td colspan="5" class="textColumn">
                                <asp:TextBox ID="txtHighCourtdecision" runat="server" TextMode="MultiLine" meta:resourcekey="txtHighCourtdecisionResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealRemarksHeadingIns" runat="server" meta:resourcekey="lblAppealRemarksHeadingIns"
                                    SkinID="SubHeading" Text="Appeal Application Remarks"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <uc1:FileForward ID="FileForward1" runat="server"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:CheckBox ID="chkVerified" runat="server" Text="Verification Complete" meta:resourcekey="chkVerifiedResource1" />
                                <asp:Button ID="LicInsert" runat="server" CommandName="Update" Text="Update" meta:resourcekey="LicInsertResource2" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource2" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" SkinID="SubHeading" Text="Appeal Application Details"
                                    meta:resourcekey="lblFileDetailsHeaderInsResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblDocumentNo" runat="server" Text='Document No&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'
                                    meta:resourcekey="lblDocumentNoResource1"></asp:Label></td>
                            <td align="left" class="textColumn">
                                <asp:TextBox ID="txtDocumentNo" runat="server" MaxLength="5" Text='<%# Bind("DocumentNo") %>'
                                    meta:resourcekey="txtDocumentNoResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdIns" runat="server" meta:resourcekey="lblOfficeIdIns" Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeIdIns" runat="server" meta:resourcekey="ddlOfficeIdIns"
                                    DataSourceID="odsGetOffices" Text='<%# Bind("OfficeId") %>' DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>' OnLoad="ddlOfficeIdIns_Load">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentDate" runat="server" Text="Document Date" meta:resourcekey="lblDocumentDateResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentdate" runat="server" Text='<%# Bind("DocumentDate") %>'
                                    ReadOnly="True" meta:resourcekey="txtDocumentdateResource1" Width="79%"></asp:TextBox>
                                <rjs:PopCalendar ID="calDocumentDate" runat="server" Control="txtDocumentdate" meta:resourcekey="calDocumentDateResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfCollectorIns" runat="server" Text="Date Of Order From Collector"
                                    meta:resourcekey="lblDateOfCollectorIns"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfCollectorIns" runat="server" meta:resourcekey="txtDateOfCollectorIns"
                                    Text='<%# Bind("DaTeOffOrderFromCollector") %>' ReadOnly="True" Width="79%"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDateOfCollectorIns"
                                    meta:resourcekey="calDocumentDateResource1" />
                            </td>
                            <td class="validationColumn">
                            <asp:RequiredFieldValidator ID="rfvDaTeOffOrderFromCollector" runat="server" ErrorMessage="DaTe Off Order From Collector Can't be blank" ControlToValidate="txtDateOfCollectorIns" meta:resourcekey="rfvDaTeOffOrderFromCollectorResource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOriginalSRO" runat="server" Text="Original SRO" meta:resourcekey="lblOriginalSROResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOriginalSRO" runat="server" DataSourceID="odsGetOffices"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OriginalSRO") %>'
                                    meta:resourcekey="ddlOriginalSROResource1">
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="lblApplicantDetailsHeaderIns" runat="server" meta:resourcekey="lblApplicantDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
                                    Text='Applicant Name&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
                                    Text='<%# Bind("ApplicantName") %>' MaxLength="50"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvApplicantNameIns" runat="server" ControlToValidate="txtApplicantNameIns"
                                    ErrorMessage="Please Enter Applicant Name" meta:resourcekey="rfvApplicantNameInsResource1"
                                    Text="
							*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressIns" runat="server" meta:resourcekey="lblApplicantAddressIns"
                                    Text='Applicant Address&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtApplicantAddressIns" runat="server" meta:resourcekey="txtApplicantAddressIns"
                                    Text='<%# Bind("Address") %>' TextMode="MultiLine" MaxLength="150"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvApplicantAddressIns" runat="server" ControlToValidate="txtApplicantAddressIns"
                                    meta:resourcekey="rfvApplicantAddressInsResource1" Text="
							*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:CheckBox ID="chkIsPaidAppealFeeIns" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                                    meta:resourcekey="chkIsPaidAppealFeeIns" SkinID="SubHeading" Text="Is Appeal Fee Paid"
                                    OnLoad="chkIsPaidAppealFeeIns_Load" />
                            </td>
                        </tr>
                        <tr id="trAppeaFeesetails" visible="false" style="display: none;">
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeReceiptNoIns" runat="server" meta:resourcekey="lblFeeReceiptNoIns"
                                    Text='Receipt Number&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFeeReceiptNoIns" runat="server" meta:resourcekey="txtFeeReceiptNoIns"
                                    Text='<%# Bind("FeeReceiptNo") %>' MaxLength="19"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountIns" runat="server" meta:resourcekey="lblAmountIns" Text='Amount&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmountIns" runat="server" meta:resourcekey="txtAmountIns" Text='<%# Bind("Amount") %>'
                                    MaxLength="8"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="RegAmountIns" runat="server" ControlToValidate="txtAmountIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="RegAmountInsResource1"
                                    Text="*"></asp:RegularExpressionValidator>
                       
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="lblAppealDetailsHeaderIns" runat="server" meta:resourcekey="lblAppealDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 28px">
                                <asp:Label ID="lblTypeOfAppealIns" runat="server" meta:resourcekey="lblTypeOfAppealIns"
                                    Text="Type of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 28px">
                                <asp:DropDownList ID="ddlTypeOfAppealIns" runat="server" AutoPostBack="True" DataSourceID="odsGetAppealType"
                                    DataTextField="AppealName" DataValueField="AppealTypeId" meta:resourcekey="ddlTypeOfAppealIns"
                                    SelectedValue='<%# Bind("TypeOfAppeal") %>' Text='<%# Bind("TypeOfAppeal") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 28px">
                            </td>
                            <td class="validationColumn" style="height: 28px">
                            </td>
                            <td class="labelColumn" style="width: 23%; height: 28px;">
                                <asp:Label ID="lblRegistrationNoIns" runat="server" meta:resourcekey="lblRegistrationNoIns"
                                    Text="Appeal No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="RegistrationNo" runat="server" Text='<%# Bind("RegistrationNo") %>' meta:resourcekey="RegistrationNoResource1"></asp:TextBox>
                            </td>
                            <asp:MultiView ID="viewAppealType" runat="server" ActiveViewIndex="0">
                                <asp:View ID="viewRegistration" runat="server">
                                </asp:View>
                                <asp:View ID="viewStamp" runat="server">
                                </asp:View>
                            </asp:MultiView></tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalculatedAmountIns" runat="server" meta:resourcekey="lblCalculatedAmountIns"
                                    Text='Calculated Amount&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCalculatedAmountIns" runat="server" meta:resourcekey="txtCalculatedAmountIns"
                                    Text='<%# Bind("CalculatedAmount") %>' MaxLength="9"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvtxtCalculatedAmountIns" runat="server" ControlToValidate="txtCalculatedAmountIns"
                                    meta:resourcekey="rfvtxtCalculatedAmountInsResource1" Text="
							*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegCalculatedAmount" runat="server" ControlToValidate="txtCalculatedAmountIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="RegCalculatedAmountResource1"
                                    Text="*"></asp:RegularExpressionValidator>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepositAmountIns" runat="server" meta:resourcekey="lblDepositAmountIns"
                                    Text='Deposit Amount&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDepositAmountIns" runat="server" meta:resourcekey="txtDepositAmountIns"
                                    Text='<%# Bind("DepositAmount") %>' MaxLength="8"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDepositAmountIns" runat="server" ControlToValidate="txtDepositAmountIns"
                                    meta:resourcekey="RfvDepositAmountInsResource1" Text="
							*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegDepositAmountIns" runat="server" ControlToValidate="txtDepositAmountIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="RegDepositAmountInsResource1"
                                    Text="*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeficitAmountIns" runat="server" meta:resourcekey="lblDeficitAmountIns"
                                    Text="Deficit Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeficitAmountIn" runat="server" Text='<%# Bind("DficitAmount") %>'
                                    MaxLength="7" meta:resourcekey="txtDeficitAmountInResource1"></asp:TextBox>
                                <td class="validationColumn">
                                    <asp:RegularExpressionValidator ID="regdeficit" runat="server" ControlToValidate="txtDeficitAmountIn"
                                        ValidationExpression="\d*" ErrorMessage="Please Enter Valid Deficit Amount" meta:resourcekey="RegularExpressionValidator1Resource1">*</asp:RegularExpressionValidator>
                                </td>
                                <td class="validationColumn">
                                </td>
                                <td class="labelColumn">
                                    <asp:Label ID="lblInwardDateIns" runat="server" meta:resourcekey="lblInwardDateIns"
                                        Text='Received Date&lt;span style=&quot;color: Red;&quot;&gt;*&lt;/span&gt;'></asp:Label>
                                </td>
                                <td class="textColumn">
                                    <asp:TextBox ID="txtInwardDateIns" runat="server" meta:resourcekey="txtInwardDateIns"
                                        SkinID="Calendar" ReadOnly="True" Text='<%# Bind("InwardDate", "{0:d}") %>'></asp:TextBox>
                                    <rjs:PopCalendar ID="calInwardDateIns" Control="txtInwardDateIns" runat="server"
                                        meta:resourcekey="calInwardDateIns" Move="True" BlankFieldText="Invalid Date"
                                        InvalidDateMessage="Invalid Date" />
                                </td>
                                <td class="validationColumn">
                                    <asp:RequiredFieldValidator ID="rfvInwardDateIns" runat="server" ErrorMessage="Please Enter Inward Date"
                                        ControlToValidate="txtInwardDateIns" meta:resourcekey="rfvInwardDateInsResource1"
                                        Text="*
                                    "></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelcolumn">
                                <asp:Label ID="lblReceiptNoIns" runat="server" meta:resourcekey="lblReceiptNoIns"
                                    Text="Receipt No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptNoIns" runat="server" Text='<%# Bind("ReceiptNo") %>'
                                    meta:resourcekey="txtReceiptNoIns" MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelcolumn">
                                <asp:Label ID="lblReceiptDateIns" runat="server" meta:resourcekey="lblReceiptDateIns"
                                    Text="Receipt Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptDateIns" runat="server" Text='<%# Bind("ReceiptDate") %>'
                                    meta:resourcekey="txtReceiptNoIns" SkinID="Calendar" ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopReceiptDateIns" Control="txtReceiptDateIns" runat="server"
                                    meta:resourcekey="PopReceiptDateIns" Move="True" BlankFieldText="Invalid Date"
                                    InvalidDateMessage="Invalid Date" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvReceiptDateIns" runat="server" ErrorMessage="Please Enter Receipt Date"
                                    ControlToValidate="txtReceiptDateIns" meta:resourcekey="rfvReceiptDateIns" Text="*
"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtFeeTicketIns" runat="server" meta:resourcekey="lblCourtFeeTicketIns"
                                    Text="Court Fee Ticket Pasted?"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkCourtFeeTicketIns" runat="server" Checked='<%# Bind("CourtFeeTicket") %>'
                                    meta:resourcekey="chkCourtFeeTicketIns" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblPaperFromToIns" runat="server" meta:resourcekey="lblPaperFromToIns"
                                    Text="Paper From To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPaperFromToIns" runat="server" meta:resourcekey="txtPaperFromToIns"
                                    Text='<%# Bind("PaperFromTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealIntimeIns" runat="server" meta:resourcekey="lblAppealIntimeIns"
                                    Text="Appeal In Time"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="6">
                                <asp:CheckBox ID="ChkAppealIntimeIns" runat="server" Checked='<%# Bind("AppealInTime") %>'
                                    meta:resourcekey="ChkAppealIntimeIns" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="lblAppealActsHeadingIns" runat="server" meta:resourcekey="lblAppealActsHeadingIns"
                                    SkinID="SubHeading" Text="Appeal Act"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 37px">
                                <asp:Label ID="lblAppealAct" runat="server" Text="Select Appeal Act" meta:resourcekey="lblAppealActResource1"></asp:Label></td>
                            <td style="height: 37px">
                                <asp:ListBox ID="liAppealAct" runat="server" SelectionMode="Multiple" Width="140px"
                                    DataSourceID="odsGetAct" DataTextField="NameOfAct" DataValueField="ActId" meta:resourcekey="liAppealActResource1">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="lblAppealRemarksHeadingIns" runat="server" meta:resourcekey="lblAppealRemarksHeadingIns"
                                    SkinID="SubHeading" Text="Appeal Application Remarks"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <uc1:FileForward ID="FileForward1" runat="server"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7" style="height: 40px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="7">
                                <asp:Button ID="LicInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="LicInsertResource1" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="CancelButtonResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsAppealApplication" runat="server" InsertMethod="AddAppealAplication"
                SelectMethod="GetAppealApplicationByAppealID" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                UpdateMethod="UpdateAppealAplication" OnInserting="odsAppealApplication_Inserting"
                OnUpdating="odsAppealApplication_Updating" OnInserted="odsAppealApplication_Inserted">
                <UpdateParameters>
                    <asp:Parameter Name="parameter" Type="Object" />
                    <asp:Parameter Name="dtAct" Type="Object" />
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="AlertId" Type="Object" />
                    <asp:Parameter Name="Verified" Type="Boolean" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldAppealApplicationId" Name="AppealApplicationId"
                        PropertyName="Value" Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="parameter" Type="Object" />
                    <asp:Parameter Name="dtAct" Type="Object" />
                    <asp:Parameter Name="rem" Type="Object" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetAppealType" runat="server" SelectMethod="GetAppealType"
                TypeName="IGRSS.BusinessLogicLayer.AppealType"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetApplicantDtl" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAppealApplicationByAppealNo" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                DataObjectTypeName="System.Guid" UpdateMethod="RejectAppealApplication" OnSelecting="odsGetApplicantDtl_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAppealNo" Name="AppealSlNo" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsHighCourtHearing" runat="server" DataObjectTypeName="System.Guid"
                InsertMethod="AddHighCourtJudgementDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetHighCourtHearingDetails" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                UpdateMethod="RejectAppealApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldAppealApplicationId" Name="AppealApplicationId"
                        PropertyName="Value" Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsInterHearing" runat="server" DataObjectTypeName="System.Guid"
                InsertMethod="AddHighCourtJudgementDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInterHearingDetails" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                UpdateMethod="RejectAppealApplication">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldAppealApplicationId" Name="AppealApplicationId"
                        PropertyName="Value" Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetAct" runat="server" InsertMethod="InsertNewActMaster"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetActMaster" TypeName="IGRSS.BusinessLogicLayer.RefundActMaster"
                UpdateMethod="UpdateActMaster">
                <UpdateParameters>
                    <asp:Parameter Name="ActId" Type="Object" />
                    <asp:Parameter Name="DescriptionOfAct" Type="String" />
                    <asp:Parameter Name="NameOfAct" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="DescriptionOfAct" Type="String" />
                    <asp:Parameter Name="NameOfAct" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetAppealActs" runat="server" DataObjectTypeName="System.Guid"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetActDetailByApppealId"
                TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication"
                InsertMethod="AddAppealHearing">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldAppealApplicationId" Name="AppealApplicationId"
                        PropertyName="Value" Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                    <asp:Parameter Name="HearingDate" Type="DateTime" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="IsJudgement" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </asp:View>
        <asp:View ID="viewReadOnly" runat="server">
            <asp:FormView ID="fvReadOnly" runat="server" DataKeyNames="AppealApplicationId" DataSourceID="odsAppealApplication"
                meta:resourcekey="fvReadOnlyResource1">
                <ItemTemplate>
                    <table style="width: 100%; text-align: left;">
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblFileDetailsHeaderItm" runat="server" meta:resourcekey="lblFileDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Application Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileNoItm" runat="server" meta:resourcekey="lblFileNoItm" Text="File Number"></asp:Label>
                            </td>
                            <td class="textColumn" align="left">
                                &nbsp;<asp:Label ID="lblFileNo" runat="server" meta:resourcekey="lblFileNoResource1"></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicationStatus" runat="server" meta:resourcekey="lblApplicationStatusItm"
                                    Text="Status"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtApplicationStatus" runat="server" meta:resourcekey="txtApplicationStatus"
                                    ReadOnly="True" Text='<%# Bind("AppealStatus") %>' OnDataBinding="txtApplicationStatus_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdItm" runat="server" meta:resourcekey="lblOfficeIdItm" Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOfficeIdItm" runat="server" meta:resourcekey="txtOfficeIdItm"
                                    ReadOnly="True" Text='<%# Bind("OfficeName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantDetailsHeaderItm" runat="server" meta:resourcekey="lblApplicantDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Applicant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameItm" runat="server" meta:resourcekey="lblApplicantNameItm"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtApplicantNameItm" runat="server" meta:resourcekey="txtApplicantNameItm"
                                    ReadOnly="True" Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressItm" runat="server" meta:resourcekey="lblApplicantAddressItm"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtApplicantAddressItm" runat="server" meta:resourcekey="txtApplicantAddressItm"
                                    ReadOnly="True" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkIsPaidAppealFeeItm" Enabled="False" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                                    meta:resourcekey="chkIsPaidAppealFeeItm" SkinID="SubHeading" Text="Is Appeal Fee Paid" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeReceiptNoItm" runat="server" meta:resourcekey="lblFeeReceiptNoItm"
                                    Text="Receipt Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFeeReceiptNoItm" runat="server" meta:resourcekey="txtFeeReceiptNoItm"
                                    ReadOnly="True" Text='<%# Bind("FeeReceiptNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountItm" runat="server" meta:resourcekey="lblAmountItm" Text="Amount"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtAmountItm" runat="server" meta:resourcekey="txtAmountItm" ReadOnly="True"
                                    Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealDetailsHeaderItm" runat="server" meta:resourcekey="lblAppealDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Appeal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfAppealItm" runat="server" meta:resourcekey="lblTypeOfAppealItm"
                                    Text="Type of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAppealItm" ReadOnly="True" runat="server" meta:resourcekey="txtAppealItm"
                                    Text='<%# Bind("AppealName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoItm" runat="server" meta:resourcekey="lblRegistrationNoItm"
                                    Text="Appeal No"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtRegistrationNoItm" runat="server" meta:resourcekey="txtRegistrationNoItm"
                                    ReadOnly="True" Text='<%# Bind("RegistrationNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalculatedAmountItm" runat="server" meta:resourcekey="lblCalculatedAmountItm"
                                    Text="Calculated Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCalculatedAmountItm" runat="server" meta:resourcekey="txtCalculatedAmountItm"
                                    ReadOnly="True" Text='<%# Bind("CalculatedAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepositAmountItm" runat="server" meta:resourcekey="lblDepositAmountItm"
                                    Text="Deposit Amount"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtDepositAmountItm" runat="server" meta:resourcekey="txtDepositAmountItm"
                                    ReadOnly="True" Text='<%# Bind("DepositAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblInwardDateItm" runat="server" meta:resourcekey="lblInwardDateItm"
                                    Text="Inward Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInwardDateItm" runat="server" meta:resourcekey="txtInwardDateItm"
                                    ReadOnly="True" SkinID="Calendar" Text='<%# Bind("InwardDate", "{0:d}") %>' OnDataBinding="txtInwardDateItm_DataBinding"
                                    OnTextChanged="txtInwardDateItm_TextChanged"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label4" runat="server" meta:resourcekey="lblPaperFromToItm" Text="Paper From To"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="txtPaperFromToItm" ReadOnly="True"
                                    Text='<%# Bind("PaperFromTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCourtFeeTicketItm" runat="server" meta:resourcekey="lblCourtFeeTicketItm"
                                    Text="Court Fee Ticket Pasted?"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:CheckBox ID="chkCourtFeeTicketItm" Enabled="False" runat="server" meta:resourcekey="chkCourtFeeTicketItm"
                                    Checked='<%# Bind("CourtFeeTicket") %>' />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAppealIntimeItm" runat="server" meta:resourcekey="lblAppealIntimeItm"
                                    Text="Appeal In Time"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="5">
                                <asp:CheckBox ID="ChkAppealIntimeItm" runat="server" Checked='<%# Bind("AppealInTime") %>'
                                    meta:resourcekey="ChkAppealIntimeItm" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppealActsHeadingItm" runat="server" meta:resourcekey="lblAppealActsHeadingItm"
                                    SkinID="SubHeading" Text="Act Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 37px">
                                <asp:Label ID="lblAppealActItm" runat="server" Text="Appeal Act" meta:resourcekey="lblAppealActItmResource1"></asp:Label></td>
                            <td style="height: 37px">
                                <asp:ListBox ID="liAppealActItm" runat="server" Width="140px" DataSourceID="odsGetAppealActs"
                                    DataTextField="ActName" DataValueField="ActId" meta:resourcekey="liAppealActItmResource1">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblHearingDetailsI" runat="server" meta:resourcekey="lblHearingDetailsI"
                                    SkinID="SubHeading" Text="Internal Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="6">
                                <asp:GridView ID="gvHearingDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="HearingID,AppealApplicationId"
                                    DataSourceID="odsInterHearing" OnDataBound="gvHearingDetails_DataBound" meta:resourcekey="gvHearingDetailsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="HearingDate" HeaderText="HearingDate" SortExpression="HearingDate"
                                            DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource5" >
                                            <ControlStyle Width="10px" />
                                            <HeaderStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource6" >
                                            <ControlStyle Width="100px" />
                                            <HeaderStyle Width="60%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IsJudgement" SortExpression="IsJudgement" meta:resourcekey="BoundFieldResource7" >
                                            <HeaderStyle Width="20%" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        Hearing Not Started!
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCoIns" runat="server" meta:resourcekey="lblCoIns" SkinID="SubHeading"
                                    Text="High Court File Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCaseIns" runat="server" meta:resourcekey="lblCourtNoIns" Text="Case No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCourtNoIns" runat="server" ReadOnly="True" MaxLength="10" meta:resourcekey="txtCourtNoIns"
                                    Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfAppealIns" runat="server" meta:resourcekey="lblDateOfAppealIns"
                                    Text="Date Of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfAppealIns" ReadOnly="True" runat="server" meta:resourcekey="txtDateOfAppealIns"
                                    SkinID="Calendar" Text='<%# Bind("AffidavitDate", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblJudgeMentDetailsI" runat="server" meta:resourcekey="lblJudgeMentDetailsI"
                                    SkinID="SubHeading" Text="High Court Hearing Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="HearingID,AppealApplicationId"
                                    DataSourceID="odsHighCourtHearing" OnDataBound="GridView1_DataBound" meta:resourcekey="GridView1Resource1">
                                    <Columns>
                                        <asp:BoundField DataField="HearingDate" HeaderText="HearingDate"  SortExpression="HearingDate"
                                            DataFormatString="{0:dd/MM/yyyy}" meta:resourcekey="BoundFieldResource8" >
                                            <HeaderStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource9" >
                                            <HeaderStyle Width="60%" />
                                        </asp:BoundField>
                                        <asp:CheckBoxField DataField="IsJudgement" SortExpression="IsJudgement" meta:resourcekey="CheckBoxFieldResource1" >
                                            <HeaderStyle Width="20%" />
                                        </asp:CheckBoxField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        Hearing Not Started!
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:TextBox ID="txtAppealRemarksHeadingItm" runat="server" meta:resourcekey="txtAppealRemarksHeadingItm"
                                    ReadOnly="True" TextMode="MultiLine" Text='<%# Bind("AppealRemarks") %>' Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <uc1:FileForward ID="FileForward1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    AppealApplicationId:
                    <asp:Label ID="AppealApplicationIdLabel1" runat="server" Text='<%# Eval("AppealApplicationId") %>'
                        meta:resourcekey="AppealApplicationIdLabel1Resource1"></asp:Label><br />
                    AppealPrefix:
                    <asp:TextBox ID="AppealPrefixTextBox" runat="server" Text='<%# Bind("AppealPrefix") %>'
                        meta:resourcekey="AppealPrefixTextBoxResource1"></asp:TextBox><br />
                    AppealSlNo:
                    <asp:TextBox ID="AppealSlNoTextBox" runat="server" Text='<%# Bind("AppealSlNo") %>'
                        meta:resourcekey="AppealSlNoTextBoxResource1"></asp:TextBox><br />
                    AppealYear:
                    <asp:TextBox ID="AppealYearTextBox" runat="server" Text='<%# Bind("AppealYear") %>'
                        meta:resourcekey="AppealYearTextBoxResource1"></asp:TextBox><br />
                    OfficeId:
                    <asp:TextBox ID="OfficeIdTextBox" runat="server" Text='<%# Bind("OfficeId") %>' meta:resourcekey="OfficeIdTextBoxResource1"></asp:TextBox><br />
                    RegistrationNo:
                    <asp:TextBox ID="RegistrationNoTextBox" runat="server" Text='<%# Bind("RegistrationNo") %>'
                        meta:resourcekey="RegistrationNoTextBoxResource1"></asp:TextBox><br />
                    ApplicantName:
                    <asp:TextBox ID="ApplicantNameTextBox" runat="server" Text='<%# Bind("ApplicantName") %>'
                        meta:resourcekey="ApplicantNameTextBoxResource1"></asp:TextBox><br />
                    Address:
                    <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' meta:resourcekey="AddressTextBoxResource1"></asp:TextBox><br />
                    TypeOfAppeal:
                    <asp:TextBox ID="TypeOfAppealTextBox" runat="server" Text='<%# Bind("TypeOfAppeal") %>'
                        meta:resourcekey="TypeOfAppealTextBoxResource1"></asp:TextBox><br />
                    CalculatedAmount:
                    <asp:TextBox ID="CalculatedAmountTextBox" runat="server" Text='<%# Bind("CalculatedAmount") %>'
                        meta:resourcekey="CalculatedAmountTextBoxResource1"></asp:TextBox><br />
                    DepositAmount:
                    <asp:TextBox ID="DepositAmountTextBox" runat="server" Text='<%# Bind("DepositAmount") %>'
                        meta:resourcekey="DepositAmountTextBoxResource1"></asp:TextBox><br />
                    FeeReceiptNo:
                    <asp:TextBox ID="FeeReceiptNoTextBox" runat="server" Text='<%# Bind("FeeReceiptNo") %>'
                        meta:resourcekey="FeeReceiptNoTextBoxResource1"></asp:TextBox><br />
                    Amount:
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' meta:resourcekey="AmountTextBoxResource2"></asp:TextBox><br />
                    InwardDate:
                    <asp:TextBox ID="InwardDateTextBox" runat="server" Text='<%# Bind("InwardDate") %>'
                        meta:resourcekey="InwardDateTextBoxResource1"></asp:TextBox><br />
                    IsPaidAppealFee:
                    <asp:CheckBox ID="IsPaidAppealFeeCheckBox" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                        meta:resourcekey="IsPaidAppealFeeCheckBoxResource1" /><br />
                    AppealInTime:
                    <asp:CheckBox ID="AppealInTimeCheckBox" runat="server" Checked='<%# Bind("AppealInTime") %>'
                        meta:resourcekey="AppealInTimeCheckBoxResource1" /><br />
                    PaperFromTo:
                    <asp:TextBox ID="PaperFromToTextBox" runat="server" Text='<%# Bind("PaperFromTo") %>'
                        meta:resourcekey="PaperFromToTextBoxResource1"></asp:TextBox><br />
                    CourtFeeTicket:
                    <asp:CheckBox ID="CourtFeeTicketCheckBox" runat="server" Checked='<%# Bind("CourtFeeTicket") %>'
                        meta:resourcekey="CourtFeeTicketCheckBoxResource1" /><br />
                    AppealRemarks:
                    <asp:TextBox ID="AppealRemarksTextBox" runat="server" Text='<%# Bind("AppealRemarks") %>'
                        meta:resourcekey="AppealRemarksTextBoxResource1"></asp:TextBox><br />
                    AppealStatus:
                    <asp:TextBox ID="AppealStatusTextBox" runat="server" Text='<%# Bind("AppealStatus") %>'
                        meta:resourcekey="AppealStatusTextBoxResource1"></asp:TextBox><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'
                        meta:resourcekey="CreatedByTextBoxResource1"></asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'
                        meta:resourcekey="CreatedAtTextBoxResource1"></asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'
                        meta:resourcekey="ModifiedByTextBoxResource1"></asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'
                        meta:resourcekey="ModifiedAtTextBoxResource1"></asp:TextBox><br />
                    IsDeleted:
                    <asp:CheckBox ID="IsDeletedCheckBox" runat="server" Checked='<%# Bind("IsDeleted") %>'
                        meta:resourcekey="IsDeletedCheckBoxResource1" /><br />
                    DeletedBy:
                    <asp:TextBox ID="DeletedByTextBox" runat="server" Text='<%# Bind("DeletedBy") %>'
                        meta:resourcekey="DeletedByTextBoxResource1"></asp:TextBox><br />
                    DeletedAt:
                    <asp:TextBox ID="DeletedAtTextBox" runat="server" Text='<%# Bind("DeletedAt") %>'
                        meta:resourcekey="DeletedAtTextBoxResource1"></asp:TextBox><br />
                    WfInstanceId:
                    <asp:TextBox ID="WfInstanceIdTextBox" runat="server" Text='<%# Bind("WfInstanceId") %>'
                        meta:resourcekey="WfInstanceIdTextBoxResource1"></asp:TextBox><br />
                    Info:
                    <asp:TextBox ID="InfoTextBox" runat="server" Text='<%# Bind("Info") %>' meta:resourcekey="InfoTextBoxResource1"></asp:TextBox><br />
                    DocumentNo:
                    <asp:TextBox ID="DocumentNoTextBox" runat="server" Text='<%# Bind("DocumentNo") %>'
                        meta:resourcekey="DocumentNoTextBoxResource1"></asp:TextBox><br />
                    OriginalSRO:
                    <asp:TextBox ID="OriginalSROTextBox" runat="server" Text='<%# Bind("OriginalSRO") %>'
                        meta:resourcekey="OriginalSROTextBoxResource1"></asp:TextBox><br />
                    DocumentDate:
                    <asp:TextBox ID="DocumentDateTextBox" runat="server" Text='<%# Bind("DocumentDate") %>'
                        meta:resourcekey="DocumentDateTextBoxResource1"></asp:TextBox><br />
                    DaTeOffOrderFromCollector:
                    <asp:TextBox ID="DaTeOffOrderFromCollectorTextBox" runat="server" Text='<%# Bind("DaTeOffOrderFromCollector") %>'
                        meta:resourcekey="DaTeOffOrderFromCollectorTextBoxResource1"></asp:TextBox><br />
                    DficitAmount:
                    <asp:TextBox ID="DficitAmountTextBox" runat="server" Text='<%# Bind("DficitAmount") %>'
                        meta:resourcekey="DficitAmountTextBoxResource1"></asp:TextBox><br />
                    PartyHasAppearedInHighcourtornot:
                    <asp:CheckBox ID="PartyHasAppearedInHighcourtornotCheckBox" runat="server" Checked='<%# Bind("PartyHasAppearedInHighcourtornot") %>'
                        meta:resourcekey="PartyHasAppearedInHighcourtornotCheckBoxResource1" /><br />
                    HighCourtDecisionAndDwetails:
                    <asp:TextBox ID="HighCourtDecisionAndDwetailsTextBox" runat="server" Text='<%# Bind("HighCourtDecisionAndDwetails") %>'
                        meta:resourcekey="HighCourtDecisionAndDwetailsTextBoxResource1"></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                        meta:resourcekey="UpdateButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="UpdateCancelButtonResource1"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    AppealApplicationId:
                    <asp:TextBox ID="AppealApplicationIdTextBox" runat="server" Text='<%# Bind("AppealApplicationId") %>'
                        meta:resourcekey="AppealApplicationIdTextBoxResource1"></asp:TextBox><br />
                    AppealPrefix:
                    <asp:TextBox ID="AppealPrefixTextBox" runat="server" Text='<%# Bind("AppealPrefix") %>'
                        meta:resourcekey="AppealPrefixTextBoxResource2"></asp:TextBox><br />
                    AppealSlNo:
                    <asp:TextBox ID="AppealSlNoTextBox" runat="server" Text='<%# Bind("AppealSlNo") %>'
                        meta:resourcekey="AppealSlNoTextBoxResource2"></asp:TextBox><br />
                    AppealYear:
                    <asp:TextBox ID="AppealYearTextBox" runat="server" Text='<%# Bind("AppealYear") %>'
                        meta:resourcekey="AppealYearTextBoxResource2"></asp:TextBox><br />
                    OfficeId:
                    <asp:TextBox ID="OfficeIdTextBox" runat="server" Text='<%# Bind("OfficeId") %>' meta:resourcekey="OfficeIdTextBoxResource2"></asp:TextBox><br />
                    RegistrationNo:
                    <asp:TextBox ID="RegistrationNoTextBox" runat="server" Text='<%# Bind("RegistrationNo") %>'
                        meta:resourcekey="RegistrationNoTextBoxResource2"></asp:TextBox><br />
                    ApplicantName:
                    <asp:TextBox ID="ApplicantNameTextBox" runat="server" Text='<%# Bind("ApplicantName") %>'
                        meta:resourcekey="ApplicantNameTextBoxResource2"></asp:TextBox><br />
                    Address:
                    <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' meta:resourcekey="AddressTextBoxResource2"></asp:TextBox><br />
                    TypeOfAppeal:
                    <asp:TextBox ID="TypeOfAppealTextBox" runat="server" Text='<%# Bind("TypeOfAppeal") %>'
                        meta:resourcekey="TypeOfAppealTextBoxResource2"></asp:TextBox><br />
                    CalculatedAmount:
                    <asp:TextBox ID="CalculatedAmountTextBox" runat="server" Text='<%# Bind("CalculatedAmount") %>'
                        meta:resourcekey="CalculatedAmountTextBoxResource2"></asp:TextBox><br />
                    DepositAmount:
                    <asp:TextBox ID="DepositAmountTextBox" runat="server" Text='<%# Bind("DepositAmount") %>'
                        meta:resourcekey="DepositAmountTextBoxResource2"></asp:TextBox><br />
                    FeeReceiptNo:
                    <asp:TextBox ID="FeeReceiptNoTextBox" runat="server" Text='<%# Bind("FeeReceiptNo") %>'
                        meta:resourcekey="FeeReceiptNoTextBoxResource2"></asp:TextBox><br />
                    Amount:
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' meta:resourcekey="AmountTextBoxResource3"></asp:TextBox><br />
                    InwardDate:
                    <asp:TextBox ID="InwardDateTextBox" runat="server" Text='<%# Bind("InwardDate") %>'
                        meta:resourcekey="InwardDateTextBoxResource2"></asp:TextBox><br />
                    IsPaidAppealFee:
                    <asp:CheckBox ID="IsPaidAppealFeeCheckBox" runat="server" Checked='<%# Bind("IsPaidAppealFee") %>'
                        meta:resourcekey="IsPaidAppealFeeCheckBoxResource2" /><br />
                    AppealInTime:
                    <asp:CheckBox ID="AppealInTimeCheckBox" runat="server" Checked='<%# Bind("AppealInTime") %>'
                        meta:resourcekey="AppealInTimeCheckBoxResource2" /><br />
                    PaperFromTo:
                    <asp:TextBox ID="PaperFromToTextBox" runat="server" Text='<%# Bind("PaperFromTo") %>'
                        meta:resourcekey="PaperFromToTextBoxResource2"></asp:TextBox><br />
                    CourtFeeTicket:
                    <asp:CheckBox ID="CourtFeeTicketCheckBox" runat="server" Checked='<%# Bind("CourtFeeTicket") %>'
                        meta:resourcekey="CourtFeeTicketCheckBoxResource2" /><br />
                    AppealRemarks:
                    <asp:TextBox ID="AppealRemarksTextBox" runat="server" Text='<%# Bind("AppealRemarks") %>'
                        meta:resourcekey="AppealRemarksTextBoxResource2"></asp:TextBox><br />
                    AppealStatus:
                    <asp:TextBox ID="AppealStatusTextBox" runat="server" Text='<%# Bind("AppealStatus") %>'
                        meta:resourcekey="AppealStatusTextBoxResource2"></asp:TextBox><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'
                        meta:resourcekey="CreatedByTextBoxResource2"></asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'
                        meta:resourcekey="CreatedAtTextBoxResource2"></asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'
                        meta:resourcekey="ModifiedByTextBoxResource2"></asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'
                        meta:resourcekey="ModifiedAtTextBoxResource2"></asp:TextBox><br />
                    IsDeleted:
                    <asp:CheckBox ID="IsDeletedCheckBox" runat="server" Checked='<%# Bind("IsDeleted") %>'
                        meta:resourcekey="IsDeletedCheckBoxResource2" /><br />
                    DeletedBy:
                    <asp:TextBox ID="DeletedByTextBox" runat="server" Text='<%# Bind("DeletedBy") %>'
                        meta:resourcekey="DeletedByTextBoxResource2"></asp:TextBox><br />
                    DeletedAt:
                    <asp:TextBox ID="DeletedAtTextBox" runat="server" Text='<%# Bind("DeletedAt") %>'
                        meta:resourcekey="DeletedAtTextBoxResource2"></asp:TextBox><br />
                    WfInstanceId:
                    <asp:TextBox ID="WfInstanceIdTextBox" runat="server" Text='<%# Bind("WfInstanceId") %>'
                        meta:resourcekey="WfInstanceIdTextBoxResource2"></asp:TextBox><br />
                    Info:
                    <asp:TextBox ID="InfoTextBox" runat="server" Text='<%# Bind("Info") %>' meta:resourcekey="InfoTextBoxResource2"></asp:TextBox><br />
                    DocumentNo:
                    <asp:TextBox ID="DocumentNoTextBox" runat="server" Text='<%# Bind("DocumentNo") %>'
                        meta:resourcekey="DocumentNoTextBoxResource2"></asp:TextBox><br />
                    OriginalSRO:
                    <asp:TextBox ID="OriginalSROTextBox" runat="server" Text='<%# Bind("OriginalSRO") %>'
                        meta:resourcekey="OriginalSROTextBoxResource2"></asp:TextBox><br />
                    DocumentDate:
                    <asp:TextBox ID="DocumentDateTextBox" runat="server" Text='<%# Bind("DocumentDate") %>'
                        meta:resourcekey="DocumentDateTextBoxResource2"></asp:TextBox><br />
                    DaTeOffOrderFromCollector:
                    <asp:TextBox ID="DaTeOffOrderFromCollectorTextBox" runat="server" Text='<%# Bind("DaTeOffOrderFromCollector") %>'
                        meta:resourcekey="DaTeOffOrderFromCollectorTextBoxResource2"></asp:TextBox><br />
                    DficitAmount:
                    <asp:TextBox ID="DficitAmountTextBox" runat="server" Text='<%# Bind("DficitAmount") %>'
                        meta:resourcekey="DficitAmountTextBoxResource2"></asp:TextBox><br />
                    PartyHasAppearedInHighcourtornot:
                    <asp:CheckBox ID="PartyHasAppearedInHighcourtornotCheckBox" runat="server" Checked='<%# Bind("PartyHasAppearedInHighcourtornot") %>'
                        meta:resourcekey="PartyHasAppearedInHighcourtornotCheckBoxResource2" /><br />
                    HighCourtDecisionAndDwetails:
                    <asp:TextBox ID="HighCourtDecisionAndDwetailsTextBox" runat="server" Text='<%# Bind("HighCourtDecisionAndDwetails") %>'
                        meta:resourcekey="HighCourtDecisionAndDwetailsTextBoxResource2"></asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"
                        meta:resourcekey="InsertButtonResource2"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="InsertCancelButtonResource2"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
