<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_OutwardRegister, App_Web_dhxbsoqy" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvOutwardRegister" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieGrid" runat="server">
          <asp:Label ID="lbllls" runat="server" Text="Enter File Number" meta:resourcekey="lblllsResource1"></asp:Label>
            <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" OnTextChanged="txtFileNo_TextChanged"
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox>
         <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
            <asp:GridView ID="gvOutWardDetails" runat="server" AutoGenerateColumns="False"
                DataSourceID="odsOutward" OnSelectedIndexChanged="gvOutWardDetails_SelectedIndexChanged"
                meta:resourcekey="gvOutWardDetailsResource1" EnableModelValidation="True">
                <EmptyDataTemplate>
                    Record Not Available
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="viewOutwardRegister" runat="server">
            <asp:Button ID="Button_new" runat="server" onclick="Button_new_Click" 
                Text="New" />
            <asp:FormView ID="FvOutward" runat="server" Width="100%" DataKeyNames="Inward_outwardId"
                DefaultMode="Insert" meta:resourcekey="FvOutward" DataSourceID="odsOutward" OnItemInserting="FvOutward_ItemInserting"
                OnItemInserted="FvOutward_ItemInserted" OnItemUpdated="FvOutward_ItemUpdated"
                OnItemUpdating="FvOutward_ItemUpdating">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td class="labelColumn" colspan="4">
                                <asp:Label ID="lblInwardOutwardHeaderIns" runat="server" meta:resourcekey="lblInwardOutwardHeaderIns"
                                    SkinID="SubHeading" Text="Outward Register"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDIns" runat="server" meta:resourcekey="ddlSentOfficeIDIns"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lbloutwardno" runat="server" meta:resourcekey="lblDocumentNoIns"
                                    Text="Outward No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtoutwardno" runat="server" MaxLength="10" 
                                    meta:resourcekey="txtDocumentNoIns" Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                &nbsp;</td>
                            <td class="labelColumn">
                                <asp:Label ID="lbloutwarddate" runat="server" 
                                    meta:resourcekey="lblInOutDateIns" Text="Outward Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOutwarddate" runat="server" 
                                    meta:resourcekey="txtInOutDateIns" ReadOnly="True" SkinID="Calendar" 
                                    Text='<%# Bind("InOutDate", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoIns" runat="server" 
                                    meta:resourcekey="lblDocumentNoIns" Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoIns" runat="server" MaxLength="10" 
                                    meta:resourcekey="txtDocumentNoIns" Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoIns" runat="server" 
                                    ControlToValidate="txtDocumentNoIns" ErrorMessage="Document No Can't be blank" 
                                    meta:resourcekey="RfvDocumentNoInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoIns" runat="server" 
                                    ControlToValidate="txtDocumentNoIns" 
                                    ErrorMessage="Document No is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentNoInsResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateIns" runat="server" 
                                    meta:resourcekey="lblInOutDateIns" Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateIns" runat="server" 
                                    meta:resourcekey="txtInOutDateIns" ReadOnly="True" SkinID="Calendar" 
                                    Text='<%# Bind("InOutDate", "{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateIns" runat="server" 
                                    Control="txtInOutDateIns" meta:resourcekey="PopCalInOutDateInsResource1" 
                                    ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" 
                                    ControlToValidate="txtInOutDateIns" ErrorMessage="Please Enter Inward Date" 
                                    meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocTypeIns" runat="server" meta:resourcekey="lblDocTypeIns" Text="Letter Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDocTypeIns" runat="server" meta:resourcekey="ddlDocTypeIns"
                                    SelectedValue='<%# Bind("DocType") %>' DataSourceID="XmlInwarddoctype" DataTextField="id"
                                    DataValueField="Value">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Put Appropriate Description" meta:resourcekey="RfvDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <%--<td class="labelColumn">
                                <asp:Label ID="lblSentOfficeIDIns" runat="server" meta:resourcekey="lblSentOfficeIDIns"
                                    Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDIns" runat="server" meta:resourcekey="ddlSentOfficeIDIns"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>--%>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentFromIns" runat="server" meta:resourcekey="lblDocumentSentFromIns"
                                    Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddldocumentsentfrombranch" runat="server" meta:resourcekey="ddlReceivingOfficeIDIns"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDIns" runat="server" meta:resourcekey="lblReceivingOfficeIDIns"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDIns" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlReceivingOfficeIDIns" 
                                    SelectedValue='<%# Bind("ReceivingOfficeID") %>' 
                                    Text='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromIns" runat="server" ControlToValidate="txtDocumentSentFromIns"
                                    ErrorMessage="Document sent From Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentFromInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromIns" runat="server"
                                    ControlToValidate="txtDocumentSentFromIns" ErrorMessage="Document sent From is not in correct format"
                                    ValidationExpression="^[a-zA-Z0-9]+$" meta:resourcekey="RegexptxtDocumentSentFromInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToIns" runat="server" meta:resourcekey="lblDocumentSentToIns"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToIns" MaxLength="50" runat="server" meta:resourcekey="txtDocumentSentToIns"
                                    Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStampValueAffixedIns" runat="server" meta:resourcekey="lblStampValueAffixedIns"
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedIns" MaxLength="5" runat="server" meta:resourcekey="txtStampValueAffixedIns"
                                    Text='<%# Bind("StampValueAffixed") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedIns" runat="server" ControlToValidate="txtStampValueAffixedIns"
                                    ErrorMessage="Stamp Value should n't be blank" meta:resourcekey="RfvStampValueAffixedInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" ControlToValidate="txtStampValueAffixedIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" ErrorMessage="Stamp value is not proper format"
                                    meta:resourcekey="RegExpStampValueResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeIns" runat="server" meta:resourcekey="lblDeliveryTypeIns"
                                    Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryTypeIns" runat="server" meta:resourcekey="ddlDeliveryTypeIns"
                                    Text='<%# Bind("DeliveryType") %>' DataSourceID="odsDeliveryType" DataTextField="Name"
                                    DataValueField="PostalDeliveryType_Id" SelectedValue='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <%--<td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchIns" runat="server" meta:resourcekey="lblDeliveryBranchIns"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryBranchIns" runat="server" meta:resourcekey="ddlDeliveryBranchIns"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>--%>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameIns" runat="server" meta:resourcekey="lblSenderNameIns"
                                    Text="Sender Name"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameIns" MaxLength="50" runat="server" meta:resourcekey="txtSenderNameIns"
                                    Text='<%# Bind("DocumentSender") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksIns" MaxLength="120" runat="server" meta:resourcekey="txtRemarksIns"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Insert" meta:resourcekey="btnInsate"
                                    Text="Save" />
                                <asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelIns"
                                    CausesValidation="False" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblInwardOutwardHeaderUpd" runat="server" meta:resourcekey="lblInwardOutwardHeaderUpd"
                                    SkinID="SubHeading" Text="Outward Register"></asp:Label>
                                <asp:DropDownList ID="ddlDeliveryBranchUpd" runat="server" meta:resourcekey="ddlDeliveryBranchUpd"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDUpd" runat="server" meta:resourcekey="ddlSentOfficeIDUpd"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoUpd" runat="server" meta:resourcekey="lblDocumentNoUpd"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoUpd" ReadOnly="True" runat="server" meta:resourcekey="txtDocumentNoUpd"
                                    Text='<%# Bind("DocumentNo") %>' MaxLength="10"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoUpd" runat="server" ControlToValidate="txtDocumentNoUpd"
                                    ErrorMessage="Document No Can't be blank" meta:resourcekey="RfvDocumentNoUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoUpd" runat="server" ControlToValidate="txtDocumentNoUpd"
                                    ErrorMessage="Document No is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentNoUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateUpd" runat="server" meta:resourcekey="lblInOutDateUpd"
                                    Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateUpd" runat="server" meta:resourcekey="txtInOutDateUpd"
                                    Text='<%# Bind("InOutDate", "{0:d}") %>' SkinID="Calendar" ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateUpd" runat="server" Control="txtInOutDateUpd"
                                    ToolTip="select Date From Date Picker" meta:resourcekey="PopCalInOutDateUpdResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" ControlToValidate="txtInOutDateUpd"
                                    ErrorMessage="Please Enter Inward Date" meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocTypeUpd" runat="server" meta:resourcekey="lblDocTypeUpd" Text="Letter Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDocTypeUpd" runat="server" meta:resourcekey="ddlDocTypeUpd"
                                    SelectedValue='<%# Bind("DocType") %>' DataSourceID="XmlInwarddoctype" DataTextField="id"
                                    DataValueField="Value">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescriptionUpd" ReadOnly="true" SkinID="Calendar" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="calDescriptionUpd" runat="server" Control="txtDescriptionUpd" ToolTip="select Date From Date Picker"
                                    meta:resourcekey="calDescriptionUpd" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Put Appropriate Description" meta:resourcekey="RfvDescriptionUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <%--<td class="labelColumn">
                                <asp:Label ID="lblSentOfficeIDUpd" runat="server" meta:resourcekey="lblSentOfficeIDUpd"
                                    Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDUpd" runat="server" meta:resourcekey="ddlSentOfficeIDUpd"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>--%>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDUpd" runat="server" meta:resourcekey="lblReceivingOfficeIDUpd"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDUpd" runat="server" meta:resourcekey="ddlReceivingOfficeIDUpd"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentFromUpd" runat="server" meta:resourcekey="lblDocumentSentFromUpd"
                                    Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromUpd" MaxLength="50" runat="server" meta:resourcekey="txtDocumentSentFromUpd"
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromUpd" runat="server" ControlToValidate="txtDocumentSentFromUpd"
                                    ErrorMessage="Document sent From Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentFromUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromUpd" runat="server"
                                    ControlToValidate="txtDocumentSentFromUpd" ErrorMessage="Document sent From is not in correct format"
                                    ValidationExpression="^[a-zA-Z0-9]+$" meta:resourcekey="RegexptxtDocumentSentFromUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToUpd" runat="server" meta:resourcekey="lblDocumentSentToUpd"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToUpd" MaxLength="50" runat="server" meta:resourcekey="txtDocumentSentToUpd"
                                    Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToUpd" runat="server" ControlToValidate="txtDocumentSentToUpd"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToUpd" runat="server" ControlToValidate="txtDocumentSentToUpd"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStampValueAffixedUpd" runat="server" meta:resourcekey="lblStampValueAffixedUpd"
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedUpd" MaxLength="5" runat="server" meta:resourcekey="txtStampValueAffixedUpd"
                                    Text='<%# Bind("StampValueAffixed", "{0:F}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedUpd" runat="server" ControlToValidate="txtStampValueAffixedUpd"
                                    ErrorMessage="Stamp Value should n't be blank" meta:resourcekey="RfvStampValueAffixedUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" ControlToValidate="txtStampValueAffixedUpd"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" ErrorMessage="Stamp value is not proper format"
                                    meta:resourcekey="RegExpStampValueResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeUpd" runat="server" meta:resourcekey="lblDeliveryTypeUpd"
                                    Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryTypeUpd" runat="server" meta:resourcekey="ddlDeliveryTypeUpd"
                                    Text='<%# Bind("DeliveryType") %>' DataSourceID="odsDeliveryType" DataTextField="Name"
                                    DataValueField="PostalDeliveryType_Id" SelectedValue='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <%--<td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchUpd" runat="server" meta:resourcekey="lblDeliveryBranchUpd"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryBranchUpd" runat="server" meta:resourcekey="ddlDeliveryBranchUpd"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>--%>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameUpd" runat="server" meta:resourcekey="lblSenderNameUpd"
                                    Text="Sender Name"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameUpd" MaxLength="50" runat="server" meta:resourcekey="txtSenderNameUpd"
                                    Text='<%# Bind("DocumentSender") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiversNameUpd" runat="server" meta:resourcekey="lblReceiversNameUpd"
                                    Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameUpd" MaxLength="50" runat="server" meta:resourcekey="txtReceiversNameUpd"
                                    Text='<%# Bind("ReceiversName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksUpd" MaxLength="150" runat="server" meta:resourcekey="txtRemarksUpd"
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Update" meta:resourcekey="btnUpdate"
                                    Text="Update" />
                                <asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
                                    CausesValidation="False" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderItm" runat="server" meta:resourcekey="lblInwardOutwardHeaderItm"
                                    SkinID="SubHeading" Text="Inward Outward Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoItm" runat="server" meta:resourcekey="lblDocumentNoItm"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoItm" runat="server" meta:resourcekey="txtDocumentNoItm"
                                    Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoItm" runat="server" ControlToValidate="txtDocumentNoItm"
                                    ErrorMessage="Document No Can't be blank" meta:resourcekey="RfvDocumentNoItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoItm" runat="server" ControlToValidate="txtDocumentNoItm"
                                    ErrorMessage="Document No is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentNoItmResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateItm" runat="server" meta:resourcekey="lblInOutDateItm"
                                    Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateItm" runat="server" meta:resourcekey="txtInOutDateItm"
                                    Text='<%# Bind("InOutDate", "{0:d}") %>' SkinID="Calendar" ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateItm" runat="server" Control="txtInOutDateItm"
                                    ToolTip="select Date From Date Picker" meta:resourcekey="PopCalInOutDateItmResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" ControlToValidate="txtInOutDateItm"
                                    ErrorMessage="Please Enter Inward Date" meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="LabelOutwardNo" runat="server" 
                                    meta:resourcekey="lblDocumentNoItm" Text="Outward No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox_outwardno" runat="server" 
                                    meta:resourcekey="txtDocumentNoItm" Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                &nbsp;</td>
                            <td class="labelColumn">
                                <asp:Label ID="Label_address" runat="server" 
                                    meta:resourcekey="lblDocumentNoItm" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox_address" runat="server" 
                                    meta:resourcekey="txtDescriptionItm" Text='<%# Bind("Description") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocTypeItm" runat="server" meta:resourcekey="lblDocTypeItm" Text="Letter Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDocTypeItm" runat="server" meta:resourcekey="ddlDocTypeItm"
                                    SelectedValue='<%# Bind("DocType") %>' DataSourceID="XmlInwarddoctype" DataTextField="id"
                                    DataValueField="Value">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescriptionItm" runat="server" meta:resourcekey="txtDescriptionItm"
                                    Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionItm" runat="server" ControlToValidate="txtDescriptionItm"
                                    ErrorMessage="Put Appropriate Description" meta:resourcekey="RfvDescriptionItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSentOfficeIDItm" runat="server" meta:resourcekey="lblSentOfficeIDItm"
                                    Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDItm" runat="server" meta:resourcekey="ddlSentOfficeIDItm"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDItm" runat="server" meta:resourcekey="lblReceivingOfficeIDItm"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDItm" runat="server" meta:resourcekey="ddlReceivingOfficeIDItm"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentFromItm" runat="server" meta:resourcekey="lblDocumentSentFromItm"
                                    Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromItm" runat="server" meta:resourcekey="txtDocumentSentFromItm"
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromItm" runat="server" ControlToValidate="txtDocumentSentFromItm"
                                    ErrorMessage="Document sent From Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentFromItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromItm" runat="server"
                                    ControlToValidate="txtDocumentSentFromItm" ErrorMessage="Document sent From is not in correct format"
                                    ValidationExpression="^[a-zA-Z0-9]+$" meta:resourcekey="RegexptxtDocumentSentFromItmResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToItm" runat="server" meta:resourcekey="lblDocumentSentToItm"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToItm" runat="server" meta:resourcekey="txtDocumentSentToItm"
                                    Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToItm" runat="server" ControlToValidate="txtDocumentSentToItm"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToItm" runat="server" ControlToValidate="txtDocumentSentToItm"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToItmResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStampValueAffixedItm" runat="server" meta:resourcekey="lblStampValueAffixedItm"
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedItm" runat="server" meta:resourcekey="txtStampValueAffixedItm"
                                    Text='<%# Bind("StampValueAffixed") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedItm" runat="server" ControlToValidate="txtStampValueAffixedItm"
                                    ErrorMessage="Stamp Value should n't be blank" meta:resourcekey="RfvStampValueAffixedItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" ControlToValidate="txtStampValueAffixedItm"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" ErrorMessage="Stamp value is not proper format"
                                    meta:resourcekey="RegExpStampValueResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeItm" runat="server" meta:resourcekey="lblDeliveryTypeItm"
                                    Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryTypeItm" runat="server" meta:resourcekey="ddlDeliveryTypeItm"
                                    Text='<%# Bind("DeliveryType") %>' DataSourceID="odsDeliveryType" DataTextField="Name"
                                    DataValueField="PostalDeliveryType_Id" SelectedValue='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchItm" runat="server" meta:resourcekey="lblDeliveryBranchItm"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeliveryBranchItm" runat="server" meta:resourcekey="txtDeliveryBranchItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameItm" runat="server" meta:resourcekey="lblSenderNameItm"
                                    Text="Sender Name"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameItm" runat="server" meta:resourcekey="txtSenderNameItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiversNameItm" runat="server" meta:resourcekey="lblReceiversNameItm"
                                    Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameItm" runat="server" meta:resourcekey="txtReceiversNameItm"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Itmert" meta:resourcekey="btnItmate"
                                    Text="Save" />
                                <asp:Button ID="btnCancelItm" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelItm"
                                    CausesValidation="False" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDeliveryType" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
                InsertMethod="AddInwardDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDeliveryType" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
                UpdateMethod="UpdateInwardDetails">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_outwardId" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlInwardtype" runat="server"></asp:XmlDataSource>
            <asp:ObjectDataSource ID="odsOutward" runat="server" InsertMethod="AddOutWardDetails"
                OnInserting="odsOutward_Inserting" SelectMethod="GetAllOutwardDetailsById" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
                UpdateMethod="UpdateOutwardDetails" OnUpdating="odsOutward_Updating" OnInserted="odsOutward_Inserted">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_OutwardId" Type="Object" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOutWardDetails" Name="OutwardId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" SelectMethod="GetDepartmentMasterDetails"
                TypeName="IGRSS.BusinessLogicLayer.Employee" OldValuesParameterFormatString="original_{0}">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllOutwardDetails" TypeName="IGRSS.BusinessLogicLayer.InwardOutward">
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
