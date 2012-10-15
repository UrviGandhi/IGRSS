<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="AssignInvestigationOfficer.aspx.cs" Inherits="Complain_AssignInvestigationOfficer"
    Title="Assign Investigation Officer details" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" %>

<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script type="text/javascript">
    function showEnquiryDetails(checkboxId, buttonId){
        var chkEnquiryDetails = document.getElementById(checkboxId);
        if(chkEnquiryDetails.checked) {
            document.getElementById("trEnquiryDetails").style.display="inline-block";
            document.getElementById(buttonId).disabled=false;
            
        }
        else {
            document.getElementById("trEnquiryDetails").style.display="none";
            document.getElementById(buttonId).disabled=true;
        }
    }
    </script>
    
    <asp:MultiView ID="mvAssignOfficer" runat="server" ActiveViewIndex="1">
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
                        <asp:Button ID="btnSearchComplainNo" runat="server" Text="Search" meta:resourcekey="btnSearchComplainNoResource1"
                            OnClick="btnSearchComplainNo_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 222px">
                        <asp:GridView ID="gdComplain" runat="server" AutoGenerateColumns="False" DataKeyNames="ComplainId"
                            DataSourceID="odsGetComplainByComplainNo" OnSelectedIndexChanged="gdComplain_SelectedIndexChanged"
                            meta:resourcekey="gdComplainResource1">
                            <Columns>
                                <asp:BoundField DataField="ComplaintNo" HeaderText="Complaint No" SortExpression="ComplaintNo"
                                    meta:resourcekey="BoundFieldResource1" >
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ComplaintDate" HeaderText="Complaint Date" SortExpression="ComplaintDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False"
                                    meta:resourcekey="BoundFieldResource4" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ComplainantName" HeaderText="Complainant Name" SortExpression="ComplainantName"
                                    meta:resourcekey="BoundFieldResource2" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"
                                    meta:resourcekey="BoundFieldResource5" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" HeaderText="Select" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
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
            <asp:FormView ID="FvAssignOfficer" runat="server" DataKeyNames="ComplainId" DataSourceID="odsComplain"
                OnItemCommand="FvAssignOfficer_ItemCommand" meta:resourcekey="FvAssignOfficerResource1" OnLoad="FvAssignOfficer_Load">
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
                                <asp:MultiView ID="mvComplainDetails" runat="server" ActiveViewIndex="1">
                                    <asp:View ID="viewComplainType" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainantNameUps" runat="server" meta:resourcekey="lblComplainantNameUps"
                                                        Text="Complainant Name"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtComplainantNameUps" runat="server" meta:resourcekey="ComplainantNameUps"
                                                        ReadOnly="True" Text='<%# Bind("ComplainantName") %>'></asp:TextBox>
                                                </td>
                                                <td align="left" class="validationColumn">
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
                                                    <asp:TextBox ID="txtOfficeIdUps" runat="server" meta:resourcekey="txtOfficeIdUps"
                                                        ReadOnly="True" Text='<%# Bind("OfficeName") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblComplainingEmpName" runat="server" meta:resourcekey="lblComplainingEmpName"
                                                        Text="Employee Name"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtComplainingEmpName" runat="server" meta:resourcekey="txtComplainingEmpName"
                                                        ReadOnly="True" Text='<%# Bind("ComEmpName") %>'></asp:TextBox>
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
                                    ReadOnly="True" Text='<%# Bind("ComplaintDate") %>' OnDataBinding="txtComplaintDateUps_DataBinding"></asp:TextBox>
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
                            <td colspan="6">
                                <asp:Label ID="lblDetailUps" runat="server" meta:resourcekey="lblDetailUps" SkinID="SubHeading"
                                    Text="Detail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="textColumn" colspan="6">
                                <asp:TextBox ID="txtDetailUps" runat="server" Height="125px" meta:resourcekey="txtDetailUps"
                                    ReadOnly="True" Text='<%# Bind("Detail") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkAssignEnquiry" runat="server" SkinID="SubHeading" Checked="true" Text="Assign Enquiry" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="6">
                                <table width="100%">
                                    <tr id="trEnquiryDetails">
                                        <td align="left" style="width: 20%" >
                                            <asp:Label ID="lblOfficeName" runat="server" Text="Office Name:"></asp:Label>
                                        </td>
                                        <td style="width: 20%" >
                                            <asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="odsDepartment"
                                                DataTextField="OfficeName" DataValueField="OfficeId">
                                            </asp:DropDownList><br />
                                            <asp:ObjectDataSource ID="odsDepartment" runat="server" InsertMethod="InsertNewFile"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.FileManagement">
                                                <InsertParameters>
                                                    <asp:Parameter Name="OfficeId" Type="Object" />
                                                    <asp:Parameter Name="FileDepartment" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                        <td style="width: 10%">
                                        </td>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDesigination" runat="server" Text="Desigination:"></asp:Label>
                                        </td>
                                        <td style="width: 20%">
                                            <asp:DropDownList ID="ddlDesigination" runat="server" DataSourceID="odsDesignation"
                                                DataTextField="Name" DataValueField="DesignationID">
                                            </asp:DropDownList><asp:ObjectDataSource ID="odsDesignation" runat="server" SelectMethod="GetDesignationDetails"
                                                TypeName="IGRSS.BusinessLogicLayer.FileManagement"></asp:ObjectDataSource>
                                        </td>
                                        <td style="width: 10%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="6">
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                                Text="Remarks" Visible="False" />
                                            <asp:Button ID="btnForward" runat="server" CausesValidation="False" 
                                                Text="Forward" Width="80px" Visible="False" />
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr visible="false" runat="Server">
                            <td class="labelColumn">
                                <asp:Label ID="lblEnquiryOfficerName" runat="server" meta:resourcekey="lblEnquiryOfficerName"
                                    Text="Enquiry Officer Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEnquiryOfficerName" runat="server" DataSourceID="odsGetEmployee"
                                    DataTextField="FirstName" DataValueField="EmployeeID" meta:resourcekey="ddlEnquiryOfficerNameResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnAssignOfficer" runat="server" CommandName="AssignOfficer" Text="Assign Officer"
                                    Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <uc1:FileForward ID="ffcAssignOfficer" runat="server" OnLoad="ffcAssignOfficer_Load" Visible="False" />
                            </td>
                        </tr>
                    </table>
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
                </ItemTemplate>
            </asp:FormView>
            &nbsp;&nbsp;&nbsp;
            <asp:HiddenField ID="fldComplainId" runat="server" />
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsComplain" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetComplainDetailsByComplainId" TypeName="IGRSS.BusinessLogicLayer.Complain">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fldComplainId" Name="ComplainId" PropertyName="Value"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlComplainType" runat="server"></asp:XmlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
