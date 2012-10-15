<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Refund_RefundApplication, App_Web_e5jlgnnw" title="Refund Application Details" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Src="../UserControls/DocumentDownload.ascx" TagName="DocumentDownload"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControls/DocumentUpload.ascx" TagName="DocumentUpload" TagPrefix="uc2" %>
<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvRefund" runat="server" ActiveViewIndex="1">
        <asp:View ID="viewDetails" runat="server">
            <asp:FormView ID="fvRefundApplication" runat="server" DataKeyNames="RefundApplicationId"
                DataSourceID="OdsRefundDetails" DefaultMode="Insert" OnDataBinding="fvRefundApplication_DataBinding"
                OnDataBound="fvRefundApplication_DataBound" OnItemInserting="fvRefundApplication_ItemInserting"
                OnItemUpdating="fvRefundApplication_ItemUpdating" OnItemUpdated="fvRefundApplication_ItemUpdated"
                OnModeChanged="fvRefundApplication_ModeChanged" OnModeChanging="fvRefundApplication_ModeChanging"
                OnPageIndexChanging="fvRefundApplication_PageIndexChanging" Width="100%" meta:resourcekey="fvRefundApplicationResource1"
                OnItemInserted="fvRefundApplication_ItemInserted">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Refund Application"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblOfficeName" runat="server" meta:resourcekey="lblOfficeNameIns"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlOfficeName" runat="server" DataTextField="OfficeName" DataValueField="OfficeId"
                                    SelectedValue='<%# Bind("OfficeId") %>' Width="180px" meta:resourcekey="dlOfficeNameResource1"
                                    OnLoad="dlOfficeName_Load">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoIns" runat="server" meta:resourcekey="lblRegistrationNoIns"
                                    Text='Registration  No'><span style="color: Red;">*</span></asp:Label><strong> </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoIns" runat="server" meta:resourcekey="txtRegistrationNoIns"
                                    Text='<%# Bind("RegistrationNo") %>' MaxLength="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RflRegistrationNoIns" runat="server" ControlToValidate="txtRegistrationNoIns"
                                    Font-Bold="True" meta:resourcekey="RflRegistrationNoInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorLicenseNoIns" runat="server" meta:resourcekey="lblVendorLicenseNoIns"
                                    Text="Vendor License No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlVendorLicenseNo" runat="server" DataSourceID="OdsLicenseMaster"
                                    DataTextField="LicenseNo" DataValueField="LicenseApplicationId" SelectedValue='<%# Bind("VendorLicenseId") %>'
                                    meta:resourcekey="dlVendorLicenseNoResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfRefundIns" runat="server" meta:resourcekey="lblTypeOfRefundIns"
                                    Text="Type Of Refund"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlTypeOfRefundIns" runat="server" DataValueField="Key" SelectedValue='<%# Bind("TypeOfRefund") %>'
                                    DataSourceID="XmlRefundType" DataTextField="Key" meta:resourcekey="dlTypeOfRefundInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicationDateIns" runat="server" meta:resourcekey="lblApplicationDateIns"
                                    Text='Application Date'></asp:Label><span style="color: Red;">*</span><strong></strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicationDateIns" runat="server" meta:resourcekey="txtApplicationDateIns"
                                    SkinID="Calendar" ReadOnly="True" Text='<%# Bind("ApplicationDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtApplicationDateIns"
                                    meta:resourcekey="PopCalendar1Resource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfltxtApplicationDateIns" runat="server" ControlToValidate="txtApplicationDateIns"
                                    ErrorMessage="Please Enter Application Date" Font-Bold="True" meta:resourcekey="RfltxtApplicationDateIns">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPurchasedDateIns" runat="server" meta:resourcekey="lblPurchasedDateIns"
                                    Text='Purchased Date'><span style="color: Red;">*</span></asp:Label><strong></strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPurchasedDateIns" runat="server" meta:resourcekey="txtPurchasedDateIns"
                                    ReadOnly="True" SkinID="Calendar" Text='<%# Bind("PurchasedDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtPurchasedDateIns" meta:resourcekey="PopCalendar2Resource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfltxtPurchasedDateIns" runat="server" ControlToValidate="txtPurchasedDateIns"
                                    ErrorMessage="Please Enter Purchased Date" Font-Bold="True" meta:resourcekey="RfltxtPurchasedDateIns">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTotalValueOfStampsIns" runat="server" meta:resourcekey="lblTotalValueOfStampsIns"
                                    Text='Total Value Of Stamps'><span style="color: Red;">*</span></asp:Label><strong></strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTotalValueOfStampsIns" runat="server" meta:resourcekey="txtTotalValueOfStampsIns"
                                    Text='<%# Bind("TotalValueOfStamps") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RflTotalValueOfStampsIns" runat="server" ControlToValidate="txtTotalValueOfStampsIns"
                                    ErrorMessage="Please enter Total Value Of Stamps " Font-Bold="True" meta:resourcekey="RflTotalValueOfStampsIns">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpValueOfStamps" runat="server" ControlToValidate="txtTotalValueOfStampsIns"
                                    ErrorMessage="Total Value Of Stamps Is not Proper Format" ValidationExpression="^[-]?([1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|\.[0-9]{1,2})$"
                                    meta:resourcekey="regexpValueOfStampsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReasonForNotUsingIns" runat="server" meta:resourcekey="lblReasonForNotUsingIns"
                                    Text="Reason For Not Using"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtReasonForNotUsingIns" runat="server" meta:resourcekey="txtReasonForNotUsingIns"
                                    Text='<%# Bind("ReasonForNotUsing") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 40px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPersonalDetailsIns" runat="server" meta:resourcekey="lblPersonalDetailsIns"
                                    SkinID="SubHeading" Text="Personal  Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 40px">
                                <asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
                                    Text='Applicant Name'><span style="color: Red;">*</span></asp:Label><strong> </strong>
                            </td>
                            <td class="textColumn" style="height: 40px">
                                <asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
                                    Text='<%# Bind("ApplicantName") %>' MaxLength="40"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%; height: 40px;">
                                <asp:RequiredFieldValidator ID="RfltxtApplicantNameIns" runat="server" ControlToValidate="txtApplicantNameIns"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfltxtApplicantNameInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExptxtApplicantNameIns" runat="server" ControlToValidate="txtApplicantNameIns"
                                    ErrorMessage="Applicant Name Should be Proper" ValidationExpression="<%$ Resources:ValidationRegx, Name %>"
                                    meta:resourcekey="RegExptxtApplicantNameInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn" style="height: 40px">
                                <asp:Label ID="lblApplicantAddressIns" runat="server" meta:resourcekey="lblApplicantAddressIns"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 40px">
                                <asp:TextBox ID="txtApplicantAddressIns" runat="server" meta:resourcekey="txtApplicantAddressIns"
                                    Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 40px">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCityIns" runat="server" meta:resourcekey="lblCityIns" Text="City"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCityIns" runat="server" meta:resourcekey="txtCityIns" Text='<%# Bind("City") %>'
                                    Rows="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictIns" runat="server" meta:resourcekey="lblDistrictIns" Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDistrictIns" runat="server" meta:resourcekey="txtDistrictIns"
                                    Text='<%# Bind("District") %>' Rows="30"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPinCodeIns" runat="server" meta:resourcekey="lblPinCodeIns" Text="Pin Code"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPinCodeIns" MaxLength="6" runat="server" meta:resourcekey="txtPinCodeIns"
                                    Text='<%# Bind("PinCode") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPinCodeIns" runat="server" ControlToValidate="txtPinCodeIns"
                                    ErrorMessage="Please Enter Pin No" meta:resourcekey="rfvPinCodeInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPinCodeIns" runat="server" ControlToValidate="txtPinCodeIns"
                                    ErrorMessage="Please Enter Valid Pin No" ValidationExpression="<%$ Resources:ValidationRegx, PinCode %>"
                                    meta:resourcekey="regPinCodeInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoIns" runat="server" meta:resourcekey="lblPhoneNoIns" Text="Phone No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoIns" MaxLength="13" runat="server" meta:resourcekey="txtPhoneNoIns"
                                    Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPhoneNoIns" runat="server" ControlToValidate="txtPhoneNoIns"
                                    ErrorMessage="Please Enter Phone No" meta:resourcekey="rfvPhoneNoInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPhoneNoIns" runat="server" ControlToValidate="txtPhoneNoIns"
                                    ErrorMessage="Please Enter Valid Phone No(13 digit No)" ValidationExpression="<%$ Resources:ValidationRegx, PhoneNo %>"
                                    meta:resourcekey="regPhoneNoInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <uc1:FileForward ID="FileForward1" runat="server"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAddStampDetailsHeaderIns" runat="server" meta:resourcekey="lblAddStampDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Add Stamp Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px">
                                <asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
                                    Text="Stamp Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlRevenueStampIdIns" runat="server" DataSourceID="odsRevenueStampMaster"
                                    DataTextField="Name" DataValueField="RevenueStampId" meta:resourcekey="ddlRevenueStampIdInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReturnedQuantityIns" runat="server" meta:resourcekey="lblReturnedQuantityIns"
                                    Text="Returned Quantity"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReturnedQuantityIns" MaxLength="3" runat="server" meta:resourcekey="txtReturnedQuantityIns"
                                    ValidationGroup="AddStamp"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtReturnedQuantityIns" runat="server" ControlToValidate="txtReturnedQuantityIns"
                                    ErrorMessage="Returned Quantity Can't be Blank" ValidationGroup="AddStamp" meta:resourcekey="ReqfldtxtReturnedQuantityInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regQuantityIns" runat="server" ControlToValidate="txtReturnedQuantityIns"
                                    ErrorMessage="Please Enter Valid No Of Stamped Returned" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>"
                                    ValidationGroup="AddStamp" meta:resourcekey="regQuantityInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStampSlNoIns" runat="server" meta:resourcekey="lblStampSlNoIns"
                                    Text="Stamps Seriel No"></asp:Label>
                            </td>
                            <td align="left" colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtStampSlNoIns" runat="server" meta:resourcekey="txtStampSlNoIns"
                                    TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStampSlNoIns"
                                    ErrorMessage="Returned Quantity Can't be Blank" ValidationGroup="AddStamp" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtStampSlNoIns"
                                    ErrorMessage="Please Enter Valid No Of Stamped Returned" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>"
                                    ValidationGroup="AddStamp" meta:resourcekey="RegularExpressionValidator1Resource1">*</asp:RegularExpressionValidator>
                        --%>
                            </td>
                            <td>
                                <asp:Button ID="btnAddStampIns" runat="server" OnClick="AddStampDetails_Click" Text="Add"
                                    ValidationGroup="AddStamp" meta:resourcekey="btnAddStampInsResource1" />
                                <asp:Button ID="btnUpdateStampIns" runat="server" CausesValidation="False" OnClick="UpdateStampDetails_Click"
                                    Text="Update" Visible="False" meta:resourcekey="btnUpdateStampInsResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvRefundStampDetailsIns" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="RefundApplicationId,RevenueStampId" OnRowDeleting="StampDetails_RowDeleting"
                                    OnSelectedIndexChanged="StampDetailsGrid_SelectedIndexChanged" meta:resourcekey="gvRefundStampDetailsInsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                                            Visible="False" meta:resourcekey="BoundFieldResource1" />
                                        <asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" Visible="False"
                                            meta:resourcekey="BoundFieldResource2" />
                                        <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                                            Visible="False" meta:resourcekey="BoundFieldResource3" />
                                        <asp:BoundField DataField="StampName" HeaderText="StampName" meta:resourcekey="BoundFieldResource4" />
                                        <asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" meta:resourcekey="BoundFieldResource5" />
                                        <asp:BoundField DataField="StampNumber" HeaderText="StampNumber" meta:resourcekey="BoundFieldResource6" />
                                        <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/App_Images/edit.bmp"
                                            ShowDeleteButton="True" DeleteImageUrl="~/App_Images/delete.bmp" meta:resourcekey="CommandFieldResource1">
                                            <ItemStyle Width="5px" />
                                        </asp:CommandField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppliedActDetailsIns" runat="server" meta:resourcekey="lblAppliedActDetailsIns"
                                    SkinID="SubHeading" Text="Applied Act Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: left;">
                                <asp:CheckBoxList ID="chkLstBxIns" runat="server" DataSourceID="odsActMaster" DataTextField="NameOfAct"
                                    DataValueField="ActId" RepeatColumns="4" meta:resourcekey="chkLstBxInsResource1">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksActIns" runat="server" meta:resourcekey="lblRemarksActIns"
                                    Text="Act Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksActIns" runat="server" meta:resourcekey="txtRemarksActIns"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblFIleUpload" runat="server" SkinID="SubHeading" Text="Attach Documents"
                                    Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <uc2:DocumentUpload ID="DocumentUpload1" runat="server" Visible="false" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Insert" OnClick="btnInsert_Click"
                                    meta:resourcekey="btnInsertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False"
                                    meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Refund Application"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFileno" runat="server" Text="File Number"></asp:Label></td>
                            <td class="textColumn">
                                <asp:Label ID="lblFilenoEdit" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeName" runat="server" meta:resourcekey="lblOfficeNameUpd"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlOfficeName" runat="server" DataTextField="OfficeName" DataValueField="OfficeId"
                                    SelectedValue='<%# Bind("OfficeId") %>' Width="180px" meta:resourcekey="dlOfficeNameResource3"
                                    OnSelectedIndexChanged="dlOfficeName_SelectedIndexChanged" DataSourceID="OdsOfficeMaster"
                                    OnLoad="dlOfficeName_Load1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoUpd" runat="server" meta:resourcekey="lblRegistrationNoUpd"
                                    Text="Registration  No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoUpd" runat="server" meta:resourcekey="txtRegistrationNoUpd"
                                    Text='<%# Bind("RegistrationNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorLicenseNoUpd" runat="server" meta:resourcekey="lblVendorLicenseNoUpd"
                                    Text="Vendor License No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlVendorLicenseNo" runat="server" DataSourceID="OdsLicenseMaster"
                                    DataTextField="LicenseNo" DataValueField="LicenseApplicationId" SelectedValue='<%# Bind("VendorLicenseId") %>'
                                    meta:resourcekey="dlVendorLicenseNoResource3">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfRefundUpd" runat="server" meta:resourcekey="lblTypeOfRefundUpd"
                                    Text="Type Of Refund"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlTypeOfRefundUpd" runat="server" DataValueField="TypeOfRefund"
                                    SelectedValue='<%# Bind("TypeOfRefund") %>' Width="180px" meta:resourcekey="dlTypeOfRefundUpdResource1">
                                    <asp:ListItem Selected="True" meta:resourcekey="ListItemResource3">U</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4">N</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicationDateUpd" runat="server" meta:resourcekey="lblApplicationDateUpd"
                                    Text="Application Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicationDateUpd" runat="server" meta:resourcekey="txtApplicationDateUpd"
                                    SkinID="Calendar" Text='<%# Bind("ApplicationDate", "{0:d}") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtApplicationDateUpd"
                                    meta:resourcekey="PopCalendar1Resource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPurchasedDateUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="Purchased Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPurchasedDateUpd" runat="server" meta:resourcekey="txtPurchasedDateUpd"
                                    SkinID="Calendar" Text='<%# Bind("PurchasedDate", "{0:d}") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtPurchasedDateUpd" meta:resourcekey="PopCalendar2Resource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTotalValueOfStampsUpd" runat="server" meta:resourcekey="lblTotalValueOfStampsUpd"
                                    Text="Total Value Of Stamps"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTotalValueOfStampsUpd" runat="server" meta:resourcekey="txtTotalValueOfStampsUpd"
                                    Text='<%# Bind("TotalValueOfStamps") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReasonForNotUsingUpd" runat="server" meta:resourcekey="lblReasonForNotUsingUpd"
                                    Text="Reason For Not Using"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtReasonForNotUsingUpd" runat="server" meta:resourcekey="txtReasonForNotUsingUpd"
                                    Text='<%# Bind("ReasonForNotUsing") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 40px; width: 2%;">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPersonalDetailsUpd" runat="server" meta:resourcekey="lblPersonalDetailsUpd"
                                    SkinID="SubHeading" Text="Personal  Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameUpd" runat="server" meta:resourcekey="lblApplicantNameUpd"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantNameUpd" runat="server" meta:resourcekey="txtApplicantNameUpd"
                                    Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressUpd" runat="server" meta:resourcekey="lblApplicantAddressUpd"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantAddressUpd" runat="server" meta:resourcekey="txtApplicantAddressUpd"
                                    Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCityUpd" runat="server" meta:resourcekey="lblCityUpd" Text="City"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCityUpd" runat="server" meta:resourcekey="txtCityUpd" Text='<%# Bind("City") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictUpd" runat="server" meta:resourcekey="lblDistrictUpd" Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDistrictUpd" runat="server" meta:resourcekey="txtDistrictUpd"
                                    Text='<%# Bind("District") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPinCodeUpd" runat="server" meta:resourcekey="lblPinCodeUpd" Text="Pin Code"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPinCodeUpd" runat="server" meta:resourcekey="txtPinCodeUpd" MaxLength="6"
                                    Text='<%# Bind("PinCode") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoUpd" runat="server" meta:resourcekey="lblPhoneNoUpd" Text="Phone No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoUpd" runat="server" meta:resourcekey="txtPhoneNoUpd" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksUpd" runat="server" meta:resourcekey="lblRemarksUpd" Text="Remarks"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtRemarksUpd" runat="server" meta:resourcekey="txtRemarksUpd" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAddStampDetailsHeaderUpd" runat="server" meta:resourcekey="lblAddStampDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Add Stamp Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="Stamp Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlRevenueStampIdUpd" runat="server" DataSourceID="odsRevenueStampMaster"
                                    DataTextField="Name" DataValueField="RevenueStampId" meta:resourcekey="ddlRevenueStampIdUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReturnedQuantityUpd" runat="server" meta:resourcekey="lblReturnedQuantityUpd"
                                    Text="Returned Quantity"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReturnedQuantityUpd" runat="server" MaxLength="3" meta:resourcekey="txtReturnedQuantityUpd"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblStampSlNoUpd" runat="server" meta:resourcekey="lblStampSlNoUpd"
                                    Text="Stamps Seriel No"></asp:Label>
                            </td>
                            <td align="left" colspan="4">
                                <asp:TextBox ID="txtStampSlNoUpd" runat="server" meta:resourcekey="txtStampSlNoUpd"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnAddStampUpd" runat="server" OnClick="AddStampDetails_Click" Text="Add"
                                    meta:resourcekey="btnAddStampUpdResource1" />
                                <asp:Button ID="btnUpdateStampUpd" runat="server" OnClick="UpdateStampDetails_Click"
                                    Text="Update" Visible="False" meta:resourcekey="btnUpdateStampUpdResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvRefundStampDetailsUpd" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="RefundApplicationId,RevenueStampId" OnRowDeleting="StampDetails_RowDeleting"
                                    OnSelectedIndexChanged="StampDetailsGrid_SelectedIndexChanged" meta:resourcekey="gvRefundStampDetailsUpdResource1">
                                    <Columns>
                                        <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                                            Visible="False" meta:resourcekey="BoundFieldResource12" />
                                        <asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" Visible="False"
                                            meta:resourcekey="BoundFieldResource13" />
                                        <asp:BoundField DataField="StampName" HeaderText="StampName" meta:resourcekey="BoundFieldResource14" />
                                        <asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" meta:resourcekey="BoundFieldResource15" />
                                        <asp:BoundField DataField="StampNumber" HeaderText="StampNumber" meta:resourcekey="BoundFieldResource16" />
                                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" meta:resourcekey="CommandFieldResource2" />
                                        <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource3" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAppliedActDetailsUpd" runat="server" meta:resourcekey="lblAppliedActDetailsUpd"
                                    SkinID="SubHeading" Text="Applied Act Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: left;">
                                <asp:CheckBoxList ID="chkLstBxUpd" runat="server" DataTextField="NameOfAct" DataValueField="ActId"
                                    RepeatColumns="4" meta:resourcekey="chkLstBxUpdResource1">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <uc1:FileForward ID="FileForward1" runat="server"></uc1:FileForward>
                            </td>
                        </tr>
                        <tr>
                            <%--<td colspan="6">
                                <uc3:DocumentDownload ID="ddRefund" runat="server" />
                            </td>--%>
                        </tr>
                        <tr>
                            <%--<td colspan="6">
                                <uc2:DocumentUpload ID="DocumentUpload2" runat="server" />
                            </td>--%>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkVerified" runat="server" Text="Verification Complete" meta:resourcekey="chkVerifiedResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnFvRefundApplicationUpdate" runat="server" CommandName="Update"
                                    Text="Update" meta:resourcekey="btnFvRefundApplicationUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" OnClick="btnCancel_Click1"
                                    CausesValidation="False" meta:resourcekey="btnCancelResource3" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderItm" runat="server" meta:resourcekey="lblFileDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Refund Approval"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                &nbsp;<asp:Label ID="lblRefundFileNoItm" runat="server" meta:resourcekey="lblRefundFileNoItm"
                                    Text="File No"></asp:Label></td>
                            <td class="textColumn">
                                &nbsp;<asp:Label ID="lblFileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoItm" runat="server" meta:resourcekey="lblRegistrationNoItm"
                                    Text="Registration  No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoItm" runat="server" meta:resourcekey="txtRegistrationNoItm"
                                    Text='<%# Bind("RegistrationNo") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblOfficeName" runat="server" meta:resourcekey="lblOfficeNameItm"
                                    Text="Office Name" Width="76px"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlOfficeName" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="180px" Enabled="False" meta:resourcekey="dlOfficeNameResource2">
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfRefundItm" runat="server" meta:resourcekey="lblTypeOfRefundItm"
                                    Text="Type Of Refund"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlTypeOfRefundIns" runat="server" DataValueField="TypeOfRefund"
                                    SelectedValue='<%# Bind("TypeOfRefund") %>' Width="180px" meta:resourcekey="dlTypeOfRefundInsResource2">
                                    <asp:ListItem Selected="True" meta:resourcekey="ListItemResource1">U</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2">N</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicationDateItm" runat="server" meta:resourcekey="lblApplicationDateItm"
                                    Text="Application Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicationDateItm" runat="server" meta:resourcekey="txtApplicationDateItm"
                                    Text='<%# Bind("ApplicationDate", "{0:d}") %>' ReadOnly="True"></asp:TextBox>&nbsp;
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorLicenseNoItm" runat="server" meta:resourcekey="lblVendorLicenseNoItm"
                                    Text="Vendor License No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlVendorLicenseNo" runat="server" DataSourceID="OdsLicenseMaster"
                                    DataTextField="LicenseNo" DataValueField="LicenseApplicationId" SelectedValue='<%# Bind("VendorLicenseId") %>'
                                    Enabled="False" meta:resourcekey="dlVendorLicenseNoResource2">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPurchasedDateItm" runat="server" meta:resourcekey="lblReceiptNumberItm"
                                    Text="Purchased Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPurchasedDateItm" runat="server" meta:resourcekey="txtPurchasedDateItm"
                                    Text='<%# Bind("PurchasedDate", "{0:d}") %>' ReadOnly="True"></asp:TextBox>&nbsp;
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTotalValueOfStampsItm" runat="server" meta:resourcekey="lblTotalValueOfStampsItm"
                                    Text="Total Value Of Stamps"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTotalValueOfStampsItm" runat="server" meta:resourcekey="txtTotalValueOfStampsItm"
                                    Text='<%# Bind("TotalValueOfStamps") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReasonForNotUsingItm" runat="server" meta:resourcekey="lblReasonForNotUsingItm"
                                    Text="Reason For Not Using"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtReasonForNotUsingItm" runat="server" meta:resourcekey="txtReasonForNotUsingItm"
                                    Text='<%# Bind("ReasonForNotUsing") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 40px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPersonalDetailsItm" runat="server" meta:resourcekey="lblPersonalDetailsItm"
                                    SkinID="SubHeading" Text="Personal  Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameItm" runat="server" meta:resourcekey="lblApplicantNameItm"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantNameItm" runat="server" meta:resourcekey="txtApplicantNameItm"
                                    Text='<%# Bind("ApplicantName") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressItm" runat="server" meta:resourcekey="lblApplicantAddressItm"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantAddressItm" runat="server" meta:resourcekey="txtApplicantAddressItm"
                                    Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCityItm" runat="server" meta:resourcekey="lblCityItm" Text="City"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCityItm" runat="server" meta:resourcekey="txtCityItm" Text='<%# Bind("City") %>'
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictItm" runat="server" meta:resourcekey="lblDistrictItm" Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDistrictItm" runat="server" meta:resourcekey="txtDistrictItm"
                                    Text='<%# Bind("District") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPinCodeItm" runat="server" meta:resourcekey="lblPinCodeItm" Text="Pin Code"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPinCodeItm" runat="server" meta:resourcekey="txtPinCodeItm" Text='<%# Bind("PinCode") %>'
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoItm" runat="server" meta:resourcekey="lblPhoneNoItm" Text="Phone No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoItm" runat="server" meta:resourcekey="txtPhoneNoItm" ReadOnly="True"
                                    Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksItm" runat="server" meta:resourcekey="lblRemarksItm" Text="Remarks"></asp:Label>
                            </td>
                            <td align="left" colspan="4">
                                <asp:TextBox ID="txtRemarksItm" runat="server" meta:resourcekey="txtRemarksItm" Text='<%# Bind("Remarks") %>'
                                    TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDetailsHeaderItm" runat="server" meta:resourcekey="lblStampDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Stamp Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvRefundStampDetailsItm" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="RefundApplicationId,RevenueStampId" DataSourceID="RefundStampsById"
                                    meta:resourcekey="gvRefundStampDetailsItmResource1">
                                    <Columns>
                                        <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                                            ReadOnly="True" SortExpression="RefundApplicationId" Visible="False" meta:resourcekey="BoundFieldResource7" />
                                        <asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" ReadOnly="True"
                                            SortExpression="RevenueStampId" Visible="False" meta:resourcekey="BoundFieldResource8" />
                                        <asp:BoundField DataField="StampName" HeaderText="StampName" meta:resourcekey="BoundFieldResource9" />
                                        <asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" SortExpression="ReturnedQty"
                                            meta:resourcekey="BoundFieldResource10" />
                                        <asp:BoundField DataField="StampNumber" HeaderText="StampNumber" SortExpression="StampNumber"
                                            meta:resourcekey="BoundFieldResource11" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblActDetailsItm" runat="server" meta:resourcekey="lblActDetailsItm"
                                    SkinID="SubHeading" Text="Act Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: left;">
                                <asp:CheckBoxList ID="chkLstBxItm" runat="server" DataTextField="NameOfAct" DataValueField="ActId"
                                    RepeatColumns="4" Enabled="False" meta:resourcekey="chkLstBxItmResource1">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblActApplicableItm" runat="server" meta:resourcekey="lblActApplicableItm"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksActItm" runat="server" meta:resourcekey="txtRemarksActItm"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblApprovingRefundOrderItm" runat="server" meta:resourcekey="lblApprovingRefundOrderItm"
                                    SkinID="SubHeading" Text="Approving Refund Order"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRefundOrderIdItm" runat="server" meta:resourcekey="lblRefundOrderIdItm"
                                    Text="Refund Order Id"></asp:Label>
                                <strong>*</strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRefundOrderIdItm" runat="server" meta:resourcekey="txtRefundOrderIdItm"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfltxtRefundOrderIdItm" runat="server" ControlToValidate="txtRefundOrderIdItm"
                                    ErrorMessage="Refund Order Id Can't be Blank" Font-Bold="True" meta:resourcekey="RfltxtRefundOrderIdItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRefundOrderDateItm" runat="server" meta:resourcekey="lblRefundOrderDateItm"
                                    Text="Refund Order Date"></asp:Label>
                                <strong>*</strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRefundOrderDateItm" runat="server" ReadOnly="True" meta:resourcekey="txtRefundOrderDateItm"
                                    SkinID="Calendar"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" Control="txtRefundOrderDateItm"
                                    meta:resourcekey="PopCalendar3Resource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfltxtRefundOrderDateItm" runat="server" ControlToValidate="txtRefundOrderDateItm"
                                    ErrorMessage="Refund Order Date Can't be Blank" Font-Bold="True" meta:resourcekey="RfltxtRefundOrderDateItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click"
                                    meta:resourcekey="btnApproveResource1" />
                                <asp:Button ID="btnCancel" runat="server" Text="Reject" OnClick="btnCancel_Click"
                                    CausesValidation="False" meta:resourcekey="btnCancelResource2" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="viewGrid" runat="server" OnActivate="viewGrid_Activate">
            <table style="width: 100%; text-align: left;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblRefundApplicationIns" runat="server" meta:resourcekey="lblRefundApplicationIns"
                            SkinID="SubHeading" Text="Refund Application Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblRefundlNo" runat="server" Text="Enter Refund No" meta:resourcekey="lblRefundlNo"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtRefundlNo" runat="server" meta:resourcekey="txtRefundlNo"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" meta:resourcekey="btnSearch"
                            OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GvRefundAlerts" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RefundApplicationId"
                DataSourceID="OdsRefund" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GvRefundAlerts_SelectedIndexChanged"
                Width="792px" OnRowCommand="GvRefundAlerts_RowCommand" meta:resourcekey="GvRefundAlertsResource1">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" SortExpression="ApplicantName"
                        meta:resourcekey="BoundFieldResource17" />
                    <asp:BoundField DataField="TotalValueOfStamps" HeaderText="TotalValueOfStamps" SortExpression="TotalValueOfStamps"
                        meta:resourcekey="BoundFieldResource18">
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="ApplicationDate"
                        HtmlEncode="False" SortExpression="ApplicationDate" meta:resourcekey="BoundFieldResource19">
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                        ReadOnly="True" SortExpression="RefundApplicationId" Visible="False" meta:resourcekey="BoundFieldResource20" />
                    <asp:CommandField ShowSelectButton="True" SelectText="View" meta:resourcekey="CommandFieldResource4">
                        <ItemStyle Width="5px" />
                    </asp:CommandField>
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate>
                    Data Not Available!
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="ViewRefundReadOnly" runat="server">
            <asp:FormView ID="FvRefundReadOnly" runat="server" DataKeyNames="RefundApplicationId"
                DataSourceID="OdsRefundApplicationReadOnly" meta:resourcekey="FvRefundReadOnlyResource1">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderReadOnly" runat="server" meta:resourcekey="lblFileDetailsHeaderReadOnly"
                                    SkinID="SubHeading" Text="Refund  application History"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                                <asp:Label ID="Label1" runat="server" Text="File Number"></asp:Label></td>
                            <td class="textColumn">
                                <asp:Label ID="lblfileNOR" runat="server"></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblOfficeNameReadOnly" runat="server" meta:resourcekey="lblOfficeNameReadOnly"
                                    Text="Office Name" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlOfficeNameReadOnly" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" Enabled="False" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="180px" meta:resourcekey="dlOfficeNameReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRegistrationNoReadOnly" runat="server" meta:resourcekey="lblRegistrationNoReadOnly"
                                    Text="Registration  No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRegistrationNoReadOnly" runat="server" meta:resourcekey="txtRegistrationNoReadOnly"
                                    ReadOnly="True" Text='<%# Bind("RegistrationNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblTypeOfRefundItm" runat="server" meta:resourcekey="lblTypeOfRefundItm"
                                    Text="Type Of Refund"></asp:Label></td>
                            <td class="textColumn">
                                &nbsp;<asp:DropDownList ID="dlTypeOfRefundReadOnly" Enabled="false" runat="server"
                                    DataValueField="TypeOfRefund" SelectedValue='<%# Bind("TypeOfRefund") %>' Width="180px"
                                    meta:resourcekey="dlTypeOfRefundReadOnlyResource1">
                                    <asp:ListItem Selected="True" meta:resourcekey="ListItemResource5">U</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource6">N</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblRefundFileNoReadOnly" runat="server" meta:resourcekey="lblRefundFileNoReadOnly"
                                    Text="Refund File No" Visible="False"></asp:Label></td>
                            <td class="textColumn">
                                &nbsp;<asp:TextBox ID="txtRefundYearReadOnly" runat="server" ReadOnly="True" Text='<%# Bind("RefundYear") %>'
                                    Width="19%" meta:resourcekey="txtRefundYearReadOnlyResource1" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtRefundSlNoReadOnly" runat="server" ReadOnly="True" Text='<%# Bind("RefundSlNo") %>'
                                    Width="19%" meta:resourcekey="txtRefundSlNoReadOnlyResource1" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtRefundPrefixReadOnly" runat="server" ReadOnly="True" Text='<%# Bind("RefundPrefix") %>'
                                    Width="19%" meta:resourcekey="txtRefundPrefixReadOnlyResource1" Visible="False"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicationDateReadOnly" runat="server" meta:resourcekey="lblApplicationDateReadOnly"
                                    Text="Application Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicationDateReadOnly" runat="server" meta:resourcekey="txtApplicationDateReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ApplicationDate", "{0:d}") %>'></asp:TextBox>&nbsp;
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVendorLicenseNoReadOnly" runat="server" meta:resourcekey="lblVendorLicenseNoReadOnly"
                                    Text="Vendor License No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="dlVendorLicenseNoReadOnly" runat="server" DataSourceID="OdsLicenseMaster"
                                    DataTextField="LicenseNo" DataValueField="LicenseApplicationId" Enabled="False"
                                    SelectedValue='<%# Bind("VendorLicenseId") %>' meta:resourcekey="dlVendorLicenseNoReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPurchasedDateReadOnly" runat="server" meta:resourcekey="lblReceiptNumberReadOnly"
                                    Text="Purchased Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPurchasedDateReadOnly" runat="server" meta:resourcekey="txtPurchasedDateReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PurchasedDate", "{0:d}") %>'></asp:TextBox>&nbsp;
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTotalValueOfStampsReadOnly" runat="server" meta:resourcekey="lblTotalValueOfStampsReadOnly"
                                    Text="Total Value Of Stamps"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTotalValueOfStampsReadOnly" runat="server" meta:resourcekey="txtTotalValueOfStampsReadOnly"
                                    ReadOnly="True" Text='<%# Bind("TotalValueOfStamps") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReasonForNotUsingReadOnly" runat="server" meta:resourcekey="lblReasonForNotUsingReadOnly"
                                    Text="Reason For Not Using"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="txtReasonForNotUsingReadOnly" runat="server" meta:resourcekey="txtReasonForNotUsingReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ReasonForNotUsing") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 40px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPersonalDetailsReadOnly" runat="server" meta:resourcekey="lblPersonalDetailsReadOnly"
                                    SkinID="SubHeading" Text="Personal  Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantNameReadOnly" runat="server" meta:resourcekey="lblApplicantNameReadOnly"
                                    Text="Applicant Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantNameReadOnly" runat="server" meta:resourcekey="txtApplicantNameReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ApplicantName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblApplicantAddressReadOnly" runat="server" meta:resourcekey="lblApplicantAddressReadOnly"
                                    Text="Applicant Address"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtApplicantAddressReadOnly" runat="server" meta:resourcekey="txtApplicantAddressReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCityReadOnly" runat="server" meta:resourcekey="lblCityReadOnly"
                                    Text="City"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCityReadOnly" runat="server" meta:resourcekey="txtCityReadOnly"
                                    ReadOnly="True" Text='<%# Bind("City") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictReadOnly" runat="server" meta:resourcekey="lblDistrictReadOnly"
                                    Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDistrictReadOnly" runat="server" meta:resourcekey="txtDistrictReadOnly"
                                    ReadOnly="True" Text='<%# Bind("District") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPinCodeReadOnly" runat="server" meta:resourcekey="lblPinCodeReadOnly"
                                    Text="Pin Code"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPinCodeReadOnly" runat="server" meta:resourcekey="txtPinCodeReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PinCode") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoReadOnly" runat="server" meta:resourcekey="lblPhoneNoReadOnly"
                                    Text="Phone No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoReadOnly" runat="server" meta:resourcekey="txtPhoneNoReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRemarksReadOnly" runat="server" meta:resourcekey="lblRemarksReadOnly"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td align="left" colspan="4">
                                <asp:TextBox ID="txtRemarksReadOnly" runat="server" meta:resourcekey="txtRemarksReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDetailsHeaderItm" runat="server" meta:resourcekey="lblStampDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Stamp Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvRefundStampDetailsReadOnly" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="RefundApplicationId,RevenueStampId" DataSourceID="RefundStampsById"
                                    meta:resourcekey="gvRefundStampDetailsReadOnlyResource1">
                                    <Columns>
                                        <asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
                                            ReadOnly="True" SortExpression="RefundApplicationId" Visible="False" meta:resourcekey="BoundFieldResource21" />
                                        <asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" ReadOnly="True"
                                            SortExpression="RevenueStampId" Visible="False" meta:resourcekey="BoundFieldResource22" />
                                        <asp:BoundField DataField="StampName" HeaderText="StampName" meta:resourcekey="BoundFieldResource23" />
                                        <asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" SortExpression="ReturnedQty"
                                            meta:resourcekey="BoundFieldResource24" />
                                        <asp:BoundField DataField="StampNumber" HeaderText="StampNumber" SortExpression="StampNumber"
                                            meta:resourcekey="BoundFieldResource25" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblActDetailsReadOnly" runat="server" meta:resourcekey="lblActDetailsReadOnly"
                                    SkinID="SubHeading" Text="Act Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: left;">
                                <asp:CheckBoxList ID="chkLstBxReadOnly" runat="server" DataTextField="NameOfAct"
                                    DataValueField="ActId" Enabled="False" RepeatColumns="4" meta:resourcekey="chkLstBxReadOnlyResource1">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblActApplicableReadOnly" runat="server" meta:resourcekey="lblActApplicableReadOnly"
                                    Text="Remarks"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtRemarksActReadOnly" runat="server" meta:resourcekey="txtRemarksActReadOnly"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblOtherDetailsHeaderReadOnly" runat="server" meta:resourcekey="lblOtherDetailsHeaderReadOnly"
                                    SkinID="SubHeading" Text="Other Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblStatusReadOnly" runat="server" meta:resourcekey="lblStatusReadOnly"
                                    Text="Status" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStatusReadOnly" runat="server" meta:resourcekey="txtStatusReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Status") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRefundOrderIdReadOnly" runat="server" meta:resourcekey="lblRefundOrderIdReadOnly"
                                    Text="Refund Order Id"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRefundOrderIdReadOnly" runat="server" meta:resourcekey="txtRefundOrderIdReadOnly"
                                    ReadOnly="True" Text='<%# Bind("RefundOrderId") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblPenaltyAmountReadOnly" runat="server" meta:resourcekey="lblPenaltyAmountReadOnly"
                                    Text="Penality Amount" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPenaltyAmountReadOnly" runat="server" meta:resourcekey="txtPenaltyAmountReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PenaltyAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRefundAmountReadOnly" runat="server" meta:resourcekey="lblRefundAmountReadOnly"
                                    Text="Refund Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRefundAmountReadOnly" runat="server" meta:resourcekey="txtRefundAmountReadOnly"
                                    ReadOnly="True" Text='<%# Bind("RefundAmount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblDateOfOrderReadOnly" runat="server" meta:resourcekey="lblDateOfOrderReadOnly"
                                    Text="Date Of Order" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfOrderReadOnly" runat="server" meta:resourcekey="txtDateOfOrderReadOnly"
                                    ReadOnly="True" Text='<%# Bind("DateOfOrder") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInfoReadOnly" runat="server" meta:resourcekey="lblInfoReadOnly"
                                    Text="Info"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInfoReadOnly" runat="server" meta:resourcekey="txtInfoReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Info") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblCreatedByReadOnly" runat="server" meta:resourcekey="lblCreatedByReadOnly"
                                    Text="Created By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedByReadOnly" runat="server" meta:resourcekey="txtCreatedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedAtReadOnly" runat="server" meta:resourcekey="lblCreatedAtReadOnly"
                                    Text="Created At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedAtReadOnly" runat="server" meta:resourcekey="txtCreatedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedAt", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblModifiedByReadOnly" runat="server" meta:resourcekey="lblModifiedByReadOnly"
                                    Text="Modified By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedByReadOnly" runat="server" meta:resourcekey="txtModifiedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblModifiedAtReadOnly" runat="server" meta:resourcekey="lblModifiedAtReadOnly"
                                    Text="Modified At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedAtReadOnly" runat="server" meta:resourcekey="txtModifiedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedAt", "{0:d}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="BackToGrid" runat="server" OnClick="BackToGrid_Click" Text="Back"
                                    meta:resourcekey="BackToGridResource1" Visible="false" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" SelectMethod="GetOffices"
        TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices" OldValuesParameterFormatString="original_{0}">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsLicenseMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetLicenses" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
        UpdateMethod="CancelVendorLicenses">
        <UpdateParameters>
            <asp:Parameter Name="LicenseNo" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="RenewedDate" Type="DateTime" />
            <asp:Parameter Name="EffectiveDate" Type="DateTime" />
            <asp:Parameter Name="ExpiryDate" Type="DateTime" />
            <asp:Parameter Name="LicenseApplicationId" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsRefund" runat="server" SelectMethod="GetRefundDetailsByRefundNo"
        TypeName="IGRSS.BusinessLogicLayer.RefundApplication" OnInserting="OdsRefund_Inserting"
        OnUpdating="OdsRefund_Updating" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtRefundlNo" Name="RefundNo" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsRevenueStampMaster" runat="server" InsertMethod="NewRevenueStampMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetrevenueStampMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsActMaster" runat="server" InsertMethod="InsertNewActMaster"
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
    <asp:ObjectDataSource ID="OdsRefundDetails" runat="server" SelectMethod="GetAllRefundApplicationsById"
        TypeName="IGRSS.BusinessLogicLayer.RefundApplication" OnUpdating="OdsRefundDetails_Updating"
        UpdateMethod="UpdateRefundApplicationNew" InsertMethod="AddNewRefundApplication"
        OnInserting="OdsRefundDetails_Inserting">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldRefundId" Name="RefundApplicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="StampDetails" Type="Object" />
            <asp:Parameter Name="ActsApplicable" Type="Object" />
            <asp:Parameter Name="RefundApplicationId" Type="Object" />
            <asp:Parameter Name="AlertId" Type="Object" />
            <asp:Parameter Name="Verified" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="StampDetails" Type="Object" />
            <asp:Parameter Name="ActsApplicable" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="RefundStampsById" runat="server" SelectMethod="SelectRefundStampDetailsByRefundId"
        TypeName="IGRSS.BusinessLogicLayer.RefundApplication" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="GvRefundAlerts" Name="RefundApplicationId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsRefundApplicationReadOnly" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllRefundApplicationsById" TypeName="IGRSS.BusinessLogicLayer.RefundApplication">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldRefundId" Name="RefundApplicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;<asp:XmlDataSource ID="XmlRefundType" runat="server"></asp:XmlDataSource>
    &nbsp;&nbsp;<br />
    <asp:HiddenField ID="fldRefundId" runat="server" />
    &nbsp;
    <br />
</asp:Content>
