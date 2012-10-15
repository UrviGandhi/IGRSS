<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_BranchToBranchInward, App_Web_dhxbsoqy" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvBTBInward" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearchDetails" runat="server">
            <table width="100%">
            <tr>
					<td colspan="6">
						<asp:Label ID="lblAllPostalStampHeaderIns" runat="server" meta:resourcekey="lblPostalStampHeaderIns"
							SkinID="SubHeading" Text="All Postal Stamp Details"></asp:Label>
					</td>
				</tr>
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
                    <td>
                        <asp:GridView ID="gvInwardDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="Inward_outwardId"
                            DataSourceID="odsBranch" OnSelectedIndexChanged="gvInwardDetails_SelectedIndexChanged" meta:resourcekey="gvInwardDetailsResource1">
                            <Columns>
                                <asp:BoundField DataField="DocumentNo" HeaderText="Document No" SortExpression="DocumentNo" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="InOutDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yy}"
                                    HtmlEncode="False" SortExpression="InOutDate" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" meta:resourcekey="BoundFieldResource4" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Update" meta:resourcekey="CommandFieldResource1" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewBTBInward" runat="server">
            <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
            <asp:FormView ID="fvBTBInward" runat="server" DefaultMode="Insert" DataSourceID="odsBranch"
                OnItemInserting="fvBTBInward_ItemInserting" OnItemUpdating="fvBTBInward_ItemUpdating" meta:resourcekey="fvBTBInwardResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderIns" runat="server" meta:resourcekey="lblInwardOutwardHeaderIns"
                                    SkinID="SubHeading" Text="Branch Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoIns" runat="server" meta:resourcekey="lblDocumentNoIns"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoIns" MaxLength="10" runat="server" meta:resourcekey="txtDocumentNoIns"
                                    Text='<%# Bind("DocumentNo") %>'></asp:TextBox>
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
                            <td>
                                <asp:TextBox ID="txtDescriptionIns" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
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
                                <asp:DropDownList ID="ddlSentOfficeIDIns" runat="server" meta:resourcekey="ddlSentOfficeIDIns"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchIns" runat="server" meta:resourcekey="lblDeliveryBranchIns"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryBranchIns" runat="server" meta:resourcekey="ddlDeliveryBranchIns"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiverBranchIns" runat="server" meta:resourcekey="lblReceiverBranchIns"
                                    Text="Sender Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceiverBranchIns" runat="server" meta:resourcekey="ddlReceiverBranchIns"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("SenderBranch") %>'>
                                </asp:DropDownList>
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
                                    CausesValidation="False" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInwardOutwardHeaderUpd" runat="server" meta:resourcekey="lblInwardOutwardHeaderUpd"
                                    SkinID="SubHeading" Text="Branch Register"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentNoUpd" runat="server" meta:resourcekey="lblDocumentNoUpd"
                                    Text="Letter No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNoUpd" MaxLength="10" runat="server" meta:resourcekey="txtDocumentNoUpd"
                                    Text='<%# Bind("DocumentNo") %>' ReadOnly="True"></asp:TextBox>
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
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" meta:resourcekey="txtDescriptionUpd"
                                    Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
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
                                <asp:DropDownList ID="ddlSentOfficeIDUpd" runat="server" meta:resourcekey="ddlSentOfficeIDUpd"
                                    Text='<%# Bind("SentOfficeID") %>' DataSourceID="odsGetOffices" DataTextField="OfficeName"
                                    DataValueField="OfficeId" SelectedValue='<%# Bind("SentOfficeID") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeliveryBranchUpd" runat="server" meta:resourcekey="lblDeliveryBranchUpd"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryBranchUpd" runat="server" meta:resourcekey="ddlDeliveryBranchUpd"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiverBranchUpd" runat="server" meta:resourcekey="lblReceiverBranchUpd"
                                    Text="Sender Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceiverBranchUpd" runat="server" meta:resourcekey="ddlReceiverBranchUpd"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("SenderBranch") %>'>
                                </asp:DropDownList>
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
                                <asp:Label ID="lblDeliveryBranchItm" runat="server" meta:resourcekey="lblDeliveryBranchItm"
                                    Text="Delivery Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDeliveryBranchItm" runat="server" meta:resourcekey="ddlDeliveryBranchItm"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("DeliveryBranch") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiverBranchItm" runat="server" meta:resourcekey="lblReceiverBranchItm"
                                    Text="Sender Branch"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReceiverBranchItm" runat="server" meta:resourcekey="ddlReceiverBranchItm"
                                    DataSourceID="OdsDepartmentMaster" DataTextField="Name" DataValueField="DepartmentID"
                                    SelectedValue='<%# Bind("SenderBranch") %>'>
                                </asp:DropDownList>
                                <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
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
            <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" SelectMethod="GetDepartmentMasterDetails"
                TypeName="IGRSS.BusinessLogicLayer.Employee" OldValuesParameterFormatString="original_{0}">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsBranch" runat="server" InsertMethod="AddBranchToBranchInwardDetails"
                SelectMethod="GetAllBranchInwardDetails" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
                OnInserted="odsBranch_Inserted" OnUpdated="odsBranch_Updated" UpdateMethod="UpdateBranchToBranchInwardDetails"
                OnUpdating="odsBranch_Updating" OnInserting="odsBranch_Inserting">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="gvInwardDetails" Name="Inward_OutwardId" PropertyName="SelectedValue"
                        Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
