<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="VendorMaster.aspx.cs" Inherits="Service_VendorMaster" Title="Vendor Details Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:FormView runat="server" ID="fvVendorMaster" DefaultMode="Insert">
		<InsertItemTemplate>
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblVendorDetailsHeaderIns" runat="server" meta:resourcekey="lblVendorDetailsHeaderIns"
							SkinID="SubHeading" Text="Vendor Details"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblVendorNameIns" runat="server" meta:resourcekey="lblVendorNameIns"
							Text="Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtVendorNameIns" runat="server" meta:resourcekey="txtVendorNameIns"
							Text='<%# Bind("VendorName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
						<asp:RequiredFieldValidator ID="RvfName" runat="server" ControlToValidate="txtVendorNameIns">*</asp:RequiredFieldValidator>
					
					
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorAddressIns" runat="server" meta:resourcekey="lblVendorAddressIns"
							Text="Address"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtAddressIns" runat="server" meta:resourcekey="txtAddressIns" Text='<%# Bind("Address") %>'
							TextMode="MultiLine"></asp:TextBox>
					<td class="validationColumn">
						<asp:RequiredFieldValidator ID="RfvAddress" runat="server" ControlToValidate="txtAddressIns">*</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblCompanyIns" runat="server" meta:resourcekey="lblCompanyIns" Text="Company Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtCompanyIns" runat="server" meta:resourcekey="txtCompanyIns" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorTypeIns" runat="server" meta:resourcekey="lblVendorTypeIns"
							Text="Vendor Type"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlvendorTypeIns" runat="server">
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblContactPersonIns" runat="server" meta:resourcekey="lblContactPersonIns"
							Text="Contact Person"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtContactPersonIns" runat="server" meta:resourcekey="txtContactPersonIns"
							Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblPhoneIns" runat="server" meta:resourcekey="lblPhoneIns" Text="Phone"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtPhoneIns" runat="server" meta:resourcekey="txtPhoneIns" Text='<%# Bind("Phone") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkingDaysIns">*</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<asp:Button ID="btnvendorInsertIns" runat="server" CausesValidation="True" CommandName="Insert"
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
						<asp:Label ID="lblVendorDetailsHeaderUpd" runat="server" meta:resourcekey="lblVendorDetailsHeaderUpd"
							SkinID="SubHeading" Text="Vendor Details"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblVendorNameUpd" runat="server" meta:resourcekey="lblVendorNameUpd"
							Text="Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtVendorNameUpd" runat="server" meta:resourcekey="txtVendorNameUpd"
							Text='<%# Bind("VendorName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorAddressUpd" runat="server" meta:resourcekey="lblVendorAddressUpd"
							Text="Address"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtApplicationDateUpd" runat="server" meta:resourcekey="txtApplicationDateUpd"
							Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblCompanyUpd" runat="server" meta:resourcekey="lblCompanyUpd" Text="Company Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtCompanyUpd" runat="server" meta:resourcekey="txtCompanyUpd" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorTypeUpd" runat="server" meta:resourcekey="lblVendorTypeUpd"
							Text="Vendor Type"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlvendorTypeUpd" runat="server">
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblContactPersonUpd" runat="server" meta:resourcekey="lblContactPersonUpd"
							Text="Contact Person"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtContactPersonUpd" runat="server" meta:resourcekey="txtContactPersonUpd"
							Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblPhoneUpd" runat="server" meta:resourcekey="lblPhoneUpd" Text="Phone"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtPhoneUpd" runat="server" meta:resourcekey="txtPhoneUpd" Text='<%# Bind("Phone") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkingDaysUpd">*</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<asp:Button ID="btnvendorUpdatetUpd" runat="server" CausesValidation="True" CommandName="Update"
							Text="Update" />
						<asp:Button ID="btnvendorUpdateCancelUpd" runat="server" CausesValidation="False"
							CommandName="Cancel" Text="Cancel" />
					</td>
				</tr>
			</table>
		</EditItemTemplate>
		<ItemTemplate>
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblVendorDetailsHeaderItm" runat="server" meta:resourcekey="lblVendorDetailsHeaderItm"
							SkinID="SubHeading" Text="Vendor Details"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblVendorNameItm" runat="server" meta:resourcekey="lblVendorNameItm"
							Text="Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtVendorNameItm" ReadOnly="true" runat="server" meta:resourcekey="txtVendorNameItm"
							Text='<%# Bind("VendorName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorAddressItm" runat="server" meta:resourcekey="lblVendorAddressItm"
							Text="Address"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtApplicationDateItm" runat="server" meta:resourcekey="txtApplicationDateItm"
							ReadOnly="true" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblCompanyItm" runat="server" meta:resourcekey="lblCompanyItm" Text="Company Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtCompanyItm" runat="server" meta:resourcekey="txtCompanyItm" ReadOnly="true"
							Text='<%# Bind("CompanyName") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblVendorTypeItm" runat="server" meta:resourcekey="lblVendorTypeItm"
							Text="Vendor Type"></asp:Label>
					</td>
					<td class="textColumn">
						<td class="textColumn">
							<asp:TextBox ID="txtVendorTypeItm" runat="server" meta:resourcekey="txtVendorTypeItm"
								ReadOnly="true" Text='<%# Bind("VendorType") %>'></asp:TextBox>
						</td>	
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblContactPersonItm" runat="server" meta:resourcekey="lblContactPersonItm"
							Text="Contact Person"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtContactPersonItm" runat="server" meta:resourcekey="txtContactPersonItm"
							ReadOnly="true" Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblPhoneItm" runat="server" meta:resourcekey="lblPhoneItm" Text="Phone"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:TextBox ID="txtPhoneItm" runat="server" meta:resourcekey="txtPhoneItm" ReadOnly="true"
							Text='<%# Bind("Phone") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkingDaysItm">*</asp:RequiredFieldValidator>
					</td>
				</tr>
				
			</table>
		</ItemTemplate>
	</asp:FormView>
</asp:Content>
