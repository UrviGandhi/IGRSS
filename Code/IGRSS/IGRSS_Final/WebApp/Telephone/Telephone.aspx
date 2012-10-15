<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="Telephone.aspx.cs" Inherits="Telephone_Telephone" Title="Untitled Page" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvTelephone" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewSearchCallDetails" runat="server">
            <table id="TABLE1" width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblEmpId" runat="server" Text="Enter Caller Name"></asp:Label></td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtEmpName" runat="server" CausesValidation="True" meta:resourcekey="txtEmpName"
                            Width="166px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmpName"
                            ErrorMessage="Please Enter Valid Name" ValidationExpression="[a-z]*">*</asp:RegularExpressionValidator></td>
                    <td class="labelColumn">
                        <asp:Label ID="lblEmpNo" runat="server" Text="Enter Employee No"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtEmpNo" runat="server" meta:resourcekey="txtEmpNo" CausesValidation="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        &nbsp;<asp:Button ID="btnSearchCallDetails" runat="server" Text="Search" OnClick="btnSearchCallDetails_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="gdTelephoneDetails" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="TelephoneRegID" OnSelectedIndexChanged="gdTelephoneDetails_SelectedIndexChanged"
                            AllowPaging="True" OnPageIndexChanging="gdTelephoneDetails_PageIndexChanging"
                            OnSelectedIndexChanging="gdTelephoneDetails_SelectedIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="CallDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Call Date"
                                    SortExpression="CallDate" HtmlEncode="False">
                                    <HeaderStyle CssClass="grdDateField" />
                                    <ItemStyle CssClass="grdDateField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DialledNo" HeaderText="Dialled No" SortExpression="DialledNo">
                                    <HeaderStyle CssClass="grdMoneyField" />
                                    <ItemStyle CssClass="grdMoneyField" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks">
                                    <HeaderStyle CssClass="grdTextField" />
                                    <ItemStyle CssClass="grdTextField" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Select" />
                            </Columns>
                            <EmptyDataTemplate>
                                Records not found!
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewTelephoneDetails" runat="server">
            <asp:FormView runat="server" ID="FvTelephone" DataSourceID="odsTelePhone" DataKeyNames="TelephoneRegID"
                DefaultMode="Insert">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPhoneDetailsHeaderIns" runat="server" meta:resourcekey="lblPhoneDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Phone Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallDateIns" runat="server" meta:resourcekey="lblCallDateIns" Text="Phone Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCallDateIns" runat="server" meta:resourcekey="txtCallDateIns"
                                    SkinID="Calendar" ReadOnly="True" Text='<%# Bind("CallDate", "{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calInwardDateItm" runat="server" Control="txtCallDateIns" meta:resourcekey="calInwardDateItm"
                                    Move="True" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="regPhonedate" runat="server" ControlToValidate="txtCallDateIns"
                                    ErrorMessage="Please Enter Phone Date">
							*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallerNameIns" runat="server" meta:resourcekey="lblCallerNameIns"
                                    Text="Caller Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCallerNameIns" runat="server" meta:resourcekey="ddlCallerNameIns"
                                    SelectedValue='<%# Bind("EmployeeID") %>' Text='<%# Bind("EmployeeID") %>' DataSourceID="odsGetEmployee"
                                    DataTextField="FirstName" DataValueField="EmployeeID">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalledPersonIns" runat="server" meta:resourcekey="lblCalledPersonIns"
                                    Text="Called Person"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCalledPersonIns" runat="server" meta:resourcekey="ddlCalledPersonIns"
                                    SelectedValue='<%# Bind("CalledEmpID") %>' Text='<%# Bind("CalledEmpID") %>'
                                    DataSourceID="odsGetEmployee" DataTextField="FirstName" DataValueField="EmployeeID">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDialledNoIns" runat="server" meta:resourcekey="lblDialedNoIns"
                                    Text="Dialled No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDialledNoIns" runat="server" meta:resourcekey="txtDialledNoIns"
                                    Text='<%# Bind("DialledNo") %>' MaxLength="13"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvDialledNoIns" runat="server" ControlToValidate="txtDialledNoIns"
                                    ErrorMessage="Please Enter Dialled No">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpDialledNo" runat="server" ControlToValidate="txtDialledNoIns"
                                    ErrorMessage="Please Enter Valid Phone No" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="5">
                                <asp:TextBox ID="txtRemarksIns" TextMode="MultiLine" runat="server" meta:resourcekey="txtRemarksIns"
                                    Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="regRemarksIns" runat="server" ControlToValidate="txtRemarksIns"
                                    ErrorMessage="Enter Valid Remarks" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnTelephoneInsertIns" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Save" />
                                <asp:Button ID="btnTelephoneCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPhoneDetailsHeaderUpd" runat="server" meta:resourcekey="lblPhoneDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Phone Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallDateUpd" runat="server" meta:resourcekey="lblCallDateUpd" Text="Phone Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCallDateUpd" runat="server" meta:resourcekey="txtCallDateUpd"
                                    ReadOnly="True" Text='<%# Bind("CallDate", "{0:d}") %>' OnDataBinding="txtCallDateUpd_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <rjs:PopCalendar ID="calInwardDateItm" runat="server" Control="txtCallDateUpd" meta:resourcekey="calInwardDateItm"
                                    Move="True" />
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallerNameUpd" runat="server" meta:resourcekey="lblCallerNameUpd"
                                    Text="Caller Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCallerNameUpd" runat="server" meta:resourcekey="ddlCallerNameUpd"
                                    SelectedValue='<%# Bind("EmployeeID") %>' DataSourceID="odsGetEmployee" DataTextField="FirstName"
                                    DataValueField="EmployeeID">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalledPersonUpd" runat="server" meta:resourcekey="lblCalledPersonUpd"
                                    Text="Called Person"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCalledPersonUpd" runat="server" meta:resourcekey="ddlCalledPersonUpd"
                                    SelectedValue='<%# Bind("CalledEmpID") %>' DataSourceID="odsGetEmployee" DataTextField="FirstName"
                                    DataValueField="EmployeeID">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDialledNoUpd" runat="server" meta:resourcekey="lblDialedNoUpd"
                                    Text="Dialled No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDialledNoUpd" MaxLength="13" runat="server" meta:resourcekey="txtDialledNoUpd"
                                    Text='<%# Bind("DialledNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvDialledNoUpd" runat="server" ControlToValidate="txtDialledNoUpd"
                                    ErrorMessage="Please Enter Dialled No">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpDialledNo" runat="server" ControlToValidate="txtDialledNoUpd"
                                    ErrorMessage="Please Enter Valid Phone No" ValidationExpression="\d*">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnTelephoneInsertUpd" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update" />
                                <asp:Button ID="btnTelephoneCancelUpd" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPhoneDetailsHeaderItm" runat="server" meta:resourcekey="lblPhoneDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Phone Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallDateItm" runat="server" meta:resourcekey="lblCallDateItm" Text="Phone Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCallDateItm" runat="server" ReadOnly="true" meta:resourcekey="txtCallDateItm"
                                    Text='<%# Bind("CallDate") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCallerNameItm" runat="server" meta:resourcekey="lblCallerNameItm"
                                    Text="Caller Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCallerNameItm" runat="server" meta:resourcekey="txtCallerName"
                                    ReadOnly="true" Text='<%# Bind("EmpName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCalledPersonItm" runat="server" meta:resourcekey="lblCalledPersonItm"
                                    Text="Called Person"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCalledPersonNameItm" runat="server" meta:resourcekey="txtCalledPersonNameItm"
                                    ReadOnly="true" Text='<%# Bind("CalledEmpName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDialledNoItm" runat="server" meta:resourcekey="lblDialedNoItm"
                                    Text="Dialled No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDialledNoItm" runat="server" meta:resourcekey="txtDialledNoItm"
                                    ReadOnly="true" Text='<%# Bind("DialledNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" ReadOnly="true"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            &nbsp;
        </asp:View>
        <asp:View ID="viewReadOnly" runat="server">
            <asp:FormView ID="fvReadonly" runat="server" DataKeyNames="TelephoneRegID" DataSourceID="odsTelePhone"
                OnPageIndexChanging="fvReadonly_PageIndexChanging">
                <ItemTemplate>
                    TelephoneRegID:
                    <asp:Label ID="TelephoneRegIDLabel" runat="server" Text='<%# Eval("TelephoneRegID") %>'>
                    </asp:Label><br />
                    CallDate:
                    <asp:Label ID="CallDateLabel" runat="server" Text='<%# Bind("CallDate") %>'></asp:Label><br />
                    EmployeeID:
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Bind("EmployeeID") %>'>
                    </asp:Label><br />
                    CalledEmpID:
                    <asp:Label ID="CalledEmpIDLabel" runat="server" Text='<%# Bind("CalledEmpID") %>'>
                    </asp:Label><br />
                    CalledPerson:
                    <asp:Label ID="CalledPersonLabel" runat="server" Text='<%# Bind("CalledPerson") %>'>
                    </asp:Label><br />
                    DialledNo:
                    <asp:Label ID="DialledNoLabel" runat="server" Text='<%# Bind("DialledNo") %>'></asp:Label><br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label><br />
                    CreatedBy:
                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label><br />
                    CreatedAt:
                    <asp:Label ID="CreatedAtLabel" runat="server" Text='<%# Bind("CreatedAt") %>'></asp:Label><br />
                    ModifiedBy:
                    <asp:Label ID="ModifiedByLabel" runat="server" Text='<%# Bind("ModifiedBy") %>'>
                    </asp:Label><br />
                    ModifiedAt:
                    <asp:Label ID="ModifiedAtLabel" runat="server" Text='<%# Bind("ModifiedAt") %>'>
                    </asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit">
                    </asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New">
                    </asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    TelephoneRegID:
                    <asp:Label ID="TelephoneRegIDLabel1" runat="server" Text='<%# Eval("TelephoneRegID") %>'>
                    </asp:Label><br />
                    CallDate:
                    <asp:TextBox ID="CallDateTextBox" runat="server" Text='<%# Bind("CallDate") %>'>
                    </asp:TextBox><br />
                    EmployeeID:
                    <asp:TextBox ID="EmployeeIDTextBox" runat="server" Text='<%# Bind("EmployeeID") %>'>
                    </asp:TextBox><br />
                    CalledEmpID:
                    <asp:TextBox ID="CalledEmpIDTextBox" runat="server" Text='<%# Bind("CalledEmpID") %>'>
                    </asp:TextBox><br />
                    CalledPerson:
                    <asp:TextBox ID="CalledPersonTextBox" runat="server" Text='<%# Bind("CalledPerson") %>'>
                    </asp:TextBox><br />
                    DialledNo:
                    <asp:TextBox ID="DialledNoTextBox" runat="server" Text='<%# Bind("DialledNo") %>'>
                    </asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>'>
                    </asp:TextBox><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'>
                    </asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'>
                    </asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'>
                    </asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    TelephoneRegID:
                    <asp:TextBox ID="TelephoneRegIDTextBox" runat="server" Text='<%# Bind("TelephoneRegID") %>'>
                    </asp:TextBox><br />
                    CallDate:
                    <asp:TextBox ID="CallDateTextBox" runat="server" Text='<%# Bind("CallDate") %>'>
                    </asp:TextBox><br />
                    EmployeeID:
                    <asp:TextBox ID="EmployeeIDTextBox" runat="server" Text='<%# Bind("EmployeeID") %>'>
                    </asp:TextBox><br />
                    CalledEmpID:
                    <asp:TextBox ID="CalledEmpIDTextBox" runat="server" Text='<%# Bind("CalledEmpID") %>'>
                    </asp:TextBox><br />
                    CalledPerson:
                    <asp:TextBox ID="CalledPersonTextBox" runat="server" Text='<%# Bind("CalledPerson") %>'>
                    </asp:TextBox><br />
                    DialledNo:
                    <asp:TextBox ID="DialledNoTextBox" runat="server" Text='<%# Bind("DialledNo") %>'>
                    </asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>'>
                    </asp:TextBox><br />
                    CreatedBy:
                    <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>'>
                    </asp:TextBox><br />
                    CreatedAt:
                    <asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt") %>'>
                    </asp:TextBox><br />
                    ModifiedBy:
                    <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>'>
                    </asp:TextBox><br />
                    ModifiedAt:
                    <asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
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
    <asp:ObjectDataSource ID="odsTelePhone" runat="server" InsertMethod="InsertTelephoneDetails"
        SelectMethod="GetTelePhoneDetailsByTelephoneRegId" TypeName="IGRSS.BusinessLogicLayer.Telephone"
        UpdateMethod="UpdateTelephoneDetails">
        <UpdateParameters>
            <asp:Parameter Name="CallDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="CalledEmpID" Type="Object" />
            <asp:Parameter Name="DialledNo" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="TelephoneRegID" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gdTelephoneDetails" Name="TelephoneRegID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="CallDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="CalledEmpID" Type="Object" />
            <asp:Parameter Name="DialledNo" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetCallDetails" runat="server" InsertMethod="InsertTelephoneDetails"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetTelePhoneDetailsByEmpId"
        TypeName="IGRSS.BusinessLogicLayer.Telephone" UpdateMethod="UpdateTelephoneDetails">
        <UpdateParameters>
            <asp:Parameter Name="CallDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="CalledEmpID" Type="Object" />
            <asp:Parameter Name="DialledNo" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="TelephoneRegID" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CallDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="CalledEmpID" Type="Object" />
            <asp:Parameter Name="DialledNo" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
