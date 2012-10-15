<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_DocumentMaster, App_Web_tbz1y0ii" title="Document Master" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="MvDocumentMaster" runat="server" ActiveViewIndex="0">
	
	
		<asp:View ID="View2" runat="server">
		
			<asp:GridView ID="GvDocumentMasters" runat="server" AutoGenerateColumns="false" DataKeyNames="DocumentTypeId">
			</asp:GridView>
		
		
		</asp:View>
	
	
	
		<asp:View ID="View1" runat="server">
			<asp:FormView ID="FvDocumentMaster" runat="server" DefaultMode="Insert">
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblDocumentMasterHeadingsIns" runat="server" meta:resourcekey="lblDocumentMasterHeadingsIns"
									SkinID="SubHeading" Text="Document Master"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" Text='<%# Bind("Name") %>'>
								</asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqFldName" runat="server" ControlToValidate="txtNameIns"
									ErrorMessage="Name Can't be Blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegexpFldName" runat="server" ControlToValidate="txtNameIns"
									ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
							
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
									Text="Description"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDescriptionIns" runat="server" meta:resourcekey="txtDescriptionIns"
									Text='<%# Bind("Description") %>'>
								</asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="ReqfldtxtDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
									ErrorMessage="Description Can't be Blank">*</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDescriptionIns"
									ErrorMessage="Enter Valid Description" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>">*</asp:RegularExpressionValidator>
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
								<asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Insert" />
								<asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
							</td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
			</asp:FormView>
		</asp:View>
	</asp:MultiView><br />
	<asp:ObjectDataSource ID="odsDocumentMaster" runat="server"></asp:ObjectDataSource>
	
</asp:Content>
