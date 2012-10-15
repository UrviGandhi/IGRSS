<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="TestCheckList.aspx.cs" Inherits="Inspection_TestCheckList" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	&nbsp;
	<asp:Button ID="btnSetControls" runat="server" Text="Get" OnClick="btnSetControls_Click" />
	<asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click" /><br />
	<br />
	<asp:ObjectDataSource ID="odsTest" runat="server" InsertMethod="SetXmlData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetXmlData" TypeName="IGRSS.BusinessLogicLayer.InspectionCheckList">
		<InsertParameters>
			<asp:Parameter Name="Values" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
</asp:Content>
