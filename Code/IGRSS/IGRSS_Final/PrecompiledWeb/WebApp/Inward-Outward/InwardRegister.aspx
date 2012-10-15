<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_InwardRegister, App_Web_dhxbsoqy" title="Inward Outward Register" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvInward" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieGrid" runat="server">
            <table width="100%">
             <tr>
                    <td align="left" class="labelColumn">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" class="textColumn">
                        <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" OnTextChanged="txtFileNo_TextChanged"
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 198px">
                        <asp:GridView ID="gvInwarddtl" runat="server" AutoGenerateColumns="False" DataKeyNames="InwardNo,SrNo"
                            DataSourceID="odsgv"
                            OnSelectedIndexChanged="gvInwarddtl_SelectedIndexChanged"
                            meta:resourcekey="gvInwarddtlResource1" AllowPaging="True" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="InwardDate" HeaderText="InwardDate" 
                                    SortExpression="InwardDate" />
                                <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                                    SortExpression="ApplicantAddress" />
                                <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                                    SortExpression="ApplicationDate" />
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" ReadOnly="True" />
                                <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName"
                                    SortExpression="ApplicantName" />
                                <asp:BoundField DataField="SentTo" HeaderText="SentTo" 
                                    SortExpression="SentTo" />
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                                    SortExpression="SrNo" ReadOnly="True" />
                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:Button ID="btnNew" runat="server" onclick="btnNew_Click" Text="New" />
                    </td>
                </tr>
            </table>
        </asp:View>
        
        <asp:View ID="vieFv" runat="server">
            <asp:FormView ID="FvInward" runat="server" Width="100%" DataSourceID="odsInward"
                OnItemInserting="FvInward_ItemInserting" OnItemUpdating="FvInward_ItemUpdating"
                DataKeyNames="Inward_outwardId" OnItemCommand="FvInward_ItemCommand" DefaultMode="Insert"
                OnItemUpdated="FvInward_ItemUpdated" meta:resourcekey="FvInwardResource1" 
                OnItemInserted="FvInward_ItemInserted" 
                onpageindexchanging="FvInward_PageIndexChanging1" 
                EnableModelValidation="True">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblInwardOutwardHeaderIns" runat="server" meta:resourcekey="lblInwardOutwardHeaderIns"
                                    SkinID="SubHeading" Text="Inward Register"></asp:Label>
                            </td>
                            <td class="textColumn">
                              <%--  <asp:DropDownList ID="ddlReceivingOfficeIDIns" runat="server" meta:resourcekey="ddlReceivingOfficeIDIns"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>--%>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblsrno" runat="server" Text="1" Visible="False"></asp:Label>
                        
                        </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label_inwardno" runat="server" Text="Inward No"></asp:Label>
                                <span style="color: #FF6666">*</span></td>
                            <td>
                                <asp:TextBox ID="txtInwardNo" runat="server" Text='<%# Bind("InwardNo") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDescriptionIns" runat="server" 
                                    meta:resourcekey="lblDescriptionIns" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"  Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblInOutDateIns" runat="server" meta:resourcekey="lblInOutDateIns"
                                    Text="Inward Date"></asp:Label>
                                <span style="color: #FF6666">*</span></td>
                            <td>
                                <asp:TextBox ID="txtInOutDateIns" runat="server" 
                                    meta:resourcekey="txtInOutDateIns" ReadOnly="True" SkinID="Calendar" 
                                    Text='<%# Bind("InOutDate", "{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateIns" runat="server" 
                                    Control="txtInOutDateIns" meta:resourcekey="PopCalInOutDateInsResource1" 
                                    ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                               <%--    <asp:RequiredFieldValidator ID="RfvDocumentNoIns" runat="server" ControlToValidate="txtDocumentNoIns"
                                 ErrorMessage="Document No Can't be blank" meta:resourcekey="RfvDocumentNoInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoIns" runat="server" ControlToValidate="txtDocumentNoIns"
                                    ErrorMessage="Document No is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentNoInsResource1">*</asp:RegularExpressionValidator>--%>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="validationColumn">
                                &nbsp;</td>
                        </tr>
                        <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Applicant Name"></asp:Label>
                            <span style="color: #FF6666">*</span></td>
                        <td>
                        <asp:TextBox ID="TextBox_ApplicantName" runat="server" 
                                Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID="Label_Applicantaddress" Text="Applicant's Address" runat="server"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="TextBox_Applicantaddress" TextMode="MultiLine" runat="server" 
                                Text='<%# Bind("ApplicantAddress") %>'></asp:TextBox>
                        </td>                                           
                        </tr>
                        <tr>
                        <td>
                         <asp:Label ID="Label_applicationdate" Text="Application Date" runat="server"></asp:Label>
                            <span style="color: #FF6666">*</span></td>
                        <td>
                            <asp:TextBox ID="txtApplicationDate" runat="server" 
                                meta:resourcekey="txtDescriptionIns" ReadOnly="True" SkinID="calendar" 
                                Text='<%# Bind("ApplicantDate") %>'></asp:TextBox>
                            <rjs:PopCalendar ID="calDescriptionIns" runat="server" 
                                Control="txtApplicationDate" meta:resourcekey="calDescriptionIns" 
                                ToolTip="select Date From Date Picker" />
                        </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToIns" runat="server" 
                                    meta:resourcekey="lblDocumentSentToIns" Text="Office Sent To"></asp:Label>
                                <span style="color: #FF6666">*</span></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOffices" runat="server" DataSourceID="OdsOffices" 
                                    DataTextField="OfficeName" DataValueField="OfficeId" 
                                    meta:resourcekey="ddlDocTypeIns" SelectedValue='<%# Bind("DocType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                             <%--   <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromIns" runat="server" 
                                    ControlToValidate="txtDocumentSentFromIns" 
                                    ErrorMessage="Document sent From Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentFromInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromIns" 
                                    runat="server" ControlToValidate="txtDocumentSentFromIns" 
                                    ErrorMessage="Document sent From is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentFromInsResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>--%>
                            </td>
                            <td class="textColumn">
                                &nbsp;</td>
                            <td class="validationColumn">
                               <%-- <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToInsResource1">*</asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiversNameIns" runat="server" meta:resourcekey="lblReceiversNameIns"
                                    Text="Receiver Name"></asp:Label>
                               
                                <span style="color: #FF6666">*</span></td>
                            <td class="textColumn">
                               
                                <asp:TextBox ID="txtReceiverName" runat="server" 
                                    Text='<%# Bind("ReceiverName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="textColumn">
                                &nbsp;</td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" 
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksIns" runat="server" meta:resourcekey="txtRemarksIns" 
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                &nbsp;</td>
                            <td class="textColumn">
                                &nbsp;</td>
                            <td class="validationColumn">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="5">
                                <asp:Button ID="btnUp" runat="server" CommandName="Insert" meta:resourcekey="btnInsate"
                                    Text="Save" />
                                <asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelIns"
                                    CausesValidation="False" Text="Cancel" OnClick="btnCancelIns_Click" />
                                    <asp:Button ID="Buttonreset" runat="server" CommandName="Reset" meta:resourcekey="Buttonreset"
                                    Text="Reset" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderUpd" runat="server" meta:resourcekey="lblInwardOutwardHeaderUpd"
                                    SkinID="SubHeading" Text="Inward  Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoUpd" runat="server" meta:resourcekey="lblDocumentNoUpd"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoUpd" ReadOnly="True" runat="server" meta:resourcekey="txtDocumentNoUpd"
                                    Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
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
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" meta:resourcekey="txtDescriptionUpd"
                                    Text='<%# Bind("Description") %>' ReadOnly="true" SkinID="calendar"></asp:TextBox>
                                <rjs:PopCalendar ID="calDescriptionUpd" runat="server" Control="txtDescriptionUpd"
                                    meta:resourcekey="calDescriptionUpd" ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Put Appropriate Description" meta:resourcekey="RfvDescriptionUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSentOfficeIDUpd" runat="server" meta:resourcekey="lblSentOfficeIDUpd"
                                    Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                              <%--  <asp:DropDownList ID="ddlSentOfficeIDUpd" runat="server" meta:resourcekey="ddlSentOfficeIDUpd"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>--%>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDUpd" runat="server" meta:resourcekey="lblReceivingOfficeIDUpd"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                               <%-- <asp:DropDownList ID="ddlReceivingOfficeIDUpd" runat="server" meta:resourcekey="ddlReceivingOfficeIDUpd"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>--%>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 41px">
                                <asp:Label ID="lblDocumentSentFromUpd" runat="server" meta:resourcekey="lblDocumentSentFromUpd"
                                    Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 41px">
                                <asp:TextBox ID="txtDocumentSentFromUpd" runat="server" meta:resourcekey="txtDocumentSentFromUpd"
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 41px">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromUpd" runat="server" ControlToValidate="txtDocumentSentFromUpd"
                                    ErrorMessage="Document sent From Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentFromUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromUpd" runat="server"
                                    ControlToValidate="txtDocumentSentFromUpd" ErrorMessage="Document sent From is not in correct format"
                                    ValidationExpression="^[a-zA-Z0-9]+$" meta:resourcekey="RegexptxtDocumentSentFromUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn" style="height: 41px">
                                <asp:Label ID="lblDocumentSentToUpd" runat="server" meta:resourcekey="lblDocumentSentToUpd"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 41px">
                                <asp:TextBox ID="txtDocumentSentToUpd" runat="server" meta:resourcekey="txtDocumentSentToUpd"
                                    Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 41px">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToUpd" runat="server" ControlToValidate="txtDocumentSentToUpd"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToUpd" runat="server" ControlToValidate="txtDocumentSentToUpd"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="labelColumn">
                                <asp:Label ID="lblStampValueAffixedUpd" runat="server" meta:resourcekey="lblStampValueAffixedUpd"
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedUpd" runat="server" meta:resourcekey="txtStampValueAffixedUpd"
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
<%--                                <asp:DropDownList ID="ddlDeliveryTypeUpd" runat="server" meta:resourcekey="ddlDeliveryTypeUpd"
                                    Text='<%# Bind("DeliveryType") %>' DataSourceID="odsDeliveryType" DataTextField="Name"
                                    DataValueField="PostalDeliveryType_Id" SelectedValue='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
