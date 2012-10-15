<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Leave_Leave, App_Web_vi1f4uxd" title="Leave Application Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="mvLeave" runat="server" ActiveViewIndex="0">
		<asp:View ID="viewSearch" runat="server">
			<table id="TABLE1" width="100%">
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblEmpName" runat="server" Text="Employee Name" meta:resourcekey="lblEmpNameResource1"></asp:Label></td>
					<td class="textColumn">
						<asp:TextBox ID="txtEmpName" runat="server" meta:resourcekey="txtEmpName"></asp:TextBox></td>
					<td class="labelColumn">
						<asp:Label ID="lblEmpNo" runat="server" Text="Employee No" meta:resourcekey="lblEmpNoResource1"></asp:Label></td>
					<td  class="textColumn">
						<asp:TextBox ID="txtEmpNo" runat="server" meta:resourcekey="txtEmpNo"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<asp:Button ID="btnSearchEmpDetails" runat="server" Text="Search" OnClick="btnSearchEmpDetails_Click" meta:resourcekey="btnSearchEmpDetailsResource1" />
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<asp:GridView ID="gvLeaveDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="LeaveRegID"
							OnSelectedIndexChanged="gvLeaveDetails_SelectedIndexChanged" meta:resourcekey="gvLeaveDetailsResource1">
							<Columns>
								<asp:BoundField DataField="LeaveFrom" DataFormatString="{0:dd-MMM-yy}" HeaderText="Leave From"
									SortExpression="LeaveFrom" HtmlEncode="False" meta:resourcekey="BoundFieldResource1" />
								<asp:BoundField DataField="LeaveTo" DataFormatString="{0:dd-MMM-yy}" HeaderText="Leave To"
									HtmlEncode="False" SortExpression="LeaveTo" meta:resourcekey="BoundFieldResource2" />
								<asp:BoundField DataField="WorkingDays"  HeaderText="No Of Working Days"
									HtmlEncode="False" SortExpression="WorkingDays" meta:resourcekey="BoundFieldResource3" />
								<asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" meta:resourcekey="BoundFieldResource4" />
								<asp:CommandField ShowSelectButton="True" SelectText="Update" meta:resourcekey="CommandFieldResource1" />
							</Columns>
						</asp:GridView>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="viewLeaveDetails" runat="server">
			<asp:FormView ID="fvLeave" runat="server" DataSourceID="odsLeave" OnItemInserting="fvLeave_ItemInserting"
				OnItemUpdating="fvLeave_ItemUpdating" DataKeyNames="LeaveRegID" DefaultMode="Edit" meta:resourcekey="fvLeaveResource1">
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblLeaveDetailsHeaderIns" runat="server" meta:resourcekey="lblLeaveDetailsHeaderIns"
									SkinID="SubHeading" Text="Leave Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblEmployeeNameIns" runat="server" meta:resourcekey="lblEmployeeNameIns"
									Text="Employee Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlEmployeeNameIns" runat="server" meta:resourcekey="ddlEmployeeNameIns"
									SelectedValue='<%# Bind("EmployeeID") %>' Text='<%# Bind("EmployeeID") %>' DataSourceID="odsGetEmployee"
									DataTextField="FirstName" DataValueField="EmployeeID">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblApplicationDateIns" runat="server" meta:resourcekey="lblApplicationDateIns"
									Text="Application Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtApplicationDateIns" runat="server" meta:resourcekey="txtApplicationDateIns"
									Text='<%# Bind("ApplnDate", "{0:d}") %>' ReadOnly="True" SkinID="Calendar"></asp:TextBox>
								<rjs:PopCalendar ID="calInwardDateItm" runat="server" Control="txtApplicationDateIns"
									meta:resourcekey="calInwardDateItm" Move="True" />
							</td>
							
							<td class="validationColumn">
							<asp:RequiredFieldValidator ID="rfvAppDate" runat="server" ControlToValidate="txtApplicationDateIns" ErrorMessage="Please Enter Application Date">
							*</asp:RequiredFieldValidator></td>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblLeaveTypeIns" runat="server" meta:resourcekey="lblLeaveTypeIns"
										Text="Leave Type"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlLeaveTypeIns" runat="server" meta:resourcekey="ddlLeaveTypeIns"
										SelectedValue='<%# Bind("LeaveType") %>' Text='<%# Bind("LeaveType") %>' DataSourceID="XmlLeaveType"
										DataTextField="Key" DataValueField="value">
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
								<td class="labelColumn">
									<asp:Label ID="lblLeaveFromIns" runat="server" meta:resourcekey="lblLeaveFromIns"
										Text="Leave From"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtLeaveFromIns" runat="server" meta:resourcekey="txtLeaveFromIns"
										Text='<%# Bind("LeaveFrom", "{0:d}") %>' ReadOnly="True" SkinID="Calendar"></asp:TextBox>
									<rjs:PopCalendar ID="cab" runat="server" Control="txtLeaveFromIns" meta:resourcekey="calInwardDateItm"
										Move="True" />
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="regLeaveFromIns" runat="server" ControlToValidate="txtLeaveFromIns"
										ErrorMessage="Please Enter Leave From Field">
							*</asp:RequiredFieldValidator>
									
								</td>
							</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveToIns" runat="server" meta:resourcekey="lblLeaveToIns" Text="Leave To"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveToIns" runat="server" meta:resourcekey="txtLeaveToIns" Text='<%# Bind("LeaveTo", "{0:d}") %>'
									ReadOnly="True" SkinID="Calendar"></asp:TextBox><rjs:PopCalendar ID="cabdd" runat="server" Control="txtLeaveToIns"
										meta:resourcekey="calInwardDateItm" Move="True" />
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="regLeaveToins" runat="server" ControlToValidate="txtLeaveToIns"
									ErrorMessage="Please Enter Leave To Field">
							*</asp:RequiredFieldValidator>
								
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblWorkingDaysIns" runat="server" meta:resourcekey="lblWorkingDaysIns"
									Text="No Of Working Days"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtWorkingDaysIns" runat="server" meta:resourcekey="txtWorkingDaysIns"
									Text='<%# Bind("WorkingDays") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkingDaysIns" ErrorMessage="Please Enter No of Working Day's" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="regexpNoOfDays" runat="server" ControlToValidate="txtWorkingDaysIns"
									ValidationExpression="\d*" meta:resourcekey="regexpNoOfDaysResource1">*</asp:RegularExpressionValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblJoiningIns" runat="server" meta:resourcekey="lblJoiningIns" Text="Resume Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtJoiningIns" runat="server" meta:resourcekey="txtJoiningIns" Text='<%# Bind("ResumedDutyOn", "{0:d}") %>'
									ReadOnly="True" SkinID="Calendar"></asp:TextBox>
								<rjs:PopCalendar ID="pcJoiningDateins" runat="server" Control="txtJoiningIns" meta:resourcekey="pcJoiningDateins"
									Move="True" />
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="regJoingIns" runat="server" ControlToValidate="txtJoiningIns"
									ErrorMessage="Please Enter Resume Date">
							*</asp:RequiredFieldValidator>
								
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblReasonIns" runat="server" meta:resourcekey="lblReasonIns" Text="Reason"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtReasonIns" TextMode="MultiLine" runat="server" meta:resourcekey="txtReasonIns"
									Text='<%# Bind("Reason") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReasonIns" meta:resourcekey="rfvReasonResource1">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblrulesIns" runat="server" meta:resourcekey="lblrulesIns" Text="Rules"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtrulesIns" runat="server" TextMode="MultiLine" meta:resourcekey="txtrulesIns"
									Text='<%# Bind("ApplicableRules") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnTelephoneInsertIns" runat="server" CommandName="Insert"
									Text="Save" meta:resourcekey="btnTelephoneInsertInsResource1" />
								<asp:Button ID="btnTelephoneCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" meta:resourcekey="btnTelephoneCancelInsResource1" />
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblLeaveDetailsHeaderUpd" runat="server" meta:resourcekey="lblLeaveDetailsHeaderUpd"
									SkinID="SubHeading" Text="Leave Details"></asp:Label>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblEmployeeNameUpd" runat="server" meta:resourcekey="lblEmployeeNameUpd"
									Text="Employee Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlEmployeeNameUpd" runat="server" meta:resourcekey="ddlEmployeeNameUpd"
									SelectedValue='<%# Bind("EmployeeID") %>' Text='<%# Bind("EmployeeID") %>' DataSourceID="odsGetEmployee"
									DataTextField="FirstName" DataValueField="EmployeeID">
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblApplicationDateUpd" runat="server" meta:resourcekey="lblApplicationDateUpd"
									Text="Application Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtApplicationDateUpd" runat="server" meta:resourcekey="txtApplicationDateUpd"
									Text='<%# Bind("ApplnDate", "{0:d}") %>' OnTextChanged="txtApplicationDateUpd_TextChanged"
									OnDataBinding="txtApplicationDateUpd_DataBinding" ReadOnly="True"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<rjs:PopCalendar ID="calInwardDateItm" runat="server" meta:resourcekey="calInwardDateItm"
									Move="True" Control="txtApplicationDateUpd" />
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveTypeUpd" runat="server" meta:resourcekey="lblLeaveTypeUpd"
									Text="Leave Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlLeaveTypeUpd" runat="server" meta:resourcekey="ddlLeaveTypeUpd"
									DataSourceID="XmlLeaveType" DataTextField="Key" DataValueField="value" SelectedValue='<%# Bind("LeaveType") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveFromUpd" runat="server" meta:resourcekey="lblLeaveFromUpd"
									Text="Leave From"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveFromUpd" runat="server" meta:resourcekey="txtLeaveFromUpd"
									Text='<%# Bind("LeaveFrom", "{0:d}") %>' OnTextChanged="txtLeaveFromUpd_TextChanged" OnDataBinding="txtLeaveFromUpd_DataBinding"
									ReadOnly="True"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<rjs:PopCalendar ID="cab" runat="server" meta:resourcekey="calInwardDateItm" Move="True" Control="txtLeaveFromUpd" />
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveToUpd" runat="server" meta:resourcekey="lblLeaveToUpd" Text="Leave To"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveToUpd" runat="server" meta:resourcekey="txtLeaveToUpd" Text='<%# Bind("LeaveTo", "{0:d}") %>'
									OnDataBinding="txtLeaveToUpd_DataBinding" ReadOnly="True"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<rjs:PopCalendar ID="cabdd" runat="server" meta:resourcekey="calInwardDateItm" Move="True" Control="txtLeaveToUpd" />
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblWorkingDaysUpd" runat="server" meta:resourcekey="lblWorkingDaysUpd"
									Text="No Of Working Days"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtWorkingDaysUpd" runat="server" meta:resourcekey="txtWorkingDaysUpd"
									Text='<%# Bind("WorkingDays") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblJoiningUpd" runat="server" meta:resourcekey="lblJoiningUpd" Text="Joining Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtJoiningUpd" runat="server" meta:resourcekey="txtJoiningUpd" Text='<%# Bind("ResumedDutyOn", "{0:d}") %>'
									OnTextChanged="txtJoiningUpd_TextChanged" OnDataBinding="txtJoiningUpd_DataBinding"
									ReadOnly="True"></asp:TextBox>
							</td>
							<td class="validationColumn">
								<rjs:PopCalendar ID="pcJoiningDateUpd" runat="server" meta:resourcekey="pcJoiningDateUpd"
									Move="True" Control="txtJoiningUpd" />
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblReasonUpd" runat="server" meta:resourcekey="lblReasonUpd" Text="Reason"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtReasonUpd" runat="server" meta:resourcekey="txtReasonUpd" Text='<%# Bind("Reason") %>'
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblrulesUpd" runat="server" meta:resourcekey="lblrulesUpd" Text="Rules"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtrulesUpd" runat="server" meta:resourcekey="txtrulesUpd" Text='<%# Bind("ApplicableRules") %>'
									TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnLeaveInsertIns" runat="server" CommandName="Update"
									Text="Update" meta:resourcekey="btnLeaveInsertInsResource1" />
								<asp:Button ID="btnLeaveCancelIns" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" meta:resourcekey="btnLeaveCancelInsResource1" />
							</td>
						</tr>
					</table>
				</EditItemTemplate>
				<ItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblLeaveDetailsHeaderItm" runat="server" meta:resourcekey="lblLeaveDetailsHeaderItm"
									SkinID="SubHeading" Text="Leave Details"></asp:Label>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblEmployeeNameItm" runat="server" meta:resourcekey="lblEmployeeNameItm"
									Text="Employee Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtEmployeeNameItm" ReadOnly="True" runat="server" meta:resourcekey="txtEmployeeNameItm"
									Text='<%# Bind("EmpName") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblApplicationDateItm" runat="server" meta:resourcekey="lblApplicationDateItm"
									Text="Application Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtApplicationDateItm" runat="server" meta:resourcekey="txtApplicationDateItm"
									ReadOnly="True" Text='<%# Bind("ApplnDate") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveTypeItm" runat="server" meta:resourcekey="lblLeaveTypeItm"
									Text="Leave Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveTypeItm" runat="server" meta:resourcekey="txtLeaveTypeItm"
									ReadOnly="True" Text='<%# Bind("LeaveType") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveFromItm" runat="server" meta:resourcekey="lblLeaveFromItm"
									Text="Leave From"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveFromItm" runat="server" meta:resourcekey="txtLeaveFromItm"
									ReadOnly="True" Text='<%# Bind("LeaveFrom") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveToItm" runat="server" meta:resourcekey="lblLeaveToItm" Text="Leave To"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveToItm" runat="server" meta:resourcekey="txtLeaveToItm" ReadOnly="True"
									Text='<%# Bind("LeaveTo") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblWorkingDaysItm" runat="server" meta:resourcekey="lblWorkingDaysItm"
									Text="No Of Working Days"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtWorkingDaysItm" runat="server" meta:resourcekey="txtWorkingDaysItm"
									ReadOnly="True" Text='<%# Bind("WorkingDays") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblJoiningItm" runat="server" meta:resourcekey="lblJoiningItm" Text="Joining Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtJoiningItm" runat="server" meta:resourcekey="txtJoiningItm" Text='<%# Bind("ResumedDutyOn") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblReasonItm" runat="server" meta:resourcekey="lblReasonItm" Text="Reason"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtReasonItm" runat="server" meta:resourcekey="txtReasonItm" ReadOnly="True"
									Text='<%# Bind("Reason") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblrulesItm" runat="server" meta:resourcekey="lblrulesItm" Text="Rules"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtrulesItm" runat="server" meta:resourcekey="txtrulesItm" ReadOnly="True"
									Text='<%# Bind("ApplicableRules") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
		</asp:View>
		<asp:View ID="viewReadonly" runat="server">
			<asp:FormView ID="fvreadonly" runat="server" DataKeyNames="LeaveRegID" DataSourceID="odsLeave" meta:resourcekey="fvreadonlyResource1">
				<ItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblLeaveDetailsHeaderItm" runat="server" meta:resourcekey="lblLeaveDetailsHeaderItm"
									SkinID="SubHeading" Text="Leave Details"></asp:Label>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblEmployeeNameItm" runat="server" meta:resourcekey="lblEmployeeNameItm"
									Text="Employee Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtEmployeeNameItm" runat="server" meta:resourcekey="txtEmployeeNameItm"
									ReadOnly="True" Text='<%# Bind("EmpName") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblApplicationDateItm" runat="server" meta:resourcekey="lblApplicationDateItm"
									Text="Application Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtApplicationDateItm" runat="server" meta:resourcekey="txtApplicationDateItm"
									ReadOnly="True" Text='<%# Bind("ApplnDate") %>' OnDataBinding="txtApplicationDateItm_DataBinding" OnTextChanged="txtApplicationDateItm_TextChanged"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveTypeItm" runat="server" meta:resourcekey="lblLeaveTypeItm"
									Text="Leave Type"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlLeaveTypeItm" runat="server" DataSourceID="XmlLeaveType"
									DataTextField="Key" DataValueField="value" meta:resourcekey="ddlLeaveTypeItm" Enabled="False" SelectedValue='<%# Bind("LeaveType") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveFromItm" runat="server" meta:resourcekey="lblLeaveFromItm"
									Text="Leave From"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveFromItm" runat="server" meta:resourcekey="txtLeaveFromItm"
									ReadOnly="True" Text='<%# Bind("LeaveFrom") %>' OnDataBinding="txtLeaveFromItm_DataBinding"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblLeaveToItm" runat="server" meta:resourcekey="lblLeaveToItm" Text="Leave To"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtLeaveToItm" runat="server" meta:resourcekey="txtLeaveToItm" ReadOnly="True"
									Text='<%# Bind("LeaveTo") %>' OnDataBinding="txtLeaveToItm_DataBinding"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblWorkingDaysItm" runat="server" meta:resourcekey="lblWorkingDaysItm"
									Text="No Of Working Days"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtWorkingDaysItm" runat="server" meta:resourcekey="txtWorkingDaysItm"
									ReadOnly="True" Text='<%# Bind("WorkingDays") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblJoiningItm" runat="server" meta:resourcekey="lblJoiningItm" Text="Joining Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtJoiningItm" runat="server" meta:resourcekey="txtJoiningItm" Text='<%# Bind("ResumedDutyOn") %>' OnDataBinding="txtJoiningItm_DataBinding" ReadOnly="True"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblReasonItm" runat="server" meta:resourcekey="lblReasonItm" Text="Reason"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtReasonItm" runat="server" meta:resourcekey="txtReasonItm" ReadOnly="True"
									Text='<%# Bind("Reason") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblrulesItm" runat="server" meta:resourcekey="lblrulesItm" Text="Rules"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtrulesItm" runat="server" meta:resourcekey="txtrulesItm" ReadOnly="True"
									Text='<%# Bind("ApplicableRules") %>' TextMode="MultiLine"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:Label ID="lblOtherDetails" runat="server" meta:resourcekey="lblOtherDetails"
									SkinID="SubHeading" Text="Other Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblCreatedBy" runat="server" Text="Created By" meta:resourcekey="lblCreatedByResource1"></asp:Label></td>
							<td>
								<asp:TextBox ID="txtCreatedBy" runat="server" Text='<%# Bind("CreatedBy") %>' ReadOnly="True" meta:resourcekey="txtCreatedByResource1"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblCreatedAt" runat="server" Text="Created At" meta:resourcekey="lblCreatedAtResource1"></asp:Label></td>
							<td>
								<asp:TextBox ID="txtCreatedAt" runat="server" Text='<%# Bind("CreatedAt") %>' OnDataBinding="txtCreatedAt_DataBinding" ReadOnly="True" meta:resourcekey="txtCreatedAtResource1"></asp:TextBox></td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblModifiedBy" runat="server" Text="Modified By" meta:resourcekey="lblModifiedByResource1"></asp:Label></td>
							<td>
								<asp:TextBox ID="txtModifiedBy" runat="server" Text='<%# Bind("ModifiedBy") %>' ReadOnly="True" meta:resourcekey="txtModifiedByResource1"></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblModifiedAt" runat="server" Text="Modified Time" meta:resourcekey="lblModifiedAtResource1"></asp:Label></td>
							<td>
								<asp:TextBox ID="txtModifiedAt" runat="server" Text='<%# Bind("ModifiedAt") %>' OnDataBinding="txtModifiedAt_DataBinding" ReadOnly="True" meta:resourcekey="txtModifiedAtResource1"></asp:TextBox></td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</ItemTemplate>
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
	<asp:ObjectDataSource ID="odsgv" runat="server"
		InsertMethod="AddLeaveDetails"
		SelectMethod="GetLeavedetailsByEmpId" TypeName="IGRSS.BusinessLogicLayer.Leave">
	</asp:ObjectDataSource>
	<asp:ObjectDataSource ID="odsLeave" runat="server" SelectMethod="GetLeavedetailsByLeaveRegID"
		TypeName="IGRSS.BusinessLogicLayer.Leave" UpdateMethod="UpdateLeaveDetails" InsertMethod="AddLeaveDetails" OnUpdating="odsLeave_Updating" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" OldValuesParameterFormatString="original_{0}">
		<SelectParameters>
			<asp:ControlParameter ControlID="gvLeaveDetails" Name="LeaveRegID" PropertyName="SelectedValue"
				Type="Object" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="LeaveRegID" Type="Object" />
		</UpdateParameters>
	</asp:ObjectDataSource>
	<asp:XmlDataSource ID="XmlLeaveType" runat="server" DataFile="~/Leave/LeaveType.xml">
	</asp:XmlDataSource>
</asp:Content>
