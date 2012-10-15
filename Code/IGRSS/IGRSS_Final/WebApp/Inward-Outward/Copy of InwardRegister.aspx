<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="Copy of InwardRegister.aspx.cs" Inherits="Inward_Outward_InwardRegister" Title="Inward Outward Register"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

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
                        <asp:GridView ID="gvInwarddtl" runat="server" AutoGenerateColumns="False" DataKeyNames="Inward_outwardId"
                            DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="gvInwarddtl_SelectedIndexChanged"
                            meta:resourcekey="gvInwarddtlResource1" AllowPaging="True" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" />
                                <asp:BoundField DataField="Inward_outwardId" HeaderText="Inward_outwardId" 
                                    ReadOnly="true" SortExpression="Inward_outwardId" Visible="False" />
                                <asp:BoundField DataField="DocumentNo" HeaderText="DocumentNo" 
                                    SortExpression="DocumentNo" />
                                <asp:BoundField DataField="RegisterType" HeaderText="RegisterType" 
                                    SortExpression="RegisterType" />
                                <asp:BoundField DataField="InOutDate" HeaderText="InOutDate" 
                                    SortExpression="InOutDate" />
                                <asp:BoundField DataField="DocType" HeaderText="DocType" 
                                    SortExpression="DocType" />
                                <asp:BoundField DataField="SentOfficeID" HeaderText="SentOfficeID" 
                                    SortExpression="SentOfficeID" />
                                <asp:BoundField DataField="ReceivingOfficeID" HeaderText="ReceivingOfficeID" 
                                    SortExpression="ReceivingOfficeID" />
                                <asp:BoundField DataField="DocumentSentFrom" HeaderText="DocumentSentFrom" 
                                    SortExpression="DocumentSentFrom" />
                                <asp:BoundField DataField="DocumentSentTo" HeaderText="DocumentSentTo" 
                                    SortExpression="DocumentSentTo" />
                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" />
                                <asp:BoundField DataField="StampValueAffixed" HeaderText="StampValueAffixed" 
                                    SortExpression="StampValueAffixed" />
                                <asp:BoundField DataField="DeliveryType" HeaderText="DeliveryType" 
                                    SortExpression="DeliveryType" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                    SortExpression="Remarks" />
                                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                                    SortExpression="CreatedBy" />
                                <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" 
                                    SortExpression="CreatedAt" Visible="False" />
                                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                                    SortExpression="ModifiedBy" Visible="False" />
                                <asp:BoundField DataField="ModifiedAt" HeaderText="ModifiedAt" 
                                    SortExpression="ModifiedAt" />
                                <asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" 
                                    SortExpression="IsDeleted" Visible="False" />
                                <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                                    SortExpression="DeletedBy" Visible="False" />
                                <asp:BoundField DataField="DeletedAt" HeaderText="DeletedAt" 
                                    SortExpression="DeletedAt" Visible="False" />
                                <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                                    SortExpression="ApplicantName" />
                                <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                                    SortExpression="ApplicantAddress" />
                                <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                                    SortExpression="ApplicationDate" />
                              <%--  <asp:BoundField DataField="DeliveryBranch" HeaderText="DeliveryBranch" 
                                    SortExpression="DeliveryBranch" />--%>
                                <%--<asp:BoundField DataField="DocumentSender" HeaderText="DocumentSender" 
                                    SortExpression="DocumentSender" />
                                <asp:BoundField DataField="ReceiversName" HeaderText="ReceiversName" 
                                    SortExpression="ReceiversName" />--%>
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                            </asp:GridView>
                    </td>
                </tr>
            </table>
             <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
            </asp:View>
        <asp:View ID="vieFv" runat="server">
            <asp:ObjectDataSource ID="odsInward" runat="server" SelectMethod="GetInwardDetailsByInwardId"
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" UpdateMethod="UpdateInwardDetails"
                OnUpdating="odsInward_Updating" OnInserting="odsInward_Inserting" InsertMethod="AddInwardOutwardDetails"
                OnInserted="odsInward_Inserted" OnUpdated="odsInward_Updated" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                OldValuesParameterFormatString="original_{0}">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_OutwardId" DbType="Guid" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                </SelectParameters>
            </asp:ObjectDataSource>
       <%--     <asp:FormView ID="FvInward" runat="server" Width="100%" DataSourceID="odsInward"
                OnItemInserting="FvInward_ItemInserting" 
                OnItemUpdating="FvInward_ItemUpdating" OnItemCommand="FvInward_ItemCommand" DefaultMode="Insert"
                OnItemUpdated="FvInward_ItemUpdated" meta:resourcekey="FvInwardResource1" 
                OnItemInserted="FvInward_ItemInserted" 
                onpageindexchanging="FvInward_PageIndexChanging1" 
                EnableModelValidation="True">
            </asp:FormView>--%>
            <asp:FormView ID="FvInward" runat="server" DataKeyNames="Inward_outwardId" 
                EnableModelValidation="True" DataSourceID="ObjectDataSource1">
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderItm" runat="server" 
                                    meta:resourcekey="lblInwardOutwardHeaderItm" SkinID="SubHeading" 
                                    Text="Inward Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocumentNoItm" runat="server" 
                                    meta:resourcekey="lblDocumentNoItm" Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoItm" runat="server" 
                                    meta:resourcekey="txtDocumentNoItm" Text='<%# Bind("DocumentNo") %>' 
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoItm" runat="server" 
                                    ControlToValidate="txtDocumentNoItm" ErrorMessage="Document No Can't be blank" 
                                    meta:resourcekey="RfvDocumentNoItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoItm" runat="server" 
                                    ControlToValidate="txtDocumentNoItm" 
                                    ErrorMessage="Document No is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentNoItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateItm" runat="server" 
                                    meta:resourcekey="lblInOutDateItm" Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateItm" runat="server" 
                                    meta:resourcekey="txtInOutDateItm" ReadOnly="True" SkinID="Calendar" 
                                    Text='<%# Bind("InOutDate", "{0:d}") %>' Width="200px"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateItm" runat="server" 
                                    Control="txtInOutDateItm" meta:resourcekey="PopCalInOutDateItmResource1" 
                                    ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" 
                                    ControlToValidate="txtInOutDateItm" ErrorMessage="Please Enter Inward Date" 
                                    meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocTypeItm" runat="server" meta:resourcekey="lblDocTypeItm" 
                                    Text="Letter Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDocTypeItm" runat="server" 
                                    DataSourceID="XmlInwarddoctype" DataTextField="id" DataValueField="Value" 
                                    meta:resourcekey="ddlDocTypeItm" SelectedValue='<%# Bind("DocType") %>' 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" 
                                    meta:resourcekey="lblDescriptionItm" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescriptionItm" runat="server" 
                                    meta:resourcekey="txtDescriptionItm" Text='<%# Bind("Description") %>' 
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionItm" runat="server" 
                                    ControlToValidate="txtDescriptionItm" 
                                    ErrorMessage="Put Appropriate Description" 
                                    meta:resourcekey="RfvDescriptionItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblSentOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblSentOfficeIDItm" Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlSentOfficeIDItm" 
                                    SelectedValue='<%# Bind("SentOfficeID") %>' Text='<%# Bind("SentOfficeID") %>' 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblReceivingOfficeIDItm" Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlReceivingOfficeIDItm" 
                                    SelectedValue='<%# Bind("ReceivingOfficeID") %>' 
                                    Text='<%# Bind("ReceivingOfficeID") %>' Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentFromItm" Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentFromItm" 
                                    Text='<%# Bind("DocumentSentFrom") %>' Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromItm" runat="server" 
                                    ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentFromItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromItm" 
                                    runat="server" ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentFromItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentToItm" Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentToItm" Text='<%# Bind("DocumentSentTo") %>' 
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentToItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentToItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="lblStampValueAffixedItm" Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="txtStampValueAffixedItm" 
                                    Text='<%# Bind("StampValueAffixed") %>' Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedItm" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp Value should n't be blank" 
                                    meta:resourcekey="RfvStampValueAffixedItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp value is not proper format" 
                                    meta:resourcekey="RegExpStampValueResource1" 
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeItm" runat="server" 
                                    meta:resourcekey="lblDeliveryTypeItm" Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryTypeItm" runat="server" 
                                    DataSourceID="odsDeliveryType" DataTextField="Name" 
                                    DataValueField="PostalDeliveryType_Id" meta:resourcekey="ddlDeliveryTypeItm" 
                                    SelectedValue='<%# Bind("DeliveryType") %>' Text='<%# Bind("DeliveryType") %>' 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="lblDeliveryBranchItm" Text="Delivery Branch"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="txtDeliveryBranchItm" Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameItm" runat="server" 
                                    meta:resourcekey="lblSenderNameItm" Text="Sender Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameItm" runat="server" 
                                    meta:resourcekey="txtSenderNameItm" Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblReceiversNameItm" runat="server" 
                                    meta:resourcekey="lblReceiversNameItm" Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameItm" runat="server" 
                                    meta:resourcekey="txtReceiversNameItm" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" 
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" 
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Itmert" 
                                    meta:resourcekey="btnItmate" onclick="btnUp_Click" style="height: 26px" 
                                    Text="Add" />
                                <asp:Button ID="Button_update" runat="server" Text="Update" />
                                <asp:Button ID="btnCancelItm" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" meta:resourcekey="btnCancelItm" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    I<table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderItm" runat="server" 
                                    meta:resourcekey="lblInwardOutwardHeaderItm" SkinID="SubHeading" 
                                    Text="Inward Register"></asp:Label>
                            </td>
                        </tr>
                  <tr>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" 
                                    meta:resourcekey="lblDescriptionItm" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescriptionItm" runat="server" 
                                    meta:resourcekey="txtDescriptionItm" Text='<%# Bind("Description") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionItm" runat="server" 
                                    ControlToValidate="txtDescriptionItm" 
                                    ErrorMessage="Put Appropriate Description" 
                                    meta:resourcekey="RfvDescriptionItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblSentOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblSentOfficeIDItm" Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlSentOfficeIDItm" 
                                    SelectedValue='<%# Bind("SentOfficeID") %>' Text='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblReceivingOfficeIDItm" Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlReceivingOfficeIDItm" 
                                    SelectedValue='<%# Bind("ReceivingOfficeID") %>' 
                                    Text='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentFromItm" Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentFromItm" 
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromItm" runat="server" 
                                    ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentFromItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromItm" 
                                    runat="server" ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentFromItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentToItm" Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentToItm" Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentToItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentToItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="lblStampValueAffixedItm" Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="txtStampValueAffixedItm" 
                                    Text='<%# Bind("StampValueAffixed") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedItm" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp Value should n't be blank" 
                                    meta:resourcekey="RfvStampValueAffixedItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp value is not proper format" 
                                    meta:resourcekey="RegExpStampValueResource1" 
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeItm" runat="server" 
                                    meta:resourcekey="lblDeliveryTypeItm" Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