--%>                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchUpd" runat="server" meta:resourcekey="lblDeliveryBranchUpd"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                             <%--   <asp:DropDownList ID="ddlDeliveryBranchUpd" runat="server" meta:resourcekey="ddlDeliveryBranchUpd"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>--%>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameUpd" runat="server" meta:resourcekey="lblSenderNameUpd"
                                    Text="Sender Name"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameUpd" runat="server" meta:resourcekey="txtSenderNameUpd"
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
                                <asp:TextBox ID="txtReceiversNameUpd" runat="server" meta:resourcekey="txtReceiversNameUpd"
                                    Text='<%# Bind("ReceiversName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Update" meta:resourcekey="btnUpdate"
                                    Text="Save" />
                                <asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
                                    CausesValidation="False" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblInwardOutwardHeaderIns" runat="server" meta:resourcekey="lblInwardOutwardHeaderIns"
                                    SkinID="SubHeading" Text="Inward Register"></asp:Label>
                            </td>
                            <td class="textColumn">
<%--                                <asp:DropDownList ID="ddlReceivingOfficeIDIns" runat="server" meta:resourcekey="ddlReceivingOfficeIDIns"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
--%>                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID="Label_inwardno" runat="server" Text="Inward No"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>
                        
                        </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoIns" runat="server" meta:resourcekey="lblDocumentNoIns"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoIns" runat="server" meta:resourcekey="txtDocumentNoIns"
                                    MaxLength="10" Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoIns" runat="server" ControlToValidate="txtDocumentNoIns"
                                    ErrorMessage="Document No Can't be blank" meta:resourcekey="RfvDocumentNoInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoIns" runat="server" ControlToValidate="txtDocumentNoIns"
                                    ErrorMessage="Document No is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentNoInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateIns" runat="server" meta:resourcekey="lblInOutDateIns"
                                    Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateIns" runat="server" meta:resourcekey="txtInOutDateIns"
                                    Text='<%# Bind("InOutDate", "{0:d}") %>' SkinID="Calendar" ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateIns" runat="server" Control="txtInOutDateIns"
                                    ToolTip="select Date From Date Picker" meta:resourcekey="PopCalInOutDateInsResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" ControlToValidate="txtInOutDateIns"
                                    ErrorMessage="Please Enter Inward Date" meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
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
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>' ReadOnly="true" SkinID="calendar"></asp:TextBox>
                                <rjs:PopCalendar ID="calDescriptionIns" runat="server" Control="txtDescriptionIns"
                                    meta:resourcekey="calDescriptionIns" ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Put Appropriate Description" meta:resourcekey="RfvDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSentOfficeIDIns" runat="server" meta:resourcekey="lblSentOfficeIDIns"
                                    Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
