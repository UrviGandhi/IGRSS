<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="InspectionDetailReports.aspx.cs" Inherits="Inspection_InspectionDetailReports"
	Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="MvinspectionDetailsReport" runat="server" ActiveViewIndex="0">
		<asp:View ID="View1" runat="server">
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
							SkinID="SubHeading" Text="Inspection Details Report"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
							Text="Office Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlOfficeName" runat="server" DataSourceID="OdsOfficeMaster"
							DataTextField="OfficeName" DataValueField="OfficeId" Width="180px">
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
							Text="Employee Name"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlEmployeeName" runat="server" DataSourceID="odsEmployeeMaster"
							DataTextField="FirstName" DataValueField="EmployeeID" Width="180px">
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblApplicantAddress" runat="server" meta:resourcekey="lblApplicantAddress"
							Text="Contents"></asp:Label>
					</td>
					<td colspan="4" style="width: 25%">
						<asp:TextBox ID="txtContent" runat="server" meta:resourcekey="txtContent" TextMode="MultiLine"></asp:TextBox>
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
						<asp:Button ID="btnGet" runat="server" Text="Report" OnClick="btnGet_Click" />
					</td>
					<td class="validationColumn">
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="View2" runat="server">
		
		
			<table width="100%">
				<tr>
					<td colspan="6">
						<asp:Label ID="Label1" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
							SkinID="SubHeading" Text="Memo Action Taken"></asp:Label>
					</td>
				</tr>
				
				
				<tr>
					<td class="labelColumn">
						<asp:Label ID="Label4" runat="server" meta:resourcekey="lblApplicantAddress" Text="Memo Actions"></asp:Label>
					</td>
					<td colspan="4" style="width: 25%">
						<asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="txtContent" TextMode="MultiLine"></asp:TextBox>
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
						<asp:Button ID="Button1" runat="server"  Text="Memo Action " Width="105px" />
					</td>
					<td class="validationColumn">
					</td>
				</tr>
			</table>
		
		</asp:View>
		
	</asp:MultiView>
	
	
	<asp:ObjectDataSource ID="odsEmployeeMaster" runat="server" DataObjectTypeName="System.Guid"
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
	<asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
		<InsertParameters>
			<asp:Parameter Name="OfficeId" Type="Object" />
			<asp:Parameter Name="OfficeName" Type="String" />
			<asp:Parameter Name="OfficeTypeId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	
	<asp:GridView ID="GvInspectionDemo" runat="server" AutoGenerateColumns="False" DataSourceID="odsInspectionMemo" OnSelectedIndexChanged="GvInspectionDemo_SelectedIndexChanged">
	
	<Columns>
	
	<asp:BoundField DataField="InspectionId" HeaderText="InspectionId"/>
	<asp:BoundField DataField="InspectionMemoId" HeaderText="InspectionMemoId" />
	
	<asp:CommandField ShowSelectButton="True" />
	
	</Columns>
	
	</asp:GridView>
	
	<asp:ObjectDataSource ID="odsInspectionMemo" runat="server" InsertMethod="AddNewInspectionIternary" OldValuesParameterFormatString="original_{0}" SelectMethod="GetInspectionMemo" TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionItenary">
		<UpdateParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ItenaryId" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="ScheduleId" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>

</asp:Content>