<%--                                <asp:DropDownList ID="ddlDeliveryTypeItm" runat="server" 
                                    DataSourceID="odsDeliveryType" DataTextField="Name" 
                                    DataValueField="PostalDeliveryType_Id" meta:resourcekey="ddlDeliveryTypeItm" 
                                    SelectedValue='<%# Bind("DeliveryType") %>' Text='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
--%>                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="lblDeliveryBranchItm" Text="Delivery Branch"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="txtDeliveryBranchItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameItm" runat="server" 
                                    meta:resourcekey="lblSenderNameItm" Text="Sender Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameItm" runat="server" 
                                    meta:resourcekey="txtSenderNameItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblReceiversNameItm" runat="server" 
                                    meta:resourcekey="lblReceiversNameItm" Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameItm" runat="server" 
                                    meta:resourcekey="txtReceiversNameItm" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" 
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" 
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Itmert" 
                                    meta:resourcekey="btnItmate" onclick="btnUp_Click" style="height: 26px" 
                                    Text="Add" />
                                <asp:Button ID="Button_update" runat="server" Text="Update" />
                                <asp:Button ID="btnCancelItm" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" meta:resourcekey="btnCancelItm" Text="Cancel" />
                            </td>
                        </tr>
                    </table>

                    <table border="0px" cellspacing="0" class="header" width="100%">
                        <tr align="left">
                            <td class="logo">
                                &nbsp;</td>
                            <td colspan="4" style="height: 25px" valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_letterno0" runat="server" Text="Inward No"></asp:Label>
                            </td>
                            <td style="height: 25px" valign="top">
                                <asp:TextBox ID="TextBox_inwardno" runat="server" Width="80px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label_applicationdate0" runat="server" 
                                    Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_affixedstampvalue" runat="server" 
                                    style="margin-top: 4px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_letterno" runat="server" Text="Letter No"></asp:Label>
                            </td>
                            <td style="height: 25px" valign="top">
                                <asp:TextBox ID="TextBox_letterno" runat="server" 
                                    Text='<%# Bind("DocumentNo") %>' Width="80px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label_deliverybranch" runat="server" Text="Delivery Branch"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList_deliverybranch" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="style3" colspan="2">
                                <asp:Label ID="Label_lettertype" runat="server" Text="Letter Type"></asp:Label>
                            </td>
                            <td class="style3" style="margin-left: 40px;" valign="top">
                                <asp:DropDownList ID="DropDownList_lettertype" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="style3">
                                <asp:Label ID="Label_receivername" runat="server" Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="TextBox_receivername" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="190px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_officesentfrom" runat="server" Text="Office Sent From"></asp:Label>
                            </td>
                            <td style="height: 25px; margin-left: 40px;" valign="top">
                                <asp:DropDownList ID="DropDownList_officesentfrom" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label_inoutdate" runat="server" Text="In/Out Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_inoutdate" runat="server" style="margin-top: 4px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_applicantname" runat="server" Text="Applicant's Name"></asp:Label>
                            </td>
                            <td style="height: 25px; margin-left: 40px;" valign="top">
                                <asp:TextBox ID="TextBox_applicantname" runat="server" Width="190px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label_description" runat="server" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_description" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_applicantaddress" runat="server" 
                                    Text="Applicant's Address"></asp:Label>
                            </td>
                            <td style="height: 25px; margin-left: 40px;" valign="top">
                                <asp:TextBox ID="TextBox_applicantaddress" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="190px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label_sentto" runat="server" Text="Sent To"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_sentto" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="Label_applicationdate" runat="server" Text="Application Date"></asp:Label>
                            </td>
                            <td style="height: 25px" valign="top">
                                <asp:TextBox ID="TextBox_applicationdate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label_deliverytype" runat="server" Text="Delivery Type"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList_deliverytype" runat="server" 
                                    DataSourceID="odsDeliveryType" DataTextField="Name" 
                                    DataValueField="PostalDeliveryType_Id">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2" style="margin-left: 40px">
                                &nbsp;</td>
                            <td style="height: 25px" valign="top">
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="Label_sentto0" runat="server" Text="Sender Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox_sendername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="style2" colspan="2">
                                &nbsp;</td>
                            <td class="style2" valign="top">
                                &nbsp;</td>
                            <td class="style2">
                                <asp:Label ID="Label_remarks" runat="server" Text="Remarks"></asp:Label>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox_remarks" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="190px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="style3" colspan="2">
                                &nbsp;</td>
                            <td class="style3" valign="top">
                                &nbsp;</td>
                            <td class="style4">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td class="style3" colspan="2">
                            </td>
                            <td class="style3" valign="top">
                                &nbsp;</td>
                            <td class="style4">
                                <asp:Button ID="btnUp0" runat="server" CommandName="Itmert" 
                                    meta:resourcekey="btnItmate" onclick="btnUp_Click" style="height: 26px" 
                                    Text="Add" />
                                <asp:Button ID="Button_update0" runat="server" Text="Update" />
                                <asp:Button ID="btnCancelItm0" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" meta:resourcekey="btnCancelItm" Text="Cancel" />
                            </td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                   <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderItm" runat="server" 
                                    meta:resourcekey="lblInwardOutwardHeaderItm" SkinID="SubHeading" 
                                    Text="Inward Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocumentNoItm" runat="server" 
                                    meta:resourcekey="lblDocumentNoItm" Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoItm" runat="server" 
                                    meta:resourcekey="txtDocumentNoItm" Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDocumentNoItm" runat="server" 
                                    ControlToValidate="txtDocumentNoItm" ErrorMessage="Document No Can't be blank" 
                                    meta:resourcekey="RfvDocumentNoItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentNoItm" runat="server" 
                                    ControlToValidate="txtDocumentNoItm" 
                                    ErrorMessage="Document No is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentNoItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInOutDateItm" runat="server" 
                                    meta:resourcekey="lblInOutDateItm" Text="In/Out Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInOutDateItm" runat="server" 
                                    meta:resourcekey="txtInOutDateItm" ReadOnly="True" SkinID="Calendar" 
                                    Text='<%# Bind("InOutDate", "{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalInOutDateItm" runat="server" 
                                    Control="txtInOutDateItm" meta:resourcekey="PopCalInOutDateItmResource1" 
                                    ToolTip="select Date From Date Picker" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldValidator" runat="server" 
                                    ControlToValidate="txtInOutDateItm" ErrorMessage="Please Enter Inward Date" 
                                    meta:resourcekey="ReqFldValidatorResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocTypeItm" runat="server" meta:resourcekey="lblDocTypeItm" 
                                    Text="Letter Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDocTypeItm" runat="server" 
                                    DataSourceID="XmlInwarddoctype" DataTextField="id" DataValueField="Value" 
                                    meta:resourcekey="ddlDocTypeItm" SelectedValue='<%# Bind("DocType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" 
                                    meta:resourcekey="lblDescriptionItm" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescriptionItm" runat="server" 
                                    meta:resourcekey="txtDescriptionItm" Text='<%# Bind("Description") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionItm" runat="server" 
                                    ControlToValidate="txtDescriptionItm" 
                                    ErrorMessage="Put Appropriate Description" 
                                    meta:resourcekey="RfvDescriptionItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblSentOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblSentOfficeIDItm" Text="Office Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlSentOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlSentOfficeIDItm" 
                                    SelectedValue='<%# Bind("SentOfficeID") %>' Text='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceivingOfficeIDItm" runat="server" 
                                    meta:resourcekey="lblReceivingOfficeIDItm" Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceivingOfficeIDItm" runat="server" 
                                    DataSourceID="odsGetOffices" DataTextField="OfficeName" 
                                    DataValueField="OfficeId" meta:resourcekey="ddlReceivingOfficeIDItm" 
                                    SelectedValue='<%# Bind("ReceivingOfficeID") %>' 
                                    Text='<%# Bind("ReceivingOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentFromItm" Text="Document Sent From"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentFromItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentFromItm" 
                                    Text='<%# Bind("DocumentSentFrom") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentFromItm" runat="server" 
                                    ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentFromItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentFromItm" 
                                    runat="server" ControlToValidate="txtDocumentSentFromItm" 
                                    ErrorMessage="Document sent From is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentFromItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentSentToItm" runat="server" 
                                    meta:resourcekey="lblDocumentSentToItm" Text="Sent To"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentSentToItm" runat="server" 
                                    meta:resourcekey="txtDocumentSentToItm" Text='<%# Bind("DocumentSentTo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To Can't be blank" 
                                    meta:resourcekey="ReqfldtxtDocumentSentToItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtDocumentSentToItm" runat="server" 
                                    ControlToValidate="txtDocumentSentToItm" 
                                    ErrorMessage="Document sent To is not in correct format" 
                                    meta:resourcekey="RegexptxtDocumentSentToItmResource1" 
                                    ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="lblStampValueAffixedItm" Text="Affixed Stamp Value"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStampValueAffixedItm" runat="server" 
                                    meta:resourcekey="txtStampValueAffixedItm" 
                                    Text='<%# Bind("StampValueAffixed") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvStampValueAffixedItm" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp Value should n't be blank" 
                                    meta:resourcekey="RfvStampValueAffixedItmResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpStampValue" runat="server" 
                                    ControlToValidate="txtStampValueAffixedItm" 
                                    ErrorMessage="Stamp value is not proper format" 
                                    meta:resourcekey="RegExpStampValueResource1" 
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryTypeItm" runat="server" 
                                    meta:resourcekey="lblDeliveryTypeItm" Text="Delivery Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryTypeItm" runat="server" 
                                    DataSourceID="odsDeliveryType" DataTextField="Name" 
                                    DataValueField="PostalDeliveryType_Id" meta:resourcekey="ddlDeliveryTypeItm" 
                                    SelectedValue='<%# Bind("DeliveryType") %>' Text='<%# Bind("DeliveryType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="lblDeliveryBranchItm" Text="Delivery Branch"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeliveryBranchItm" runat="server" 
                                    meta:resourcekey="txtDeliveryBranchItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSenderNameItm" runat="server" 
                                    meta:resourcekey="lblSenderNameItm" Text="Sender Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSenderNameItm" runat="server" 
                                    meta:resourcekey="txtSenderNameItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblReceiversNameItm" runat="server" 
                                    meta:resourcekey="lblReceiversNameItm" Text="Receiver Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiversNameItm" runat="server" 
                                    meta:resourcekey="txtReceiversNameItm" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" 
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" 
                                    Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUp" runat="server" CommandName="Itmert" 
                                    meta:resourcekey="btnItmate" onclick="btnUp_Click" style="height: 26px" 
                                    Text="Add" />
                                    <asp:Button ID="Button_update" Text="Update" runat="server" />

                                <asp:Button ID="btnCancelItm" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" meta:resourcekey="btnCancelItm" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;&nbsp;
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                 OldValuesParameterFormatString="original_{0}" InsertMethod="AddInwardOutwardDetails"
                SelectMethod="GetData"   OnInserting="objectDataSource1_Inserting"
                
                TypeName="IGRSS.DataAccessLayer.InwardTableAdapters.Inward_OutwardRegisterTableAdapter" 
                DeleteMethod="Delete" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                    <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                    <asp:Parameter Name="Original_RegisterType" Type="String" />
                    <asp:Parameter Name="Original_DocumentNo" Type="String" />
                    <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_DocType" />
                    <asp:Parameter Name="Original_ApplicantName" Type="String" />
                    <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_SentOfficeID" />
                    <asp:Parameter DbType="Guid" Name="Original_ReceivingOfficeID" />
                    <asp:Parameter Name="Original_DocumentSentFrom" Type="String" />
                    <asp:Parameter Name="Original_DocumentSentTo" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_StampValueAffixed" Type="Decimal" />
                    <asp:Parameter DbType="Guid" Name="Original_DeliveryType" />
                    <asp:Parameter Name="Original_Remarks" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </DeleteParameters>
                              <InsertParameters>
                                <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                                <asp:Parameter Name="InwardNo" Type="Int32" />
                                <asp:Parameter Name="RegisterType" Type="String" />
                                <asp:Parameter Name="DocumentNo" Type="String" />
                                <asp:Parameter Name="InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="DocType" />
                                <asp:Parameter Name="ApplicantName" Type="String" />
                                <asp:Parameter Name="ApplicantAddress" Type="String" />
                                <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="SentOfficeID" />
                                <asp:Parameter DbType="Guid" Name="ReceivingOfficeID" />
                                <asp:Parameter Name="DocumentSentFrom" Type="String" />
                                <asp:Parameter Name="DocumentSentTo" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="StampValueAffixed" Type="Decimal" />
                                <asp:Parameter DbType="Guid" Name="DeliveryType" />
                                <asp:Parameter Name="Remarks" Type="String" />
                                <asp:Parameter Name="CreatedBy" Type="String" />
                                <asp:Parameter Name="CreatedAt" Type="DateTime" />
                                <asp:Parameter Name="ModifiedBy" Type="String" />
                                <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                                <asp:Parameter Name="IsDeleted" Type="Boolean" />
                                <asp:Parameter Name="DeletedBy" Type="String" />
                                <asp:Parameter Name="DeletedAt" Type="DateTime" />
                            </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                    <asp:Parameter Name="InwardNo" Type="Int32" />
                    <asp:Parameter Name="RegisterType" Type="String" />
                    <asp:Parameter Name="DocumentNo" Type="String" />
                    <asp:Parameter Name="InOutDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="DocType" />
                    <asp:Parameter Name="ApplicantName" Type="String" />
                    <asp:Parameter Name="ApplicantAddress" Type="String" />
                    <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="SentOfficeID" />
                    <asp:Parameter DbType="Guid" Name="ReceivingOfficeID" />
                    <asp:Parameter Name="DocumentSentFrom" Type="String" />
                    <asp:Parameter Name="DocumentSentTo" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="StampValueAffixed" Type="Decimal" />
                    <asp:Parameter DbType="Guid" Name="DeliveryType" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                    <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                    <asp:Parameter Name="Original_RegisterType" Type="String" />
                    <asp:Parameter Name="Original_DocumentNo" Type="String" />
                    <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_DocType" />
                    <asp:Parameter Name="Original_ApplicantName" Type="String" />
                    <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_SentOfficeID" />
                    <asp:Parameter DbType="Guid" Name="Original_ReceivingOfficeID" />
                    <asp:Parameter Name="Original_DocumentSentFrom" Type="String" />
                    <asp:Parameter Name="Original_DocumentSentTo" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_StampValueAffixed" Type="Decimal" />
                    <asp:Parameter DbType="Guid" Name="Original_DeliveryType" />
                    <asp:Parameter Name="Original_Remarks" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objinwardoutward" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddInwardDetails" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllInwardDetails" 
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" 
                UpdateMethod="UpdateInwardDetails">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter DbType="Guid" Name="Inward_OutwardId" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" 
                TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices" 
                InsertMethod="UpdateOfficeDetailsById">
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="OfficeId" />
                    <asp:Parameter Name="OfficeName" Type="String" />
                    <asp:Parameter DbType="Guid" Name="OfficeTypeId" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDeliveryType" runat="server" SelectMethod="GetData"
                
                TypeName="IGRSS.DataAccessLayer.InwardOutwardTableAdapters.PostalDeliveryType_LKPTableAdapter" 
                DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_PostalDeliveryType_Id" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                </DeleteParameters>
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
            <asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllInwardDetails" TypeName="IGRSS.BusinessLogicLayer.InwardOutward">
                 </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlInwardtype" runat="server"></asp:XmlDataSource>
               <%--<asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" DataObjectTypeName="System.Guid"
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
