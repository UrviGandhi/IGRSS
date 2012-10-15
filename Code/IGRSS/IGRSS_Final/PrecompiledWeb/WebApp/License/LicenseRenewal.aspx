<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_LicenseRenewal, App_Web_syjfv0ab" title="License Renewal Application" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="mvLicRenew" runat="server" ActiveViewIndex="0">
		<asp:View ID="vieLicRenew" runat="server">
			<table width="100%">
				<tr>
					<td align="left" colspan="5" style="height: 18px">
						<asp:Label ID="lblLicenseCancelation" runat="server" SkinID="Heading" Text="License Renewal Process" meta:resourcekey="lblLicenseCancelationResource1"></asp:Label></td>
				</tr>
				<tr>
					<td style="Width:25%" >
						<asp:Label ID="Label4" runat="server" Text="Enter License No<span >*</span></td>" meta:resourcekey="Label4Resource1"></asp:Label>
					</td>	
					<td  style="Width:25%">
						<asp:TextBox ID="txtLicenseNo" runat="server" meta:resourcekey="txtLicenseNoResource1"></asp:TextBox></td>
                    <td  style="Width:25%">
                        <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
                    <td  style="Width:25%">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
                        &nbsp;</td>
                    <td align="right" colspan="2">
						<asp:Button ID="btnLicenseNo" runat="server" Text="Search" OnClick="btnLicenseNo_Click" meta:resourcekey="btnLicenseNoResource1" />
						</td>
				</tr>
			</table>
			<asp:GridView ID="gvRenewVendor" runat="server" DataSourceID="odsLicenseN0" AutoGenerateColumns="False"
				DataKeyNames="LicenseApplicationId" OnSelectedIndexChanged="gvRenewVendor_SelectedIndexChanged" meta:resourcekey="gvRenewVendorResource1">
				<Columns>
					<asp:BoundField DataField="ApplnNumber" HeaderText="Application No" SortExpression="ApplnNumber" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle CssClass="grdTextField" />
                        <ItemStyle CssClass="grdTextField" />
                    </asp:BoundField>
					<asp:BoundField DataField="NameOfApplicant" HeaderText="Applicant Name" SortExpression="NameOfApplicant" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle CssClass="grdTextField" />
                    </asp:BoundField>
					<asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DateOfBirth" meta:resourcekey="BoundFieldResource3" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
					<asp:BoundField DataField="IssuedDate" HeaderText="Issue Date" SortExpression="IssuedDate" meta:resourcekey="BoundFieldResource4"  HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
					<asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" SortExpression="ExpiryDate" meta:resourcekey="BoundFieldResource5"  HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                        <HeaderStyle CssClass="grdDateField" />
                        <ItemStyle CssClass="grdDateField" />
                    </asp:BoundField>
					<asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
				</Columns>
                <EmptyDataTemplate>
                    No Records found
                </EmptyDataTemplate>
			</asp:GridView>
			<asp:ObjectDataSource ID="odsLicenseN0" runat="server" OldValuesParameterFormatString="{0}"
				SelectMethod="GetVendorLicenseDetails" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL" DataObjectTypeName="System.Guid" DeleteMethod="DeleteLicenseDetails" InsertMethod="RenewVendorLicenses" UpdateMethod="CancelVendorLicenses">
				<SelectParameters>
                    <asp:ControlParameter ControlID="txtName" Name="NameOfApplicant" PropertyName="Text"
                        Type="String" />
					<asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
						Type="String" />
				</SelectParameters>
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
			<asp:ObjectDataSource ID="odsRenewHistry" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetRenewalHistry" TypeName="IGRSS.BusinessLogicLayer.LicenseRenewal">
				<SelectParameters>
					<asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
						Type="String" />
				</SelectParameters>
			</asp:ObjectDataSource>
		</asp:View>
		<asp:View ID="viewRenewalHistory" runat="server">
			<table width="100%">
				<tr>
					<td align="left" style="height: 141px">
						<asp:GridView ID="gvRenewHistry" runat="server" AutoGenerateColumns="False" DataKeyNames="RenewalId"
							DataSourceID="odsRenewHistry" meta:resourcekey="gvRenewHistryResource1">
							<Columns>
								<asp:BoundField DataField="RenewedDate" HeaderText="RenewedDate" SortExpression="RenewedDate" meta:resourcekey="BoundFieldResource6" />
								<asp:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" SortExpression="EffectiveDate" meta:resourcekey="BoundFieldResource7" />
								<asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" meta:resourcekey="BoundFieldResource8" />
							</Columns>
                            <EmptyDataTemplate>
                                No Record Found!
                            </EmptyDataTemplate>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="viewLicFv" runat="server">
			<asp:FormView ID="fvVendorDetails" runat="server" DataKeyNames="LicenseApplicationId"
				DataSourceID="odsGetVendorDetails" OnPageIndexChanging="fvVendorDetails_PageIndexChanging"
				OnItemCommand="fvVendorDetails_ItemCommand" OnItemUpdated="fvVendorDetails_ItemUpdated" meta:resourcekey="fvVendorDetailsResource1">
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td align="left" colspan="6">
								<asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Vendor Details" meta:resourcekey="LBlLicenseHeadingResource3"></asp:Label>
							</td>
						</tr>
                        <tr>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblfile" runat="server" Text="File Number"></asp:Label></td>
                            <td align="left" style="height: 28px">
                                <asp:Label ID="lblfileNo" runat="server" Text='<%# Eval("FileNo") %>'></asp:Label></td>
                            <td align="left" style="height: 28px">
                            </td>
                            <td align="left" style="width: 227px; height: 28px">
                            </td>
                        </tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblappno" runat="server" Text="License No" meta:resourcekey="lblappnoResource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="ApplnNumberTextBox" ReadOnly="True" runat="server" Text='<%# Bind("ApplnNumber") %>' meta:resourcekey="ApplnNumberTextBoxResource3"></asp:TextBox>
							</td>
							<td align="left" style="height: 28px">
								<asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource3"></asp:Label></td>
							<td align="left" style="width: 227px; height: 28px">
								<asp:TextBox ID="NameOfApplicantTextBox" runat="server" ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>' meta:resourcekey="NameOfApplicantTextBoxResource3"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 28px">
								<asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource3"></asp:Label></td>
							<td align="left" style="height: 28px">
								<asp:TextBox ID="PresentAddressTextBox" runat="server" Height="50px" ReadOnly="false"
									TextMode="MultiLine" Text='<%# Bind("PresentAddress") %>' meta:resourcekey="PresentAddressTextBoxResource3"></asp:TextBox></td>
							<td align="left">
								<asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource3"></asp:Label></td>
							<td align="left" style="width: 227px">
								<asp:TextBox ID="PermanentAddressTextBox" runat="server" Height="50px" ReadOnly="false"
									TextMode="MultiLine" Text='<%# Bind("PermanentAddress") %>' meta:resourcekey="PermanentAddressTextBoxResource3"></asp:TextBox></td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="BusinessAddressTextBox" runat="server" Height="50px" ReadOnly="false"
									TextMode="MultiLine" Text='<%# Bind("BusinessAddress") %>' meta:resourcekey="BusinessAddressTextBoxResource3"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource3"></asp:Label></td>
							<td align="left" style="width: 227px">
								<asp:TextBox ID="DateOfBirthTextBox" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth", "{0:d}") %>' meta:resourcekey="DateOfBirthTextBoxResource3"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource3"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:TextBox ID="QualificationTextBox" ReadOnly="True" runat="server" Text='<%# Bind("Qualification") %>' meta:resourcekey="QualificationTextBoxResource3"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource3"></asp:Label></td>
							<td align="left" style="width: 227px">
								<asp:TextBox ID="ExperienceTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Experience") %>' meta:resourcekey="ExperienceTextBoxResource3"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource3"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:TextBox ID="CasteTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource3"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource3"></asp:Label></td>
							<td align="left" style="width: 227px">
								<asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" ReadOnly="True" Text='<%# Bind("TotalInvestmentAmount") %>' meta:resourcekey="TotalInvestmentAmountTextBoxResource3"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource3"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" TextMode="MultiLine"
									ReadOnly="True" Text='<%# Bind("NameAndAddressOfReferer") %>' meta:resourcekey="NameAndAddressOfRefererTextBoxResource3"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource3"></asp:Label></td>
							<td align="left" style="width: 227px">
								<asp:TextBox ID="txtphone" runat="server" ReadOnly="false" Text='<%# Bind("HomePhone") %>' meta:resourcekey="txtphoneResource3"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblApplicationDate" runat="server" Text="Application Date" meta:resourcekey="lblApplicationDateResource2"></asp:Label>
							</td>
							<td align="left">
								<asp:TextBox ID="txtApplicationDate" runat="server" meta:resourcekey="txtApplicationDateResource2" Width="79%"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtApplicationDate" meta:resourcekey="PopCalendar1Resource1"
                                    To-Date="" To-Today="True" />
							</td>
							<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApplicationDate"
                                    ErrorMessage="Please Enter date">*</asp:RequiredFieldValidator></td>
							<td style="width: 227px">
								<asp:CheckBox ID="chkVerified" runat="server" Text="Verified" meta:resourcekey="chkVerifiedResource2" />
							</td>
						</tr>
						<tr>
							<td align="right" colspan="4">
								<asp:Button ID="UpdateButton" runat="server" CommandName="UpdateAppDate"
									Text="Save" meta:resourcekey="UpdateButtonResource1" />
								<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" meta:resourcekey="UpdateCancelButtonResource1" />
							</td>
						</tr>
					</table>
				</EditItemTemplate>
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td align="left" colspan="6" style="height: 18px">
								<asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Enter License Details" meta:resourcekey="LBlLicenseHeadingResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource1"></asp:Label></td>
							<td align="left">
								<asp:Label ID="ApplnNumberTextBox" runat="server" Text='<%# Bind("ApplnNumber") %>' meta:resourcekey="ApplnNumberTextBoxResource1"></asp:Label>
							</td>
							<td align="left" style="height: 28px">
								<asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource1"></asp:Label></td>
							<td align="left" style="width: 151px; height: 28px">
								<asp:Label ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant") %>' meta:resourcekey="NameOfApplicantTextBoxResource1"></asp:Label></td>
						</tr>
						<tr>
							<td align="left" style="height: 52px">
								<asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource1"></asp:Label></td>
							<td align="left" style="height: 52px">
								<asp:Label ID="PresentAddressTextBox" runat="server" Height="50px" Text='<%# Bind("PresentAddress") %>' meta:resourcekey="PresentAddressTextBoxResource1"></asp:Label></td>
							<td align="left" style="height: 52px">
								<asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource1"></asp:Label></td>
							<td align="left" style="width: 151px; height: 52px;">
								<asp:Label ID="PermanentAddressTextBox" runat="server" Height="50px" Text='<%# Bind("PermanentAddress") %>' meta:resourcekey="PermanentAddressTextBoxResource1"></asp:Label></td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource1"></asp:Label></td>
							<td align="left">
								<asp:Label ID="BusinessAddressTextBox" runat="server" Height="50px" Text='<%# Bind("BusinessAddress") %>' meta:resourcekey="BusinessAddressTextBoxResource1"></asp:Label><br />
							</td>
							<td align="left">
								<asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource1"></asp:Label></td>
							<td align="left">
								<asp:Label ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth") %>' meta:resourcekey="DateOfBirthTextBoxResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource1"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:Label ID="QualificationTextBox" runat="server" Text='<%# Bind("Qualification") %>' meta:resourcekey="QualificationTextBoxResource1"></asp:Label>
							</td>
							<td align="left">
								<asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource1"></asp:Label></td>
							<td align="left">
								<asp:Label ID="ExperienceTextBox" runat="server" Text='<%# Bind("Experience") %>' meta:resourcekey="ExperienceTextBoxResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource1"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:Label ID="CasteTextBox" runat="server" Text='<%# Bind("Caste") %>' meta:resourcekey="CasteTextBoxResource1"></asp:Label>
							</td>
							<td align="left">
								<asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource1"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:Label ID="TotalInvestmentAmountTextBox" runat="server" Text='<%# Bind("TotalInvestmentAmount") %>' meta:resourcekey="TotalInvestmentAmountTextBoxResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource1"></asp:Label></td>
							<td align="left">
								<asp:Label ID="NameAndAddressOfRefererTextBox" runat="server" Text='<%# Bind("NameAndAddressOfReferer") %>' meta:resourcekey="NameAndAddressOfRefererTextBoxResource1"></asp:Label>
							</td>
							<td align="left">
								<asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource1"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:Label ID="txtphone" runat="server" Text='<%# Bind("HomePhone") %>' meta:resourcekey="txtphoneResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td>
								lb
								<asp:Label ID="lblApplicationDate" runat="server" Text="Application Date" meta:resourcekey="lblApplicationDateResource1"></asp:Label>
							</td>
							<td>
								<asp:TextBox ID="txtApplicationDate" runat="server" Text='<%# Bind("ApplicationDate") %>' meta:resourcekey="txtApplicationDateResource1"></asp:TextBox>
							</td>
							<td>
							</td>
							<td>
								<asp:CheckBox ID="chkVerified" runat="server" Text="Verified" meta:resourcekey="chkVerifiedResource1" />
							</td>
						</tr>
						<tr>
							<td align="right" colspan="4">
								<asp:Button ID="InsertButton" runat="server" CommandName="Insert"
									Text="Save" meta:resourcekey="InsertButtonResource1" />
								<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" meta:resourcekey="InsertCancelButtonResource1" />
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
				<ItemTemplate>
					<table width="100%">
                        <tr>
                            <td align="left" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4">
                                <asp:GridView ID="gvRenewVendor" runat="server" DataSourceID="odsLicenseN0" AutoGenerateColumns="False"
				DataKeyNames="LicenseApplicationId" OnSelectedIndexChanged="gvRenewVendor_SelectedIndexChanged" meta:resourcekey="gvRenewVendorResource1">
                                    <Columns>
                                        <asp:BoundField DataField="ApplnNumber" HeaderText="Application No" SortExpression="ApplnNumber" meta:resourcekey="BoundFieldResource1" />
                                        <asp:BoundField DataField="NameOfApplicant" HeaderText="Applicant Name" SortExpression="NameOfApplicant" meta:resourcekey="BoundFieldResource2" />
                                        <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DateOfBirth" meta:resourcekey="BoundFieldResource3" />
                                        <asp:BoundField DataField="IssuedDate" HeaderText="Issue Date" SortExpression="IssuedDate" meta:resourcekey="BoundFieldResource4" />
                                        <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" SortExpression="ExpiryDate" meta:resourcekey="BoundFieldResource5" />
                                        <asp:CommandField SelectText="Update" ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                    </Columns>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="odsLicenseN0" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetDataByLicenseNo" TypeName="IGRSS.BusinessLogicLayer.LicenseMasterBLL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtLicenseNo" Name="LicenseNo" PropertyName="Text"
						Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
						<tr>
							<td align="left" colspan="4" style="height: 18px">
								<asp:Label ID="LBlLicenseHeading" runat="server" SkinID="Heading" Text="Vendors Details" meta:resourcekey="LBlLicenseHeadingResource2"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblappno" runat="server" Text="Application No" meta:resourcekey="lblappnoResource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="ApplnNumberTextBox" runat="server" ReadOnly="True" Text='<%# Bind("ApplnNumber") %>'
									Width="131px" meta:resourcekey="ApplnNumberTextBoxResource2"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lblapname" runat="server" Text="Applicant Name" meta:resourcekey="lblapnameResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="NameOfApplicantTextBox" runat="server" ReadOnly="True" Text='<%# Bind("NameOfApplicant") %>'
									Width="131px" meta:resourcekey="NameOfApplicantTextBoxResource2"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblpresentaddress" runat="server" Text="Present Address" meta:resourcekey="lblpresentaddressResource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="PresentAddressTextBox" runat="server" Height="50px" ReadOnly="True"
									Text='<%# Bind("PresentAddress") %>' TextMode="MultiLine" Width="131px" meta:resourcekey="PresentAddressTextBoxResource2"></asp:TextBox></td>
							<td align="left">
								<asp:Label ID="lblpermanentaddress" runat="server" Text="Permanent Address" meta:resourcekey="lblpermanentaddressResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="PermanentAddressTextBox" runat="server" Height="50px" ReadOnly="True"
									Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" Width="131px" meta:resourcekey="PermanentAddressTextBoxResource2"></asp:TextBox></td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Baddtress" runat="server" Text="Business Address" meta:resourcekey="BaddtressResource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="BusinessAddressTextBox" runat="server" Height="50px" ReadOnly="True"
									Text='<%# Bind("BusinessAddress") %>' TextMode="MultiLine" Width="131px" meta:resourcekey="BusinessAddressTextBoxResource2"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lbldateofbirth" runat="server" Text="Date Of Birth" meta:resourcekey="lbldateofbirthResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="DateOfBirthTextBox" runat="server" ReadOnly="True" Text='<%# Bind("DateOfBirth") %>'
									Width="131px" meta:resourcekey="DateOfBirthTextBoxResource2"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="lblqualification" runat="server" Text="Qualification" meta:resourcekey="lblqualificationResource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="QualificationTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Qualification") %>'
									Width="131px" meta:resourcekey="QualificationTextBoxResource2"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lblexperience" runat="server" Text="Experience" meta:resourcekey="lblexperienceResource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="ExperienceTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Experience") %>'
									Width="131px" meta:resourcekey="ExperienceTextBoxResource2"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Lblcaste" runat="server" Text="Caste" meta:resourcekey="LblcasteResource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="CasteTextBox" runat="server" ReadOnly="True" Text='<%# Bind("Caste") %>'
									Width="131px" meta:resourcekey="CasteTextBoxResource2"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="Label1" runat="server" Text="Investment Amount" meta:resourcekey="Label1Resource2"></asp:Label></td>
							<td align="left">
								<asp:TextBox ID="TotalInvestmentAmountTextBox" runat="server" ReadOnly="True" Text='<%# Bind("TotalInvestmentAmount") %>'
									Width="131px" meta:resourcekey="TotalInvestmentAmountTextBoxResource2"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left">
								<asp:Label ID="Label2" runat="server" Text="Name Of Refer" meta:resourcekey="Label2Resource2"></asp:Label></td>
							<td align="left" style="width: 172px">
								<asp:TextBox ID="NameAndAddressOfRefererTextBox" runat="server" Height="50px" ReadOnly="True"
									Text='<%# Bind("NameAndAddressOfReferer") %>' TextMode="MultiLine" Width="131px" meta:resourcekey="NameAndAddressOfRefererTextBoxResource2"></asp:TextBox>
							</td>
							<td align="left">
								<asp:Label ID="lblpjone" runat="server" Text="Phone" meta:resourcekey="lblpjoneResource2"></asp:Label></td>
							<td align="left" style="width: 151px">
								<asp:TextBox ID="txtphone" runat="server" ReadOnly="True" Text='<%# Bind("HomePhone") %>'
									Width="131px" meta:resourcekey="txtphoneResource2"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td align="left" colspan="4" style="height: 18px">
								<asp:Label ID="LBlLicenseHg" runat="server" SkinID="Heading" Text="Enter License Details" meta:resourcekey="LBlLicenseHgResource1"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 26px">
								<asp:Label ID="lblLicenseNo" runat="server" Text='License No<span style="color: Red;">*</span>' meta:resourcekey="lblLicenseNoResource1"></asp:Label></td>
							<td align="left" style="height: 26px; width: 172px;">
								<asp:TextBox ID="txtLicNo" runat="server" Width="131px" meta:resourcekey="txtLicNoResource1"></asp:TextBox>
								<asp:RequiredFieldValidator ID="reqLicNo" runat="server" ControlToValidate="txtLicNo"
									ErrorMessage="License NO is Must" meta:resourcekey="reqLicNoResource1">*
								</asp:RequiredFieldValidator></td>
							<td align="left" style="height: 26px">
								<asp:Label ID="lblissuedate" runat="server" Text='Issue Date<span style="color: Red;">*</span>' meta:resourcekey="lblissuedateResource1"></asp:Label></td>
							<td align="left" style="height: 26px">
								<asp:TextBox ID="txtIssueDate" runat="server" ReadOnly="True" Width="131px" meta:resourcekey="txtIssueDateResource1"></asp:TextBox>
								<asp:RequiredFieldValidator ID="rfvIssueDate" runat="server" ControlToValidate="txtIssueDate"
									ErrorMessage="Issue Date is Must" meta:resourcekey="rfvIssueDateResource1">*
								</asp:RequiredFieldValidator></td>
							<td align="left">
								<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtIssueDate" meta:resourcekey="PopCalendar1Resource1" />
							</td>
						</tr>
						<tr>
							<td align="left" style="height: 26px">
								<asp:Label ID="lbleffectivedate" runat="server" Text='Valid From<span style="color: Red;">*</span>' meta:resourcekey="lbleffectivedateResource1"></asp:Label></td>
							<td align="left" style="width: 172px; height: 26px;">
								<asp:TextBox ID="txtEffectiveDate" runat="server" ReadOnly="True" Width="131px" meta:resourcekey="txtEffectiveDateResource1"></asp:TextBox>&nbsp;<rjs:PopCalendar
									ID="lslsl" runat="server" Control="txtEffectiveDate" meta:resourcekey="lslslResource1" />
								<asp:RequiredFieldValidator ID="refEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
									ErrorMessage="Effective Date is Must" meta:resourcekey="refEffectiveDateResource1">*
								</asp:RequiredFieldValidator>
							</td>
							<td align="left" style="height: 26px">
								&nbsp;<asp:Label ID="lblexpirydate" runat="server" Text='Valid Till<span style="color: Red;">*</span>' meta:resourcekey="lblexpirydateResource1"></asp:Label></td>
							<td align="left" style="height: 26px">
								<asp:TextBox ID="txtExpiryDate" runat="server" ReadOnly="True" Width="131px" meta:resourcekey="txtExpiryDateResource1"></asp:TextBox></td>
							<asp:RequiredFieldValidator ID="regExpiryDate" runat="server" ControlToValidate="txtExpiryDate"
								ErrorMessage="Expiry Date is Must" meta:resourcekey="regExpiryDateResource1">*
							</asp:RequiredFieldValidator><td align="left" style="height: 26px">
								<rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtExpiryDate" meta:resourcekey="PopCalendar2Resource1" />
							</td>
						</tr>
						<tr>
							<td align="right" colspan="4">
								<asp:Button ID="InsertButton" runat="server" CommandName="RenewVendorLicense"
									Text="Renew" OnClick="InsertButton_Click" meta:resourcekey="InsertButtonResource2" />
								<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="RejectVendorLicense"
									Text="Reject" meta:resourcekey="InsertCancelButtonResource2" />
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
			&nbsp;
			<asp:ObjectDataSource ID="odsGetVendorDetails" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetlicenseAppBylicenseAppID" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication" UpdateMethod="updateVendorsDetail">
				<SelectParameters>
					<asp:ControlParameter ControlID="gvRenewVendor" Name="LicenseApplicationId" PropertyName="SelectedValue"
						Type="Object" />
				</SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Verified" Type="Boolean" />
                    <asp:Parameter Name="AlertId" Type="Object" />
                    <asp:Parameter Name="LicenseApplicationId" Type="Object" />
                    <asp:Parameter Name="rem" Type="Object" />
                </UpdateParameters>
			</asp:ObjectDataSource>
		</asp:View>
	</asp:MultiView>
</asp:Content>
