<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="RegistrationNotice.aspx.cs" Inherits="Registration_RegistrationNotice"
	Title="Untitled Page" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblRegistrationNotice" runat="server" meta:resourcekey="lblRegistrationNotice"
					SkinID="SubHeading" Text="Registration Notice"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDate" Text="Date"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtDateIns" runat="server" meta:resourcekey="txtDateIns" SkinID="Calendar"></asp:TextBox>
				<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDateIns" />
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
					Text="Notice To"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlEmployeeNameIns" runat="server" DataSourceID="odsEmployee"
					DataTextField="FirstName" DataValueField="EmployeeID">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Subject"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="txtReceiptNumberIns"></asp:TextBox>
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
			<td class="labelColumn">
				<asp:Label ID="lblApplicantAddress" runat="server" meta:resourcekey="lblApplicantAddress"
					Text="Body"></asp:Label>
			</td>
			<td colspan="4" style="width: 25%">
				<asp:TextBox ID="txtApplicantAddress" runat="server" meta:resourcekey="txtApplicantAddress"
					TextMode="multiline"></asp:TextBox>
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
				<asp:Button ID="btnRegistrationNotice" runat="server" Text="Report" OnClick="btnRegistrationNotice_Click" />
			</td>
			<td class="validationColumn">
			</td>
		</tr>
	</table>
	<asp:ObjectDataSource ID="odsEmployee" runat="server" DataObjectTypeName="System.Guid"
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
</asp:Content>