<%--                                <asp:DropDownList ID="ddlSentOfficeIDIns" runat="server" meta:resourcekey="ddlSentOfficeIDIns"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
--%>                            </td>
                            <td class="validationColumn">
                            </td>
                            <%--<td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDIns" runat="server" meta:resourcekey="lblReceivingOfficeIDIns"
                                    Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDIns" runat="server" meta:resourcekey="ddlReceivingOfficeIDIns"
                                    Text='<%# Bind("ReceivingOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>--%>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID="Label_Applicantname" Text="Applicant's Name" runat="server"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="TextBox_ApplicantName" runat="server"></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Label ID="Label_Applicantaddress1" Text="Applicant's Address" runat="server"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="TextBox_Applicantaddress1" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </td>                                           
                        </tr>
                        <tr>
                        <td>
                         <asp:Label ID="Label_applicationdate" Text="Application Date" runat="server"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="TextBox_applicationdate" TextMode="SingleLine" runat="server"></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentFromIns" runat="server" meta:resourcekey="lblDocumentSentFromIns"
                                    Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromIns" runat="server" meta:resourcekey="txtDocumentSentFromIns"
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
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
                              <%--  <asp:TextBox ID="txtDocumentSentToIns" runat="server" meta:resourcekey="txtDocumentSentToIns"
                                    Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>--%>
                            </td>
                            <td class="validationColumn">
                               <%-- <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To Can't be blank" meta:resourcekey="ReqfldtxtDocumentSentToInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToIns" runat="server" ControlToValidate="txtDocumentSentToIns"
                                    ErrorMessage="Document sent To is not in correct format" ValidationExpression="^[a-zA-Z0-9]+$"
                                    meta:resourcekey="RegexptxtDocumentSentToInsResource1">*</asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="labelColumn">
                                <asp:Label ID="lblStampValueAffixedIns" runat="server" meta:resourcekey="lblStampValueAffixedIns"
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedIns" runat="server" meta:resourcekey="txtStampValueAffixedIns"
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
<%--                                <asp:DropDownList ID="ddlDeliveryTypeIns" runat="server" meta:resourcekey="ddlDeliveryTypeIns"
                                    Text='<%# Bind("DeliveryType") %>' DataSourceID="odsDeliveryType" DataTextField="Name"
                                    DataValueField="PostalDeliveryType_Id" SelectedValue='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
