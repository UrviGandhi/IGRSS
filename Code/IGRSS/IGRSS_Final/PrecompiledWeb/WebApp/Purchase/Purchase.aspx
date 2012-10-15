<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Purchase_PurchaseRegHeader, App_Web_q31dfqzu" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    &nbsp; &nbsp;
    <asp:MultiView ID="MvPurchase" runat="server" ActiveViewIndex="1">
        <asp:View ID="ViewFvPurchase" runat="server">
            &nbsp;&nbsp;
            <asp:FormView ID="FvPurchase" DefaultMode="Insert" runat="server" DataSourceID="OdsPurchaseByID"
                OnItemInserting="FvPurchase_ItemInserting" OnDataBound="FvPurchase_DataBound"
                DataKeyNames="PurchaseID" OnItemUpdating="FvPurchase_ItemUpdating" meta:resourcekey="FvPurchaseResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Purchase Register Header"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
                                    Text="PurRequsition No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptNumberIns" MaxLength="10" runat="server" meta:resourcekey="txtReceiptNumberIns"
                                    Text='<%# Bind("PurRequsitionNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPurRequsitionNoIns" runat="server" ControlToValidate="txtReceiptNumberIns"
                                    ErrorMessage="Please Enter PurRequsitionNo" meta:resourcekey="rfvPurRequsitionNoIns">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPurRequsitionNoIns" runat="server" ControlToValidate="txtReceiptNumberIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" ErrorMessage="Please Enter Valid PurRequsitionNo"
                                    meta:resourcekey="regPurRequsitionNoIns">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficeNameIns" runat="server" DataSourceID="OdsVendorMaster"
                                    DataTextField="VendorName" DataValueField="VendorID" SelectedValue='<%# Bind("VendorID") %>'
                                    meta:resourcekey="ddlOfficeNameInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRequestDateIns" runat="server" meta:resourcekey="lblRequestDateIns"
                                    Text="Request Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRequestDateIns" ReadOnly="True" runat="server" meta:resourcekey="txtRequestDateIns"
                                    SkinID="Calendar" Text='<%# Bind("RequestDate") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalRequestDateIns" runat="server" Control="txtRequestDateIns"
                                    meta:resourcekey="PopCalRequestDateInsResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvRequestDateIns" runat="server" ControlToValidate="txtRequestDateIns"
                                    ErrorMessage="Please Enter Request Date" meta:resourcekey="rfvRequestDateIns">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
                                    Text="Requested By "></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlReqByEmpID" runat="server" DataSourceID="OdsEmployeeMaster"
                                    DataTextField="FirstName" DataValueField="EmployeeID" SelectedValue='<%# Bind("ReqByEmpID") %>'
                                    meta:resourcekey="ddlReqByEmpIDResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPurchaseDetailsIns" runat="server" meta:resourcekey="lblPurchaseDetailsIns"
                                    SkinID="SubHeading" Text="Purchase Register Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblItemIDIns" runat="server" meta:resourcekey="lblItemIDIns" Text="Item Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlItemIDIns" runat="server" DataSourceID="OdsItemMaster" DataTextField="Name"
                                    DataValueField="ItemID" SelectedValue='<%# Bind("ItemID") %>' meta:resourcekey="ddlItemIDInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPackTypeIns" runat="server" meta:resourcekey="lblPackTypeIns" Text="Pack Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlPackTypeIns" runat="server" meta:resourcekey="ddlPackTypeIns" DataSourceID="XmlDataSource1" DataTextField="Key" DataValueField="Value"></asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                                <%--<asp:RequiredFieldValidator ID="rfvPackTypeIns" runat="server" ControlToValidate="txtPackTypeIns"
                                    ErrorMessage="Please Enter Pack Type" ValidationGroup="PRD" meta:resourcekey="rfvPackTypeIns">*</asp:RequiredFieldValidator>
                    --%>        </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblQuantityIns" runat="server" meta:resourcekey="lblQuantityIns" Text="Quantity"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtQuantityIns" MaxLength="3" runat="server" meta:resourcekey="txtQuantityIns"
                                    ValidationGroup="PRD"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvQuantityIns" runat="server" ControlToValidate="txtQuantityIns"
                                    ErrorMessage="Please Enter Quantity" ValidationGroup="PRD" meta:resourcekey="rfvQuantityIns">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regQuantityIns" ValidationGroup="PRD" runat="server"
                                    ControlToValidate="txtQuantityIns" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>"
                                    ErrorMessage="Please Enter Quantity" meta:resourcekey="regQuantityIns">*</asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="rngQuantityIns" runat="server" ControlToValidate="txtQuantityIns"
                                    MaximumValue="999.99" MinimumValue="0" ValidationGroup="PRD" ErrorMessage="Quantity should be less than 1000"
                                    meta:resourcekey="rngQuantityInsResource1">*</asp:RangeValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPriceIns" runat="server" meta:resourcekey="lblPriceIns" Text="Price"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPriceIns" MaxLength="10" runat="server" meta:resourcekey="txtPriceIns"
                                    ValidationGroup="PRD" OnDataBinding="txtPriceIns_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPriceIns" ValidationGroup="PRD" runat="server"
                                    ControlToValidate="txtPriceIns" ErrorMessage="Please Enter Price" meta:resourcekey="rfvPriceIns">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPriceIns" runat="server" ControlToValidate="txtPriceIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" ErrorMessage="Please Enter Price"
                                    meta:resourcekey="regQuantityIns" ValidationGroup="PRD">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnAddPurchaseDetailsIns" runat="server" Text="Add" OnClick="btnAddPurchaseDetails_Click"
                                    ValidationGroup="PRD" meta:resourcekey="btnAddPurchaseDetailsInsResource1" />
                                <asp:Button ID="btnUpdatePurchaseDetailsIns" runat="server" OnClick="btnUpdatePurchaseDetails_Click"
                                    Text="Update" Visible="False" meta:resourcekey="btnUpdatePurchaseDetailsInsResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvPurchageDetailsIns" runat="server" DataKeyNames="DetailID" AutoGenerateColumns="False"
                                    OnSelectedIndexChanged="GvPurchageDetails_SelectedIndexChanged" OnRowDeleting="GvPurchageDetails_RowDeleting"
                                    meta:resourcekey="GvPurchageDetailsInsResource1">
                                    <Columns>
                                        <asp:BoundField DataField="DetailID" HeaderText="DetailID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                        <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" Visible="False" meta:resourcekey="BoundFieldResource2" />
                                        <asp:BoundField DataField="ItemID " HeaderText="ItemID " Visible="False" meta:resourcekey="BoundFieldResource3" />
                                        <asp:BoundField DataField="ItemName" HeaderText="Item Name  " meta:resourcekey="BoundFieldResource4" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity " meta:resourcekey="BoundFieldResource5" />
                                        <asp:BoundField DataField="PackType" HeaderText="Pack Type" meta:resourcekey="BoundFieldResource6" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" meta:resourcekey="BoundFieldResource7" />
                                        <asp:BoundField DataField="Value" HeaderText="Value" meta:resourcekey="BoundFieldResource8" />
                                        <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" meta:resourcekey="CommandFieldResource2" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Purchase Register Header"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="PurRequsition No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptNumberUpd" MaxLength="10" runat="server" meta:resourcekey="txtReceiptNumberUpd"
                                    Text='<%# Bind("PurRequsitionNo") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPurRequsitionNoUpd" runat="server" ControlToValidate="txtReceiptNumberUpd"
                                    ErrorMessage="Please Enter PurRequsitionNo" meta:resourcekey="rfvPurRequsitionNoUpd">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPurRequsitionNoUpd" runat="server" ControlToValidate="txtReceiptNumberUpd"
                                    ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" ErrorMessage="Please Enter Valid PurRequsitionNo"
                                    meta:resourcekey="regPurRequsitionNoUpd">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesUpd" runat="server" meta:resourcekey="lblAdjudicationTotalFeesUpd"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficeNameUpd" runat="server" DataSourceID="OdsVendorMaster"
                                    DataTextField="VendorName" DataValueField="VendorID" SelectedValue='<%# Bind("VendorID") %>'
                                    meta:resourcekey="ddlOfficeNameUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRequestDateUpd" runat="server" meta:resourcekey="lblRequestDateUpd"
                                    Text="Request Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRequestDateUpd" ReadOnly="True" runat="server" meta:resourcekey="txtRequestDateUpd"
                                    SkinID="Calendar" Text='<%# Bind("RequestDate", "{0:d}") %>'></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalRequestDateUpd" runat="server" Control="txtRequestDateUpd"
                                    meta:resourcekey="PopCalRequestDateUpdResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvRequestDateUpd" runat="server" ControlToValidate="txtRequestDateUpd"
                                    ErrorMessage="Please Enter Request Date" meta:resourcekey="rfvRequestDateUpd">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblRequestedByUpd" runat="server" meta:resourcekey="lblRequestedByUpd"
                                    Text="Requested By "></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlReqByEmpID" runat="server" DataSourceID="OdsEmployeeMaster"
                                    DataTextField="FirstName" DataValueField="EmployeeID" SelectedValue='<%# Bind("ReqByEmpID") %>'
                                    meta:resourcekey="ddlReqByEmpIDResource3">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPurchaseDetailsUpd" runat="server" meta:resourcekey="lblPurchaseDetailsUpd"
                                    SkinID="SubHeading" Text="Purchase Register Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblItemIDUpd" runat="server" meta:resourcekey="lblItemIDUpd" Text="Item Name"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlItemIDUpd" runat="server" DataSourceID="OdsItemMaster" DataTextField="Name"
                                    DataValueField="ItemID" meta:resourcekey="ddlItemIDUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPackTypeUpd" runat="server" meta:resourcekey="lblPackTypeUpd" Text="Pack Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                 <asp:DropDownList ID="ddlPackTypeUpd" runat="server" meta:resourcekey="ddlPackTypeUpd" DataSourceID="XmlDataSource1" DataTextField="Key" DataValueField="Value"></asp:DropDownList>
                          </td>
                            <td class="validationColumn">
                                <%--<asp:RequiredFieldValidator ID="rfvPackTypeUpd" runat="server" ControlToValidate="txtPackTypeUpd"
                                    ErrorMessage="Please Enter Pack Type" ValidationGroup="PRD" meta:resourcekey="rfvPackTypeUpd">*</asp:RequiredFieldValidator>
                   --%>         </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblQuantityUpd" runat="server" meta:resourcekey="lblQuantityUpd" Text="Quantity"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtQuantityUpd" MaxLength="3" runat="server" meta:resourcekey="txtQuantityUpd"
                                    ValidationGroup="PRD"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvQuantityUpd" runat="server" ControlToValidate="txtQuantityUpd"
                                    ErrorMessage="Please Enter Quantity" ValidationGroup="PRD" meta:resourcekey="rfvQuantityUpd">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regQuantityUpd" ValidationGroup="PRD" runat="server"
                                    ControlToValidate="txtQuantityUpd" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>"
                                    ErrorMessage="Please Enter Quantity" meta:resourcekey="regQuantityUpd">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPriceUpd" runat="server" meta:resourcekey="lblPriceUpd" Text="Price"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPriceUpd" MaxLength="10" runat="server" meta:resourcekey="txtPriceUpd"
                                    ValidationGroup="PRD"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvPriceUpd" runat="server" ControlToValidate="txtPriceUpd"
                                    ErrorMessage="Please Enter Price" ValidationGroup="PRD" meta:resourcekey="rfvPriceUpd">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regPriceUpd" ValidationGroup="PRD" runat="server"
                                    ControlToValidate="txtPriceUpd" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>"
                                    ErrorMessage="Please Enter Price" meta:resourcekey="regPriceUpd">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnAddPurchaseDetailsUpd" ValidationGroup="PRD" runat="server" OnClick="btnAddPurchaseDetails_Click"
                                    Text="Add" meta:resourcekey="btnAddPurchaseDetailsUpdResource1" />
                                <asp:Button ID="btnUpdatePurchaseDetailsUpd" ValidationGroup="PRD" runat="server"
                                    OnClick="btnUpdatePurchaseDetails_Click" Text="Update" Visible="False" meta:resourcekey="btnUpdatePurchaseDetailsUpdResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvPurchageDetailsUpd" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="DetailID" OnRowDeleting="GvPurchageDetails_RowDeleting" OnSelectedIndexChanged="GvPurchageDetails_SelectedIndexChanged"
                                    meta:resourcekey="GvPurchageDetailsUpdResource1">
                                    <Columns>
                                        <asp:BoundField DataField="DetailID" HeaderText="DetailID" Visible="False" meta:resourcekey="BoundFieldResource17" />
                                        <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" Visible="False" meta:resourcekey="BoundFieldResource18" />
                                        <asp:BoundField DataField="ItemID " HeaderText="ItemID " Visible="False" meta:resourcekey="BoundFieldResource19" />
                                        <asp:BoundField DataField="ItemName" HeaderText="Item Name  " meta:resourcekey="BoundFieldResource20" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity " meta:resourcekey="BoundFieldResource21" />
                                        <asp:BoundField DataField="PackType" HeaderText="Pack Type" meta:resourcekey="BoundFieldResource22" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:F2}" HtmlEncode="False"
                                            meta:resourcekey="BoundFieldResource23" />
                                        <asp:BoundField DataField="Value" HeaderText="Value" DataFormatString="{0:F2}" HtmlEncode="False"
                                            meta:resourcekey="BoundFieldResource24" />
                                        <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" meta:resourcekey="CommandFieldResource3" />
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" meta:resourcekey="CommandFieldResource4" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" OnClick="btnCancel_Click"
                                    meta:resourcekey="btnCancelResource2" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderItm" runat="server" meta:resourcekey="lblFileDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Purchase Register Header"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 28px">
                                <asp:Label ID="lblReceiptNumberItm" runat="server" meta:resourcekey="lblReceiptNumberItm"
                                    Text="PurRequsition No"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 28px">
                                <asp:TextBox ID="txtReceiptNumberItm" runat="server" meta:resourcekey="txtReceiptNumberItm"
                                    Text='<%# Bind("PurRequsitionNo") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="height: 28px">
                            </td>
                            <td class="labelColumn" style="height: 28px">
                                <asp:Label ID="lblAdjudicationTotalFeesItm" runat="server" meta:resourcekey="lblAdjudicationTotalFeesItm"
                                    Text="Vendor Name"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 28px">
                                <asp:DropDownList ID="ddlOfficeNameItm" runat="server" DataSourceID="OdsVendorMaster"
                                    DataTextField="VendorName" DataValueField="VendorID" SelectedValue='<%# Bind("VendorID") %>'
                                    Width="157px" Enabled="False" meta:resourcekey="ddlOfficeNameItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 28px">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblRequestDateItm" runat="server" meta:resourcekey="lblRequestDateItm"
                                    Text="Request Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRequestDateItm" runat="server" meta:resourcekey="txtRequestDateItm"
                                    SkinID="Calendar" Text='<%# Bind("RequestDate") %>' Enabled="False"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalRequestDateItm" runat="server" Control="txtRequestDateItm"
                                    meta:resourcekey="PopCalRequestDateItmResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="lblAdjudicationTotalFeesItm"
                                    Text="Requested By "></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlReqByEmpID" runat="server" DataSourceID="OdsEmployeeMaster"
                                    DataTextField="FirstName" DataValueField="EmployeeID" SelectedValue='<%# Bind("ReqByEmpID") %>'
                                    Width="157px" Enabled="False" meta:resourcekey="ddlReqByEmpIDResource2">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GvPurchageDetailsItm" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="PurchaseID" OnRowDeleting="GvPurchageDetails_RowDeleting" OnSelectedIndexChanged="GvPurchageDetails_SelectedIndexChanged"
                                    meta:resourcekey="GvPurchageDetailsItmResource1">
                                    <Columns>
                                        <asp:BoundField DataField="DetailID" HeaderText="DetailID" Visible="False" meta:resourcekey="BoundFieldResource9" />
                                        <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" Visible="False" meta:resourcekey="BoundFieldResource10" />
                                        <asp:BoundField DataField="ItemID " HeaderText="ItemID " Visible="False" meta:resourcekey="BoundFieldResource11" />
                                        <asp:BoundField DataField="ItemName" HeaderText="ItemName  " meta:resourcekey="BoundFieldResource12" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity " meta:resourcekey="BoundFieldResource13" />
                                        <asp:BoundField DataField="PackType" HeaderText="PackType" meta:resourcekey="BoundFieldResource14" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" meta:resourcekey="BoundFieldResource15" />
                                        <asp:BoundField DataField="Value" HeaderText="Value" meta:resourcekey="BoundFieldResource16" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPurchaseApproval" runat="server" meta:resourcekey="lblPurchaseApproval"
                                    SkinID="SubHeading" Text="Purchase Approval"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPurchaseDateItm" runat="server" meta:resourcekey="lblPurchaseDateItm"
                                    Text="Purchase Date"></asp:Label>
                                <strong>*</strong></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPurchaseDateItm" runat="server" meta:resourcekey="txtPurchaseDateItm"
                                    SkinID="Calendar"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalPurchaseDateItm" runat="server" Control="txtPurchaseDateItm"
                                    meta:resourcekey="PopCalPurchaseDateItmResource1" />
                            </td>
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
                            <td colspan="6" style="text-align: right;">
                                <asp:Button ID="btnApproveItm" runat="server" Text="Approve" OnClick="btnApproveItm_Click"
                                    meta:resourcekey="btnApproveItmResource1" />
                                <asp:Button ID="BtnCancelItm" runat="server" Text="Cancel" OnClick="BtnCancelItm_Click"
                                    meta:resourcekey="BtnCancelItmResource1" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="ViewGvPurchase" runat="server">
            <asp:GridView ID="GvPurchase" runat="server" DataKeyNames="PurchaseID" AutoGenerateColumns="False"
                DataSourceID="OdsPurchaseRequest" OnSelectedIndexChanged="GvPurchase_SelectedIndexChanged"
                meta:resourcekey="GvPurchaseResource1">
                <Columns>
                    <asp:BoundField DataField="PurRequsitionNo" HeaderText="Pur Requsition No" meta:resourcekey="BoundFieldResource25" />
                    <asp:BoundField DataField="VendorName" HeaderText=" Vendor Name" meta:resourcekey="BoundFieldResource26" />
                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName"
                        meta:resourcekey="BoundFieldResource27" />
                    <asp:BoundField DataField="RequestDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="RequestDate"
                        HtmlEncode="False" SortExpression="RequestDate" meta:resourcekey="BoundFieldResource28" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource5" />
                </Columns>
                <EmptyDataTemplate>
                    Data Not Available!
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View1" runat="server">
            &nbsp;<br />
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsItemMaster" runat="server" InsertMethod="InsertVendorMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetItemMasterTableDetails"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
        <UpdateParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" DataObjectTypeName="System.Guid"
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
    <asp:ObjectDataSource ID="OdsVendorMaster" runat="server" InsertMethod="InsertVendorMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorMasterTableDetails"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
        <UpdateParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsPurchaseRequest" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeletePurchaseRegDetailsByID" InsertMethod="InsertPurchaseRegHeader"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetPurchaseRequestDetails"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdatePurchaseRegHeader">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
            <asp:Parameter Name="PurchaseID" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;<asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsPurchaseByID" runat="server" InsertMethod="InsertPurchaseRegHeader"
        SelectMethod="GetPurchaseDetailsByID" TypeName="IGRSS.BusinessLogicLayer.Purchase"
        UpdateMethod="UpdatePurchaseRegHeader" OnUpdating="OdsPurchaseByID_Updating"
        OnInserting="OdsPurchaseByID_Inserting">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
            <asp:Parameter Name="PurchaseID" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvPurchase" Name="PurchaseID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
