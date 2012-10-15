<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Test_Calculator, App_Web_5blfifdp" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<table width="100%">
		<tr>
			<td colspan="6">
				<asp:Label ID="lblStampDutyCalculationIns" runat="server" meta:resourcekey="lblStampDutyCalculationIns"
					SkinID="SubHeading" Text="Stamp Duty Calculation "></asp:Label>
			</td>
		</tr>
		<%--	<tr >
							<td class="labelColumn">
								<asp:Label ID="lblDistirctCode" runat="server" meta:resourcekey="lblDistirctCode"
									Text="Distirct Code"></asp:Label>
							</td>
							<td class="textColumn" >
								<asp:DropDownList ID="ddlDistirctCode" runat="server" DataSourceID="odsDistirctMaster"
									Width="180px" DataTextField="distname" DataValueField="distcd">
								</asp:DropDownList>
							</td>
							<td class="labelColumn" >
								<asp:Label ID="lblTalukaCode" runat="server" meta:resourcekey="lblTalukaCode" Text="Taluka Code"></asp:Label>
							</td>
							<td class="textColumn" >
								<asp:DropDownList ID="ddlTalukaCode" runat="server" DataSourceID="odsTalukaMaster"
								 DataTextField="talukaname" DataValueField="talcd">
								</asp:DropDownList>
							</td>
							<td class="labelColumn" >
								<asp:Label ID="lblVillageCode" runat="server" meta:resourcekey="lblVillageCode" Text="village Code"></asp:Label>
							</td>
							<td class="textColumn" >
								<asp:DropDownList ID="ddlVillageCode" runat="server" DataSourceID="odsVillageMaster"
									DataTextField="villname" DataValueField="villcd">
								</asp:DropDownList>
							</td>
						</tr>--%>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblDistirctCode" runat="server" meta:resourcekey="lblDistirctCode"
					Text="Distirct Code"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:DropDownList ID="ddlDistirctCodeIns" runat="server" SelectedValue='<%# Bind("DistrictCode") %>'>
					<asp:ListItem Selected="True" Value="0"></asp:ListItem>
					<asp:ListItem Value="1"></asp:ListItem>
					<asp:ListItem Value="2"></asp:ListItem>
					<asp:ListItem Value="3"></asp:ListItem>
					<asp:ListItem Value="4"></asp:ListItem>
				</asp:DropDownList>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblTalukaCode" runat="server" meta:resourcekey="lblTalukaCode" Text="Taluka Code"></asp:Label>
			</td>
			<td class="textColumn">
				<asp:DropDownList ID="ddlTalukaCodeIns" runat="server" SelectedValue='<%# Bind("TalukaCode") %>'>
					<asp:ListItem Selected="True" Value="0"></asp:ListItem>
					<asp:ListItem Value="1"></asp:ListItem>
					<asp:ListItem Value="2"></asp:ListItem>
					<asp:ListItem Value="3"></asp:ListItem>
					<asp:ListItem Value="4"></asp:ListItem>
				</asp:DropDownList>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblVillageCode" runat="server" meta:resourcekey="lblVillageCode" Text="village Code"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:DropDownList ID="ddlVillageCodeIns" runat="server" SelectedValue='<%# Bind("VillageCode") %>'>
					<asp:ListItem Selected="True" Value="0"></asp:ListItem>
					<asp:ListItem Value="1"></asp:ListItem>
					<asp:ListItem Value="2"></asp:ListItem>
					<asp:ListItem Value="3"></asp:ListItem>
					<asp:ListItem Value="4"></asp:ListItem>
				</asp:DropDownList>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<%--<asp:Label ID="Label2" runat="server" meta:resourcekey="lblTalukaCode" Text="Taluka Code"></asp:Label>--%>
			</td>
			<td class="textColumn">
				<%--<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsTalukaMaster"
									DataTextField="talukaname" DataValueField="talcd">
								</asp:DropDownList>--%>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblTpSchemeNo" runat="server" meta:resourcekey="lblTpSchemeNo" Text="Tp Scheme No"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:TextBox ID="txtTpSchemeNoIns" runat="server" meta:resourcekey="txtTpSchemeNo"
					Text='<%# Bind("TpSchemeNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblPlotNo" runat="server" meta:resourcekey="lblPlotNo" Text="Plot No"></asp:Label><strong>
					* </strong>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtPlotNoIns" runat="server" meta:resourcekey="txtPlotNo" Text='<%# Bind("PlotNo") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlotNoIns"
					ErrorMessage="*"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblAreaOfLand" runat="server" meta:resourcekey="lblAreaOfLand" Text="Area Of Land"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:TextBox ID="txtAreaOfLandIns" runat="server" meta:resourcekey="txtAreaOfLand"
					Text='<%# Bind("AreaOfLand") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblAreaOfConstruction" runat="server" meta:resourcekey="lblAreaOfConstriction"
					Text="Area Of Constriction"></asp:Label><strong> * </strong>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtAreaOfConstructionIns" runat="server" meta:resourcekey="txtAreaOfConstriction"
					Text='<%# Bind("PlinthAreaOfConstruction") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 37px">
				<asp:Label ID="lblTypeOfConstruction" runat="server" meta:resourcekey="lblTypeOfConstruction"
					Text="Type Of Construction"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%; height: 37px;">
				<%--<asp:TextBox ID="txtTypeOfConstruction" runat="server" meta:resourcekey="txtTypeOfConstruction"></asp:TextBox>
						--%>
				<asp:DropDownList ID="ddlTypeofConstruction" runat="server" SelectedValue='<%# Bind("TypeOfConstruction") %>'>
					<asp:ListItem Value="876944d2-e8c5-4d1a-b68d-57808318b096">Low</asp:ListItem>
					<asp:ListItem Value="625b5496-47ae-4606-8e81-6f0f8789da37">Medium</asp:ListItem>
					<asp:ListItem Value="71ff2de3-a4a4-42f6-8d84-1e9a5a99c248">High</asp:ListItem>
				</asp:DropDownList>
			</td>
			<td class="validationColumn" style="width: 5%; height: 37px;">
			</td>
			<td class="labelColumn" style="height: 37px">
				<asp:Label ID="lblInternalElectricficationRate" runat="server" meta:resourcekey="lblInternalElectricficationRate"
					Text="Internal ElectricficationRate"></asp:Label><strong> * </strong>
			</td>
			<td class="textColumn" style="height: 37px">
				<asp:TextBox ID="txtInternalElectrificationRateIns" runat="server" meta:resourcekey="txtInternalElectricficationRate"
					Text='<%# Bind("InternalElectrificationRate") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="height: 37px">
				<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInternalElectrificationRateIns"
					ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10"></asp:RangeValidator></td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblDevelopmentFeeRate" runat="server" meta:resourcekey="lblDevelopmentFeeRate"
					Text="Development Fee Rate"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:TextBox ID="txtDevelopmentFeeRateIns" runat="server" meta:resourcekey="txtDevelopmentFeeRate"
					Text='<%# Bind("DevelopmentRate") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 5%">
				<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtDevelopmentFeeRateIns"
					ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10"></asp:RangeValidator></td>
			<td class="labelColumn">
				<asp:Label ID="lblOtherFeeRate" runat="server" meta:resourcekey="lblOtherFeeRate"
					Text="Other Fee Rate"></asp:Label><strong> * </strong>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtOtherFeeRateIns" runat="server" meta:resourcekey="txtOtherFeeRate"
					Text='<%# Bind("OtherFeeRate") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
				<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtOtherFeeRateIns"
					ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10"></asp:RangeValidator></td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblYearOfConstruction" runat="server" meta:resourcekey="lblYearOfConstruction"
					Text="YeaOf Construction"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:TextBox ID="txtYearOfConstructionIns" runat="server" meta:resourcekey="txtYearOfConstruction"
					Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<asp:Label ID="lblSpecialDeduction" runat="server" meta:resourcekey="lblSpecialDeduction"
					Text="Special Deduction"></asp:Label><strong> * </strong>
			</td>
			<td class="textColumn">
				<asp:TextBox ID="txtSpecialDeductionIns" runat="server" meta:resourcekey="txtSpecialDeduction"
					Text='<%# Bind("SpecialDeduction") %>'></asp:TextBox>
			</td>
			<td class="validationColumn">
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
				<asp:Label ID="lblLiftExpense" runat="server" meta:resourcekey="lblLiftExpense" Text="LiftExpense"></asp:Label>
			</td>
			<td class="textColumn" style="width: 26%">
				<asp:TextBox ID="txtLiftExpenseIns" runat="server" meta:resourcekey="txtLiftExpense"
					Text='<%# Bind("LiftExpense") %>'></asp:TextBox>
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td class="labelColumn">
				<%--<asp:Label ID="Label2" runat="server" meta:resourcekey="lblSpecialDeduction" Text="Special Deduction"></asp:Label><strong>
									* </strong>--%>
			</td>
			<td class="textColumn">
				<%--<asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="txtSpecialDeduction"></asp:TextBox>--%>
			</td>
			<td class="validationColumn">
				<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRegistrationNoIns"
									ErrorMessage="*" Font-Bold="True"></asp:RequiredFieldValidator>--%>
			</td>
		</tr>
		<tr>
			<td class="labelColumn" style="width: 77px; height: 28px">
			</td>
			<td class="textColumn" style="width: 26%">
			</td>
			<td class="validationColumn" style="width: 5%">
			</td>
			<td align="right" class="labelColumn">
			</td>
			<td class="textColumn">
				<asp:Button ID="btnCalculate" runat="server" CommandName="Update" Text="Calculate" OnClick="btnCalculate_Click" /></td>
			<td class="validationColumn">
			</td>
		</tr>
	</table>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="CalculateSd" TypeName="IGRSS.SdcCalc">
		<SelectParameters>
			<asp:ControlParameter ControlID="ddlDistirctCodeIns" Name="DistrictCode" PropertyName="SelectedValue"
				Type="Int32" />
			<asp:ControlParameter ControlID="ddlTalukaCodeIns" Name="TalukaCode" PropertyName="SelectedValue"
				Type="Int32" />
			<asp:ControlParameter ControlID="ddlVillageCodeIns" Name="VillageCode" PropertyName="SelectedValue"
				Type="Int32" />
			<asp:ControlParameter ControlID="txtTpSchemeNoIns" Name="TpSchemeNo" PropertyName="Text"
				Type="String" />
			<asp:ControlParameter ControlID="txtPlotNoIns" Name="PlotNo" PropertyName="Text"
				Type="String" />
			<asp:ControlParameter ControlID="txtAreaOfLandIns" Name="AreaOfLand" PropertyName="Text"
				Type="Decimal" />
			<asp:ControlParameter ControlID="txtAreaOfConstructionIns" Name="PlinthAreaOfConstruction"
				PropertyName="Text" Type="Decimal" />
			<asp:ControlParameter ControlID="ddlTypeofConstruction" Name="TypeOfConstruction"
				PropertyName="SelectedValue" Type="String" />
			<asp:ControlParameter ControlID="txtInternalElectrificationRateIns" Name="InternalElectrificationRate"
				PropertyName="Text" Type="Decimal" />
			<asp:ControlParameter ControlID="txtDevelopmentFeeRateIns" Name="DevelopmentRate"
				PropertyName="Text" Type="Decimal" />
			<asp:ControlParameter ControlID="txtOtherFeeRateIns" Name="OtherFeeRate" PropertyName="Text"
				Type="Decimal" />
			<asp:ControlParameter ControlID="txtYearOfConstructionIns" Name="YearOfConstruction"
				PropertyName="Text" Type="Int32" />
			<asp:ControlParameter ControlID="txtSpecialDeductionIns" Name="SpecialDeduction"
				PropertyName="Text" Type="Decimal" />
			<asp:ControlParameter ControlID="txtLiftExpenseIns" Name="LiftExpense" PropertyName="Text"
				Type="Decimal" />
		</SelectParameters>
	</asp:ObjectDataSource>
	&nbsp;
	<asp:FormView ID="fvResult" runat="server" OnItemUpdated="fvResult_ItemUpdated"
		DefaultMode="Edit">
		<EditItemTemplate>
			OtherFeeRate:
			<asp:TextBox ID="OtherFeeRateTextBox" runat="server" Text='<%# Bind("OtherFeeRate") %>'>
			</asp:TextBox><br />
			InternalElectrificationRate:
			<asp:TextBox ID="InternalElectrificationRateTextBox" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'>
			</asp:TextBox><br />
			YearOfConstruction:
			<asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction") %>'>
			</asp:TextBox><br />
			EstimatedPriceOfConstruction:
			<asp:TextBox ID="EstimatedPriceOfConstructionTextBox" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'>
			</asp:TextBox><br />
			OtherFees:
			<asp:TextBox ID="OtherFeesTextBox" runat="server" Text='<%# Bind("OtherFees") %>'>
			</asp:TextBox><br />
			PlotNo:
			<asp:TextBox ID="PlotNoTextBox" runat="server" Text='<%# Bind("PlotNo") %>'>
			</asp:TextBox><br />
			DevelopmentRate:
			<asp:TextBox ID="DevelopmentRateTextBox" runat="server" Text='<%# Bind("DevelopmentRate") %>'>
			</asp:TextBox><br />
			Remarks:
			<asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>'>
			</asp:TextBox><br />
			SpecialDeduction:
			<asp:TextBox ID="SpecialDeductionTextBox" runat="server" Text='<%# Bind("SpecialDeduction") %>'>
			</asp:TextBox><br />
			LiftExpense:
			<asp:TextBox ID="LiftExpenseTextBox" runat="server" Text='<%# Bind("LiftExpense") %>'>
			</asp:TextBox><br />
			AreaOfLand:
			<asp:TextBox ID="AreaOfLandTextBox" runat="server" Text='<%# Bind("AreaOfLand") %>'>
			</asp:TextBox><br />
			StampDuty:
			<asp:TextBox ID="StampDutyTextBox" runat="server" Text='<%# Bind("StampDuty") %>'>
			</asp:TextBox><br />
			PlinthAreaOfConstruction:
			<asp:TextBox ID="PlinthAreaOfConstructionTextBox" runat="server" Text='<%# Bind("PlinthAreaOfConstruction") %>'>
			</asp:TextBox><br />
			NetPrice:
			<asp:TextBox ID="NetPriceTextBox" runat="server" Text='<%# Bind("NetPrice") %>'>
			</asp:TextBox><br />
			ConstructionRate:
			<asp:TextBox ID="ConstructionRateTextBox" runat="server" Text='<%# Bind("ConstructionRate") %>'>
			</asp:TextBox><br />
			EstimatedPrice:
			<asp:TextBox ID="EstimatedPriceTextBox" runat="server" Text='<%# Bind("EstimatedPrice") %>'>
			</asp:TextBox><br />
			TpSchemeNo:
			<asp:TextBox ID="TpSchemeNoTextBox" runat="server" Text='<%# Bind("TpSchemeNo") %>'>
			</asp:TextBox><br />
			InternalElectrificationExpense:
			<asp:TextBox ID="InternalElectrificationExpenseTextBox" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'>
			</asp:TextBox><br />
			TypeOfConstruction:
			<asp:TextBox ID="TypeOfConstructionTextBox" runat="server" Text='<%# Bind("TypeOfConstruction") %>'>
			</asp:TextBox><br />
			LifeOfConstruction:
			<asp:TextBox ID="LifeOfConstructionTextBox" runat="server" Text='<%# Bind("LifeOfConstruction") %>'>
			</asp:TextBox><br />
			Depreciation:
			<asp:TextBox ID="DepreciationTextBox" runat="server" Text='<%# Bind("Depreciation") %>'>
			</asp:TextBox><br />
			ValuationOfProperty:
			<asp:TextBox ID="ValuationOfPropertyTextBox" runat="server" Text='<%# Bind("ValuationOfProperty") %>'>
			</asp:TextBox><br />
			DevelopmentExpense:
			<asp:TextBox ID="DevelopmentExpenseTextBox" runat="server" Text='<%# Bind("DevelopmentExpense") %>'>
			</asp:TextBox><br />
			PriceOfLand:
			<asp:TextBox ID="PriceOfLandTextBox" runat="server" Text='<%# Bind("PriceOfLand") %>'>
			</asp:TextBox><br />
			ConstructionExpense:
			<asp:TextBox ID="ConstructionExpenseTextBox" runat="server" Text='<%# Bind("ConstructionExpense") %>'>
			</asp:TextBox><br />
			<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
				Text="Update">
			</asp:LinkButton>
			<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
				Text="Cancel">
			</asp:LinkButton>
		</EditItemTemplate>
		<InsertItemTemplate>
			OtherFeeRate:
			<asp:TextBox ID="OtherFeeRateTextBox" runat="server" Text='<%# Bind("OtherFeeRate") %>'>
			</asp:TextBox><br />
			InternalElectrificationRate:
			<asp:TextBox ID="InternalElectrificationRateTextBox" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'>
			</asp:TextBox><br />
			YearOfConstruction:
			<asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction") %>'>
			</asp:TextBox><br />
			EstimatedPriceOfConstruction:
			<asp:TextBox ID="EstimatedPriceOfConstructionTextBox" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'>
			</asp:TextBox><br />
			OtherFees:
			<asp:TextBox ID="OtherFeesTextBox" runat="server" Text='<%# Bind("OtherFees") %>'>
			</asp:TextBox><br />
			PlotNo:
			<asp:TextBox ID="PlotNoTextBox" runat="server" Text='<%# Bind("PlotNo") %>'>
			</asp:TextBox><br />
			DevelopmentRate:
			<asp:TextBox ID="DevelopmentRateTextBox" runat="server" Text='<%# Bind("DevelopmentRate") %>'>
			</asp:TextBox><br />
			Remarks:
			<asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>'>
			</asp:TextBox><br />
			SpecialDeduction:
			<asp:TextBox ID="SpecialDeductionTextBox" runat="server" Text='<%# Bind("SpecialDeduction") %>'>
			</asp:TextBox><br />
			LiftExpense:
			<asp:TextBox ID="LiftExpenseTextBox" runat="server" Text='<%# Bind("LiftExpense") %>'>
			</asp:TextBox><br />
			AreaOfLand:
			<asp:TextBox ID="AreaOfLandTextBox" runat="server" Text='<%# Bind("AreaOfLand") %>'>
			</asp:TextBox><br />
			StampDuty:
			<asp:TextBox ID="StampDutyTextBox" runat="server" Text='<%# Bind("StampDuty") %>'>
			</asp:TextBox><br />
			PlinthAreaOfConstruction:
			<asp:TextBox ID="PlinthAreaOfConstructionTextBox" runat="server" Text='<%# Bind("PlinthAreaOfConstruction") %>'>
			</asp:TextBox><br />
			NetPrice:
			<asp:TextBox ID="NetPriceTextBox" runat="server" Text='<%# Bind("NetPrice") %>'>
			</asp:TextBox><br />
			ConstructionRate:
			<asp:TextBox ID="ConstructionRateTextBox" runat="server" Text='<%# Bind("ConstructionRate") %>'>
			</asp:TextBox><br />
			EstimatedPrice:
			<asp:TextBox ID="EstimatedPriceTextBox" runat="server" Text='<%# Bind("EstimatedPrice") %>'>
			</asp:TextBox><br />
			TpSchemeNo:
			<asp:TextBox ID="TpSchemeNoTextBox" runat="server" Text='<%# Bind("TpSchemeNo") %>'>
			</asp:TextBox><br />
			InternalElectrificationExpense:
			<asp:TextBox ID="InternalElectrificationExpenseTextBox" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'>
			</asp:TextBox><br />
			TypeOfConstruction:
			<asp:TextBox ID="TypeOfConstructionTextBox" runat="server" Text='<%# Bind("TypeOfConstruction") %>'>
			</asp:TextBox><br />
			LifeOfConstruction:
			<asp:TextBox ID="LifeOfConstructionTextBox" runat="server" Text='<%# Bind("LifeOfConstruction") %>'>
			</asp:TextBox><br />
			Depreciation:
			<asp:TextBox ID="DepreciationTextBox" runat="server" Text='<%# Bind("Depreciation") %>'>
			</asp:TextBox><br />
			ValuationOfProperty:
			<asp:TextBox ID="ValuationOfPropertyTextBox" runat="server" Text='<%# Bind("ValuationOfProperty") %>'>
			</asp:TextBox><br />
			DevelopmentExpense:
			<asp:TextBox ID="DevelopmentExpenseTextBox" runat="server" Text='<%# Bind("DevelopmentExpense") %>'>
			</asp:TextBox><br />
			PriceOfLand:
			<asp:TextBox ID="PriceOfLandTextBox" runat="server" Text='<%# Bind("PriceOfLand") %>'>
			</asp:TextBox><br />
			ConstructionExpense:
			<asp:TextBox ID="ConstructionExpenseTextBox" runat="server" Text='<%# Bind("ConstructionExpense") %>'>
			</asp:TextBox><br />
			<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
				Text="Insert">
			</asp:LinkButton>
			<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
				Text="Cancel">
			</asp:LinkButton>
		</InsertItemTemplate>
	</asp:FormView>
	<br />
	<br />
	<br />
	<br />
</asp:Content>
