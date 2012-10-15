<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="InvestigationResult.aspx.cs" Inherits="Complain_InvestigationResult"
    Title="Complain Investigation Result Details" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvAssignOfficer" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearch" runat="server">
            <table width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblComplainNo" runat="server" Text="Enter Complain No" meta:resourcekey="lblComplainNoResource1"></asp:Label></td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtComplainNo" Width="150px" runat="server" meta:resourcekey="txtComplainNoResource1"></asp:TextBox></td>
                    <td class="validationColumn">
                    </td>
                    <td align="right" colspan="3">
                        <asp:Button ID="btnSearchComplainNo" runat="server" Text="Search" meta:resourcekey="btnSearchComplainNoResource1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gdComplain" runat="server" AutoGenerateColumns="False" DataKeyNames="ComplainId"
                            DataSourceID="odsGetComplainByComplainNo" OnSelectedIndexChanged="gdComplain_SelectedIndexChanged"
                            meta:resourcekey="gdComplainResource1">
                            <Columns>
                                <asp:BoundField DataField="ComplaintNo" HeaderText="Complaint No" SortExpression="ComplaintNo"
                                    meta:resourcekey="BoundFieldResource1" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ComplaintDate" HeaderText="Complaint Date" SortExpression="ComplaintDate"
                                    DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" meta:resourcekey="BoundFieldResource4" >
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ComplainantName" HeaderText="Complainant Name" SortExpression="ComplainantName"
                                    meta:resourcekey="BoundFieldResource2" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"
                                    meta:resourcekey="BoundFieldResource5" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsGetComplainByComplainNo" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetComplainDetailsByComplainNo" TypeName="IGRSS.BusinessLogicLayer.Complain">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtComplainNo" Name="ComplaintNo" PropertyName="Text"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewAssignOfficer" runat="server">
            <asp:FormView ID="FvInvestigationdetail" runat="server" DataKeyNames="ComplainId"
                DataSourceID="odsComplain" meta:resourcekey="FvInvestigationdetailResource1">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantHeaderUps" runat="server" meta:resourcekey="lblApplicantHeader"
                                    SkinID="SubHeading" Text="Complainant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintNo" runat="server" meta:resourcekey="lblComplaintNo" Text="Complaint No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtComplaintNoUps" ReadOnly="True" runat="server" meta:resourcekey="txtComplaintNoUps"
                                    Text='<%# Bind("ComplaintNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintTypeUps" runat="server" meta:resourcekey="lblComplaintTypeUps"
                                    Text="Complain Type"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlComplaintTypeUps" runat="server" AutoPostBack="True" DataSourceID="XmlComplainType"
                                    DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlComplaintTypeUps"
                                    Enabled="False" OnDataBound="ddlComplaintTypeUps_DataBound" SelectedValue='<%# Bind("ComplaintType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:MultiView ID="mvComplainDetails" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="viewComplainType" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainantNameUps" runat="server" meta:resourcekey="lblComplainantNameUps"
                                                        Text="Name"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtComplainantNameUps" runat="server" meta:resourcekey="ComplainantNameUps"
                                                        ReadOnly="True" Text='<%# Bind("ComplainantName") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainantUps" runat="server" meta:resourcekey="lblComplainantUps"
                                                        Text="Address"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtAddressUps" runat="server" meta:resourcekey="txtAddress" ReadOnly="True"
                                                        Text='<%# Bind("ComplainantAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="view1" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="lblOfficeIdUps" Text="Office"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="txtAddress" ReadOnly="True"
                                                        Text='<%# Bind("OfficeName") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainingEmpName" runat="server" meta:resourcekey="lblComplainingEmpName"
                                                        Text="Employee Name"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:DropDownList ID="ddlComplainingEmpName" runat="server" meta:resourcekey="ddlComplainingEmpName"
                                                        DataSourceID="odsGetEmployee" DataTextField="FirstName" DataValueField="EmployeeID"
                                                        Enabled="False">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintDateUps" runat="server" meta:resourcekey="lblComplaintDateUps"
                                    Text="Complaint Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtComplaintDateUps" runat="server" meta:resourcekey="txtComplaintDateUps"
                                    SkinID="Calendar" Text='<%# Bind("ComplaintDate") %>' ReadOnly="True" OnDataBinding="txtComplaintDateUps_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSubjectUps" runat="server" meta:resourcekey="lblSubject" Text="Subject"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSubjectUps" runat="server" meta:resourcekey="txtSubject" Text='<%# Bind("Subject") %>'
                                    TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDetailUps" runat="server" meta:resourcekey="lblDetailUps" SkinID="SubHeading"
                                    Text="Detail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="textColumn" colspan="5">
                                <asp:TextBox ID="txtDetailUps" runat="server" Height="125px" meta:resourcekey="txtDetailUps"
                                    ReadOnly="True" Text='<%# Bind("Detail") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblEnquiryHeaderUps" runat="server" meta:resourcekey="lblApplicantHeader"
                                    SkinID="SubHeading" Text="Enquiry Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEnquiryOfficerName" runat="server" meta:resourcekey="lblEnquiryOfficerName"
                                    Text="Enquiry Officer Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEnquiryOfficerName" ReadOnly="True" runat="server" Text='<%# Bind("OfficerName") %>'
                                    meta:resourcekey="txtEnquiryOfficerNameResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <table width="100%">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblInvestigationHeaderUps" runat="server" meta:resourcekey="lblApplicantHeader"
                            SkinID="SubHeading" Text="Investigation Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblInvestigationDate" runat="server" meta:resourcekey="lblInvestigationDate"
                            Text="Date"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtInvestigationDate" runat="server" meta:resourcekey="txtInvestigationDate"
                            Text='<%# Bind("InvDate") %>' SkinID="Calendar" ReadOnly="True"></asp:TextBox>
                        <rjs:PopCalendar ID="PopCalendar5" runat="server" Control="txtInvestigationDate"
                            meta:resourcekey="PopCalendar5Resource1" />
                    </td>
                    <td class="validationColumn">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInvestigationDate"
                            ErrorMessage="Please Enter Investigation Date" meta:resourcekey="RequiredFieldValidator3Resource1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblInvestigationDetails" runat="server" meta:resourcekey="lblInvestigationDetails"
                            Text="Detail"></asp:Label>
                    </td>
                    <td class="textColumn" colspan="4">
                        <asp:TextBox ID="txtInvestigationDetails" runat="server" TextMode="MultiLine" meta:resourcekey="txtInvestigationDetails"
                            Text='<%# Bind("InvDetails") %>' Height="50px"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtInvestigationDetails"
                            ErrorMessage="Enter Investigation Details" meta:resourcekey="RequiredFieldValidator4Resource1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblIsFinal" runat="server" meta:resourcekey="lblIsFinal" Text="Investigation Completed"></asp:Label>
                    </td>
                    <td class="textColumn" colspan="4">
                        <asp:CheckBox ID="chkIsFinal" runat="server" meta:resourcekey="chkIsFinal" Text='<%# Bind("IsFinal") %>' />
                    </td>
                    <td class="validationColumn">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInvestigationDetails"
                            meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Button1_Click" meta:resourcekey="btnSubmitResource1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gdInvestigationDetail" runat="server" AutoGenerateColumns="False"
                DataKeyNames="InvestigationID" DataSourceID="odsGetInvestigationdetail" OnSelectedIndexChanged="gdInvestigationDetail_SelectedIndexChanged"
                OnRowDeleting="gdInvestigationDetail_RowDeleting" meta:resourcekey="gdInvestigationDetailResource1">
                <Columns>
                    <asp:TemplateField HeaderText="Investigation Date" SortExpression="InvDate" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InvDate") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblInvDate" runat="server" Text='<%# Bind("InvDate") %>' meta:resourcekey="LblInvDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Investigation Details" SortExpression="InvDetails"
                        meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("InvDetails") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInvDetails" runat="server" Text='<%# Bind("InvDetails") %>' meta:resourcekey="lblInvDetailsResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:TemplateField>
                    <asp:CommandField SelectText="Update" ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsComplain" runat="server"
                SelectMethod="GetComplainDetailsByComplainId" TypeName="IGRSS.BusinessLogicLayer.Complain" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldComplainId" Name="ComplainId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsGetInvestigationdetail" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInvestigationDetail" TypeName="IGRSS.BusinessLogicLayer.Complain">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldComplainId" Name="ComplainId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlComplainType" runat="server"></asp:XmlDataSource>
            <asp:ObjectDataSource ID="odsGetEmployee" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeDetails"
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
            <asp:HiddenField ID="fldComplainId" runat="server" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
