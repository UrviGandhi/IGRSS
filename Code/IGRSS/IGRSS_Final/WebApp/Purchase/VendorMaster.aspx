<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="VendorMaster.aspx.cs" Inherits="Purchase_VendorMaster" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<asp:FormView ID="FvvendorMaster" runat="server" DataSourceID="OdsVendorMaster" DefaultMode="Insert" OnItemInserting="FvvendorMaster_ItemInserting" meta:resourcekey="FvvendorMasterResource1" >
	
	<InsertItemTemplate>
	
		<table width="100%">
			<tr>
				<td colspan="6">
					<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
						SkinID="SubHeading" Text="Vendor Master"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
						Text="VendorType"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="txtReceiptNumberIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
						Text='<%# Bind("VendorType") %>'></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
				<td class="labelColumn">
					<asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
						Text="CompanyName"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="txtAdjudicationTotalFeesIns" runat="server" meta:resourcekey="txtAdjudicationTotalFeesIns"
						Text='<%# Bind("CompanyName") %>'></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="VendorName"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="txtReceiptNumberIns"
						Text='<%# Bind("VendorName") %>'></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
				<td class="labelColumn">
					<asp:Label ID="Label2" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
						Text="Address"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="txtAdjudicationTotalFeesIns"
						Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
			</tr>
			<tr>
				<td class="labelColumn">
					<asp:Label ID="Label3" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Phone"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="txtReceiptNumberIns"
						Text='<%# Bind("Phone") %>'></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
				<td class="labelColumn">
					<asp:Label ID="Label4" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
						Text="ContactPerson"></asp:Label>
				</td>
				<td class="textColumn">
					<asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="txtAdjudicationTotalFeesIns"
						Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
				</td>
				<td class="validationColumn">
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
					<asp:Button ID="btnVendorMasterIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnVendorMasterInsResource1" />
				</td>
				<td>
				</td>
			</tr>
		</table>
	
	
	
	</InsertItemTemplate>
	
	
	
	
	</asp:FormView>








	<br />
	<asp:ObjectDataSource ID="OdsVendorMaster" runat="server" OnInserting="OdsVendorMaster_Inserting" InsertMethod="InsertVendorMaster" SelectMethod="GetVendorMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster" OldValuesParameterFormatString="original_{0}">
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
	</asp:ObjectDataSource>
	<br />
	<br />

</asp:Content>

