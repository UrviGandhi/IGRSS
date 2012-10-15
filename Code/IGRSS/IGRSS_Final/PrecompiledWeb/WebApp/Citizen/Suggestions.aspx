<%@ page language="C#" masterpagefile="~/Citizen/Citizen.master" autoeventwireup="true" inherits="Citizen_Suggestions, App_Web_nftpapcz" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblSuggestionsDetails" runat="server" meta:resourcekey="lblOfficeDetails"
					SkinID="SubHeading" Text="Enter Grievance/Suggestions Details "></asp:Label>
			</td>
		</tr>
	</table>
	<asp:FormView ID="fvSuggestionDetails" runat="server" DefaultMode="Insert" DataSourceID="odsCitizen">
		<ItemTemplate>
			<table width="100%">
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblTypeIns" runat="server" meta:resourcekey="lblTypeIns" Text="Type"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlTypeIns" runat="server">
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
					<td class="labelColumn">
						<asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
							Text="Name"></asp:Label>
					</td>
					<td>
						<asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
							Text='<%# Bind("Name") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblApplicantAddressIns" runat="server" meta:resourcekey="lblApplicantAddressIns"
							Text="Address"></asp:Label>
					</td>
					<td colspan="4">
						<asp:TextBox ID="txtApplicantAddressIns" runat="server" meta:resourcekey="txtApplicantAddressIns"
							Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblSuggestionIns" runat="server" meta:resourcekey="lblSuggestionIns"
							Text="Grievance/Suggestions"></asp:Label>
					</td>
					<td colspan="4">
						<asp:TextBox ID="txtSuggestionIns" runat="server" meta:resourcekey="txtSuggestionIns"
							Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
			</table>
		</ItemTemplate>
		<InsertItemTemplate>
			<table width="100%">
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblTypeIns" runat="server" meta:resourcekey="lblTypeIns" Text="Type"></asp:Label>
					</td>
					<td class="textColumn">
						<asp:DropDownList ID="ddlTypeIns" runat="server" SelectedValue='<%# Bind("Type") %>'>
							<asp:ListItem>Grievance</asp:ListItem>
							<asp:ListItem>Suggestions</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td class="validationColumn">
					</td>
					</tr>
					<tr>
					<td class="labelColumn">
						<asp:Label ID="lblApplicantNameIns" runat="server" meta:resourcekey="lblApplicantNameIns"
							Text="Name"></asp:Label>
					</td>
					<td class="textColumn" colspan="4">
						<asp:TextBox ID="txtApplicantNameIns" runat="server" meta:resourcekey="txtApplicantNameIns"
							Text='<%# Bind("Name") %>'></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblApplicantAddressIns" runat="server" meta:resourcekey="lblApplicantAddressIns"
							Text="Address"></asp:Label>
					</td>
					<td class="textColumn" colspan="4">
						<asp:TextBox ID="txtApplicantAddressIns" runat="server" meta:resourcekey="txtApplicantAddressIns"
							Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblPhoneNoIns" runat="server" meta:resourcekey="lblPhoneNoIns" Text="Phone/Mobile"></asp:Label>
					</td>
					<td class="textColumn" >
						<asp:TextBox ID="txtPhoneNoIns" runat="server" meta:resourcekey="txtPhoneNoIns" Text='<%# Bind("PhoneNo") %>'
							></asp:TextBox>
					</td>
					<td class="validationColumn" colspan="4">
					</td>
				</tr>
				<tr>
					<td class="labelColumn">
						<asp:Label ID="lblSuggestionIns" runat="server" meta:resourcekey="lblSuggestionIns"
							Text="Grievance/Suggestions"></asp:Label>
					</td>
					<td class="textColumn" colspan="4">
						<asp:TextBox ID="txtSuggestionIns" runat="server" meta:resourcekey="txtSuggestionIns"
							Text='<%# Bind("Description") %>' TextMode="MultiLine" Height="100px"></asp:TextBox>
					</td>
					<td class="validationColumn">
					</td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<asp:Button ID="Suggestion" runat="server" CausesValidation="True" CommandName="Insert"
							Text="Save" />
						<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="Cancel" />
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
	</asp:FormView>
	<asp:ObjectDataSource ID="odsCitizen" runat="server" InsertMethod="InsertSuggestionsDetails"
		SelectMethod="GetSuggestionsDetails" TypeName="IGRSS.BusinessLogicLayer.Citizen">
		<InsertParameters>
			<asp:Parameter Name="Type" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="PhoneNo" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
</asp:Content>
