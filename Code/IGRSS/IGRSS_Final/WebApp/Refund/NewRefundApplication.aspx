<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="NewRefundApplication.aspx.cs" Inherits="NewRefundApplication" Title="Refund Application Details" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="mvRefund" runat="server" ActiveViewIndex="0" >
		<asp:View ID="RefundApplicationView" runat="server">
			<asp:FormView ID="FVRefundApplication" runat="server" DataKeyNames="RefundApplicationId"
				DataSourceID="odsRefundDetails" DefaultMode="Insert" OnItemInserting="FVRefundApplication_ItemInserting"
				OnPageIndexChanging="FVRefundApplication_PageIndexChanging" OnItemInserted="FVRefundApplication_ItemInserted"
				OnItemUpdated="FVRefundApplication_ItemUpdated" meta:resourcekey="FVRefundApplicationResource1" >
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td align="left" colspan="6">
								<asp:Label ID="LblRefundHeading" runat="server" SkinID="Heading" Text="Refund Application" meta:resourcekey="LblRefundHeadingResource1"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px; width: 156px;">
								<asp:Label ID="LblOfficeId" runat="server" Text="Office Name" Width="98px" meta:resourcekey="LblOfficeIdResource1"></asp:Label></td>
							<td align="left" style="height: 15px; width: 163px;">
								<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OdsOfficeMaster"
									DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
									Width="157px" meta:resourcekey="DropDownList1Resource1">
								</asp:DropDownList></td>
							<td style="height: 15px">
							</td>
							<td align="left" style="width: 101px; height: 15px">
								<asp:Label ID="LblRegistrationNo" runat="server" Text="Registration No" meta:resourcekey="LblRegistrationNoResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 15px">
								<asp:TextBox ID="TxtRegistrationNo" runat="server" Text='<%# Bind("RegistrationNo") %>' meta:resourcekey="TxtRegistrationNoResource1"></asp:TextBox></td>
							<td align="left" style="width: 12px; height: 15px">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtRegistrationNo"
									ErrorMessage="*" Font-Bold="True" Width="1px" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 26px; width: 156px;">
								<asp:Label ID="LblRefundPrefix" runat="server" Text="Refund File No" meta:resourcekey="LblRefundPrefixResource1"></asp:Label></td>
							<td align="left" style="height: 7px; width: 163px;">
								<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RefundPrefix") %>' Width="19%" meta:resourcekey="TextBox1Resource1"></asp:TextBox>&nbsp;/
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RefundSlNo") %>' Width="19%" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
								/
								<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RefundYear") %>' Width="19%" meta:resourcekey="TextBox3Resource1"></asp:TextBox></td>
							<td style="height: 26px;">
							</td>
							<td align="left" style="width: 101px; height: 26px;">
								<asp:Label ID="LblTypeOfRefund" runat="server" Text="Type Of Refund" meta:resourcekey="LblTypeOfRefundResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 26px;">
								<asp:TextBox ID="TxtTypeOfRefund" runat="server" Text='<%# Bind("TypeOfRefund") %>' meta:resourcekey="TxtTypeOfRefundResource1"></asp:TextBox></td>
							<td style="width: 12px; height: 26px;">
							</td>
						</tr>
						<tr>
							<td align="left" style="width: 156px; height: 37px;">
								<asp:Label ID="LblApplicationDate" runat="server" Text="Application Date" Width="118px" meta:resourcekey="LblApplicationDateResource1"></asp:Label></td>
							<td align="left" style="width: 163px; height: 37px;">
								<asp:TextBox ID="TxtApplicationDate" runat="server" Text='<%# Bind("ApplicationDate") %>' meta:resourcekey="TxtApplicationDateResource1"></asp:TextBox></td>
							<td style="height: 37px;">
							</td>
							<td align="left" style="width: 101px; height: 37px;">
								<asp:Label ID="LblVendorLicenseId" runat="server" Text="Vendor License No" Width="130px" meta:resourcekey="LblVendorLicenseIdResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 37px;">
								<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odsLicenseMaster"
									DataTextField="LicenseNo" DataValueField="LicenseApplicationId" SelectedValue='<%# Bind("VendorLicenseId") %>'
									Width="161px" meta:resourcekey="DropDownList3Resource1">
								</asp:DropDownList><asp:ObjectDataSource ID="odsLicenseMaster" runat="server" DataObjectTypeName="System.Guid"
									DeleteMethod="DeleteLicenseDetails" InsertMethod="IssueLicense" OldValuesParameterFormatString="original_{0}"
									SelectMethod="GetLicenses" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL"
									UpdateMethod="UpdateLicenseDetails">
									<UpdateParameters>
										<asp:Parameter Name="LicenseApplicationId" Type="Object" />
										<asp:Parameter Name="LicenseNo" Type="String" />
										<asp:Parameter Name="IssuedDate" Type="DateTime" />
										<asp:Parameter Name="EffectiveDate" Type="DateTime" />
										<asp:Parameter Name="ExpiryDate" Type="DateTime" />
										<asp:Parameter Name="IsCancelled" Type="Boolean" />
									</UpdateParameters>
									<InsertParameters>
										<asp:Parameter Name="LicenseApplicationId" Type="Object" />
										<asp:Parameter Name="LicenseNo" Type="String" />
										<asp:Parameter Name="IssuedDate" Type="DateTime" />
										<asp:Parameter Name="EffectiveDate" Type="DateTime" />
										<asp:Parameter Name="ExpiryDate" Type="DateTime" />
										<asp:Parameter Name="Status" Type="String" />
									</InsertParameters>
								</asp:ObjectDataSource>
							</td>
							<td style="width: 12px; height: 37px;">
							</td>
						</tr>
						<tr>
							<td align="left" style="width: 156px">
								<asp:Label ID="LblPurchasedDate" runat="server" Text="Purchased Date" Width="106px" meta:resourcekey="LblPurchasedDateResource1"></asp:Label></td>
							<td align="left" style="width: 163px">
								<asp:TextBox ID="TxtPurchasedDate" runat="server" Text='<%# Bind("PurchasedDate") %>' meta:resourcekey="TxtPurchasedDateResource1"></asp:TextBox></td>
							<td align="left">
							</td>
							<td align="left" style="width: 101px">
								<asp:Label ID="LblTotalValueOfStamps" runat="server" Text="Total Value Of Stamps"
									Width="144px" meta:resourcekey="LblTotalValueOfStampsResource1"></asp:Label></td>
							<td align="left" style="width: 62px">
								<asp:TextBox ID="TxtTotalValueOfStamps" runat="server" Text='<%# Bind("TotalValueOfStamps") %>' meta:resourcekey="TxtTotalValueOfStampsResource1"></asp:TextBox></td>
							<td style="width: 12px">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtTotalValueOfStamps"
									ErrorMessage="*" Font-Bold="True" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></td>
						</tr>
						<tr>
							<td align="left" style="width: 156px; height: 41px;">
								<asp:Label ID="LblReasonForNotUsing" runat="server" Text="Reason For Not Using" Width="152px" meta:resourcekey="LblReasonForNotUsingResource1"></asp:Label></td>
							<td align="left" colspan="3" style="height: 41px">
								<asp:TextBox ID="TxtReasonForNotUsing" runat="server" Text='<%# Bind("ReasonForNotUsing") %>'
									TextMode="MultiLine" Width="313px" meta:resourcekey="TxtReasonForNotUsingResource1"></asp:TextBox></td>
							<td align="left" style="width: 62px; height: 41px;">
							</td>
							<td style="width: 12px; height: 41px;">
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6">
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6" style="height: 15px">
								<asp:Label ID="LblPersonalDetails" runat="server" SkinID="Heading" Text="Personal Details" meta:resourcekey="LblPersonalDetailsResource1"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px; width: 156px;">
								<asp:Label ID="LblApplicantName" runat="server" Text="Applicant Name" Width="124px" meta:resourcekey="LblApplicantNameResource1"></asp:Label></td>
							<td align="left" style="height: 15px; width: 163px;">
								<asp:TextBox ID="TxtApplicantName" runat="server" Text='<%# Bind("ApplicantName") %>' meta:resourcekey="TxtApplicantNameResource1"></asp:TextBox></td>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="width: 101px; height: 15px">
								<asp:Label ID="LblApplicantAddress" runat="server" Text="Applicant Address" Width="128px" meta:resourcekey="LblApplicantAddressResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 15px">
								<asp:TextBox ID="TxtApplicantAddress" runat="server" TextMode="MultiLine" Text='<%# Bind("ApplicantAddress") %>'
									Height="17px" Width="149px" meta:resourcekey="TxtApplicantAddressResource1"></asp:TextBox></td>
							<td align="left" style="width: 12px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px; width: 156px;">
								<asp:Label ID="LblCity" runat="server" Text="City" meta:resourcekey="LblCityResource1"></asp:Label></td>
							<td align="left" style="height: 15px; width: 163px;">
								<asp:TextBox ID="TxtCity" runat="server" Text='<%# Bind("City") %>' meta:resourcekey="TxtCityResource1"></asp:TextBox></td>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="width: 101px; height: 15px">
								<asp:Label ID="LblDistrict" runat="server" Text="District" meta:resourcekey="LblDistrictResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 15px">
								<asp:TextBox ID="TxtDistrict" runat="server" Text='<%# Bind("District") %>' meta:resourcekey="TxtDistrictResource1"></asp:TextBox></td>
							<td align="left" style="width: 12px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px; width: 156px;">
								<asp:Label ID="LblPinCode" runat="server" Text="Pin Code" meta:resourcekey="LblPinCodeResource1"></asp:Label></td>
							<td align="left" style="height: 15px; width: 163px;">
								<asp:TextBox ID="TxtPinCode" runat="server" Text='<%# Bind("PinCode") %>' meta:resourcekey="TxtPinCodeResource1"></asp:TextBox></td>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="width: 101px; height: 15px">
								<asp:Label ID="LblPhoneNo" runat="server" Text="Phone No" meta:resourcekey="LblPhoneNoResource1"></asp:Label></td>
							<td align="left" style="width: 62px; height: 15px">
								<asp:TextBox ID="TxtPhoneNo" runat="server" Text='<%# Bind("PhoneNo") %>' meta:resourcekey="TxtPhoneNoResource1"></asp:TextBox></td>
							<td align="left" style="width: 12px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="width: 156px; height: 15px">
								<asp:Label ID="LblRemarks" runat="server" Text="Remarks" meta:resourcekey="LblRemarksResource1"></asp:Label></td>
							<td align="left" style="height: 15px" colspan="3">
								<asp:TextBox ID="TxtRemarks" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine"
									Width="313px" meta:resourcekey="TxtRemarksResource1"></asp:TextBox></td>
							<td align="left" style="width: 62px; height: 15px">
							</td>
							<td align="left" style="width: 12px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 26px; width: 156px;">
							</td>
							<td align="left" style="height: 26px; width: 163px;">
							</td>
							<td align="left" style="height: 26px">
							</td>
							<td align="left" style="width: 101px; height: 26px">
							</td>
							<td align="left" style="height: 26px">
								<asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Insert" meta:resourcekey="Button1Resource1"/>
								<asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="Cancel" meta:resourcekey="Button2Resource1" /></td>
							<td align="left" style="width: 12px; height: 26px">
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td align="left" colspan="6">
								<asp:Label ID="LblRefundHeading" runat="server" SkinID="Heading" Text="Refund Application" meta:resourcekey="LblRefundHeadingResource3"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblOfficeId" runat="server" Text="Office Id" Width="98px" meta:resourcekey="LblOfficeIdResource3"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OdsOfficeMaster"
									DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
									Width="157px" meta:resourcekey="DropDownList1Resource3">
								</asp:DropDownList></td>
							<td style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblRegistrationNo" runat="server" Text="Registration No" meta:resourcekey="LblRegistrationNoResource3"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtRegistrationNo" runat="server" Text='<%# Bind("RegistrationNo") %>' meta:resourcekey="TxtRegistrationNoResource3"></asp:TextBox></td>
							<td style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 7px">
								<asp:Label ID="LblRefundPrefix" runat="server" Text="Refund File No" meta:resourcekey="LblRefundPrefixResource3"></asp:Label></td>
							<td align="left" style="height: 7px">
								<asp:TextBox ID="TxtRefundPrefix" runat="server" Text='<%# Bind("RefundPrefix") %>'
									Width="19%" meta:resourcekey="TxtRefundPrefixResource2"></asp:TextBox>&nbsp;/
								<asp:TextBox ID="TxtRefundSlNo" runat="server" Text='<%# Bind("RefundSlNo") %>' Width="19%" meta:resourcekey="TxtRefundSlNoResource2"></asp:TextBox>
								/
								<asp:TextBox ID="TxtRefundYear" runat="server" Text='<%# Bind("RefundYear") %>' Width="19%" meta:resourcekey="TxtRefundYearResource2"></asp:TextBox></td>
							<td>
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblTypeOfRefund" runat="server" Text="Type Of Refund" meta:resourcekey="LblTypeOfRefundResource3"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtTypeOfRefund" runat="server" Text='<%# Bind("TypeOfRefund") %>' meta:resourcekey="TxtTypeOfRefundResource3"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblApplicationDate" runat="server" Text="Application Date" Width="118px" meta:resourcekey="LblApplicationDateResource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtApplicationDate" runat="server" Text='<%# Bind("ApplicationDate") %>' meta:resourcekey="TxtApplicationDateResource3"></asp:TextBox></td>
							<td style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblVendorLicenseId" runat="server" Text="Vendor License Id" Width="130px" meta:resourcekey="LblVendorLicenseIdResource3"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtVendorLicenseId" runat="server" Text='<%# Bind("VendorLicenseId") %>' meta:resourcekey="TxtVendorLicenseIdResource2"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblPurchasedDate" runat="server" Text="Purchased Date" Width="106px" meta:resourcekey="LblPurchasedDateResource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtPurchasedDate" runat="server" Text='<%# Bind("PurchasedDate") %>' meta:resourcekey="TxtPurchasedDateResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblTotalValueOfStamps" runat="server" Text="Total Value Of Stamps"
									Width="144px" meta:resourcekey="LblTotalValueOfStampsResource3"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtTotalValueOfStamps" runat="server" Text='<%# Bind("TotalValueOfStamps") %>' meta:resourcekey="TxtTotalValueOfStampsResource3"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblReasonForNotUsing" runat="server" Text="Reason For Not Using" Width="152px" meta:resourcekey="LblReasonForNotUsingResource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtReasonForNotUsing" runat="server" Text='<%# Bind("ReasonForNotUsing") %>' meta:resourcekey="TxtReasonForNotUsingResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
							</td>
							<td align="left" style="width: 51px">
							</td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6" style="height: 15px">
								<asp:Label ID="LblPersonalDetails" runat="server" SkinID="Heading" Text="Personal Details" meta:resourcekey="LblPersonalDetailsResource3"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblApplicantName" runat="server" Text="Applicant Name" Width="124px" meta:resourcekey="LblApplicantNameResource3"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtApplicantName" runat="server" Text='<%# Bind("ApplicantName") %>' meta:resourcekey="TxtApplicantNameResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblApplicantAddress" runat="server" Text="Applicant Address" Width="128px" meta:resourcekey="LblApplicantAddressResource3"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtApplicantAddress" runat="server" Text='<%# Bind("ApplicantAddress") %>' meta:resourcekey="TxtApplicantAddressResource3"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblCity" runat="server" Text="City" meta:resourcekey="LblCityResource3"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtCity" runat="server" Text='<%# Bind("City") %>' meta:resourcekey="TxtCityResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblDistrict" runat="server" Text="District" meta:resourcekey="LblDistrictResource3"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtDistrict" runat="server" Text='<%# Bind("District") %>' meta:resourcekey="TxtDistrictResource3"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblPinCode" runat="server" Text="Pin Code" meta:resourcekey="LblPinCodeResource3"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtPinCode" runat="server" Text='<%# Bind("PinCode") %>' meta:resourcekey="TxtPinCodeResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblPhoneNo" runat="server" Text="Phone No" meta:resourcekey="LblPhoneNoResource3"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtPhoneNo" runat="server" Text='<%# Bind("PhoneNo") %>' meta:resourcekey="TxtPhoneNoResource3"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblRemarks" runat="server" Text="Remarks" meta:resourcekey="LblRemarksResource3"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtRemarks" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="TxtRemarksResource3"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
							</td>
							<td align="left" style="width: 51px; height: 15px">
							</td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="right" style="width: 100px; height: 15px">
							</td>
							<td align="left">
								<asp:Button ID="BtnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="BtnUpdateResource1" />
							</td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
					</table>
					<br />
					<asp:GridView ID="GridView2" runat="server" Width="712px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RefundApplicationId,RevenueStampId" DataSourceID="odsRefundStampDetails" ForeColor="#333333" GridLines="None" meta:resourcekey="GridView2Resource1">
						<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<Columns>
							<asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
								ReadOnly="True" SortExpression="RefundApplicationId" meta:resourcekey="BoundFieldResource10" />
							<asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" ReadOnly="True"
								SortExpression="RevenueStampId" meta:resourcekey="BoundFieldResource11" />
							<asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" SortExpression="ReturnedQty" meta:resourcekey="BoundFieldResource12" />
							<asp:BoundField DataField="StampNumber" HeaderText="StampNumber" SortExpression="StampNumber" meta:resourcekey="BoundFieldResource13" />
						</Columns>
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<EditRowStyle BackColor="#999999" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					</asp:GridView>
					<asp:ObjectDataSource ID="odsRefundStampDetails" runat="server" OldValuesParameterFormatString="original_{0}"
						SelectMethod="SelectRefundStampDetailsByRefundId" TypeName="IGRSS.BusinessLogicLayer.RefundApplication">
						<SelectParameters>
							<asp:ControlParameter ControlID="FVRefundApplication" Name="RefundApplicationId"
								PropertyName="SelectedValue" Type="Object" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:GridView ID="gvEActsApplicable" runat="server" AutoGenerateColumns="False" CellPadding="4"
						DataKeyNames="ActId" DataSourceID="odsRefundActsApplicable" ForeColor="#333333"
						GridLines="None" Width="710px" meta:resourcekey="gvEActsApplicableResource1" >
						<Columns>
							<asp:BoundField DataField="ActId" HeaderText="ActId" ReadOnly="True" SortExpression="ActId" Visible="False" meta:resourcekey="BoundFieldResource14" />
							<asp:BoundField DataField="DescriptionOfAct" HeaderText="DescriptionOfAct" SortExpression="DescriptionOfAct" meta:resourcekey="BoundFieldResource15" />
							<asp:BoundField DataField="NameOfAct" HeaderText="NameOfAct" SortExpression="NameOfAct" meta:resourcekey="BoundFieldResource16" />
							<asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" meta:resourcekey="CheckBoxFieldResource2" />
							<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" meta:resourcekey="BoundFieldResource17" />
							<asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" Visible="False" meta:resourcekey="BoundFieldResource18" />
							<asp:CommandField ShowEditButton="True" meta:resourcekey="CommandFieldResource1" />
						</Columns>
						<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
						<EditRowStyle BackColor="#999999" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
						<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
						<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					</asp:GridView>
				</EditItemTemplate>
				<ItemTemplate>
					<table width="100%">
						<tr >
							<td align="left" style="width: 131px" >
								<asp:Label ID="Label1" runat="server" Text="Refund order Id" Width="155px" meta:resourcekey="Label1Resource1"></asp:Label></td>
							<td align="left" style="width: 100px; height: 18px">
								<asp:TextBox ID="txtRefundOrderId" runat="server" meta:resourcekey="txtRefundOrderIdResource1"></asp:TextBox></td>
								<td>
								</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td align="left" style="width: 131px; height: 26px;">
								<asp:Label ID="Label2" runat="server" Text="Refund Order Date" Width="197px" meta:resourcekey="Label2Resource1"></asp:Label></td>
							<td align="left" style="width: 100px; height: 26px;">
								<asp:TextBox ID="txtRefundDate" runat="server" meta:resourcekey="txtRefundDateResource1"></asp:TextBox></td>
								
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td align="left" colspan="6">
								<asp:Label ID="LblRefundHeading" runat="server" SkinID="Heading" Text="Refund Application" meta:resourcekey="LblRefundHeadingResource2"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblOfficeId" runat="server" Text="Office Id" Width="98px" meta:resourcekey="LblOfficeIdResource2"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OdsOfficeMaster"
									DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
									Width="157px" meta:resourcekey="DropDownList1Resource2">
								</asp:DropDownList></td>
							<td style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblRegistrationNo" runat="server" Text="Registration No" meta:resourcekey="LblRegistrationNoResource2"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtRegistrationNo" runat="server" Text='<%# Bind("RegistrationNo") %>' ReadOnly="True" meta:resourcekey="TxtRegistrationNoResource2"></asp:TextBox></td>
							<td style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 7px">
								<asp:Label ID="LblRefundPrefix" runat="server" Text="Refund File No" meta:resourcekey="LblRefundPrefixResource2"></asp:Label></td>
							<td align="left" style="height: 7px">
								<asp:TextBox ID="TxtRefundPrefix" runat="server" Text='<%# Bind("RefundPrefix") %>'
									Width="19%" ReadOnly="True" meta:resourcekey="TxtRefundPrefixResource1"></asp:TextBox>
								/
								<asp:TextBox ID="TxtRefundSlNo" runat="server" Text='<%# Bind("RefundSlNo") %>' Width="19%" ReadOnly="True" meta:resourcekey="TxtRefundSlNoResource1"></asp:TextBox>
								/
								<asp:TextBox ID="TxtRefundYear" runat="server" Text='<%# Bind("RefundYear") %>' Width="19%" ReadOnly="True" meta:resourcekey="TxtRefundYearResource1"></asp:TextBox></td>
							<td>
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblTypeOfRefund" runat="server" Text="Type Of Refund" meta:resourcekey="LblTypeOfRefundResource2"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtTypeOfRefund" runat="server" Text='<%# Bind("TypeOfRefund") %>' ReadOnly="True" meta:resourcekey="TxtTypeOfRefundResource2"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblApplicationDate" runat="server" Text="Application Date" Width="118px" meta:resourcekey="LblApplicationDateResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtApplicationDate" runat="server" Text='<%# Bind("ApplicationDate") %>' ReadOnly="True" meta:resourcekey="TxtApplicationDateResource2"></asp:TextBox></td>
							<td style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblVendorLicenseId" runat="server" Text="Vendor License Id" Width="130px" meta:resourcekey="LblVendorLicenseIdResource2"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtVendorLicenseId" runat="server" Text='<%# Bind("VendorLicenseId") %>' ReadOnly="True" meta:resourcekey="TxtVendorLicenseIdResource1"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblPurchasedDate" runat="server" Text="Purchased Date" Width="106px" meta:resourcekey="LblPurchasedDateResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtPurchasedDate" runat="server" Text='<%# Bind("PurchasedDate") %>' ReadOnly="True" meta:resourcekey="TxtPurchasedDateResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
								<asp:Label ID="LblTotalValueOfStamps" runat="server" Text="Total Value Of Stamps"
									Width="144px" meta:resourcekey="LblTotalValueOfStampsResource2"></asp:Label></td>
							<td align="left" style="width: 51px">
								<asp:TextBox ID="TxtTotalValueOfStamps" runat="server" Text='<%# Bind("TotalValueOfStamps") %>' ReadOnly="True" meta:resourcekey="TxtTotalValueOfStampsResource2"></asp:TextBox></td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="LblReasonForNotUsing" runat="server" Text="Reason For Not Using" Width="152px" meta:resourcekey="LblReasonForNotUsingResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TxtReasonForNotUsing" runat="server" Text='<%# Bind("ReasonForNotUsing") %>' ReadOnly="True" meta:resourcekey="TxtReasonForNotUsingResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px">
							</td>
							<td align="left" style="width: 100px">
							</td>
							<td align="left" style="width: 51px">
							</td>
							<td style="width: 21px">
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6" style="height: 15px">
								<asp:Label ID="LblPersonalDetails" runat="server" SkinID="Heading" Text="Personal Details" meta:resourcekey="LblPersonalDetailsResource2"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblApplicantName" runat="server" Text="Applicant Name" Width="124px" meta:resourcekey="LblApplicantNameResource2"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtApplicantName" runat="server" Text='<%# Bind("ApplicantName") %>' ReadOnly="True" meta:resourcekey="TxtApplicantNameResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblApplicantAddress" runat="server" Text="Applicant Address" Width="128px" meta:resourcekey="LblApplicantAddressResource2"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtApplicantAddress" runat="server" Text='<%# Bind("ApplicantAddress") %>' ReadOnly="True" meta:resourcekey="TxtApplicantAddressResource2"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblCity" runat="server" Text="City" meta:resourcekey="LblCityResource2"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtCity" runat="server" Text='<%# Bind("City") %>' ReadOnly="True" meta:resourcekey="TxtCityResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblDistrict" runat="server" Text="District" meta:resourcekey="LblDistrictResource2"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtDistrict" runat="server" Text='<%# Bind("District") %>' ReadOnly="True" meta:resourcekey="TxtDistrictResource2"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblPinCode" runat="server" Text="Pin Code" meta:resourcekey="LblPinCodeResource2"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtPinCode" runat="server" Text='<%# Bind("PinCode") %>' ReadOnly="True" meta:resourcekey="TxtPinCodeResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
								<asp:Label ID="LblPhoneNo" runat="server" Text="Phone No" meta:resourcekey="LblPhoneNoResource2"></asp:Label></td>
							<td align="left" style="width: 51px; height: 15px">
								<asp:TextBox ID="TxtPhoneNo" runat="server" Text='<%# Bind("PhoneNo") %>' ReadOnly="True" meta:resourcekey="TxtPhoneNoResource2"></asp:TextBox></td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
								<asp:Label ID="LblRemarks" runat="server" Text="Remarks" meta:resourcekey="LblRemarksResource2"></asp:Label></td>
							<td align="left" style="height: 15px">
								<asp:TextBox ID="TxtRemarks" runat="server" Text='<%# Bind("Remarks") %>' ReadOnly="True" meta:resourcekey="TxtRemarksResource2"></asp:TextBox></td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="left" style="width: 100px; height: 15px">
							</td>
							<td align="left" style="width: 51px; height: 15px">
							</td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6" style="height: 15px">
								<br />
								<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
									DataKeyNames="RefundApplicationId,RevenueStampId" DataSourceID="odsStampDetails"
									ForeColor="#333333" GridLines="None" Width="706px" meta:resourcekey="GridView3Resource1">
									<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
									<Columns>
										<asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
											ReadOnly="True" SortExpression="RefundApplicationId" meta:resourcekey="BoundFieldResource1" />
										<asp:BoundField DataField="RevenueStampId" HeaderText="RevenueStampId" ReadOnly="True"
											SortExpression="RevenueStampId" meta:resourcekey="BoundFieldResource2" />
										<asp:BoundField DataField="ReturnedQty" HeaderText="ReturnedQty" SortExpression="ReturnedQty" meta:resourcekey="BoundFieldResource3" />
										<asp:BoundField DataField="StampNumber" HeaderText="StampNumber" SortExpression="StampNumber" meta:resourcekey="BoundFieldResource4" />
									</Columns>
									<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
									<EditRowStyle BackColor="#999999" />
									<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
									<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
									<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
									<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
								</asp:GridView>
								<asp:ObjectDataSource ID="odsStampDetails" runat="server" OldValuesParameterFormatString="original_{0}"
									SelectMethod="SelectRefundStampDetailsByRefundId" TypeName="IGRSS.BusinessLogicLayer.RefundApplication">
									<SelectParameters>
										<asp:ControlParameter ControlID="FVRefundApplication" Name="RefundApplicationId"
											PropertyName="SelectedValue" Type="Object" />
									</SelectParameters>
								</asp:ObjectDataSource>
								
							</td>
						</tr>
						<tr>
							<td align="left" colspan="6" style="height: 15px">
								<asp:GridView ID="GridView4" runat="server" CellPadding="4" DataSourceID="odsRefundActsApplicable"
									ForeColor="#333333" GridLines="None" Width="712px" AutoGenerateColumns="False" DataKeyNames="ActId" meta:resourcekey="GridView4Resource1">
									<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
									<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
									<EditRowStyle BackColor="#999999" />
									<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
									<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
									<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
									<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
									<Columns>
										<asp:BoundField DataField="ActId" HeaderText="ActId" ReadOnly="True" SortExpression="ActId"
											Visible="False" meta:resourcekey="BoundFieldResource5" />
										<asp:BoundField DataField="DescriptionOfAct" HeaderText="DescriptionOfAct" SortExpression="DescriptionOfAct" meta:resourcekey="BoundFieldResource6" />
										<asp:BoundField DataField="NameOfAct" HeaderText="NameOfAct" SortExpression="NameOfAct" meta:resourcekey="BoundFieldResource7" />
										<asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" meta:resourcekey="CheckBoxFieldResource1" />
										<asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy"
											Visible="False" meta:resourcekey="BoundFieldResource8" />
										<asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt"
											Visible="False" meta:resourcekey="BoundFieldResource9" />
									</Columns>
								</asp:GridView>
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="height: 15px">
							</td>
							<td align="left" style="width: 22px; height: 15px">
							</td>
							<td align="right" style="width: 100px; height: 15px">
								<asp:Button ID="EditOnApproving" runat="server" OnClick="EditOnApproving_Click" Text="Edit" meta:resourcekey="EditOnApprovingResource1" /></td>
							<td align="left">
								<asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" meta:resourcekey="btnApproveResource1" />
							</td>
							<td align="left" style="width: 21px; height: 15px">
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
			<table width="100%">
				<tr>
					<td align="left" colspan="4">
						<asp:Label ID="lblAddStampDetails" runat="server" SkinID="Heading" Text="Add Stamp Details" meta:resourcekey="lblAddStampDetailsResource1"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="height: 18px">
						<asp:Label ID="lblStampType" runat="server" Text="Stamp Type" Width="114px" meta:resourcekey="lblStampTypeResource1"></asp:Label></td>
					<td align="center" style="height: 18px">
						<asp:Label ID="lblStampQuantity" runat="server" Text="Quantity" Width="166px" meta:resourcekey="lblStampQuantityResource1"></asp:Label></td>
					<td align="center" style="height: 18px">
						<asp:Label ID="lblStampsSerielNo" runat="server" Text=" Stamps Seriel No" Width="277px" meta:resourcekey="lblStampsSerielNoResource1"></asp:Label></td>
					<td align="left" style="height: 18px">
					</td>
				</tr>
				<tr>
					<td align="left" style="height: 23px">
						<asp:DropDownList ID="dlRevenueStampId" runat="server" DataSourceID="odsRevenueStampMaster"
							DataTextField="Name" DataValueField="RevenueStampId" Height="20px" Width="131px" meta:resourcekey="dlRevenueStampIdResource1">
						</asp:DropDownList></td>
					<td align="left" style="height: 23px">
						<asp:TextBox ID="TxtReturnedQty" runat="server" Height="18px" Width="175px" meta:resourcekey="TxtReturnedQtyResource1"></asp:TextBox></td>
					<td align="left" style="height: 23px">
						<asp:TextBox ID="txtStampsNumbers" runat="server" TextMode="MultiLine" Height="21px"
							Width="271px" meta:resourcekey="txtStampsNumbersResource1"></asp:TextBox></td>
					<td align="left" style="height: 23px">
						<asp:Button ID="btnAddStamp" runat="server" OnClick="btnAddStamp_Click" Text="Add" meta:resourcekey="btnAddStampResource1" />
						<asp:Button ID="btnUpdateStamp" runat="server" OnClick="btnUpdateStamp_Click" Text="Update"
							Visible="False" meta:resourcekey="btnUpdateStampResource1" />
					</td>
				</tr>
			</table>
			<asp:GridView ID="gvRefundStampDetails" runat="server" AutoGenerateColumns="False"
				CellPadding="4" DataKeyNames="StampType" ForeColor="#333333" GridLines="None"
				OnRowDeleting="gvRefundStampDetails_RowDeleting" OnRowEditing="gvRefundStampDetails_RowEditing"
				OnSelectedIndexChanged="gvRefundStampDetails_SelectedIndexChanged" Width="748px" meta:resourcekey="gvRefundStampDetailsResource1">
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<EditRowStyle BackColor="#999999" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="StampType" HeaderText="Type Id" Visible="False" meta:resourcekey="BoundFieldResource19" />
					<asp:TemplateField HeaderText="Name Of Stamp" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
						<ItemTemplate>
							<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
								Text='<%# Bind("StampName") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="Qty" HeaderText="Quantity" meta:resourcekey="BoundFieldResource20" />
					<asp:BoundField DataField="Nos" HeaderText="Numbers" meta:resourcekey="BoundFieldResource21" />
					<asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
				</Columns>
			</asp:GridView>
			<table width="100%">
				<tr>
					<td align="left" colspan="4" style="height: 9px">
						<asp:Label ID="lblAppliedActs" runat="server" SkinID="Heading" Text="Applied Act Details" meta:resourcekey="lblAppliedActsResource1"></asp:Label></td>
				</tr>
				<tr>
					<td align="left" style="width: 29px; height: 9px;">
						<asp:Label ID="lblActApplicable" runat="server" Text="Act Applicable" Width="105px" meta:resourcekey="lblActApplicableResource1"></asp:Label></td>
					<td align="left" style="width: 52px; height: 9px;">
						<asp:CheckBoxList ID="chkLstBx" runat="server" DataSourceID="odsActMaster" DataTextField="NameOfAct"
							DataValueField="ActId" Height="26px" Width="144px" meta:resourcekey="chkLstBxResource1">
						</asp:CheckBoxList>
					</td>
					<td align="left" style="width: 49px; height: 9px;">
						<asp:Label ID="lblAppliedActsRemarks" runat="server" Text="Remarks" meta:resourcekey="lblAppliedActsRemarksResource1"></asp:Label></td>
					<td align="left" style="width: 100px; height: 9px;">
						<asp:TextBox ID="TxtActRemarks" runat="server" TextMode="MultiLine" Width="417px" meta:resourcekey="TxtActRemarksResource1"></asp:TextBox></td>
				</tr>
				<tr>
					<td align="left" style="width: 29px; height: 9px">
					</td>
					<td align="left" style="width: 52px; height: 9px">
					</td>
					<td align="left" style="width: 49px; height: 9px">
					</td>
					<td align="left" style="width: 100px; height: 9px">
						<asp:ObjectDataSource ID="odsRefundActsApplicable" runat="server" InsertMethod="InsertNewActMaster"
							OldValuesParameterFormatString="original_{0}" SelectMethod="GetActMasterDetails"
							TypeName="IGRSS.BusinessLogicLayer.RefundActMaster" UpdateMethod="UpdateActMaster">
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
					</td>
				</tr>
			</table>
			
			<asp:ObjectDataSource ID="odsRevenueStampMaster" runat="server" InsertMethod="NewRevenueStampMaster"
				OldValuesParameterFormatString="original_{0}" SelectMethod="GetrevenueStampMasterDetails"
				TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster" UpdateMethod="UpdateRevenueStampMaster">
				<UpdateParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
					<asp:Parameter Name="Amount" Type="Decimal" />
					<asp:Parameter Name="RevenueStampId" Type="Object" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
					<asp:Parameter Name="Amount" Type="Decimal" />
				</InsertParameters>
			</asp:ObjectDataSource>
			<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Show All" meta:resourcekey="Button3Resource1" />
			<asp:ObjectDataSource ID="odsRefundDetails" runat="server" InsertMethod="NewRefundApplication"
				SelectMethod="GetAllRefundApplicationsById" TypeName="IGRSS.BusinessLogicLayer.RefundApplication"
				UpdateMethod="UpdateRefundApplication">
				<UpdateParameters>
					<asp:Parameter Name="RefundApplicationId" Type="Object" />
					<asp:Parameter Name="OfficeId" Type="Object" />
					<asp:Parameter Name="RegistrationNo" Type="Object" />
					<asp:Parameter Name="RefundPrefix" Type="String" />
					<asp:Parameter Name="RefundSlNo" Type="Decimal" />
					<asp:Parameter Name="RefundYear" Type="Decimal" />
					<asp:Parameter Name="TypeOfRefund" Type="String" />
					<asp:Parameter Name="ApplicationDate" Type="DateTime" />
					<asp:Parameter Name="VendorLicenseId" Type="Object" />
					<asp:Parameter Name="PURCHASEDDATE" Type="DateTime" />
					<asp:Parameter Name="TotalValueOfStamps" Type="String" />
					<asp:Parameter Name="ReasonForNotUsing" Type="String" />
					<asp:Parameter Name="ApplicantName" Type="String" />
					<asp:Parameter Name="ApplicantAddress" Type="String" />
					<asp:Parameter Name="City" Type="String" />
					<asp:Parameter Name="District" Type="String" />
					<asp:Parameter Name="PinCode" Type="String" />
					<asp:Parameter Name="PhoneNo" Type="String" />
					<asp:Parameter Name="Remarks" Type="String" />
				</UpdateParameters>
				<InsertParameters>
					<asp:Parameter Name="OfficeId" Type="Object" />
					<asp:Parameter Name="RegistrationNo" Type="Object" />
					<asp:Parameter Name="RefundPrefix" Type="String" />
					<asp:Parameter Name="RefundSlNo" Type="Decimal" />
					<asp:Parameter Name="RefundYear" Type="Decimal" />
					<asp:Parameter Name="TypeOfRefund" Type="String" />
					<asp:Parameter Name="ApplicationDate" Type="DateTime" />
					<asp:Parameter Name="VendorLicenseId" Type="Object" />
					<asp:Parameter Name="PURCHASEDDATE" Type="DateTime" />
					<asp:Parameter Name="TotalValueOfStamps" Type="String" />
					<asp:Parameter Name="ReasonForNotUsing" Type="String" />
					<asp:Parameter Name="ApplicantName" Type="String" />
					<asp:Parameter Name="ApplicantAddress" Type="String" />
					<asp:Parameter Name="City" Type="String" />
					<asp:Parameter Name="District" Type="String" />
					<asp:Parameter Name="PinCode" Type="String" />
					<asp:Parameter Name="PhoneNo" Type="String" />
					<asp:Parameter Name="Remarks" Type="String" />
					<asp:Parameter Name="StampDetails" Type="Object" />
				</InsertParameters>
				<SelectParameters>
					<asp:Parameter Name="RefundApplicationId" Type="Object" />
				</SelectParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsActMaster" runat="server" InsertMethod="InsertNewActMaster"
				SelectMethod="GetActMasterDetails" TypeName="IGRSS.BusinessLogicLayer.RefundActMaster"
				UpdateMethod="UpdateActMaster" OldValuesParameterFormatString="original_{0}">
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
			<br />
		</asp:View>
		<asp:View ID="RefundApprovalView" runat="server">
			<asp:GridView ID="GvRefundAlerts" runat="server" AllowPaging="True" AllowSorting="True"
				AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RefundApplicationId"
				DataSourceID="OdsRefund" ForeColor="#333333" GridLines="None" Width="746px" OnSelectedIndexChanged="GvRefundAlerts_SelectedIndexChanged"
				OnRowCommand="GvRefundAlerts_RowCommand" meta:resourcekey="GvRefundAlertsResource1">
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<Columns>
					<asp:BoundField DataField="RefundApplicationId" HeaderText="RefundApplicationId"
						ReadOnly="True" SortExpression="RefundApplicationId" Visible="False" meta:resourcekey="BoundFieldResource22" />
					<asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" SortExpression="ApplicantName" meta:resourcekey="BoundFieldResource23" />
					<asp:BoundField DataField="TypeOfRefund" HeaderText="TypeOfRefund" SortExpression="TypeOfRefund" meta:resourcekey="BoundFieldResource24" />
					<asp:BoundField DataField="TotalValueOfStamps" HeaderText="TotalValueOfStamps" SortExpression="TotalValueOfStamps" meta:resourcekey="BoundFieldResource25" />
					<asp:BoundField DataField="RefundAmount" HeaderText="RefundAmount" SortExpression="RefundAmount" meta:resourcekey="BoundFieldResource26" />
					<asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" SortExpression="ApplicationDate" meta:resourcekey="BoundFieldResource27" />
					<asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource3" />
					<asp:ButtonField ButtonType="Button" Text="Issue" CommandName="Issue" meta:resourcekey="ButtonFieldResource1" />
				</Columns>
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<EditRowStyle BackColor="#999999" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
			</asp:GridView>
			<asp:ObjectDataSource ID="OdsRefund" runat="server" InsertMethod="NewRefundApplication"
				SelectMethod="GetAllRefundApplications" TypeName="IGRSS.BusinessLogicLayer.RefundApplication"
				UpdateMethod="UpdateRefundApplication" OldValuesParameterFormatString="original_{0}">
				<InsertParameters>
					<asp:Parameter Name="OfficeId" Type="Object" />
					<asp:Parameter Name="RegistrationNo" Type="Object" />
					<asp:Parameter Name="RefundPrefix" Type="String" />
					<asp:Parameter Name="RefundSlNo" Type="Decimal" />
					<asp:Parameter Name="RefundYear" Type="Decimal" />
					<asp:Parameter Name="TypeOfRefund" Type="String" />
					<asp:Parameter Name="ApplicationDate" Type="DateTime" />
					<asp:Parameter Name="VendorLicenseId" Type="Object" />
					<asp:Parameter Name="PURCHASEDDATE" Type="DateTime" />
					<asp:Parameter Name="TotalValueOfStamps" Type="String" />
					<asp:Parameter Name="ReasonForNotUsing" Type="String" />
					<asp:Parameter Name="ApplicantName" Type="String" />
					<asp:Parameter Name="ApplicantAddress" Type="String" />
					<asp:Parameter Name="City" Type="String" />
					<asp:Parameter Name="District" Type="String" />
					<asp:Parameter Name="PinCode" Type="String" />
					<asp:Parameter Name="PhoneNo" Type="String" />
					<asp:Parameter Name="Remarks" Type="String" />
					<asp:Parameter Name="StampDetails" Type="Object" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="RefundApplicationId" Type="Object" />
					<asp:Parameter Name="OfficeId" Type="Object" />
					<asp:Parameter Name="RegistrationNo" Type="Object" />
					<asp:Parameter Name="RefundPrefix" Type="String" />
					<asp:Parameter Name="RefundSlNo" Type="Decimal" />
					<asp:Parameter Name="RefundYear" Type="Decimal" />
					<asp:Parameter Name="TypeOfRefund" Type="String" />
					<asp:Parameter Name="ApplicationDate" Type="DateTime" />
					<asp:Parameter Name="VendorLicenseId" Type="Object" />
					<asp:Parameter Name="PURCHASEDDATE" Type="DateTime" />
					<asp:Parameter Name="TotalValueOfStamps" Type="String" />
					<asp:Parameter Name="ReasonForNotUsing" Type="String" />
					<asp:Parameter Name="ApplicantName" Type="String" />
					<asp:Parameter Name="ApplicantAddress" Type="String" />
					<asp:Parameter Name="City" Type="String" />
					<asp:Parameter Name="District" Type="String" />
					<asp:Parameter Name="PinCode" Type="String" />
					<asp:Parameter Name="PhoneNo" Type="String" />
					<asp:Parameter Name="Remarks" Type="String" />
				</UpdateParameters>
			</asp:ObjectDataSource>
		</asp:View>
	</asp:MultiView><br />
	&nbsp;<asp:ObjectDataSource ID="OdsLicenseMaster" runat="server"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" SelectMethod="GetOfficeDetails"
		TypeName="IGRSS.BusinessLogicLayer.OfficeMaster" OldValuesParameterFormatString="original_{0}">
	</asp:ObjectDataSource>
</asp:Content>
