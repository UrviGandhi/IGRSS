<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
	CodeFile="ValuationForm.aspx.cs" Inherits="Registration_ValuationForm" Title="Valuation Form Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table style="text-align: left" width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblPropertyDetailsHeadingIns" runat="server" meta:resourcekey="lblPropertyDetailsHeadingIns"
					SkinID="SubHeading" Text="Property Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblDistNameIns" runat="server" meta:resourcekey="lblDistNameIns" Text="Village/City Name"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtDistNameIns" runat="server" meta:resourcekey="txtDistNameIns"
					Text='<%# Bind("Village_CityName") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblTpSchemeNoIns" runat="server" meta:resourcekey="lblTpSchemeNoIns"
					Text="T.P Scheme No"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtTpSchemeNoIns" runat="server" meta:resourcekey="txtTpSchemeNoIns"
					Text='<%# Bind("TPSchemeNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblTpSchemeNameIns" runat="server" meta:resourcekey="lblTpSchemeNameIns"
					Text="T.P Scheme Name"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtTpSchemeNameIns" runat="server" meta:resourcekey="txtTpSchemeNameIns"
					Text='<%# Bind("TPSchemeName") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblFinalPlotNoIns" runat="server" meta:resourcekey="lblFinalPlotNoIns"
					Text="Final Plot No"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtFinalPlotNoIns" runat="server" meta:resourcekey="txtFinalPlotNoIns"
					Text='<%# Bind("FinalPlotNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblCitySurveyNoIns" runat="server" meta:resourcekey="lblCitySurveyNoIns"
					Text="City Survey No"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtCitySurveyNoIns" runat="server" meta:resourcekey="txtCitySurveyNoIns"
					Text='<%# Bind("CitySurveyNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
			<td class="labelColumn">
				&nbsp;<asp:Label ID="lblRevenueSurveyNoIns" runat="server" meta:resourcekey="lblRevenueSurveyNoIns"
					Text="Revenue Survey No"></asp:Label></td>
			<td class="textColumn">
				<asp:TextBox ID="txtRevenueSurveyNoIns" runat="server" meta:resourcekey="txtRevenueSurveyNoIns"
					Text='<%# Bind("RevenueSurveyNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblWard_SubWardNoIns" runat="server" meta:resourcekey="lblWard_SubWardNoIns"
					Text="Ward/SubWard No"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtWard_SubWardNoIns" runat="server" meta:resourcekey="txtWard_SubWardNoIns"
					Text='<%# Bind("Ward_SubWardNo") %>'></asp:TextBox>
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
			<td colspan="6">
				<asp:Label ID="lblPartyDetailsIns" runat="server" meta:resourcekey="lblPartyDetailsIns"
					SkinID="SubHeading" Text="Party Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblNameOfOwnerIns" runat="server" meta:resourcekey="lblNameOfOwnerIns"
					Text="Name Of Owner"></asp:Label>
			</td>
			<td colspan="4">
				<asp:TextBox ID="txtNameOfOwnerIns" runat="server" meta:resourcekey="txtNameOfOwnerIns"
					Text='<%# Bind("NameOfOwner") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqFldValOwnerNameIns" runat="server" ControlToValidate="txtNameOfOwnerIns">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtNameOfOwnerIns"
					ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblAddressOfOwnerIns" runat="server" meta:resourcekey="lblAddressOfOwnerIns"
					Text="Address Of Owner"></asp:Label>
			</td>
			<td colspan="3">
				<asp:TextBox ID="txtAddressOfOwnerIns" runat="server" meta:resourcekey="txtAddressOfOwnerIns"
					Text='<%# Bind("AddressOfOwner") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqfldtxtAddressOfOwnerIns" runat="server" ControlToValidate="txtAddressOfOwnerIns"
					ErrorMessage="Address of Owner">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegExprValtxtNameOfOwnerIns" runat="server" ControlToValidate="txtNameOfOwnerIns"
					ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator></td>
			<td class="labelColumn">
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqFldValAddressOwnerIns" runat="server" ControlToValidate="txtAddressOfOwnerIns">*</asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblNameOfClaimingPartyIns" runat="server" meta:resourcekey="lblNameOfClaimingPartyIns"
					Text="Claiming Party Name"></asp:Label>
			</td>
			<td colspan="4">
				<asp:TextBox ID="txtNameOfClaimingPartyIns" runat="server" meta:resourcekey="txtNameOfClaimingPartyIns"
					Text='<%# Bind("NameOfClaimingParty") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqFldValNameOfCLaimingPartyIns" runat="server" ControlToValidate="txtNameOfClaimingPartyIns">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegexptxtNameOfClaimingPartyIns" runat="server"
					ControlToValidate="txtNameOfClaimingPartyIns" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblAddressOfClaimingPartyIns" runat="server" meta:resourcekey="lblAddressOfClaimingPartyIns"
					Text="Address Of Claiming Party"></asp:Label>
			</td>
			<td colspan="3">
				<asp:TextBox ID="txtAddressOfClaimingPartyIns" runat="server" meta:resourcekey="txtAddressOfClaimingPartyIns"
					Text='<%# Bind("AddressOfClaimingParty") %>' TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblPropertyDescriptionHeaderIns" runat="server" meta:resourcekey="lblPropertyDescriptionHeaderIns"
					SkinID="SubHeading" Text="Property Description Header"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblAreaOfPlotIns" runat="server" meta:resourcekey="lblAreaOfPlotIns"
					Text="Area(Sq mts)"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtAreaOfPlotIns" runat="server" meta:resourcekey="txtAreaOfPlotIns"
					Text='<%# Bind("AreaOfPlot") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
					ErrorMessage="Area Of Plot can't be blank">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegexptxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
					ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
			</td>
			<td class="validationColumn">
				<asp:Label ID="lblAreaOfConstructionIns" runat="server" meta:resourcekey="lblAreaOfConstructionIns"
					Text="Plinth Area & No of Floors"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtAreaOfConstructionIns" runat="server" meta:resourcekey="txtAreaOfConstructionIns"
					Text='<%# Bind("AreaOfConstruction") %>' Width="45%"></asp:TextBox>
				<asp:TextBox ID="txtNoOfFloorsIns" runat="server" meta:resourcekey="txtNoOfFloorsIns"
					Text='<%# Bind("NoOfFloors") %>' Width="45%"></asp:TextBox></td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqfldtxtAreaOfConstructionIns" runat="server" ControlToValidate="txtAreaOfConstructionIns"
					ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegExptxtAreaOfConstructionIns" runat="server"
					ControlToValidate="txtAreaOfConstructionIns" ErrorMessage="Enter values is not in correct format"
					ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator ID="ReqfldtxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
					ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegExptxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
					ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblYearOfConstructionIns" runat="server" meta:resourcekey="lblYearOfConstructionIns"
					Text="Year of Construction"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtYearOfConstructionIns" runat="server" meta:resourcekey="txtYearOfConstructionIns"
					Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqfldtxtYearOfConstructionIns" runat="server" ControlToValidate="txtYearOfConstructionIns"
					ErrorMessage="Year of construction Can't be blank">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegexptxtYearOfConstructionIns" runat="server"
					ControlToValidate="txtYearOfConstructionIns" ErrorMessage="Enter values is not in correct format"
					ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
			</td>
			<td class="validationColumn">
				<asp:Label ID="lblTypeOfPropertyIns" runat="server" meta:resourcekey="lblTypeOfPropertyIns"
					Text="Type Of Property"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlTypeOfPropertyIns" runat="server" AutoPostBack="true" meta:resourcekey="ddlTypeOfPropertyIns"
					SelectedValue='<%# Bind("TypeOfProperty") %>'>
					<asp:ListItem meta:resourcekey="ListItemResource18">Residential</asp:ListItem>
					<asp:ListItem meta:resourcekey="ListItemResource19">Commercial</asp:ListItem>
					<asp:ListItem meta:resourcekey="ListItemResource20">Industrial</asp:ListItem>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:MultiView ID="mvPropertyDetailsIns" runat="server" ActiveViewIndex="0">
					<asp:View ID="View1" runat="server">
						<table width="100%">
							<tr>
								<td colspan="6">
									<asp:Label ID="lblResidentialDetailsHeaderIns" runat="server" meta:resourcekey="lblResidentialDetailsHeaderIns"
										SkinID="SubHeading" Text="Residential Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblHeightOfCeilingIns" runat="server" meta:resourcekey="lblHeightOfCeilingIns"
										Text="Ceiling Height"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtHeightOfCeilingIns" runat="server" meta:resourcekey="txtHeightOfCeilingIns"
										Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
										ErrorMessage="Height Of Ceiling Can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
										ErrorMessage="Height Of Ceiling is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn">
									<asp:Label ID="lblTypeOfTilesIns" runat="server" meta:resourcekey="lblTypeOfTilesIns"
										Text="Tiles Type"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:DropDownList ID="ddlTypeOfTilesIns" runat="server" meta:resourcekey="ddlTypeOfTilesIns"
										SelectedValue='<%# Bind("TypeOfTiles") %>'>
										<asp:ListItem meta:resourcekey="ListItemResource21" Text="Mosaic" Value="2cd90b7c-de3e-488e-be52-cb0f7f335812"></asp:ListItem>
										<asp:ListItem meta:resourcekey="ListItemResource22" Text="Marble" Value="dbd44bd2-28b4-4cdf-83b6-e434c2912985"></asp:ListItem>
										<asp:ListItem meta:resourcekey="ListItemResource23" Text="Red Oxide" Value="4f1ac771-b5e4-424d-85bf-6a6931d93559"></asp:ListItem>
									</asp:DropDownList>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblWallFurnishingIns" runat="server" meta:resourcekey="lblWallFurnishingIns"
										Text="Wall Furnishing"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtWallFurnishingIns" runat="server" meta:resourcekey="txtWallFurnishingIns"
										Text='<%# Bind("WallFurnishing") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn">
								</td>
								<td class="textColumn">
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td class="validationColumn">
									<asp:Label ID="lblNoOfBathroomsIns" runat="server" meta:resourcekey="lblNoOfBathroomsIns"
										Text="No Of Bathrooms"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtNoOfBathroomsIns" runat="server" meta:resourcekey="txtNoOfBathroomsIns"
										Text='<%# Bind("NoOfBathrooms") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RequiredFieldValidator ID="ReqfldtxtNoOfBathroomsIns" runat="server" ControlToValidate="txtNoOfBathroomsIns"
										ErrorMessage="No Of Bathroom Can't be blank">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegexptxtNoOfBathroomsIns" runat="server" ControlToValidate="txtNoOfBathroomsIns"
										ErrorMessage="Enter values is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn">
									<asp:Label ID="lblBathroomTilesHeightIns" runat="server" meta:resourcekey="lblBathroomTilesHeightIns"
										Text="Tiles Height"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtBathroomTilesHeightIns" runat="server" meta:resourcekey="txtBathroomTilesHeightIns"
										Text='<%# Bind("BathroomTilesHeight") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegexptxtBathroomTilesHeightIns" runat="server"
										ControlToValidate="txtBathroomTilesHeightIns" ErrorMessage="Bathroom Tiles height values is not in correct format"
										ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblNoOfToiletsIns" runat="server" meta:resourcekey="lblNoOfToiletsIns"
										Text="No Of Toilets"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtNoOfToiletsIns" runat="server" meta:resourcekey="txtNoOfToiletsIns"
										Text='<%# Bind("NoOfToilets") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegExpNoOfToiletIns" runat="server" ControlToValidate="txtNoOfToiletsIns"
										ValidationExpression="^\d+$">*</asp:RegularExpressionValidator>
								</td>
								<td class="validationColumn">
									<asp:Label ID="lblToiletTilesHeightIns" runat="server" meta:resourcekey="lblToiletTilesHeightIns"
										Text="Toilet Tiles Height"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtToiletTilesHeightIns" runat="server" meta:resourcekey="txtToiletTilesHeightIns"
										Text='<%# Bind("ToiletTilesHeight") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegExpValToiletTilesHeightIns" runat="server"
										ControlToValidate="txtToiletTilesHeightIns" ValidationExpression="^\d*\.{0,1}\d+$">*</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblParkingIns" runat="server" meta:resourcekey="lblParkingIns" Text="Parking"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:CheckBox ID="chkParkingIns" runat="server" Checked='<%# Bind("Parking") %>'
										meta:resourcekey="txtParkingIns" />
								</td>
								<td class="validationColumn">
								</td>
								<td class="validationColumn">
								</td>
								<td class="textColumn">
								</td>
								<td class="validationColumn">
								</td>
							</tr>
						</table>
					</asp:View>
					<asp:View ID="viewCommercialIns" runat="server">
						<table width="100%">
							<tr>
								<td colspan="6">
									<asp:Label ID="lblDescOfPropertyHeadingIns" runat="server" meta:resourcekey="lblDescOfPropertyHeadingIns"
										SkinID="SubHeading" Text="Commercial Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblDescOfPropertyIns" runat="server" meta:resourcekey="lblDescOfPropertyIns"
										Text="Desc Of Property"></asp:Label>
								</td>
								<td colspan="4">
									<asp:TextBox ID="txtDescOfPropertyIns" runat="server" meta:resourcekey="txtDescOfPropertyIns"
										Text='<%# Bind("DescOfProperty") %>' TextMode="MultiLine"></asp:TextBox>
								</td>
								<td class="validationColumn">
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width: 50%;">
									<asp:CheckBox ID="chkShopsOnGroundFloorIns" runat="server" Checked='<%# Bind("ShopsOnGroundFloor") %>'
										meta:resourcekey="chkShopsOnGroundFloorIns" Text="Is Shops On Ground/First Floor?" />
								</td>
								<td class="validationColumn">
								</td>
								<td colspan="2" style="width: 50%;">
									<asp:CheckBox ID="chkIsPropertyInCommercialIns" runat="server" Checked='<%# Bind("IsPropertyInCommercial") %>'
										meta:resourcekey="chkIsPropertyInCommercialIns" Text="Is Property in Commercially Developed Area?" />
								</td>
								<td class="validationColumn">
								</td>
							</tr>
						</table>
					</asp:View>
					<asp:View ID="viewIndustrialIns" runat="server">
						<table width="100%">
							<tr>
								<td colspan="6">
									<asp:Label ID="lblIndustrialHeaderIns" runat="server" meta:resourcekey="lblIndustrialHeaderIns"
										SkinID="SubHeading" Text="Industrial Details"></asp:Label>
								</td>
							</tr>
							<tr>
								<td class="labelColumn">
									<asp:Label ID="lblHeightOfIndCeilingIns" runat="server" meta:resourcekey="lblHeightOfIndCeilingIns"
										Text="Height till bottom of Ceiling"></asp:Label>
								</td>
								<td class="textColumn">
									<asp:TextBox ID="txtHeightOfIndCeilingIns" runat="server" meta:resourcekey="txtHeightOfIndCeilingIns"
										Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
								</td>
								<td class="validationColumn">
									<asp:RegularExpressionValidator ID="RegexpHeightOfIndCeilingIns" runat="server" ControlToValidate="txtHeightOfIndCeilingIns"
										ErrorMessage="Height Of ceiling Format must be decimal" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
								</td>
								<td class="labelColumn">
								</td>
								<td class="textColumn">
								</td>
								<td class="validationColumn">
								</td>
							</tr>
						</table>
					</asp:View>
				</asp:MultiView>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblTypeOfElectricficationIns" runat="server" meta:resourcekey="lblTypeOfElectricficationIns"
					Text="Electricfication Type"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:DropDownList ID="ddlTypeOfElectricficationIns" runat="server" DataSourceID="xdsElectricalElectrification"
					DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfElectricficationIns"
					Text='<%# Bind("TypeOfElectricfication") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="validationColumn" style="width: 23%">
			</td>
			<td class="textColumn">
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="height: 35px">
				<asp:Label ID="lblCompoundWallTypeIns" runat="server" meta:resourcekey="lblCompoundWallTypeIns"
					Text="Compound Wall Type"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px; height: 35px;">
				<asp:DropDownList ID="ddlCompoundWallTypeIns" runat="server" DataSourceID="xdsCompoundWall"
					DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlCompoundWallTypeIns"
					Text='<%# Bind("CompoundWallType") %>'>
				</asp:DropDownList>
			</td>
			<td class="validationColumn" style="height: 35px">
			</td>
			<td colspan="2" style="height: 35px">
				<asp:CheckBox ID="chkIsLightsOnCompoundWallIns" runat="server" Checked='<%# Bind("IsLightsOnCompoundWall") %>'
					meta:resourcekey="chkIsLightsOnCompoundWallIns" Text="Is Lights On Compound Wall?" />
			</td>
			<td class="validationColumn" style="height: 35px">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:CheckBox ID="chkWaterStorageFacilityIns" runat="server" Checked='<%# Bind("WaterStorageFacility") %>'
					meta:resourcekey="chkWaterStorageFacilityIns" Text="Water Storage Facility (Y/N)" />
			</td>
			<td class="validationColumn">
			</td>
			<td colspan="2">
				<asp:CheckBox ID="chkDrainageSystemIns" runat="server" Checked='<%# Bind("DrainageSystem") %>'
					meta:resourcekey="chkDrainageSystemIns" Text="Is Drainage Facility Available?" />
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblNoOfLiftsIns" runat="server" meta:resourcekey="lblNoOfLiftsIns"
					Text="No Of Lifts"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:TextBox ID="txtNoOfLiftsIns" runat="server" meta:resourcekey="txtNoOfLiftsIns"
					Text='<%# Bind("NoOfLifts") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RegularExpressionValidator ID="RegexpNoOfLifts" runat="server" ControlToValidate="txtNoOfLiftsIns"
					ErrorMessage="No Of Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
			</td>
			<td class="validationColumn" style="width: 23%">
				<asp:Label ID="lblAreaOfEachLiftIns" runat="server" meta:resourcekey="lblAreaOfEachLiftIns"
					Text="Area Of each Lift"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtAreaOfEachLiftIns" runat="server" meta:resourcekey="txtAreaOfEachLiftIns"
					Text='<%# Bind("AreaOfEachLift") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RegularExpressionValidator ID="RegexpAreaOfEachLift" runat="server" ControlToValidate="txtAreaOfEachLiftIns"
					ErrorMessage="Areas Of Each Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:CheckBox ID="chkInternalRoadIns" runat="server" Checked='<%# Bind("InternalRoad") %>'
					meta:resourcekey="chkInternalRoadIns" Text="Internal Road Present (Y/N)" />
			</td>
			<td class="validationColumn">
			</td>
			<td colspan="2">
				<asp:CheckBox ID="chkValuatedBeforeIns" runat="server" Checked='<%# Bind("ValuatedBefore") %>'
					meta:resourcekey="chkValuatedBeforeIns" Text="Has been Valuated before?" />
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td colspan="6" style="height: 18px">
				<asp:Label ID="lblFeeDetailsHeaderIns" runat="server" meta:resourcekey="lblFeeDetailsHeaderIns"
					SkinID="SubHeading" Text="Fee Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblFeeTypeIns" runat="server" meta:resourcekey="lblFeeTypeIns" Text="Fee"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:DropDownList ID="ddlFeeTypeIns" runat="server" DataSourceID="odsFeeMaster" DataTextField="Name"
					DataValueField="FeeId">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="validationColumn" style="width: 23%">
				<asp:Label ID="lblFeeAmountIns" runat="server" meta:resourcekey="lblFeeAmountIns"
					Text="Amount"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtFeeAmountIns" runat="server" meta:resourcekey="txtFeeAmountIns"
					ValidationGroup="FeeDetails"></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RegularExpressionValidator ID="RegExptxtFeeAmountIns" runat="server" ControlToValidate="txtFeeAmountIns"
					ErrorMessage="Fee Amount must be Numeric" ValidationExpression="^\d+$" ValidationGroup="FeeDetails">*</asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator ID="ReqFldtxtFeeAmountIns" runat="server" ControlToValidate="txtFeeAmountIns"
					ErrorMessage="Enter Fee Amount" ValidationGroup="FeeDetails">*</asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnUpdateFeeDetailIns" runat="server" Text="Update" ValidationGroup="FeeDetails"
					Visible="false" />
				<asp:Button ID="btnAddFeeDetailIns" runat="server" Text="Add" ValidationGroup="FeeDetails" />
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<asp:GridView ID="gvFeeStampDetailsIns" runat="server" AutoGenerateColumns="false"
					DataKeyNames="AdjudicationId,FeeId" meta:resourcekey="gvFeeStampDetails">
					<EmptyDataTemplate>
						No Data Available!!!
					</EmptyDataTemplate>
					<Columns>
						<asp:TemplateField HeaderText="Fee Id" SortExpression="FeeId" Visible="False">
							<EditItemTemplate>
								&nbsp;<asp:Label ID="lbleFeeId" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblFeeId" runat="server" Text='<%# Bind("FeeId") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Name" SortExpression="Name">
							<EditItemTemplate>
								&nbsp;<asp:Label ID="lbleFeeName" runat="server" Text='<%# Bind("FeeName") %>'></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblFeeName" runat="server" Text='<%# Bind("FeeName") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Amount" SortExpression="Amount">
							<EditItemTemplate>
								<asp:Label ID="lbleFeeAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblFeeAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="ID" SortExpression="AdjudicationId" Visible="false">
							<EditItemTemplate>
								&nbsp;<asp:Label ID="lbleAdjID" runat="server" Text='<%# Bind("AdjudicationId") %>'></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblAdjID" runat="server" Text='<%# Bind("AdjudicationId") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:CommandField SelectText="Update" ShowSelectButton="True" />
						<asp:CommandField ShowDeleteButton="True" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:Label ID="lblDocumentDetailsHeaderIns" runat="server" meta:resourcekey="lblDocumentDetailsHeaderIns"
					SkinID="SubHeading" Text="Document Details"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="labelColumn">
				<asp:Label ID="lblDocumentTypeIns" runat="server" meta:resourcekey="lblDocumentTypeIns"
					Text="Document Type"></asp:Label>
			</td>
			<td class="textColumn" style="width: 93px">
				<asp:DropDownList ID="ddlDocumentTypeIns" runat="server" DataSourceID="odsGetDocument"
					DataTextField="Name" DataValueField="DocumentTypeId" meta:resourcekey="ddlDocumentTypeIns">
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
			<td class="validationColumn" style="width: 23%">
				<asp:Label ID="lvlDocumentNumberIns" runat="server" meta:resourcekey="lvlDocumentNumberIns"
					Text="Document Number"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtDocumentNumberIns" runat="server" meta:resourcekey="txtDocumentNumberIns"
					ValidationGroup="DocumentDetails"></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="ReqfldValtxtDocumentNumberIns" runat="server" ControlToValidate="txtDocumentNumberIns"
					ErrorMessage="Enter Document No" ValidationGroup="DocumentDetails">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegexptxtDocumentNumberIns" runat="server" ControlToValidate="txtDocumentNumberIns"
					ErrorMessage="Enter Document No in correct format" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="validationColumn">
				<asp:Label ID="lblDocRemarksIns" runat="server" meta:resourcekey="lblDocRemarksIns"
					Text="Doc Remarks" Width="153px"></asp:Label>
			</td>
			<td colspan="6" style="width: 25%">
				<asp:TextBox ID="txtDocRemarksIns" runat="server" meta:resourcekey="txtDocRemarksIns"
					TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td>
				<asp:CheckBox ID="chkSubmittedIns" runat="server" meta:resourcekey="chkSubmittedIns"
					Text="Has Submitted?" Width="151px" />
			</td>
			<td style="width: 93px">
				<asp:Button ID="btnAddDocumentIns" runat="server" Text="Add" ValidationGroup="DocumentDetails" />
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="btnUpdateFeeDetailsIns" runat="server" Text="Update" ValidationGroup="DocumentDetails"
					Visible="false" /></td>
		</tr>
		<tr>
			<td colspan="6">
				<asp:GridView ID="gvDocumentIns" runat="server" AutoGenerateColumns="false" DataKeyNames="ValuationFormId,DocumentTypeId"
					meta:resourcekey="gvDocumentsInsResource1">
					<Columns>
						<asp:TemplateField HeaderText="Document Id" SortExpression="DocumentTypeId" Visible="False">
							<EditItemTemplate>
								<asp:Label ID="lbleDocumentId" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="DocumentId" runat="server" Text='<%# Bind("DocumentTypeId") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Document Name" SortExpression="Name">
							<EditItemTemplate>
								<asp:Label ID="lbleDocumentName" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblDocumentName" runat="server" Text='<%# Bind("DocName") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="ID" SortExpression="ValuationFormId" Visible="false">
							<EditItemTemplate>
								<asp:Label ID="lbleValId" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblValId" runat="server" Text='<%# Bind("ValuationFormId") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Document No" SortExpression="DocumentNo">
							<EditItemTemplate>
								<asp:Label ID="lbleDocumentNo" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblDocumentNo" runat="server" Text='<%# Bind("DocumentNumber") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
							<EditItemTemplate>
								<asp:Label ID="lbleRemarks" runat="server"></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:CheckBoxField DataField="Submitted" HeaderText="Submitted" SortExpression="Submitted" />
						<asp:CommandField SelectText="Update" ShowSelectButton="True" />
						<asp:CommandField ShowDeleteButton="true" />
					</Columns>
				</asp:GridView>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="6">
				<asp:Button ID="RegInsert" runat="server" CausesValidation="True" CommandName="Insert"
					Text="Save" />
				<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
					Text="Cancel" />
			</td>
		</tr>
	</table>
	
	
	
	<asp:ObjectDataSource ID="odsOffices" runat="server" DataObjectTypeName="System.Guid"
		DeleteMethod="DeActivateOffice" InsertMethod="AddNewOfficeType" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.OfficeManagement">
		<InsertParameters>
			<asp:Parameter Name="OfficeTypeName" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsGetDocument" runat="server" DataObjectTypeName="System.Guid"
		InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetDocumentMaster" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
		UpdateMethod="UpdatePhysicalVerification">
		<InsertParameters>
			<asp:Parameter Name="AdjudicationId" Type="Object" />
			<asp:Parameter Name="CertificateNumber" Type="String" />
			<asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
			<asp:Parameter Name="CertificateDescription" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<asp:XmlDataSource ID="xdsElectricalElectrification" runat="server" DataFile="~/Adjudication/ElectrificationType.xml">
	</asp:XmlDataSource>
	<asp:XmlDataSource ID="xdsCompoundWall" runat="server" DataFile="~/Adjudication/CompoundWall.xml">
	</asp:XmlDataSource>
	<asp:ObjectDataSource ID="odsFeeMaster" runat="server" DataObjectTypeName="System.Guid"
		InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetFees" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
		UpdateMethod="UpdatePhysicalVerification">
		<InsertParameters>
			<asp:Parameter Name="AdjudicationId" Type="Object" />
			<asp:Parameter Name="CertificateNumber" Type="String" />
			<asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
			<asp:Parameter Name="CertificateDescription" Type="String" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<asp:ObjectDataSource ID="odsRegistration" runat="server" InsertMethod="AddNewRegistration"
		OldValuesParameterFormatString="original_{0}" SelectMethod="GetInputSheetDetails"
		TypeName="IGRSS.BusinessLogicLayer.Registration" UpdateMethod="UpdateRegistrationPartyDetails">
		<UpdateParameters>
			<asp:Parameter Name="PartyID" Type="Object" />
			<asp:Parameter Name="RegistrationId" Type="Object" />
			<asp:Parameter Name="PartyType" Type="String" />
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Address" Type="String" />
			<asp:Parameter Name="Age" Type="Decimal" />
			<asp:Parameter Name="Gender" Type="String" />
			<asp:Parameter Name="Religion" Type="Object" />
			<asp:Parameter Name="Occupation" Type="String" />
			<asp:Parameter Name="PAN" Type="String" />
			<asp:Parameter Name="UserName" Type="String" />
			<asp:Parameter Name="ModifiedAt" Type="DateTime" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="Parameter" Type="Object" />
			<asp:Parameter Name="PartyDetails" Type="Object" />
		</InsertParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	<br />
	<br />
</asp:Content>
