<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Complain_Complaint, App_Web_jp5ccvwi" title="Complain Details" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvComplain" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewSearch" runat="server">
            <table width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblComplainNo" runat="server" Text="Enter Complaint No" meta:resourcekey="lblComplainNoResource1"></asp:Label></td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtComplainNo" runat="server" MaxLength="10" meta:resourcekey="txtComplainNoResource1"
                            Width="150px"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                        <asp:RegularExpressionValidator ID="RegComplainNo" runat="server" ControlToValidate="txtComplainNo"
                            ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" meta:resourcekey="RegComplainNoResource1">*</asp:RegularExpressionValidator>
                    </td>
                    <td align="right" colspan="3">
                        <asp:HiddenField ID="fldComplainId" runat="server" />
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
                                    meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="ComplaintDate" HeaderText="Complaint Date" SortExpression="ComplaintDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false"
                                    meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="ComplainantName" HeaderText="Complainant Name" SortExpression="ComplainantName"
                                    meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"
                                    meta:resourcekey="BoundFieldResource5" />
                                <asp:CommandField SelectText="Update" ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
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
        <asp:View ID="viewComplain" runat="server">
            <asp:FormView ID="fvcomplain" runat="server" DataSourceID="odsComplain" DataKeyNames="ComplainId"
                DefaultMode="Insert" OnItemInserting="fvcomplain_ItemInserting" OnItemUpdating="fvcomplain_ItemUpdating"
                meta:resourcekey="fvcomplainResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantHeaderIns" runat="server" meta:resourcekey="lblApplicantHeader"
                                    SkinID="SubHeading" Text="Complaint Application Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintNo" runat="server" meta:resourcekey="lblComplaintNo" Text="Complaint No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtComplaintNoIns" MaxLength="10" runat="server" meta:resourcekey="txtComplaintNoIns"
                                    Text='<%# Bind("ComplaintNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComplaintNoIns"
                                    ErrorMessage="Complaint No is Must" meta:resourcekey="RequiredFieldValidator3Resource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegComplainNoIns" runat="server" ControlToValidate="txtComplaintNoIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" ErrorMessage="Please Enter Valid Complain No"
                                    meta:resourcekey="RegComplainNoInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintTypeIns" runat="server" Text="Complaint Type" Visible="false"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlComplaintTypeIns" runat="server" meta:resourcekey="ddlComplaintTypeIns"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlComplaintTypeIns_SelectedIndexChanged"
                                    SelectedValue='<%# Bind("ComplaintType") %>' DataSourceID="XmlComplainType" DataTextField="Key"
                                    DataValueField="Value" Visible="false" >
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                    <asp:MultiView ID="mvComplainDetails" runat="server" ActiveViewIndex="1">
                        <asp:View ID="viewComplainType" runat="server">
                            <table width="100%">
                                <tr>
                                    <td class="labelColumn">
                                        <asp:Label ID="lblComplainantNameIns" runat="server" meta:resourcekey="lblComplainantNameIns"
                                            Text="Complaint Name"></asp:Label>
                                    </td>
                                    <td class="textColumn">
                                        <asp:TextBox ID="txtComplainantNameIns" MaxLength="50" runat="server" meta:resourcekey="ComplainantNameIns"
                                            Text='<%# Bind("ComplainantName") %>'></asp:TextBox>
                                    </td>
                                    <td class="validationColumn">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComplainantNameIns"
                                            ErrorMessage="Please Enter Complainant Name" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="regComplainantNameIns" runat="server" ControlToValidate="txtComplainantNameIns"
                                            ErrorMessage="Please Enter Valid Complainant Name" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>"
                                            meta:resourcekey="regComplainantNameInsResource1">*</asp:RegularExpressionValidator>
                                  --%>
                                    </td>
                                    <td class="labelColumn">
                                        <asp:Label ID="lblComplainantIns" runat="server" meta:resourcekey="lblComplainantIns"
                                            Text="Address"></asp:Label>
                                    </td>
                                    <td class="textColumn">
                                        <asp:TextBox ID="txtAddressIns" runat="server" MaxLength="150" meta:resourcekey="txtAddress"
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
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="lblOfficeIdIns" Text="Office"></asp:Label>
                                    </td>
                                    <td class="textColumn">
                                        <asp:DropDownList ID="ddlComOfficeIdIns" runat="server" DataTextField="OfficeName"
                                            DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeId") %>' OnLoad="ddlComOfficeIdIns_Load"
                                            DataSourceID="odsDepartment">
                                        </asp:DropDownList>
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
                                            SelectedValue='<%# Bind("AgainstEmpID") %>'>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="validationColumn">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelColumn">
                                        <asp:Label ID="lblDesignation" runat="server" Text="Designation"></asp:Label>
                                    </td>
                                    <td class="textColumn">
                                        <asp:DropDownList ID="ddlDesignation" runat="server" DataSourceID="odsDesignation"
                                            DataTextField="Name" DataValueField="DesignationID" SelectedValue='<%# Bind("Designation") %>'>
                                        </asp:DropDownList>
                                        <td class="validationColumn">
                                        </td>
                                        <td class="labelColumn">
                                            <asp:Label ID="lblCurrentOffice" runat="server" Text="Current Office"></asp:Label>
                                        </td>
                                        <td class="textColumn">
                                            <asp:DropDownList ID="ddlCurrentOffice" runat="server" DataSourceID="odsDepartment"
                                                DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("CurrentOffice") %>'>
                                            </asp:DropDownList>
                                        </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                    <table width="100%">
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintDateIns" runat="server" meta:resourcekey="lblComplaintDateIns"
                                    Text="Complaint Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                               &nbsp; <asp:TextBox ID="txtComplaintDateIns" runat="server" meta:resourcekey="txtComplaintDateIns"
                                    Text='<%# Bind("ComplaintDate") %>' ReadOnly="True" SkinID="Calendar"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtComplaintDateIns" meta:resourcekey="PopCalendar1Resource1" />
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="regComplaintDate" runat="server" ControlToValidate="txtComplaintDateIns"
                                    ErrorMessage="Please Enter Complain Date" meta:resourcekey="regComplaintDateResource1"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSubjectIns" runat="server" meta:resourcekey="lblSubject" Text="Subject"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                &nbsp;&nbsp;<asp:TextBox ID="txtSubjectIns" runat="server" TextMode="MultiLine" MaxLength="250"
                                    meta:resourcekey="txtSubject" Text='<%# Bind("Subject") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDetailIns" runat="server" meta:resourcekey="lblDetailIns" SkinID="SubHeading"
                                    Text="Complainant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:TextBox ID="txtDetailIns" runat="server" Height="125px" MaxLength="500" meta:resourcekey="txtDetailIns"
                                    Text='<%# Bind("Detail") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDetailIns"
                                    ErrorMessage="Please Enter Complain Details" meta:resourcekey="RequiredFieldValidator2Resource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="ComplaintIns" runat="server" Text="Save" CommandName="Insert" meta:resourcekey="ComplaintInsResource1" />
                                <asp:Button ID="ComplaintCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="ComplaintCancelInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantHeaderUps" runat="server" meta:resourcekey="lblApplicantHeader"
                                    SkinID="SubHeading" Text="Complaint Application Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintNo" runat="server" meta:resourcekey="lblComplaintNo" Text="Complaint No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtComplaintNoUps" ReadOnly="true" runat="server" meta:resourcekey="txtComplaintNoUps"
                                    Text='<%# Bind("ComplaintNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtComplaintNoUps"
                                    meta:resourcekey="RequiredFieldValidator9Resource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintTypeUps" runat="server" meta:resourcekey="lblComplaintTypeUps"
                                    Text="Complain Type" ></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlComplaintTypeUps" runat="server" AutoPostBack="True" meta:resourcekey="ddlComplaintTypeIns"
                                    OnSelectedIndexChanged="ddlComplaintTypeUps_SelectedIndexChanged" DataSourceID="XmlComplainType"
                                    DataTextField="Key"  DataValueField="Value" Enabled="False" OnDataBinding="ddlComplaintTypeUps_DataBinding"
                                    OnDataBound="ddlComplaintTypeUps_DataBound" SelectedValue='<%# Bind("ComplaintType")  %>' >
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:MultiView ID="mvPropertyDetailsUps" runat="server" ActiveViewIndex="1">
                                    <asp:View ID="viewComplainTypeUps" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainantNameUps" runat="server" meta:resourcekey="lblComplainantNameUps"
                                                        Text="Complainant Name"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtComplainantNameUps" runat="server" meta:resourcekey="ComplainantNameUps"
                                                        Text='<%# Bind("ComplainantName") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtComplainantNameUps"
                                                        meta:resourcekey="RequiredFieldValidatorNameResource1">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainantUps" runat="server" meta:resourcekey="lblComplainantUps"
                                                        Text="Address"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtAddressUps" runat="server" meta:resourcekey="txtAddress" Text='<%# Bind("ComplainantAddress") %>'
                                                        TextMode="MultiLine"></asp:TextBox>
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
                                                    <asp:Label ID="lblOfficeIdUps" runat="server" meta:resourcekey="lblOfficeIdUps" Text="Office"></asp:Label>
                                                </td>
                                                <td align="left" class="textColumn">
                                                    <asp:DropDownList ID="ddlOfficeIdUps" runat="server" DataTextField="OfficeName" DataValueField="OfficeId"
                                                        meta:resourcekey="ddlOfficeIdIns" SelectedValue='<%# Bind("ReceivingOfficeId") %>'
                                                        OnLoad="ddlOfficeIdUps_Load">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainingEmpName" runat="server" meta:resourcekey="lblComplainingEmpName"
                                                        Text="Employee Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlComplainingEmpName" runat="server" meta:resourcekey="ddlComplainingEmpName"
                                                        DataSourceID="odsGetEmployee" DataTextField="FirstName" DataValueField="EmployeeID"
                                                        SelectedValue='<%# Bind("AgainstEmpID") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblDesignation" runat="server" Text="Designation"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlDesignationUpd" runat="server" DataSourceID="odsDesignation"
                                                        DataTextField="Name" DataValueField="DesignationID" SelectedValue='<%# Eval("Designation") %>'>
                                                    </asp:DropDownList>
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtComplaintDateUps" runat="server" meta:resourcekey="txtComplaintDateUps"
                                    Text='<%# Bind("ComplaintDate") %>' SkinID="Calendar" OnDataBinding="txtComplaintDateUps_DataBinding"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtComplaintDateUps" meta:resourcekey="PopCalendar1Resource2" />
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
                                    TextMode="MultiLine"></asp:TextBox>
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
                            <td colspan="5">
                                <asp:TextBox ID="txtDetailUps" runat="server" Height="125px" meta:resourcekey="txtDetailUps"
                                    Text='<%# Bind("Detail") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="ComplaintUps" runat="server" CommandName="Update" Text="Update" meta:resourcekey="ComplaintUpsResource1" />
                                <asp:Button ID="ComplaintCancelUps" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" meta:resourcekey="ComplaintCancelUpsResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="viewReadOnly" runat="server">
            <asp:FormView ID="fvReadonly" runat="server" DataSourceID="odsComplain" meta:resourcekey="fvReadonlyResource1">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApplicantHeaderUps" runat="server" meta:resourcekey="lblApplicantHeader"
                                    SkinID="SubHeading" Text="Complain Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="lblfileno" runat="server" Text="File Number"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFileNumber" runat="server" Text='<%# Eval("FileNo") %>' ></asp:Label>
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
                                    Text="Complain Type" ></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlviewcomtype" runat="server" meta:resourcekey="ddlComplaintTypeIns"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlComplaintTypeIns_SelectedIndexChanged"
                                    SelectedValue='<%# Bind("ComplaintType") %>' DataSourceID="XmlComplainType" DataTextField="Key"
                                    DataValueField="Value" Enabled="false" >
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplaintDateUps" runat="server" meta:resourcekey="lblComplaintDateUps"
                                    Text="Complaint Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtComplaintDateUps" runat="server" meta:resourcekey="txtComplaintDateUps"
                                    ReadOnly="True" Text='<%# Bind("ComplaintDate", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblStatusUps" runat="server" meta:resourcekey="lblStatusUps" Text="Status"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStatusUps" runat="server" meta:resourcekey="txtStatusUps" ReadOnly="True"
                                    Text='<%# Bind("Status") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="lblApplicantHeader" SkinID="SubHeading"
                                    Text="Complainant Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplainantNameUps" runat="server" meta:resourcekey="lblComplainantNameUps"
                                    Text="Complainant Name"></asp:Label>
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
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeIdUps" runat="server" meta:resourcekey="lblOfficeIdUps" Text="Office"></asp:Label>
                            </td>
                            <td align="left" class="textColumn">
                                <asp:TextBox ID="txtOfficeIdUps" runat="server" ReadOnly="True" Text='<%# Bind("OfficeName") %>'
                                    meta:resourcekey="txtOfficeIdUpsResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblComplainingEmpName" runat="server" meta:resourcekey="lblComplainingEmpName"
                                    Text="Employee Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtComplainingEmpName" runat="server" ReadOnly="True" Text='<%# Bind("ComEmpName") %>'
                                    meta:resourcekey="txtComplainingEmpNameResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSubjectUps" runat="server" meta:resourcekey="lblSubject" Text="Subject"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtSubjectUps" runat="server" meta:resourcekey="txtSubject" ReadOnly="True"
                                    Text='<%# Bind("Subject") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblEnquiryDetailsUps" runat="server" meta:resourcekey="lblEnquiryDetailsUps"
                                    SkinID="SubHeading" Text="Enquiry Detail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficerNameUps" runat="server" meta:resourcekey="lblOfficerNameUps"
                                    Text="Officer Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOfficerNameUps" runat="server" ReadOnly="True" Text='<%# Bind("OfficerName") %>'
                                    meta:resourcekey="txtOfficerNameUpsResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStartDateUps" runat="server" meta:resourcekey="lblStartDateUps"
                                    Text="Start Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStartDateUps" runat="server" ReadOnly="True" Text='<%# Bind("StartDate", "{0:d}") %>'
                                    meta:resourcekey="txtStartDateUpsResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateUps" runat="server" meta:resourcekey="lblEndDateUps" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEndDateUps" runat="server" ReadOnly="True" Text='<%# Bind("EndDate", "{0:d}") %>'
                                    meta:resourcekey="txtEndDateUpsResource1"></asp:TextBox>
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
                            <td colspan="5">
                                <asp:TextBox ID="txtDetailUps" runat="server" Height="125px" meta:resourcekey="txtDetailUps"
                                    ReadOnly="True" Text='<%# Bind("Detail") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="lblEnquiryDetailsUps" SkinID="SubHeading"
                                    Text="Investigation Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvInvDetails" runat="server" AutoGenerateColumns="False" DataSourceID="OdsInvDetails"
                                    meta:resourcekey="gvInvDetailsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="InvDate" HeaderText="Investigation Date" SortExpression="InvDate"
                                            meta:resourcekey="BoundFieldResource8" />
                                        <asp:BoundField DataField="InvDetails" HeaderText="Investigation Details" SortExpression="InvDetails"
                                            meta:resourcekey="BoundFieldResource9" />
                                        <asp:BoundField DataField="CreatedBy" HeaderText="Investigated By" SortExpression="CreatedBy"
                                            meta:resourcekey="BoundFieldResource10" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="Label14" runat="server" meta:resourcekey="lblOtherDetails" SkinID="SubHeading"
                                    Text="Creation Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedBy" runat="server" Text="Created By" meta:resourcekey="lblCreatedByResource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCreatedBy" runat="server" ReadOnly="True" Text='<%# Bind("CreatedBy") %>'
                                    meta:resourcekey="txtCreatedByResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedAt" runat="server" Text="CreatedAt" meta:resourcekey="lblCreatedAtResource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCreatedAt" runat="server" ReadOnly="True" Text='<%# Bind("CreatedAt", "{0:d}") %>'
                                    meta:resourcekey="txtCreatedAtResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <uc1:FileForward ID="FileForward1" runat="server" />
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsComplain" runat="server" SelectMethod="GetComplainDetailsByComplainId"
        TypeName="IGRSS.BusinessLogicLayer.Complain" InsertMethod="AddNewComplain" UpdateMethod="UpdateComplainDetails"
        OnInserting="odsComplain_Inserting" OnUpdating="odsComplain_Updating" OnInserted="odsComplain_Inserted">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldComplainId" Name="ComplainId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="ComplainId" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices"
        DataObjectTypeName="System.Guid" DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:ObjectDataSource ID="odsDepartment"
        runat="server" InsertMethod="InsertNewFile" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.FileManagement">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="FileDepartment" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDesignation" runat="server" SelectMethod="GetDesignationDetails"
        TypeName="IGRSS.BusinessLogicLayer.FileManagement"></asp:ObjectDataSource>
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
    <asp:ObjectDataSource ID="odsInvDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetInvestigationDetail" TypeName="IGRSS.BusinessLogicLayer.Complain">
        <SelectParameters>
            <asp:ControlParameter ControlID="gdComplain" Name="ComplainId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:XmlDataSource ID="XmlComplainType" runat="server"></asp:XmlDataSource>
</asp:Content>