--%>                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchIns" runat="server" meta:resourcekey="lblDeliveryBranchIns"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                             <%--   <asp:DropDownList ID="ddlDeliveryBranchIns" runat="server" meta:resourcekey="ddlDeliveryBranchIns"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>--%>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameIns" runat="server" meta:resourcekey="lblSenderNameIns"
                                    Text="Sender Name"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameIns" runat="server" meta:resourcekey="txtSenderNameIns"
                                    Text='<%# Bind("DocumentSender") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiversNameIns" runat="server" meta:resourcekey="lblReceiversNameIns"
                                    Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameIns" runat="server" meta:resourcekey="txtReceiversNameIns"
                                    TextMode="MultiLine" Text='<%# Bind("ReceiversName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksIns" runat="server" meta:resourcekey="lblRemarksIns" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksIns" runat="server" meta:resourcekey="txtRemarksIns" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Insert" meta:resourcekey="btnInsate"
                                    Text="Save" />
                                <asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelIns"
                                    CausesValidation="False" Text="Cancel" OnClick="btnCancelIns_Click" />
                                    <asp:Button ID="Buttonreset" runat="server" CommandName="Reset" meta:resourcekey="Buttonreset"
                                    Text="Reset" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>

<%--                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetInwardDetailsByInwardId"
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" UpdateMethod="UpdateInwardDetails"
                OnUpdating="odsInward_Updating" OnInserting="odsInward_Inserting" InsertMethod="AddInwardDetails"
                OnInserted="odsInward_Inserted" OnUpdated="odsInward_Updated">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_outwardId" Type="Object" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvInwarddtl" Name="Inward_outwardId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
--%>

            <asp:ObjectDataSource ID="odsInward" runat="server" 
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" UpdateMethod="UpdateInwardDetails"
                OnUpdating="odsInward_Updating" OnInserting="odsInward_Inserting" InsertMethod="AddInwardDetails"
                OnInserted="odsInward_Inserted" OnUpdated="odsInward_Updated">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_outwardId" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <%--<asp:ObjectDataSource ID="objinwardoutward" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddInwardDetails" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllInwardDetails" 
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" 
                UpdateMethod="UpdateInwardDetails">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter DbType="Guid" Name="Inward_OutwardId" />
                </UpdateParameters>
            </asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="OdsOffices" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddNewOffices" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetOfficeDetails" 
                TypeName="IGRSS.BusinessLogicLayer.OfficeMaster"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDelivery" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetPostalDeliveryLookUpDetails" 
                TypeName="IGRSS.DataAccessLayer.InwardOutwardTableAdapters.PostalDeliveryType_LKPTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_PostalDeliveryType_Id" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="PostalDeliveryType_Id" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter DbType="Guid" Name="Original_PostalDeliveryType_Id" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDocuments" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.DocumentTableAdapters.DocumentMasterTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_DocumentTypeId" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="DocumentTypeId" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_DocumentTypeId" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsSearch" runat="server"></asp:ObjectDataSource>
            <br />
          <%--  <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>--%>
      <%--      <asp:ObjectDataSource ID="odsDeliveryType" runat="server" SelectMethod="GetDeliveryType"
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward"></asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInwardTable" 
                
                TypeName="IGRSS.DataAccessLayer.InwardTableAdapters.InwardRegisterTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlInwardtype" runat="server"></asp:XmlDataSource>
         <%--   <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeleteEmployeeQualification" InsertMethod="InsertDepartmentMaster"
                SelectMethod="GetDepartmentMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Employee"
                OldValuesParameterFormatString="original_{0}">
                <InsertParameters>
                    <asp:Parameter Name="DepartmentId" Type="Object" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>
