<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="HighCourtAppeal.aspx.cs" Inherits="Appeal_HighCourtAppeal" Title="Untitled Page"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvHighCourtDetails" runat="server" ActiveViewIndex="0">
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
                        <asp:ObjectDataSource ID="odsSearch" runat="server" DataObjectTypeName="System.Guid"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppealApplicationForHighCourt"
                            TypeName="IGRSS.BusinessLogicLayer.AppealApplication" UpdateMethod="RejectAppealApplication"
                            InsertMethod="AddHighCourtJudgementDetails">
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
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewHighCourtDetails" runat="server">
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
                            <td>
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
                            <td class="validationColumn">
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
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:FormView ID="fvHighCourtDetails" runat="server" DataSourceID="odsHighCourtAppeal"
                DefaultMode="Insert" OnItemInserting="fvHighCourtDetails_ItemInserting" meta:resourcekey="fvHighCourtDetailsResource1" OnItemInserted="fvHighCourtDetails_ItemInserted">
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
                                <asp:Label ID="lblCaseIns" runat="server" meta:resourcekey="lblCourtNoIns" Text="Case No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCourtNoIns" runat="server" MaxLength="10" meta:resourcekey="txtCourtNoIns" Text='<%# Bind("CaseNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="regPhonedate" runat="server" ControlToValidate="txtCourtNoIns"
                                    ErrorMessage="Please Enter Case No" meta:resourcekey="regPhonedateResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegAppealNo" runat="server" ControlToValidate="txtCourtNoIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" meta:resourcekey="RegAppealNoResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfAppealIns" runat="server" meta:resourcekey="lblDateOfAppealIns"
                                    Text="Date Of Appeal"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfAppealIns" runat="server" meta:resourcekey="txtDateOfAppealIns"
                                    SkinID="Calendar" Text='<%# Bind("AffidavitDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateIns" runat="server" Control="txtDateOfAppealIns"
                                    meta:resourcekey="calInwardDateIns" Move="True" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="regdate" runat="server" ControlToValidate="txtDateOfAppealIns"
                                    ErrorMessage="Please Enter Date" meta:resourcekey="regdateResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearIns" runat="server" meta:resourcekey="lblCourtNoItm" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearIns" runat="server" MaxLength="4" meta:resourcekey="txtCourtNoItm"></asp:TextBox>
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
                                <asp:TextBox ID="txtCourtNoItm" runat="server" meta:resourcekey="txtCourtNoItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearItm" runat="server" meta:resourcekey="lblCourtNoItm" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearItm" runat="server" MaxLength="4" meta:resourcekey="txtCourtNoItm"></asp:TextBox>
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
                                <asp:TextBox ID="txtDateOfAppealItm" runat="server" meta:resourcekey="txtDateOfAppealItm"></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateItm" runat="server" Control="txtHearingDateItm"
                                    meta:resourcekey="calInwardDateItm" Move="True" />
                            </td>
                            <td class="validationColumn">
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
                                <asp:Label ID="lblYearUpd" runat="server" meta:resourcekey="lblCourtNoItm" Text="Year"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearUpd" runat="server" MaxLength="4" meta:resourcekey="txtCourtNoItm"></asp:TextBox>
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
            </asp:FormView>
            <asp:ObjectDataSource ID="odsHighCourtAppeal" runat="server" InsertMethod="AddAppealIntoHighCourt"
                SelectMethod="GetAppealApplicationByAppealID" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                OnInserting="odsHighCourtAppeal_Inserting" UpdateMethod="RejectAppealApplication"
                OnInserted="odsHighCourtAppeal_Inserted">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvAppealHearing" Name="AppealApplicationId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="parameter" Type="Object" />
                    <asp:Parameter Name="AppealApplicationId" Type="Object" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsAppealHearing" runat="server" DataObjectTypeName="System.Guid"
                SelectMethod="GetAppealApplicationByAppealNo" TypeName="IGRSS.BusinessLogicLayer.AppealApplication"
                UpdateMethod="RejectAppealApplication">
                <SelectParameters>
                    <asp:Parameter Name="AppealSlNo" Type="Decimal" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
