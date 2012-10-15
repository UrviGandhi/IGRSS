<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Inward_Outward_PostalStampRequest, App_Web_b0gavear" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:MultiView ID="mvPostalStampRequest" runat="server" ActiveViewIndex="1">
		<asp:View ID="vieGv" runat="server">
			<table width="100%">
            <tr>
             <td align="left" class="labelColumn">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" class="textColumn">
                        <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" OnTextChanged="txtFileNo_TextChanged"
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
                            </td>
                            </tr>
				<tr>
					<td colspan="6">
						<asp:Label ID="lblAllPostalStampRequestHeaderIns" runat="server" meta:resourcekey="lblAllPostalStampRequestHeaderIns"
							SkinID="SubHeading" Text="Postal Stamp Request Details"></asp:Label>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<asp:GridView ID="gvPostalStampReqDetails" runat="server" AutoGenerateColumns="False"
							DataKeyNames="PurRequestId" DataSourceID="odsGv" OnSelectedIndexChanged="gvPostalStampReqDetails_SelectedIndexChanged">
							<Columns>
								<asp:BoundField DataField="OfficeName" HeaderText="Requested Office Name" SortExpression="OfficeName" />
								<asp:BoundField DataField="RequestDate" HeaderText="Requested Date" SortExpression="RequestDate" />
								<asp:BoundField DataField="TotalValue" HeaderText="Total Value" SortExpression="TotalValue" />
								<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
								<asp:CommandField ShowSelectButton="True" />
							</Columns>
						</asp:GridView>
                        </td>
				</tr>
			</table>
		</asp:View>
       
        
        <asp:View ID="vieFv" runat="server">
			<asp:Button ID="Button_new" runat="server" onclick="Button_new_Click" 
                Text="New" style="height: 26px" />
			<asp:FormView ID="fvStampRequest" runat="server" DefaultMode="Insert" DataSourceID="odsPostalReqDetails"
				OnItemInserting="fvStampRequest_ItemInserting" OnItemUpdating="fvStampRequest_ItemUpdating" DataKeyNames="PurRequestId">
				<InsertItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampRequestIns" runat="server" meta:resourcekey="lblPostalStampRequestIns"
									SkinID="SubHeading" Text="Postal Stamp Request Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
									Text="Office Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlOfficeNameIns" runat="server" meta:resourcekey="ddlOfficeNameIns"
									DataSourceID="odsGetOffices" DataTextField="OfficeName" DataValueField="OfficeId"
									SelectedValue='<%# Bind("OfficeId") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblDateIns" runat="server" meta:resourcekey="lblDateIns" Text="Request Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDateIns" runat="server" meta:resourcekey="txtDateIns" Text='<%# Bind("RequestDate") %>'
									SkinID="Calendar"></asp:TextBox>
								<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDateIns" Format="dd mm yyyy">
								</rjs:PopCalendar>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="RfvDateIns" runat="server" ControlToValidate="txtDateIns">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblValueIns" runat="server" meta:resourcekey="lblValueIns" Text="Total Value"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtValueIns" runat="server" meta:resourcekey="txtValueIns" Text='<%# Bind("TotalValue") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="rfvValueIns" runat="server" ControlToValidate="txtValueIns">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnInsertIns" runat="server" CommandName="Insert" meta:resourcekey="btnInsertIns"
									Text="Save" />
								<asp:Button ID="btnCancelIns" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelIns"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
				<EditItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampRequestUpd" runat="server" meta:resourcekey="lblPostalStampRequestUpd"
									SkinID="SubHeading" Text="Postal Stamp Request Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblOfficeNameUpd" runat="server" meta:resourcekey="lblOfficeNameUpd"
									Text="Office Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:DropDownList ID="ddlOfficeNameUpd" runat="server" meta:resourcekey="ddlOfficeNameUpd"
									DataSourceID="odsGetOffices" DataTextField="OfficeName" DataValueField="OfficeId"
									SelectedValue='<%# Bind("OfficeId") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblDateUpd" runat="server" meta:resourcekey="lblDateUpd" Text="Request Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDateUpd" runat="server" meta:resourcekey="txtDateUpd" Text='<%# Bind("RequestDate") %>'
									SkinID="Calendar"></asp:TextBox>
								<rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDateUpd" Format="dd mm yyyy" />
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="RfvDateUpd" runat="server" ControlToValidate="txtDateUpd">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblValueUpd" runat="server" meta:resourcekey="lblValueUpd" Text="Total Value"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtValueUpd" runat="server" meta:resourcekey="txtValueUpd" Text='<%# Bind("TotalValue") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
								<asp:RequiredFieldValidator ID="rfvValueUpd" runat="server" ControlToValidate="txtValueUpd">*</asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="btnUpdateUpd" runat="server" CommandName="Update" meta:resourcekey="btnUpdateUpd"
									Text="Update" />
								<asp:Button ID="btnCancelUpd" runat="server" CommandName="Cancel" meta:resourcekey="btnCancelUpd"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</EditItemTemplate>
				<ItemTemplate>
					<table width="100%">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblPostalStampRequestItm" runat="server" meta:resourcekey="lblPostalStampRequestItm"
									SkinID="SubHeading" Text="Postal Stamp Request Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblOfficeNameItm" runat="server" meta:resourcekey="lblOfficeNameItm"
									Text="Office Name"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="OfficeNameItm" runat="server" meta:resourcekey="ddlOfficeNameItm"
									ReadOnly="true" Text='<%# Bind("OfficeName") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
							<td class="labelColumn">
								<asp:Label ID="lblDateItm" runat="server" meta:resourcekey="lblDateItm" Text="Request Date"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtDateItm" runat="server" meta:resourcekey="txtDateItm" ReadOnly="true"
									Text='<%# Bind("RequestDate") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td class="labelColumn">
								<asp:Label ID="lblValueItm" runat="server" meta:resourcekey="lblValueItm" Text="Total Value"></asp:Label>
							</td>
							<td class="textColumn" colspan="4">
								<asp:TextBox ID="txtValueItm" runat="server" meta:resourcekey="txtValueItm" ReadOnly="true"
									Text='<%# Bind("TotalValue") %>'></asp:TextBox>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:FormView>
			&nbsp;
			<asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
				DeleteMethod="DeActivateOffice" InsertMethod="AddNewOfficeType" OldValuesParameterFormatString="{0}"
				SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.OfficeManagement">
				<InsertParameters>
					<asp:Parameter Name="OfficeTypeName" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
				</InsertParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsGv" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetAllPostalStampRequestDetails" TypeName="IGRSS.BusinessLogicLayer.InwardOutward" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" InsertMethod="AddPostalStampRequestDetails" UpdateMethod="UpdatePostalStampRequestDetails">
				<UpdateParameters>
					<asp:Parameter Name="Parameter" Type="Object" />
					<asp:Parameter Name="PurRequestId" Type="Object" />
				</UpdateParameters>
			</asp:ObjectDataSource>
			<asp:ObjectDataSource ID="odsPostalReqDetails" runat="server" InsertMethod="AddPostalStampRequestDetails"
				SelectMethod="GetPostalRequestdetailsById" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
				UpdateMethod="UpdatePostalStampRequestDetails" OnUpdating="odsPostalReqDetails_Updating" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" OldValuesParameterFormatString="original_{0}">
				<UpdateParameters>
					<asp:Parameter Name="Parameter" Type="Object" />
					<asp:Parameter Name="PurRequestId" Type="Object" />
				</UpdateParameters>
				<SelectParameters>
					<asp:ControlParameter ControlID="gvPostalStampReqDetails" Name="PurRequestId" PropertyName="SelectedValue"
						Type="Object" />
				</SelectParameters>
			</asp:ObjectDataSource>
		</asp:View>
	</asp:MultiView>
</asp:Content>
