<%@ page autoeventwireup="true" inherits="Valuation_ValuationRequestDetails, App_Web_1opp1cfq" language="C#" masterpagefile="~/IGRSS_Default.master" title="Untitled Page" validaterequest="false" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<asp:FormView ID="FormView1" runat="server" DataSourceID="odsValuationRequest" DataKeyNames="AdjudicationId"
		DefaultMode="Edit" OnPageIndexChanging="FormView1_PageIndexChanging" Width="746px" >
		<EditItemTemplate>
			<table>
				<tr>
					<td>
						AdjudicationId:
					</td>
					<td>
						<asp:Label ID="AdjudicationIdLabel1" runat="server" Text='<%# Eval("AdjudicationId") %>'>
						</asp:Label>
					</td>
				</tr>
				<tr>
					<td>
						Village_CityName:
					</td>
					<td>
						<asp:TextBox ID="Village_CityNameTextBox" runat="server" Text='<%# Bind("Village_CityName") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						TPSchemeNo:
					</td>
					<td>
						<asp:TextBox ID="TPSchemeNoTextBox" runat="server" Text='<%# Bind("TPSchemeNo", "{0}") %>'></asp:TextBox><br />
					</td>
					<td>
						TPSchemeName:
					</td>
					<td>
						<asp:TextBox ID="TPSchemeNameTextBox" runat="server" Text='<%# Bind("TPSchemeName", "{0}") %>'></asp:TextBox><br />
					</td>
				</tr>
				<tr>
					<td>
						FinalPlotNo:
					</td>
					<td>
						<asp:TextBox ID="FinalPlotNoTextBox" runat="server" Text='<%# Bind("FinalPlotNo", "{0}") %>'></asp:TextBox><br />
					</td>
					<td>
						CitySurveyNo:
					</td>
					<td>
						<asp:TextBox ID="CitySurveyNoTextBox" runat="server" Text='<%# Bind("CitySurveyNo", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						RevenueSurveyNo:
					</td>
					<td>
						<asp:TextBox ID="RevenueSurveyNoTextBox" runat="server" Text='<%# Bind("RevenueSurveyNo", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						Ward_SubWardNo:
					</td>
					<td>
						<asp:TextBox ID="Ward_SubWardNoTextBox" runat="server" Text='<%# Bind("Ward_SubWardNo", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						NameOfExecutingParty:
					</td>
					<td>
						<asp:TextBox ID="NameOfExecutingPartyTextBox" runat="server" Text='<%# Bind("NameOfExecutingParty", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						AddressOfExecutingParty:
					</td>
					<td>
						<asp:TextBox ID="AddressOfExecutingPartyTextBox" runat="server" Text='<%# Bind("AddressOfExecutingParty") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						NameOfClaimingParty:
					</td>
					<td>
						<asp:TextBox ID="NameOfClaimingPartyTextBox" runat="server" Text='<%# Bind("NameOfClaimingParty") %>'>
						</asp:TextBox>
					</td>
					<td>
						AddressOfClaimingParty:
					</td>
					<td>
						<asp:TextBox ID="AddressOfClaimingPartyTextBox" runat="server" Text='<%# Bind("AddressOfClaimingParty") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						AreaOfPlot:
					</td>
					<td>
						<asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						AreaOfConstruction:
					</td>
					<td>
						<asp:TextBox ID="AreaOfConstructionTextBox" runat="server" Text='<%# Bind("AreaOfConstruction", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						YearOfConstruction:
					</td>
					<td>
						<asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						TypeOfProperty:
					</td>
					<td>
						<asp:TextBox ID="TypeOfPropertyTextBox" runat="server" Text='<%# Bind("TypeOfProperty", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						HeightOfFloor:
					</td>
					<td>
						<asp:TextBox ID="HeightOfFloorTextBox" runat="server" Text='<%# Bind("HeightOfFloor", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						TypeOfTiles:
					</td>
					<td>
						<asp:TextBox ID="TypeOfTilesTextBox" runat="server" Text='<%# Bind("TypeOfTiles", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						WallFurnishing:
					</td>
					<td>
						<asp:TextBox ID="WallFurnishingTextBox" runat="server" Text='<%# Bind("WallFurnishing") %>'>
						</asp:TextBox>
					</td>
					<td>
						NoOfBathrooms:
					</td>
					<td>
						<asp:TextBox ID="NoOfBathroomsTextBox" runat="server" Text='<%# Bind("NoOfBathrooms", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						DescriptionOfCommProperty:
					</td>
					<td>
						<asp:TextBox ID="DescriptionOfCommPropertyTextBox" runat="server" Text='<%# Bind("DescriptionOfCommProperty", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ShopsOnGroundFloor:
					</td>
					<td>
						<asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("ShopsOnGroundFloor") %>' />
					</td>
				</tr>
				<tr>
					<td>
						AnyOtherProperty:
					</td>
					<td>
						<asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("AnyOtherProperty") %>' />
					</td>
					<td>
						HeightOfTheSlab:
					</td>
					<td>
						<asp:TextBox ID="HeightOfTheSlabTextBox" runat="server" Text='<%# Bind("HeightOfTheSlab", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						TypeOfElectricfication:
					</td>
					<td>
						<asp:TextBox ID="TypeOfElectricficationTextBox" runat="server" Text='<%# Bind("TypeOfElectricfication", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						CompoundWall:
					</td>
					<asp:CheckBox ID="CheckBox4" runat="server" Text='<%# Bind("CompoundWall") %>' />
					<td>
					</td>
				</tr>
				<tr>
					<td>
						WaterStorageFacility:
						</td>
						<td>
						
						<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("WaterStorageFacility")%>' />
					</td>
					<td>
						DranageSystem:
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						AreaOfEachLift:
					</td>
					<td>
						<asp:TextBox ID="AreaOfEachLiftTextBox" runat="server" Text='<%# Bind("AreaOfEachLift", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						InternalRoad:
					</td>
				</tr>
				<tr>
					<td>
						MadeValuationBefore:
					</td>
					<td>
						NameOfApplicant:
					</td>
					<td>
						<asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						WorkFlowInstanceId:
					</td>
					<td>
						<asp:TextBox ID="WorkFlowInstanceIdTextBox" runat="server" Text='<%# Bind("WorkFlowInstanceId", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						WorkFlowTrace:
					</td>
					<td>
						<asp:TextBox ID="WorkFlowTraceTextBox" runat="server" Text='<%# Bind("WorkFlowTrace", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						ValuationReport:
					</td>
					<td>
						<asp:TextBox ID="ValuationReportTextBox" runat="server" Text='<%# Bind("ValuationReport", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ValuationStatus:
					</td>
					<td>
						<asp:TextBox ID="ValuationStatusTextBox" runat="server" Text='<%# Bind("ValuationStatus", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						CreatedBy:
					</td>
					<td>
						<asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						CreatedAt:
					</td>
					<td>
						<asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						ModifiedBy:
					</td>
					<td>
						<asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ModifiedAt:
					</td>
					<td>
						<asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						Deleted:
					</td>
					<td>
						Info:
					</td>
					<td>
						<asp:TextBox ID="InfoTextBox" runat="server" Text='<%# Bind("Info", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
							Text="Calculate">
						</asp:LinkButton>
						<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="Cancel">
						</asp:LinkButton>
					</td>
				</tr>
			</table>
		</EditItemTemplate>
		<InsertItemTemplate>
			Village_CityName:
			<asp:TextBox ID="Village_CityNameTextBox" runat="server" Text='<%# Bind("Village_CityName", "{0}") %>'>
			</asp:TextBox><br />
			TPSchemeNo:
			<asp:TextBox ID="TPSchemeNoTextBox" runat="server" Text='<%# Bind("TPSchemeNo", "{0}") %>'>
			</asp:TextBox><br />
			TPSchemeName:
			<asp:TextBox ID="TPSchemeNameTextBox" runat="server" Text='<%# Bind("TPSchemeName", "{0}") %>'>
			</asp:TextBox><br />
			FinalPlotNo:
			<asp:TextBox ID="FinalPlotNoTextBox" runat="server" Text='<%# Bind("FinalPlotNo", "{0}") %>'>
			</asp:TextBox><br />
			CitySurveyNo:
			<asp:TextBox ID="CitySurveyNoTextBox" runat="server" Text='<%# Bind("CitySurveyNo", "{0}") %>'>
			</asp:TextBox><br />
			RevenueSurveyNo:
			<asp:TextBox ID="RevenueSurveyNoTextBox" runat="server" Text='<%# Bind("RevenueSurveyNo", "{0}") %>'>
			</asp:TextBox><br />
			Ward_SubWardNo:
			<asp:TextBox ID="Ward_SubWardNoTextBox" runat="server" Text='<%# Bind("Ward_SubWardNo", "{0}") %>'>
			</asp:TextBox><br />
			NameOfExecutingParty:
			<asp:TextBox ID="NameOfExecutingPartyTextBox" runat="server" Text='<%# Bind("NameOfExecutingParty", "{0}") %>'>
			</asp:TextBox><br />
			AddressOfExecutingParty:
			<asp:TextBox ID="AddressOfExecutingPartyTextBox" runat="server" Text='<%# Bind("AddressOfExecutingParty", "{0}") %>'>
			</asp:TextBox><br />
			NameOfClaimingParty:
			<asp:TextBox ID="NameOfClaimingPartyTextBox" runat="server" Text='<%# Bind("NameOfClaimingParty", "{0}") %>'>
			</asp:TextBox><br />
			AddressOfClaimingParty:
			<asp:TextBox ID="AddressOfClaimingPartyTextBox" runat="server" Text='<%# Bind("AddressOfClaimingParty", "{0}") %>'>
			</asp:TextBox><br />
			AreaOfPlot:
			<asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot", "{0}") %>'>
			</asp:TextBox><br />
			AreaOfConstruction:
			<asp:TextBox ID="AreaOfConstructionTextBox" runat="server" Text='<%# Bind("AreaOfConstruction", "{0}") %>'>
			</asp:TextBox><br />
			YearOfConstruction:
			<asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction", "{0}") %>'>
			</asp:TextBox><br />
			TypeOfProperty:
			<asp:TextBox ID="TypeOfPropertyTextBox" runat="server" Text='<%# Bind("TypeOfProperty", "{0}") %>'>
			</asp:TextBox><br />
			HeightOfFloor:
			<asp:TextBox ID="HeightOfFloorTextBox" runat="server" Text='<%# Bind("HeightOfFloor", "{0}") %>'>
			</asp:TextBox><br />
			TypeOfTiles:
			<asp:TextBox ID="TypeOfTilesTextBox" runat="server" Text='<%# Bind("TypeOfTiles", "{0}") %>'>
			</asp:TextBox><br />
			WallFurnishing:
			<asp:TextBox ID="WallFurnishingTextBox" runat="server" Text='<%# Bind("WallFurnishing", "{0}") %>'>
			</asp:TextBox><br />
			NoOfBathrooms:
			<asp:TextBox ID="NoOfBathroomsTextBox" runat="server" Text='<%# Bind("NoOfBathrooms", "{0}") %>'>
			</asp:TextBox><br />
			DescriptionOfCommProperty:
			<asp:TextBox ID="DescriptionOfCommPropertyTextBox" runat="server" Text='<%# Bind("DescriptionOfCommProperty", "{0}") %>'>
			</asp:TextBox><br />
			ShopsOnGroundFloor:
			<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ShopsOnGroundFloor", "{0}") %>'></asp:TextBox>
			<br />
			AnyOtherProperty:
			<br />
			HeightOfTheSlab:
			<asp:TextBox ID="HeightOfTheSlabTextBox" runat="server" Text='<%# Bind("HeightOfTheSlab", "{0}") %>'>
			</asp:TextBox><br />
			TypeOfElectricfication:
			<asp:TextBox ID="TypeOfElectricficationTextBox" runat="server" Text='<%# Bind("TypeOfElectricfication", "{0}") %>'>
			</asp:TextBox><br />
			CompoundWall:
			<br />
			WaterStorageFacility:
			<br />
			DranageSystem:
			<br />
			AreaOfEachLift:
			<asp:TextBox ID="AreaOfEachLiftTextBox" runat="server" Text='<%# Bind("AreaOfEachLift", "{0}") %>'>
			</asp:TextBox><br />
			InternalRoad:
			<br />
			MadeValuationBefore:
			<br />
			NameOfApplicant:
			<asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant", "{0}") %>'>
			</asp:TextBox><br />
			WorkFlowInstanceId:
			<asp:TextBox ID="WorkFlowInstanceIdTextBox" runat="server" Text='<%# Bind("WorkFlowInstanceId", "{0}") %>'>
			</asp:TextBox><br />
			WorkFlowTrace:
			<asp:TextBox ID="WorkFlowTraceTextBox" runat="server" Text='<%# Bind("WorkFlowTrace", "{0}") %>'>
			</asp:TextBox><br />
			ValuationReport:
			<asp:TextBox ID="ValuationReportTextBox" runat="server" Text='<%# Bind("ValuationReport", "{0}") %>'>
			</asp:TextBox><br />
			ValuationStatus:
			<asp:TextBox ID="ValuationStatusTextBox" runat="server" Text='<%# Bind("ValuationStatus", "{0}") %>'>
			</asp:TextBox><br />
			CreatedBy:
			<asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy", "{0}") %>'>
			</asp:TextBox><br />
			CreatedAt:
			<asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt", "{0}") %>'>
			</asp:TextBox><br />
			ModifiedBy:
			<asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy", "{0}") %>'>
			</asp:TextBox><br />
			ModifiedAt:
			<asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt", "{0}") %>'>
			</asp:TextBox><br />
			Deleted:
			<br />
			Info:
			<asp:TextBox ID="InfoTextBox" runat="server" Text='<%# Bind("Info", "{0}") %>'>
			</asp:TextBox><br />
			<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
				Text="Insert">
			</asp:LinkButton>
			<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
				Text="Cancel">
			</asp:LinkButton>
		</InsertItemTemplate>
		<ItemTemplate>
			<table>
				<tr>
					<td>
						AdjudicationId:
					</td>
					<td>
						<asp:Label ID="AdjudicationIdLabel1" runat="server" Text='<%# Eval("AdjudicationId") %>'>
						</asp:Label>
					</td>
				</tr>
				<tr>
					<td>
						Village_CityName:
					</td>
					<td>
						<asp:TextBox ID="Village_CityNameTextBox" runat="server" Text='<%# Bind("Village_CityName") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						TPSchemeNo:
					</td>
					<td>
						<asp:TextBox ID="TPSchemeNoTextBox" runat="server" Text='<%# Bind("TPSchemeNo", "{0}") %>'></asp:TextBox><br />
					</td>
					<td>
						TPSchemeName:
					</td>
					<td>
						<asp:TextBox ID="TPSchemeNameTextBox" runat="server" Text='<%# Bind("TPSchemeName", "{0}") %>'></asp:TextBox><br />
					</td>
				</tr>
				<tr>
					<td>
						FinalPlotNo:
					</td>
					<td>
						<asp:TextBox ID="FinalPlotNoTextBox" runat="server" Text='<%# Bind("FinalPlotNo", "{0}") %>'></asp:TextBox><br />
					</td>
					<td>
						CitySurveyNo:
					</td>
					<td>
						<asp:TextBox ID="CitySurveyNoTextBox" runat="server" Text='<%# Bind("CitySurveyNo", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						RevenueSurveyNo:
					</td>
					<td>
						<asp:TextBox ID="RevenueSurveyNoTextBox" runat="server" Text='<%# Bind("RevenueSurveyNo", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						Ward_SubWardNo:
					</td>
					<td>
						<asp:TextBox ID="Ward_SubWardNoTextBox" runat="server" Text='<%# Bind("Ward_SubWardNo", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						NameOfExecutingParty:
					</td>
					<td>
						<asp:TextBox ID="NameOfExecutingPartyTextBox" runat="server" Text='<%# Bind("NameOfExecutingParty", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						AddressOfExecutingParty:
					</td>
					<td>
						<asp:TextBox ID="AddressOfExecutingPartyTextBox" runat="server" Text='<%# Bind("AddressOfExecutingParty") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						NameOfClaimingParty:
					</td>
					<td>
						<asp:TextBox ID="NameOfClaimingPartyTextBox" runat="server" Text='<%# Bind("NameOfClaimingParty") %>'>
						</asp:TextBox>
					</td>
					<td>
						AddressOfClaimingParty:
					</td>
					<td>
						<asp:TextBox ID="AddressOfClaimingPartyTextBox" runat="server" Text='<%# Bind("AddressOfClaimingParty") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						AreaOfPlot:
					</td>
					<td>
						<asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						AreaOfConstruction:
					</td>
					<td>
						<asp:TextBox ID="AreaOfConstructionTextBox" runat="server" Text='<%# Bind("AreaOfConstruction", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						YearOfConstruction:
					</td>
					<td>
						<asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						TypeOfProperty:
					</td>
					<td>
						<asp:TextBox ID="TypeOfPropertyTextBox" runat="server" Text='<%# Bind("TypeOfProperty", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						HeightOfFloor:
					</td>
					<td>
						<asp:TextBox ID="HeightOfFloorTextBox" runat="server" Text='<%# Bind("HeightOfFloor", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						TypeOfTiles:
					</td>
					<td>
						<asp:TextBox ID="TypeOfTilesTextBox" runat="server" Text='<%# Bind("TypeOfTiles", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						WallFurnishing:
					</td>
					<td>
						<asp:TextBox ID="WallFurnishingTextBox" runat="server" Text='<%# Bind("WallFurnishing") %>'>
						</asp:TextBox>
					</td>
					<td>
						NoOfBathrooms:
					</td>
					<td>
						<asp:TextBox ID="NoOfBathroomsTextBox" runat="server" Text='<%# Bind("NoOfBathrooms", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						DescriptionOfCommProperty:
					</td>
					<td>
						<asp:TextBox ID="DescriptionOfCommPropertyTextBox" runat="server" Text='<%# Bind("DescriptionOfCommProperty", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ShopsOnGroundFloor:
					</td>
				</tr>
				<tr>
					<td>
						AnyOtherProperty:
					</td>
					<td>
						HeightOfTheSlab:
					</td>
					<td>
						<asp:TextBox ID="HeightOfTheSlabTextBox" runat="server" Text='<%# Bind("HeightOfTheSlab", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						TypeOfElectricfication:
					</td>
					<td>
						<asp:TextBox ID="TypeOfElectricficationTextBox" runat="server" Text='<%# Bind("TypeOfElectricfication", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						CompoundWall:
					</td>
				</tr>
				<tr>
					<td>
						WaterStorageFacility:
					</td>
					<td>
						DranageSystem:
					</td>
				</tr>
				<tr>
					<td>
						AreaOfEachLift:
					</td>
					<td>
						<asp:TextBox ID="AreaOfEachLiftTextBox" runat="server" Text='<%# Bind("AreaOfEachLift", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						InternalRoad:
					</td>
				</tr>
				<tr>
					<td>
						MadeValuationBefore:
					</td>
					<td>
						NameOfApplicant:
					</td>
					<td>
						<asp:TextBox ID="NameOfApplicantTextBox" runat="server" Text='<%# Bind("NameOfApplicant", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						WorkFlowInstanceId:
					</td>
					<td>
						<asp:TextBox ID="WorkFlowInstanceIdTextBox" runat="server" Text='<%# Bind("WorkFlowInstanceId", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						WorkFlowTrace:
					</td>
					<td>
						<asp:TextBox ID="WorkFlowTraceTextBox" runat="server" Text='<%# Bind("WorkFlowTrace", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						ValuationReport:
					</td>
					<td>
						<asp:TextBox ID="ValuationReportTextBox" runat="server" Text='<%# Bind("ValuationReport", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ValuationStatus:
					</td>
					<td>
						<asp:TextBox ID="ValuationStatusTextBox" runat="server" Text='<%# Bind("ValuationStatus", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						CreatedBy:
					</td>
					<td>
						<asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						CreatedAt:
					</td>
					<td>
						<asp:TextBox ID="CreatedAtTextBox" runat="server" Text='<%# Bind("CreatedAt", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						ModifiedBy:
					</td>
					<td>
						<asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy", "{0}") %>'>
						</asp:TextBox>
					</td>
					<td>
						ModifiedAt:
					</td>
					<td>
						<asp:TextBox ID="ModifiedAtTextBox" runat="server" Text='<%# Bind("ModifiedAt", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						Deleted:
					</td>
					<td>
						Info:
					</td>
					<td>
						<asp:TextBox ID="InfoTextBox" runat="server" Text='<%# Bind("Info", "{0}") %>'>
						</asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
							Text="Edit">
						</asp:LinkButton>
					</td>
				</tr>
			</table>
		</ItemTemplate>
	</asp:FormView>
    dsValuationRequest'
	<asp:ObjectDataSource ID="odsValuationRequest" runat="server"
		SelectMethod="GetValuationRequests" TypeName="IGRSS.BusinessLogicLayer.Valuation.ValuationRequestBLL"
		InsertMethod="InsertData" UpdateMethod="UpdateValuationRequest" OnSelecting="odsValuationRequest_Selecting">
		<InsertParameters>
			<asp:Parameter Name="Village_CityName" Type="String" />
			<asp:Parameter Name="TPSchemeNo" Type="Int32" />
			<asp:Parameter Name="TPSchemeName" Type="String" />
			<asp:Parameter Name="FinalPlotNo" Type="Int32" />
			<asp:Parameter Name="CitySurveyNo" Type="Int32" />
			<asp:Parameter Name="RevenueSurveyNo" Type="Int32" />
			<asp:Parameter Name="Ward_SubWardNo" Type="Int32" />
			<asp:Parameter Name="NameOfExecutingParty" Type="String" />
			<asp:Parameter Name="AddressOfExecutingParty" Type="String" />
			<asp:Parameter Name="NameOfClaimingParty" Type="String" />
			<asp:Parameter Name="AddressOfClaimingParty" Type="String" />
			<asp:Parameter Name="AreaOfPlot" Type="Double" />
			<asp:Parameter Name="AreaOfConstruction" Type="Double" />
			<asp:Parameter Name="YearOfConstruction" Type="Int32" />
			<asp:Parameter Name="TypeOfProperty" Type="String" />
			<asp:Parameter Name="HeightOfFloor" Type="Double" />
			<asp:Parameter Name="TypeOfTiles" Type="String" />
			<asp:Parameter Name="WallFurnishing" Type="String" />
			<asp:Parameter Name="NoOfBathrooms" Type="Int32" />
			<asp:Parameter Name="DescriptionOfCommProperty" Type="String" />
			<asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
			<asp:Parameter Name="AnyOtherProperty" Type="Boolean" />
			<asp:Parameter Name="HeightOfTheSlab" Type="Double" />
			<asp:Parameter Name="TypeOfElectricfication" Type="String" />
			<asp:Parameter Name="CompoundWall" Type="Boolean" />
			<asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
			<asp:Parameter Name="DranageSystem" Type="Boolean" />
			<asp:Parameter Name="AreaOfEachLift" Type="Double" />
			<asp:Parameter Name="InternalRoad" Type="Boolean" />
			<asp:Parameter Name="MadeValuationBefore" Type="Boolean" />
			<asp:Parameter Name="NameOfApplicant" Type="String" />
			<asp:Parameter Name="WorkFlowInstanceId" Type="Object" />
			<asp:Parameter Name="WorkFlowTrace" Type="Object" />
			<asp:Parameter Name="ValuationReport" Type="Object" />
			<asp:Parameter Name="ValuationStatus" Type="Int32" />
			<asp:Parameter Name="CreatedBy" Type="Decimal" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
			<asp:Parameter Name="ModifiedBy" Type="Decimal" />
			<asp:Parameter Name="ModifiedAt" Type="DateTime" />
			<asp:Parameter Name="Deleted" Type="Boolean" />
			<asp:Parameter Name="Info" Type="Object" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Village_CityName" Type="String" />
			<asp:Parameter Name="TPSchemeNo" Type="Int32" />
			<asp:Parameter Name="TPSchemeName" Type="String" />
			<asp:Parameter Name="FinalPlotNo" Type="Int32" />
			<asp:Parameter Name="CitySurveyNo" Type="Int32" />
			<asp:Parameter Name="RevenueSurveyNo" Type="Int32" />
			<asp:Parameter Name="Ward_SubWardNo" Type="Int32" />
			<asp:Parameter Name="NameOfExecutingParty" Type="String" />
			<asp:Parameter Name="AddressOfExecutingParty" Type="String" />
			<asp:Parameter Name="NameOfClaimingParty" Type="String" />
			<asp:Parameter Name="AddressOfClaimingParty" Type="String" />
			<asp:Parameter Name="AreaOfPlot" Type="Single" />
			<asp:Parameter Name="AreaOfConstruction" Type="Single" />
			<asp:Parameter Name="YearOfConstruction" Type="Int32" />
			<asp:Parameter Name="TypeOfProperty" Type="String" />
			<asp:Parameter Name="HeightOfFloor" Type="Single" />
			<asp:Parameter Name="TypeOfTiles" Type="String" />
			<asp:Parameter Name="WallFurnishing" Type="String" />
			<asp:Parameter Name="NoOfBathrooms" Type="Int32" />
			<asp:Parameter Name="DescriptionOfCommProperty" Type="String" />
			<asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
			<asp:Parameter Name="AnyOtherProperty" Type="Boolean" />
			<asp:Parameter Name="HeightOfTheSlab" Type="Single" />
			<asp:Parameter Name="TypeOfElectricfication" Type="String" />
			<asp:Parameter Name="CompoundWall" Type="Boolean" />
			<asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
			<asp:Parameter Name="DranageSystem" Type="Boolean" />
			<asp:Parameter Name="AreaOfEachLift" Type="Single" />
			<asp:Parameter Name="InternalRoad" Type="Boolean" />
			<asp:Parameter Name="MadeValuationBefore" Type="Boolean" />
			<asp:Parameter Name="NameOfApplicant" Type="String" />
			<asp:Parameter Name="WorkFlowInstanceId" Type="Object" />
			<asp:Parameter Name="WorkFlowTrace" Type="Object" />
			<asp:Parameter Name="ValuationReport" Type="Object" />
			<asp:Parameter Name="ValuationStatus" Type="Int32" />
			<asp:Parameter Name="CreatedBy" Type="Decimal" />
			<asp:Parameter Name="CreatedAt" Type="DateTime" />
			<asp:Parameter Name="ModifiedBy" Type="Decimal" />
			<asp:Parameter Name="ModifiedAt" Type="DateTime" />
			<asp:Parameter Name="Deleted" Type="Boolean" />
			<asp:Parameter Name="Info" Type="Object" />
			<asp:Parameter Name="original_AdjudicationId" Type="Decimal" />
		</UpdateParameters>
	</asp:ObjectDataSource>
</asp:Content>
