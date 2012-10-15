<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Show.aspx.cs" Inherits="Refund_Show" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
					SkinID="SubHeading" Text="Application Details"></asp:Label>
			</td>
		</tr>
	
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
					Text="Receipt Number"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtReceiptNumberIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
					Text='<%# Bind("ReceiptNumber") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
					Text="Adjudication Total Fees"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtAdjudicationTotalFeesIns" runat="server" meta:resourcekey="txtAdjudicationTotalFeesIns"
					Text='<%# Bind("AdjudicationTotalFees") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<asp:Label ID="Label1" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
					SkinID="SubHeading" Text="Application Details"></asp:Label>
			</td>
		</tr>
		
		<tr>
			<td class="labelColumn">
				<asp:Label ID="Label2" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Receipt Number"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="txtReceiptNumberIns"
					Text='<%# Bind("ReceiptNumber") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="Label3" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
					Text="Adjudication Total Fees"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="txtAdjudicationTotalFeesIns"
					Text='<%# Bind("AdjudicationTotalFees") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		
	</table>
</asp:Content>

