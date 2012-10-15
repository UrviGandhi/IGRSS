<%@ page autoeventwireup="true" culture="auto" inherits="ValuationApplication, App_Web_ggratpvb" language="C#" masterpagefile="~/IGRSS_Default.master" uiculture="auto" trace="true" title="Valuation Application" meta:resourcekey="PageAdjApplication" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
    <asp:MultiView ID="mvAdjRequest" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSearch" runat="server">
            <table id="TABLE1" width="100%">
                <tr>
                    <td align="left" class="labelColumn">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number"></asp:Label></td>
                    <td align="left" class="textColumn">
                        <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearchAppNo" runat="server" Text="Search" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 198px">
                        <asp:GridView ID="gdAdjReuDtl" runat="server" AutoGenerateColumns="False" DataKeyNames="ValuationFormId,AdjudicationId"
                            DataSourceID="odsAdjReqDtl" OnSelectedIndexChanged="gdAdjReuDtl_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="FilePrefix" HeaderText="File Prefix" SortExpression="FilePrefix" />
                                <asp:BoundField DataField="FileSlNo" HeaderText="File Sl. No" SortExpression="FileSlNo" />
                                <asp:BoundField DataField="FileYear" HeaderText="File Year" SortExpression="FileYear" />
                                <asp:BoundField DataField="ReceiptNumber" HeaderText="Receipt Number" SortExpression="ReceiptNumber" />
                                <asp:BoundField DataField="AdjudicationTotalFees" HeaderText="Adjudication Total Fees"
                                    SortExpression="AdjudicationTotalFees" />
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vieFM" runat="server">
            <asp:FormView ID="fvValuationForm" runat="server" DataKeyNames="ValuationFormId"
                DataSourceID="ObjectDataSource1" meta:resourcekey="fvValuationForm" OnDataBound="fvValuationForm_DataBound"
                DefaultMode="Insert" OnItemInserting="fvValuationForm_ItemInserting" OnItemUpdated="fvValuationForm_ItemUpdated"
                OnItemInserted="fvValuationForm_ItemInserted">
                <EditItemTemplate>
                    <table style="text-align: left" width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPropertyDetailsHeadingUpd" runat="server" meta:resourcekey="lblPropertyDetailsHeadingUpd"
                                    SkinID="SubHeading" Text="Property Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblDistNameUpd" runat="server" meta:resourcekey="lblDistNameUpd" Text="Village/City Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDistNameUpd" runat="server" meta:resourcekey="txtDistNameUpd"
                                    Text='<%# Bind("Village_CityName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTpSchemeNoUpd" runat="server" meta:resourcekey="lblTpSchemeNoUpd"
                                    Text="T.P Scheme No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTpSchemeNoUpd" MaxLength="20" runat="server" meta:resourcekey="txtTpSchemeNoUpd"
                                    Text='<%# Bind("TPSchemeNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblTpSchemeNameUpd" runat="server" meta:resourcekey="lblTpSchemeNameUpd"
                                    Text="T.P Scheme Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTpSchemeNameUpd" runat="server" meta:resourcekey="txtTpSchemeNameUpd"
                                    Text='<%# Bind("TPSchemeName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblFinalPlotNoUpd" runat="server" meta:resourcekey="lblFinalPlotNoUpd"
                                    Text="Final Plot No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFinalPlotNoUpd" MaxLength="20" runat="server" meta:resourcekey="txtFinalPlotNoUpd"
                                    Text='<%# Bind("FinalPlotNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblCitySurveyNoUpd" runat="server" meta:resourcekey="lblCitySurveyNoUpd"
                                    Text="City Survey No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCitySurveyNoUpd" MaxLength="20" runat="server" meta:resourcekey="txtCitySurveyNoUpd"
                                    Text='<%# Bind("CitySurveyNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="lblRevenueSurveyNoUpd" runat="server" meta:resourcekey="lblRevenueSurveyNoUpd"
                                    Text="Revenue Survey No"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRevenueSurveyNoUpd" MaxLength="20" runat="server" meta:resourcekey="txtRevenueSurveyNoUpd"
                                    Text='<%# Bind("RevenueSurveyNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblWard_SubWardNoUpd" runat="server" meta:resourcekey="lblWard_SubWardNoUpd"
                                    Text="Ward/SubWard No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtWard_SubWardNoUpd" MaxLength="20" runat="server" meta:resourcekey="txtWard_SubWardNoUpd"
                                    Text='<%# Bind("Ward_SubWardNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPartyDetailsUpd" runat="server" meta:resourcekey="lblPartyDetailsUpd"
                                    SkinID="SubHeading" Text="Party Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblNameOfOwnerUpd" runat="server" meta:resourcekey="lblNameOfOwnerUpd"
                                    Text="Name Of Owner"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtNameOfOwnerUpd" runat="server" meta:resourcekey="txtNameOfOwnerUpd"
                                    Text='<%# Bind("NameOfOwner") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblAddressOfOwnerUpd" runat="server" meta:resourcekey="lblAddressOfOwnerUpd"
                                    Text="AddressOfOwner"></asp:Label>
                            </td>
                            <td colspan="3" style="width: 25%">
                                <asp:TextBox ID="txtAddressOfOwnerUpd" runat="server" meta:resourcekey="txtAddressOfOwnerUpd"
                                    Text='<%# Bind("AddressOfOwner") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblNameOfClaimingPartyUpd" runat="server" meta:resourcekey="lblNameOfClaimingPartyUpd"
                                    Text="Claiming Party Name"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtNameOfClaimingPartyUpd" runat="server" meta:resourcekey="txtNameOfClaimingPartyUpd"
                                    Text='<%# Bind("NameOfClaimingParty") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblAddressOfClaimingPartyUpd" runat="server" meta:resourcekey="lblAddressOfClaimingPartyUpd"
                                    Text="Address Of Claiming Party"></asp:Label>
                            </td>
                            <td colspan="3" style="width: 25%">
                                <asp:TextBox ID="txtAddressOfClaimingPartyUpd" runat="server" meta:resourcekey="txtAddressOfClaimingPartyUpd"
                                    Text='<%# Bind("AddressOfClaimingParty") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressOfClaimingPartyNoteUpd" runat="server" meta:resourcekey="lblAddressOfClaimingPartyNoteUpd"
                                    Text="Full Address with City and State"></asp:Label>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblPropertyDescriptionHeaderUpd" runat="server" meta:resourcekey="lblPropertyDescriptionHeaderUpd"
                                    SkinID="SubHeading" Text="Property Description Header"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblAreaOfPlotUpd" runat="server" meta:resourcekey="lblAreaOfPlotUpd"
                                    Text="Area(Sq mts)"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfPlotUpd" runat="server" meta:resourcekey="txtAreaOfPlotUpd"
                                    Text='<%# Bind("AreaOfPlot") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAreaOfConstructionUpd" runat="server" meta:resourcekey="lblAreaOfConstructionUpd"
                                    Text="Plinth Area((Sq mts)& No of Floors"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfConstructionUpd" MaxLength="10" runat="server" meta:resourcekey="txtAreaOfConstructionUpd"
                                    Text='<%# Bind("AreaOfConstruction") %>' Width="45%"></asp:TextBox>
                                <asp:TextBox ID="txtNoOfFloorsUpd" MaxLength="3" runat="server" meta:resourcekey="txtNoOfFloorsUpd"
                                    Text='<%# Bind("NoOfFloors") %>' Width="45%"></asp:TextBox></td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblYearOfConstructionUpd" runat="server" meta:resourcekey="lblYearOfConstructionUpd"
                                    Text="Year of Construction"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearOfConstructionUpd" MaxLength="4" runat="server" meta:resourcekey="txtYearOfConstructionUpd"
                                    Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                                <asp:Label ID="lblTypeOfPropertyUpd" runat="server" meta:resourcekey="lblTypeOfPropertyUpd"
                                    Text="Type Of Property"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTypeOfPropertyUpd" runat="server" AutoPostBack="true" DataSourceID="xdsPropertyType"
                                    DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfPropertyUpd"
                                    OnDataBound="ddlTypeOfPropertyUpd_DataBound" OnSelectedIndexChanged="ddlTypeOfPropertyUpd_SelectedIndexChanged"
                                    SelectedValue='<%# Bind("TypeOfProperty") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:MultiView ID="mvPropertyDetailsUpd" runat="server">
                                    <asp:View ID="viewPropertyDetailsUpd" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Label ID="lblResidentialDetailsHeaderUpd" runat="server" meta:resourcekey="lblResidentialDetailsHeaderUpd"
                                                        SkinID="SubHeading" Text="Residential Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblHeightOfCeilingUpd" runat="server" meta:resourcekey="lblHeightOfCeilingUpd"
                                                        Text="Ceiling Height(In CM)"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtHeightOfCeilingUpd" runat="server" meta:resourcekey="txtHeightOfCeilingUpd"
                                                        Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblTypeOfTilesUpd" runat="server" meta:resourcekey="lblTypeOfTilesUpd"
                                                        Text="Tiles Type"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:DropDownList ID="ddlTypeOfTilesUpd" runat="server" meta:resourcekey="ddlTypeOfTilesUpd"
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
                                                    <asp:Label ID="lblWallFurnishingUpd" runat="server" meta:resourcekey="lblWallFurnishingUpd"
                                                        Text="WallFurnishing"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtWallFurnishingUpd" runat="server" meta:resourcekey="txtWallFurnishingUpd"
                                                        Text='<%# Bind("WallFurnishing") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblNoOfBathroomsUpd" runat="server" meta:resourcekey="lblNoOfBathroomsUpd"
                                                        Text="No Of Bathrooms"></asp:Label></td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtNoOfBathroomsUpd" runat="server" meta:resourcekey="txtNoOfBathroomsUpd"
                                                        Text='<%# Bind("NoOfBathrooms") %>'></asp:TextBox></td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblNoOfToiletsUpd" runat="server" meta:resourcekey="lblNoOfToiletsUpd"
                                                        Text="NoOfToilets"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtNoOfToiletsUpd" runat="server" meta:resourcekey="txtNoOfToiletsUpd"
                                                        Text='<%# Bind("NoOfToilets") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblToiletTilesHeightUpd" runat="server" meta:resourcekey="lblToiletTilesHeightUpd"
                                                        Text="Tiles Height((In CM))"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtToiletTilesHeightUpd" runat="server" meta:resourcekey="txtToiletTilesHeightUpd"
                                                        Text='<%# Bind("ToiletTilesHeight") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblBathroomTilesHeightUpd" runat="server" meta:resourcekey="lblBathroomTilesHeightUpd"
                                                        Text="Tiles Height((In CM))"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtBathroomTilesHeightUpd" runat="server" meta:resourcekey="txtBathroomTilesHeightUpd"
                                                        Text='<%# Bind("BathroomTilesHeight") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblParkingUpd" runat="server" meta:resourcekey="lblParkingUpd" Text="Parking"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:CheckBox ID="txtParkingUpd" runat="server" Checked='<%# Bind("Parking") %>'
                                                        meta:resourcekey="txtParkingUpd" />
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="viewCommercialUpd" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Label ID="lblDescOfPropertyHeadingUpd" runat="server" meta:resourcekey="lblDescOfPropertyHeadingUpd"
                                                        SkinID="SubHeading" Text="Commercial Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblDescOfPropertyUpd" runat="server" meta:resourcekey="lblDescOfPropertyUpd"
                                                        Text="Desc Of Property"></asp:Label>
                                                </td>
                                                <td colspan="4">
                                                    <asp:TextBox ID="txtDescOfPropertyUpd" runat="server" meta:resourcekey="txtDescOfPropertyUpd"
                                                        Text='<%# Bind("DescOfProperty") %>' TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="width: 50%;">
                                                    <asp:CheckBox ID="chkShopsOnGroundFloorUpd" runat="server" Checked='<%# Bind("ShopsOnGroundFloor") %>'
                                                        meta:resourcekey="chkShopsOnGroundFloorUpd" Text="Is Shops On Ground/First Floor?" />
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                                <td colspan="2" style="width: 50%;">
                                                    <asp:CheckBox ID="chkIsPropertyInCommercialUpd" runat="server" Checked='<%# Bind("IsPropertyInCommercial") %>'
                                                        meta:resourcekey="chkIsPropertyInCommercialUpd" Text="Is Property in Commercially Developed Area?" />
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="viewIndustrialUpd" runat="server">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Label ID="lblIndustrialHeaderUpd" runat="server" meta:resourcekey="lblIndustrialHeaderUpd"
                                                        SkinID="SubHeading" Text="Industrial Details"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblHeightOfIndCeilingUpd" runat="server" meta:resourcekey="lblHeightOfIndCeilingUpd"
                                                        Text="Height till bottom of Ceiling((In CM))"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtHeightOfIndCeilingUpd" MaxLength="3" runat="server" meta:resourcekey="txtHeightOfIndCeilingUpd"
                                                        Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RangeValidator ID="rngHeightOfIndCeilingIns" runat="server" ControlToValidate="txtHeightOfIndCeilingUpd"
                                                        MaximumValue="1.99" MinimumValue="0" ErrorMessage="Height Of ceiling value should be less than 2">*</asp:RangeValidator>
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
                            <td colspan="6">
                                <asp:Label ID="lblOtherInfoUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Other Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblTypeOfElectricficationUpd" runat="server" meta:resourcekey="lblTypeOfElectricficationUpd"
                                    Text="Electricfication Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTypeOfElectricficationUpd" runat="server" DataSourceID="xdsElectricalElectrification"
                                    DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfElectricficationUpd"
                                    SelectedValue='<%# Bind("TypeOfElectricfication") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblCompoundWallTypeUpd" runat="server" meta:resourcekey="lblCompoundWallTypeUpd"
                                    Text="Compound Wall Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlCompoundWallTypeUpd" runat="server" DataSourceID="xdsCompoundWall"
                                    DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlCompoundWallTypeUpd"
                                    SelectedValue='<%# Bind("CompoundWallType") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="chkIsLightsOnCompoundWallUpd" runat="server" Checked='<%# Bind("IsLightsOnCompoundWall") %>'
                                    meta:resourcekey="chkIsLightsOnCompoundWallUpd" Text="Is Lights On Compound Wall?" />
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="chkWaterStorageFacilityUpd" runat="server" Checked='<%# Bind("WaterStorageFacility") %>'
                                    meta:resourcekey="chkWaterStorageFacilityUpd" Text="Water Storage Facility (Y/N)" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="chkDrainageSystemUpd" runat="server" Checked='<%# Bind("DrainageSystem") %>'
                                    meta:resourcekey="chkDrainageSystemUpd" Text="Is Drainage Facility Available?" />
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 111px">
                                <asp:Label ID="lblNoOfLiftsUpd" runat="server" meta:resourcekey="lblNoOfLiftsUpd"
                                    Text="No Of Lifts"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNoOfLiftsUpd" MaxLength="2" runat="server" meta:resourcekey="txtNoOfLiftsUpd"
                                    Text='<%# Bind("NoOfLifts") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn">
                                <asp:Label ID="lblAreaOfEachLiftUpd" runat="server" meta:resourcekey="lblAreaOfEachLiftUpd"
                                    Text="Area Of each Lift(Sqr mtr)"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfEachLiftUpd" MaxLength="3" runat="server" meta:resourcekey="txtAreaOfEachLiftUpd"
                                    Text='<%# Bind("AreaOfEachLift") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="chkInternalRoadUpd" runat="server" Checked='<%# Bind("InternalRoad") %>'
                                    meta:resourcekey="chkInternalRoadUpd" Text="Internal Road Present (Y/N)" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="chkValuatedBeforeUpd" runat="server" Checked='<%# Bind("ValuatedBefore") %>'
                                    meta:resourcekey="chkValuatedBeforeUpd" Text="Has been Valuated before?" />
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDocumentDetailsHeaderUpd" runat="server" meta:resourcekey="lblDocumentDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Document Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDocumentTypeUpd" runat="server" meta:resourcekey="lblDocumentTypeIns"
                                    Text="Document Type"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:DropDownList ID="ddlDocumentTypeUpd" runat="server" DataSourceID="odsGetDocument"
                                    DataTextField="Name" DataValueField="DocumentTypeId" meta:resourcekey="ddlDocumentTypeIns">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="validationColumn" style="width: 23%">
                                <asp:Label ID="lvlDocumentNumberUpd" runat="server" meta:resourcekey="lvlDocumentNumberIns"
                                    Text="Document Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDocumentNumberUpd" MaxLength="30" runat="server" meta:resourcekey="txtDocumentNumberIns"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="validationColumn">
                                <asp:Label ID="lblDocRemarksUpd" runat="server" meta:resourcekey="lblDocRemarksIns"
                                    Text="Doc Remarks" Width="153px"></asp:Label>
                            </td>
                            <td colspan="6" style="width: 25%">
                                <asp:TextBox ID="txtDocRemarksUpd" runat="server" meta:resourcekey="txtDocRemarksIns"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkSubmittedUpd" runat="server" meta:resourcekey="chkSubmittedIns"
                                    Text="Has Submitted?" Width="151px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnAddDocumentUpd" runat="server" OnClick="AddDocumentDetails_Click"
                                    Text="Add" />
                                <asp:Button ID="btnUpdateFeeDetailsUpd" runat="server" OnClick="UpdateDocDetails_Click"
                                    Text="Update" Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvDocumentUpd" runat="server" AutoGenerateColumns="false" DataKeyNames="ValuationFormId,DocumentTypeId"
                                    meta:resourcekey="gvDocumentsInsResource1" OnRowDeleting="DocDetails_RowDeleting"
                                    OnSelectedIndexChanged="DocDetailsGrid_SelectedIndexChanged">
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
                        <asp:HiddenField ID="fldValId" runat="server" Value='<%# Bind("ValuationFormId") %>' />
                        <tr>
                            <td align="right" colspan="6">
                                <asp:CheckBox ID="chkVerified" runat="server" Text="Verification Complete" />
                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="true" CommandName="Update"
                                    Text="Update" /></td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="text-align: left" width="100%">
                        <tr>
                            <td colspan="6" style="height: 18px">
                                <asp:Label ID="lblPropertyDetailsHeadingIns" runat="server" meta:resourcekey="lblPropertyDetailsHeadingIns"
                                    SkinID="SubHeading" Text="Property Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeIdIns" runat="server" DataTextField="OfficeName" DataValueField="OfficeId"
                                    meta:resourcekey="ddlOfficeIdIns" DataSourceID="odsGetOffices" OnLoad="ddlOfficeIdIns_Load" SelectedValue='<%# Bind("OfficeId") %>'
                                    OnSelectedIndexChanged="ddlOfficeIdIns_SelectedIndexChanged">
                                </asp:DropDownList>
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
                            <td class="labelColumn">
                                <asp:Label ID="lblDistNameIns" runat="server" meta:resourcekey="lblDistNameIns" Text="Village/City Name"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtDistNameIns" runat="server" meta:resourcekey="txtDistNameIns"
                                    Text='<%# Bind("Village_CityName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblTpSchemeNoIns" runat="server" meta:resourcekey="lblTpSchemeNoIns"
                                    Text="T.P Scheme No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTpSchemeNoIns" MaxLength="20" runat="server" meta:resourcekey="txtTpSchemeNoIns"
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtTpSchemeNameIns" runat="server" meta:resourcekey="txtTpSchemeNameIns"
                                    Text='<%# Bind("TPSchemeName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="width: 23%">
                                <asp:Label ID="lblFinalPlotNoIns" runat="server" meta:resourcekey="lblFinalPlotNoIns"
                                    Text="Final Plot No"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFinalPlotNoIns" MaxLength="20" runat="server" meta:resourcekey="txtFinalPlotNoIns"
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtCitySurveyNoIns" MaxLength="20" runat="server" meta:resourcekey="txtCitySurveyNoIns"
                                    Text='<%# Bind("CitySurveyNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="width: 23%">
                                &nbsp;<asp:Label ID="lblRevenueSurveyNoIns" runat="server" meta:resourcekey="lblRevenueSurveyNoIns"
                                    Text="Revenue Survey No"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtRevenueSurveyNoIns" MaxLength="20" runat="server" meta:resourcekey="txtRevenueSurveyNoIns"
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtWard_SubWardNoIns" MaxLength="20" runat="server" meta:resourcekey="txtWard_SubWardNoIns"
                                    Text='<%# Bind("Ward_SubWardNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" style="width: 23%">
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
                            <td colspan="3" style="width: 25%">
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
                                <asp:RequiredFieldValidator ID="ReqFldValNameOfCLaimingPartyIns" runat="server" ControlToValidate="txtNameOfClaimingPartyIns"
                                    ErrorMessage="Please Enter Name Of CLaiming Party">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtNameOfClaimingPartyIns" runat="server"
                                    ControlToValidate="txtNameOfClaimingPartyIns" ErrorMessage="Name Of CLaiming Party is not in correct format"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtAreaOfPlotIns" MaxLength="6" runat="server" meta:resourcekey="txtAreaOfPlotIns"
                                    Text='<%# Bind("AreaOfPlot") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
                                    ErrorMessage="Area Of Plot can't be blank">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtAreaOfPlotIns" runat="server" ControlToValidate="txtAreaOfPlotIns"
                                    ErrorMessage="Please enter valid data for Area Of Plot " ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="validationColumn" style="width: 23%">
                                <asp:Label ID="lblAreaOfConstructionIns" runat="server" meta:resourcekey="lblAreaOfConstructionIns"
                                    Text="Plinth Area(Sq mtr)& No of Floors"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfConstructionIns" MaxLength="10" runat="server" meta:resourcekey="txtAreaOfConstructionIns"
                                    Text='<%# Bind("AreaOfConstruction") %>' Width="45%"></asp:TextBox>
                                <asp:TextBox ID="txtNoOfFloorsIns" MaxLength="3" runat="server" meta:resourcekey="txtNoOfFloorsIns"
                                    Text='<%# Bind("NoOfFloors") %>' Width="45%"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtAreaOfConstructionIns" runat="server" ControlToValidate="txtAreaOfConstructionIns"
                                    ErrorMessage="Area Of Construction Can't be Blank">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExptxtAreaOfConstructionIns" runat="server"
                                    ControlToValidate="txtAreaOfConstructionIns" ErrorMessage="Please enter valid data for Area Of Construction"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="ReqfldtxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
                                    ErrorMessage="No Of Floors Can't be Blank">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExptxtNoOfFloorsIns" runat="server" ControlToValidate="txtNoOfFloorsIns"
                                    ErrorMessage="Please enter valid data for No Of Floors" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearOfConstructionIns" runat="server" meta:resourcekey="lblYearOfConstructionIns"
                                    Text="Year of Construction"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtYearOfConstructionIns" MaxLength="4" runat="server" meta:resourcekey="txtYearOfConstructionIns"
                                    Text='<%# Bind("YearOfConstruction") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtYearOfConstructionIns" runat="server" ControlToValidate="txtYearOfConstructionIns"
                                    ErrorMessage="Year of construction Can't be blank">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegexptxtYearOfConstructionIns" runat="server"
                                    ControlToValidate="txtYearOfConstructionIns" ErrorMessage="Please enter valid data for Year of construction"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Year %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="validationColumn" style="width: 23%">
                                <asp:Label ID="lblTypeOfPropertyIns" runat="server" meta:resourcekey="lblTypeOfPropertyIns"
                                    Text="Type Of Property"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTypeOfPropertyIns" runat="server" AutoPostBack="true" DataSourceID="xdsPropertyType"
                                    DataTextField="Key" DataValueField="Value" meta:resourcekey="ddlTypeOfPropertyIns"
                                    OnSelectedIndexChanged="ddlTypeOfPropertyIns_SelectedIndexChanged" SelectedValue='<%# Bind("TypeOfProperty") %>'>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:MultiView ID="mvPropertyDetailsIns" runat="server" ActiveViewIndex="2">
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
                                                        Text="Ceiling Height(In CM)"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtHeightOfCeilingIns" MaxLength="4" runat="server" meta:resourcekey="txtHeightOfCeilingIns"
                                                        Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RequiredFieldValidator ID="ReqfldtxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
                                                        ErrorMessage="Height Of Ceiling Can't be blank">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegexptxtHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
                                                        ErrorMessage="Height Of Ceiling is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
                                                    <asp:RangeValidator ID="rngHeightOfCeilingIns" runat="server" ControlToValidate="txtHeightOfCeilingIns"
                                                        Type="Double" MinimumValue="0" MaximumValue="1.99" ErrorMessage="Ceiling Height should be less than 2"></asp:RangeValidator>
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
                                                <td class="labelColumn" style="height: 26px">
                                                    <asp:Label ID="lblWallFurnishingIns" runat="server" meta:resourcekey="lblWallFurnishingIns"
                                                        Text="Wall Furnishing"></asp:Label>
                                                </td>
                                                <td class="textColumn" style="height: 26px">
                                                    <asp:TextBox ID="txtWallFurnishingIns" runat="server" meta:resourcekey="txtWallFurnishingIns"
                                                        Text='<%# Bind("WallFurnishing") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn" style="height: 26px">
                                                </td>
                                                <td class="validationColumn" style="height: 26px">
                                                </td>
                                                <td class="textColumn" style="height: 26px">
                                                </td>
                                                <td class="validationColumn" style="height: 26px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="validationColumn">
                                                    <asp:Label ID="lblNoOfBathroomsIns" runat="server" meta:resourcekey="lblNoOfBathroomsIns"
                                                        Text="No Of Bathrooms"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtNoOfBathroomsIns" MaxLength="2" runat="server" meta:resourcekey="txtNoOfBathroomsIns"
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
                                                        Text="Tiles Height(In CM)"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtBathroomTilesHeightIns" MaxLength="4" runat="server" meta:resourcekey="txtBathroomTilesHeightIns"
                                                        Text='<%# Bind("BathroomTilesHeight") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RegularExpressionValidator ID="RegexptxtBathroomTilesHeightIns" runat="server"
                                                        ControlToValidate="txtBathroomTilesHeightIns" ErrorMessage="Bathroom Tiles height values is not in correct format"
                                                        ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
                                                    <asp:RangeValidator ID="rngBathroomTilesHeightIns" runat="server" ControlToValidate="txtBathroomTilesHeightIns"
                                                        Type="Double" MinimumValue="0" MaximumValue="1.99" ErrorMessage="Tiles Height should be less than 2"></asp:RangeValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblNoOfToiletsIns" runat="server" meta:resourcekey="lblNoOfToiletsIns"
                                                        Text="No Of Toilets"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtNoOfToiletsIns" MaxLength="3" runat="server" meta:resourcekey="txtNoOfToiletsIns"
                                                        Text='<%# Bind("NoOfToilets") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RegularExpressionValidator ID="RegExpNoOfToiletIns" runat="server" ControlToValidate="txtNoOfToiletsIns"
                                                        ValidationExpression="^\d+$">*</asp:RegularExpressionValidator>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:Label ID="lblToiletTilesHeightIns" runat="server" meta:resourcekey="lblToiletTilesHeightIns"
                                                        Text="Toilet Tiles Height(In CM)"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtToiletTilesHeightIns" MaxLength="4" runat="server" meta:resourcekey="txtToiletTilesHeightIns"
                                                        Text='<%# Bind("ToiletTilesHeight") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RegularExpressionValidator ID="RegExpValToiletTilesHeightIns" runat="server"
                                                        ControlToValidate="txtToiletTilesHeightIns" ValidationExpression="^\d*\.{0,1}\d+$">*</asp:RegularExpressionValidator>
                                                    <asp:RangeValidator ID="rngToiletTilesHeightIns" runat="server" ControlToValidate="txtToiletTilesHeightIns"
                                                        Type="Double" MinimumValue="0" MaximumValue="1.99" ErrorMessage="Toilet Tiles Height should be less than 2"></asp:RangeValidator>
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
                                                        Text="Height till bottom of Ceiling(In CM)"></asp:Label>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtHeightOfIndCeilingIns" MaxLength="3" runat="server" meta:resourcekey="txtHeightOfIndCeilingIns"
                                                        Text='<%# Bind("HeightOfCeiling") %>'></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                    <asp:RegularExpressionValidator ID="RegexpHeightOfIndCeilingIns" runat="server" ControlToValidate="txtHeightOfIndCeilingIns"
                                                        ErrorMessage="Height Of ceiling Format must be decimal" ValidationExpression="<%$ Resources:ValidationRegx, Decimal %>">*</asp:RegularExpressionValidator>
                                                    <asp:RangeValidator ID="rngHeightOfIndCeilingIns" runat="server" ControlToValidate="txtHeightOfIndCeilingIns"
                                                        MaximumValue="1.99" MinimumValue="0" ErrorMessage="Height Of ceiling value should be less than 2">*</asp:RangeValidator>
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
                            <td class="textColumn" style="width: 25%">
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
                            <td class="textColumn" style="width: 25%; height: 35px;">
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
                            <td class="textColumn" style="width: 25%">
                                <asp:TextBox ID="txtNoOfLiftsIns" MaxLength="2" runat="server" meta:resourcekey="txtNoOfLiftsIns"
                                    Text='<%# Bind("NoOfLifts") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="RegexpNoOfLifts" runat="server" ControlToValidate="txtNoOfLiftsIns"
                                    ErrorMessage="No Of Lifts is not in correct format" ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="validationColumn" style="width: 23%">
                                <asp:Label ID="lblAreaOfEachLiftIns" runat="server" meta:resourcekey="lblAreaOfEachLiftIns"
                                    Text="Area Of each Lift(Sqr mtr)"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfEachLiftIns" MaxLength="3" runat="server" meta:resourcekey="txtAreaOfEachLiftIns"
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
                            <td class="textColumn" style="width: 25%">
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
                                <asp:TextBox ID="txtDocumentNumberIns" MaxLength="8" runat="server" ValidationGroup="DocumentDetails"></asp:TextBox>
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
                            <td>
                                <asp:Button ID="btnAddDocumentIns" runat="server" OnClick="AddDocumentDetails_Click"
                                    Text="Add" ValidationGroup="DocumentDetails" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUpdateFeeDetailsIns" runat="server" OnClick="UpdateDocDetails_Click"
                                    Text="Update" ValidationGroup="DocumentDetails" Visible="false" /></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="gvDocumentIns" runat="server" AutoGenerateColumns="false" DataKeyNames="ValuationFormId,DocumentTypeId"
                                    meta:resourcekey="gvDocumentsInsResource1" OnRowDeleting="DocDetails_RowDeleting"
                                    OnSelectedIndexChanged="DocDetailsGrid_SelectedIndexChanged">
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
                                <asp:Button ID="LicInsert" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Save" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="viewReadOnly" runat="server">
            <asp:FormView ID="fvReadOnly" runat="server" DataSourceID="ObjectDataSource1" >
                <EditItemTemplate>
                    AdjudicationId:
                    <%--<asp:Label ID="AdjudicationIdLabel1" runat="server" Text='<%# Eval("AdjudicationId") %>'>
                    </asp:Label>--%><br />
                    <%--FilePrefix:
                    <asp:TextBox ID="FilePrefixTextBox" runat="server" Text='<%# Bind("FilePrefix") %>'>
                    </asp:TextBox><br />
                    FileSlNo:
                    <asp:TextBox ID="FileSlNoTextBox" runat="server" Text='<%# Bind("FileSlNo") %>'>
                    </asp:TextBox><br />
                    FileYear:
                    <asp:TextBox ID="FileYearTextBox" runat="server" Text='<%# Bind("FileYear") %>'>
                    </asp:TextBox>--%><br />
                    ValuationFormId:
                    <asp:TextBox ID="ValuationFormIdTextBox" runat="server" Text='<%# Bind("ValuationFormId") %>'>
                    </asp:TextBox><br />
                    RegistrationId:
                    <asp:TextBox ID="RegistrationIdTextBox" runat="server" Text='<%# Bind("RegistrationId") %>'>
                    </asp:TextBox><br />
                    OfficeId:
                    <asp:TextBox ID="OfficeIdTextBox" runat="server" Text='<%# Bind("OfficeId") %>'>
                    </asp:TextBox><br />
                    ApplicationDate:
                    <asp:TextBox ID="ApplicationDateTextBox" runat="server" Text='<%# Bind("ApplicationDate") %>'>
                    </asp:TextBox><br />
                    ReceiptNumber:
                    <asp:TextBox ID="ReceiptNumberTextBox" runat="server" Text='<%# Bind("ReceiptNumber") %>'>
                    </asp:TextBox><br />
                    AdjudicationTotalFees:
                    <asp:TextBox ID="AdjudicationTotalFeesTextBox" runat="server" Text='<%# Bind("AdjudicationTotalFees") %>'>
                    </asp:TextBox><br />
                    CertificateNumber:
                    <asp:TextBox ID="CertificateNumberTextBox" runat="server" Text='<%# Bind("CertificateNumber") %>'>
                    </asp:TextBox><br />
                    CertificateIssuedOn:
                    <asp:TextBox ID="CertificateIssuedOnTextBox" runat="server" Text='<%# Bind("CertificateIssuedOn") %>'>
                    </asp:TextBox><br />
                    CertificateDescription:
                    <asp:TextBox ID="CertificateDescriptionTextBox" runat="server" Text='<%# Bind("CertificateDescription") %>'>
                    </asp:TextBox><br />
                    Status:
                    <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    AdjudicationId:
                    <%--<asp:TextBox ID="AdjudicationIdTextBox" runat="server" Text='<%# Bind("AdjudicationId") %>'>
                    </asp:TextBox>--%><br />
                    <%--FilePrefix:
                    <asp:TextBox ID="FilePrefixTextBox" runat="server" Text='<%# Bind("FilePrefix") %>'>
                    </asp:TextBox><br />
                    FileSlNo:
                    <asp:TextBox ID="FileSlNoTextBox" runat="server" Text='<%# Bind("FileSlNo") %>'>
                    </asp:TextBox><br />
                    FileYear:
                    <asp:TextBox ID="FileYearTextBox" runat="server" Text='<%# Bind("FileYear") %>'>
                    </asp:TextBox>--%><br />
                    ValuationFormId:
                    <asp:TextBox ID="ValuationFormIdTextBox" runat="server" Text='<%# Bind("ValuationFormId") %>'>
                    </asp:TextBox><br />
                    RegistrationId:
                    <asp:TextBox ID="RegistrationIdTextBox" runat="server" Text='<%# Bind("RegistrationId") %>'>
                    </asp:TextBox><br />
                    OfficeId:
                    <asp:TextBox ID="OfficeIdTextBox" runat="server" Text='<%# Bind("OfficeId") %>'>
                    </asp:TextBox><br />
                    ApplicationDate:
                    <asp:TextBox ID="ApplicationDateTextBox" runat="server" Text='<%# Bind("ApplicationDate") %>'>
                    </asp:TextBox><br />
                    ReceiptNumber:
                    <asp:TextBox ID="ReceiptNumberTextBox" runat="server" Text='<%# Bind("ReceiptNumber") %>'>
                    </asp:TextBox><br />
                    AdjudicationTotalFees:
                    <asp:TextBox ID="AdjudicationTotalFeesTextBox" runat="server" Text='<%# Bind("AdjudicationTotalFees") %>'>
                    </asp:TextBox><br />
                    CertificateNumber:
                    <asp:TextBox ID="CertificateNumberTextBox" runat="server" Text='<%# Bind("CertificateNumber") %>'>
                    </asp:TextBox><br />
                    CertificateIssuedOn:
                    <asp:TextBox ID="CertificateIssuedOnTextBox" runat="server" Text='<%# Bind("CertificateIssuedOn") %>'>
                    </asp:TextBox><br />
                    CertificateDescription:
                    <asp:TextBox ID="CertificateDescriptionTextBox" runat="server" Text='<%# Bind("CertificateDescription") %>'>
                    </asp:TextBox><br />
                    Status:
                    <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    AdjudicationId:
                    <%--<asp:Label ID="AdjudicationIdLabel" runat="server" Text='<%# Eval("AdjudicationId") %>'>
                    </asp:Label><br />
                    FilePrefix:
                    <asp:Label ID="FilePrefixLabel" runat="server" Text='<%# Bind("FilePrefix") %>'>
                    </asp:Label><br />
                    FileSlNo:
                    <asp:Label ID="FileSlNoLabel" runat="server" Text='<%# Bind("FileSlNo") %>'></asp:Label><br />
                    FileYear:
                    <asp:Label ID="FileYearLabel" runat="server" Text='<%# Bind("FileYear") %>'></asp:Label>--%><br />
                    ValuationFormId:
                    <asp:Label ID="ValuationFormIdLabel" runat="server" Text='<%# Bind("ValuationFormId") %>'>
                    </asp:Label><br />
                    RegistrationId:
                    <asp:Label ID="RegistrationIdLabel" runat="server" Text='<%# Bind("RegistrationId") %>'>
                    </asp:Label><br />
                    OfficeId:
                    <asp:Label ID="OfficeIdLabel" runat="server" Text='<%# Bind("OfficeId") %>'></asp:Label><br />
                    ApplicationDate:
                    <asp:Label ID="ApplicationDateLabel" runat="server" Text='<%# Bind("ApplicationDate") %>'>
                    </asp:Label><br />
                    ReceiptNumber:
                    <asp:Label ID="ReceiptNumberLabel" runat="server" Text='<%# Bind("ReceiptNumber") %>'>
                    </asp:Label><br />
                    AdjudicationTotalFees:
                    <asp:Label ID="AdjudicationTotalFeesLabel" runat="server" Text='<%# Bind("AdjudicationTotalFees") %>'>
                    </asp:Label><br />
                    CertificateNumber:
                    <asp:Label ID="CertificateNumberLabel" runat="server" Text='<%# Bind("CertificateNumber") %>'>
                    </asp:Label><br />
                    CertificateIssuedOn:
                    <asp:Label ID="CertificateIssuedOnLabel" runat="server" Text='<%# Bind("CertificateIssuedOn") %>'>
                    </asp:Label><br />
                    CertificateDescription:
                    <asp:Label ID="CertificateDescriptionLabel" runat="server" Text='<%# Bind("CertificateDescription") %>'>
                    </asp:Label><br />
                    Status:
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>'></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit">
                    </asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:XmlDataSource ID="xdsElectricalElectrification" runat="server" DataFile="~/Adjudication/ElectrificationType.xml">
    </asp:XmlDataSource>
    <asp:XmlDataSource ID="xdsCompoundWall" runat="server" DataFile="~/Adjudication/CompoundWall.xml">
    </asp:XmlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddValuationRequest"
        OnUpdating="ObjectDataSource1_Updating" SelectMethod="GetValuationFormById"
        TypeName="IGRSS.BusinessLogicLayer.ValuationApplication" UpdateMethod="UpdateValuationForm"
        OnInserting="ObjectDataSource1_Inserting" DeleteMethod="DeleteValuationForm">
        <InsertParameters>
            <asp:Parameter Name="ValFormParameter" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="fldValId" Name="ValuationFormId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ValFormParameter" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetOffices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetFees" runat="server" InsertMethod="AddAdjudicationRequest"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetFees" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest">
        <InsertParameters>
            <asp:Parameter Name="FilePrefix" Type="String" />
            <asp:Parameter Name="FileSlNo" Type="Int32" />
            <asp:Parameter Name="FileYear" Type="Decimal" />
            <asp:Parameter Name="RegistrationId" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="String" />
            <asp:Parameter Name="AdjudicationTotalFees" Type="Decimal" />
            <asp:Parameter Name="Village_CityName" Type="String" />
            <asp:Parameter Name="TPSchemeNo" Type="String" />
            <asp:Parameter Name="TPSchemeName" Type="String" />
            <asp:Parameter Name="FinalPlotNo" Type="String" />
            <asp:Parameter Name="CitySurveyNo" Type="String" />
            <asp:Parameter Name="RevenueSurveyNo" Type="String" />
            <asp:Parameter Name="Ward_SubWardNo" Type="String" />
            <asp:Parameter Name="NameOfOwner" Type="String" />
            <asp:Parameter Name="AddressOfOwner" Type="String" />
            <asp:Parameter Name="NameOfClaimingParty" Type="String" />
            <asp:Parameter Name="AddressOfClaimingParty" Type="String" />
            <asp:Parameter Name="AreaOfPlot" Type="Decimal" />
            <asp:Parameter Name="AreaOfConstruction" Type="Decimal" />
            <asp:Parameter Name="YearOfConstruction" Type="Int32" />
            <asp:Parameter Name="NoOfFloors" Type="Int16" />
            <asp:Parameter Name="TypeOfProperty" Type="String" />
            <asp:Parameter Name="DescOfProperty" Type="String" />
            <asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
            <asp:Parameter Name="IsPropertyInCommercial" Type="Boolean" />
            <asp:Parameter Name="TypeOfElectricfication" Type="Object" />
            <asp:Parameter Name="CompoundWallType" Type="Object" />
            <asp:Parameter Name="IsLightsOnCompoundWall" Type="Boolean" />
            <asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
            <asp:Parameter Name="DrainageSystem" Type="Boolean" />
            <asp:Parameter Name="NoOfLifts" Type="Int16" />
            <asp:Parameter Name="AreaOfEachLift" Type="Decimal" />
            <asp:Parameter Name="InternalRoad" Type="Boolean" />
            <asp:Parameter Name="ValuatedBefore" Type="Boolean" />
            <asp:Parameter Name="HeightOfCeiling" Type="Decimal" />
            <asp:Parameter Name="TypeOfTiles" Type="Object" />
            <asp:Parameter Name="WallFurnishing" Type="String" />
            <asp:Parameter Name="NoOfBathrooms" Type="Int16" />
            <asp:Parameter Name="BathroomTilesHeight" Type="Int32" />
            <asp:Parameter Name="NoOfToilets" Type="Int16" />
            <asp:Parameter Name="ToiletTilesHeight" Type="Int32" />
            <asp:Parameter Name="Parking" Type="Boolean" />
            <asp:Parameter Name="FeeDetails" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetDocument" runat="server" InsertMethod="AddAdjudicationRequest"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocumentMaster"
        TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest">
        <InsertParameters>
            <asp:Parameter Name="FilePrefix" Type="String" />
            <asp:Parameter Name="FileSlNo" Type="Int32" />
            <asp:Parameter Name="FileYear" Type="Decimal" />
            <asp:Parameter Name="RegistrationId" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="String" />
            <asp:Parameter Name="AdjudicationTotalFees" Type="Decimal" />
            <asp:Parameter Name="Village_CityName" Type="String" />
            <asp:Parameter Name="TPSchemeNo" Type="String" />
            <asp:Parameter Name="TPSchemeName" Type="String" />
            <asp:Parameter Name="FinalPlotNo" Type="String" />
            <asp:Parameter Name="CitySurveyNo" Type="String" />
            <asp:Parameter Name="RevenueSurveyNo" Type="String" />
            <asp:Parameter Name="Ward_SubWardNo" Type="String" />
            <asp:Parameter Name="NameOfOwner" Type="String" />
            <asp:Parameter Name="AddressOfOwner" Type="String" />
            <asp:Parameter Name="NameOfClaimingParty" Type="String" />
            <asp:Parameter Name="AddressOfClaimingParty" Type="String" />
            <asp:Parameter Name="AreaOfPlot" Type="Decimal" />
            <asp:Parameter Name="AreaOfConstruction" Type="Decimal" />
            <asp:Parameter Name="YearOfConstruction" Type="Int32" />
            <asp:Parameter Name="NoOfFloors" Type="Int16" />
            <asp:Parameter Name="TypeOfProperty" Type="String" />
            <asp:Parameter Name="DescOfProperty" Type="String" />
            <asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
            <asp:Parameter Name="IsPropertyInCommercial" Type="Boolean" />
            <asp:Parameter Name="TypeOfElectricfication" Type="Object" />
            <asp:Parameter Name="CompoundWallType" Type="Object" />
            <asp:Parameter Name="IsLightsOnCompoundWall" Type="Boolean" />
            <asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
            <asp:Parameter Name="DrainageSystem" Type="Boolean" />
            <asp:Parameter Name="NoOfLifts" Type="Int16" />
            <asp:Parameter Name="AreaOfEachLift" Type="Decimal" />
            <asp:Parameter Name="InternalRoad" Type="Boolean" />
            <asp:Parameter Name="ValuatedBefore" Type="Boolean" />
            <asp:Parameter Name="HeightOfCeiling" Type="Decimal" />
            <asp:Parameter Name="TypeOfTiles" Type="Object" />
            <asp:Parameter Name="WallFurnishing" Type="String" />
            <asp:Parameter Name="NoOfBathrooms" Type="Int16" />
            <asp:Parameter Name="BathroomTilesHeight" Type="Int32" />
            <asp:Parameter Name="NoOfToilets" Type="Int16" />
            <asp:Parameter Name="ToiletTilesHeight" Type="Int32" />
            <asp:Parameter Name="Parking" Type="Boolean" />
            <asp:Parameter Name="FeeDetails" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAdjReqDtl" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAdJRequestByFileNo" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        DataObjectTypeName="System.Guid" DeleteMethod="DeleteFeeMaster">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="FileSlNo" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetDocumentByValuationId" runat="server" InsertMethod="AddAdjudicationRequest"
        SelectMethod="GetDocumentByValuationFormId" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateAdjudicationDocument">
        <SelectParameters>
            <asp:ControlParameter ControlID="gdAdjReuDtl" Name="ValuationFormId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="FilePrefix" Type="String" />
            <asp:Parameter Name="FileSlNo" Type="Int32" />
            <asp:Parameter Name="FileYear" Type="Decimal" />
            <asp:Parameter Name="RegistrationId" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="String" />
            <asp:Parameter Name="AdjudicationTotalFees" Type="Decimal" />
            <asp:Parameter Name="Village_CityName" Type="String" />
            <asp:Parameter Name="TPSchemeNo" Type="String" />
            <asp:Parameter Name="TPSchemeName" Type="String" />
            <asp:Parameter Name="FinalPlotNo" Type="String" />
            <asp:Parameter Name="CitySurveyNo" Type="String" />
            <asp:Parameter Name="RevenueSurveyNo" Type="String" />
            <asp:Parameter Name="Ward_SubWardNo" Type="String" />
            <asp:Parameter Name="NameOfOwner" Type="String" />
            <asp:Parameter Name="AddressOfOwner" Type="String" />
            <asp:Parameter Name="NameOfClaimingParty" Type="String" />
            <asp:Parameter Name="AddressOfClaimingParty" Type="String" />
            <asp:Parameter Name="AreaOfPlot" Type="Decimal" />
            <asp:Parameter Name="AreaOfConstruction" Type="Decimal" />
            <asp:Parameter Name="YearOfConstruction" Type="Int32" />
            <asp:Parameter Name="NoOfFloors" Type="Int16" />
            <asp:Parameter Name="TypeOfProperty" Type="String" />
            <asp:Parameter Name="DescOfProperty" Type="String" />
            <asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
            <asp:Parameter Name="IsPropertyInCommercial" Type="Boolean" />
            <asp:Parameter Name="TypeOfElectricfication" Type="Object" />
            <asp:Parameter Name="CompoundWallType" Type="Object" />
            <asp:Parameter Name="IsLightsOnCompoundWall" Type="Boolean" />
            <asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
            <asp:Parameter Name="DrainageSystem" Type="Boolean" />
            <asp:Parameter Name="NoOfLifts" Type="Int16" />
            <asp:Parameter Name="AreaOfEachLift" Type="Decimal" />
            <asp:Parameter Name="InternalRoad" Type="Boolean" />
            <asp:Parameter Name="ValuatedBefore" Type="Boolean" />
            <asp:Parameter Name="HeightOfCeiling" Type="Decimal" />
            <asp:Parameter Name="TypeOfTiles" Type="Object" />
            <asp:Parameter Name="WallFurnishing" Type="String" />
            <asp:Parameter Name="NoOfBathrooms" Type="Int16" />
            <asp:Parameter Name="BathroomTilesHeight" Type="Int32" />
            <asp:Parameter Name="NoOfToilets" Type="Int16" />
            <asp:Parameter Name="ToiletTilesHeight" Type="Int32" />
            <asp:Parameter Name="Parking" Type="Boolean" />
            <asp:Parameter Name="FeeDetails" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Submitted" Type="Boolean" />
            <asp:Parameter Name="NotApplicable" Type="Boolean" />
            <asp:Parameter Name="DocumentNumbe" Type="String" />
            <asp:Parameter Name="ValuationFormId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetFeesByAdjId" runat="server" InsertMethod="AddAdjudicationRequest"
        SelectMethod="GetAdjFeesDetailByAdjId" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateAdjudicationFees">
        <SelectParameters>
            <asp:ControlParameter ControlID="gdAdjReuDtl" Name="ValuationFormId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="FilePrefix" Type="String" />
            <asp:Parameter Name="FileSlNo" Type="Int32" />
            <asp:Parameter Name="FileYear" Type="Decimal" />
            <asp:Parameter Name="RegistrationId" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ReceiptNumber" Type="String" />
            <asp:Parameter Name="AdjudicationTotalFees" Type="Decimal" />
            <asp:Parameter Name="Village_CityName" Type="String" />
            <asp:Parameter Name="TPSchemeNo" Type="String" />
            <asp:Parameter Name="TPSchemeName" Type="String" />
            <asp:Parameter Name="FinalPlotNo" Type="String" />
            <asp:Parameter Name="CitySurveyNo" Type="String" />
            <asp:Parameter Name="RevenueSurveyNo" Type="String" />
            <asp:Parameter Name="Ward_SubWardNo" Type="String" />
            <asp:Parameter Name="NameOfOwner" Type="String" />
            <asp:Parameter Name="AddressOfOwner" Type="String" />
            <asp:Parameter Name="NameOfClaimingParty" Type="String" />
            <asp:Parameter Name="AddressOfClaimingParty" Type="String" />
            <asp:Parameter Name="AreaOfPlot" Type="Decimal" />
            <asp:Parameter Name="AreaOfConstruction" Type="Decimal" />
            <asp:Parameter Name="YearOfConstruction" Type="Int32" />
            <asp:Parameter Name="NoOfFloors" Type="Int16" />
            <asp:Parameter Name="TypeOfProperty" Type="String" />
            <asp:Parameter Name="DescOfProperty" Type="String" />
            <asp:Parameter Name="ShopsOnGroundFloor" Type="Boolean" />
            <asp:Parameter Name="IsPropertyInCommercial" Type="Boolean" />
            <asp:Parameter Name="TypeOfElectricfication" Type="Object" />
            <asp:Parameter Name="CompoundWallType" Type="Object" />
            <asp:Parameter Name="IsLightsOnCompoundWall" Type="Boolean" />
            <asp:Parameter Name="WaterStorageFacility" Type="Boolean" />
            <asp:Parameter Name="DrainageSystem" Type="Boolean" />
            <asp:Parameter Name="NoOfLifts" Type="Int16" />
            <asp:Parameter Name="AreaOfEachLift" Type="Decimal" />
            <asp:Parameter Name="InternalRoad" Type="Boolean" />
            <asp:Parameter Name="ValuatedBefore" Type="Boolean" />
            <asp:Parameter Name="HeightOfCeiling" Type="Decimal" />
            <asp:Parameter Name="TypeOfTiles" Type="Object" />
            <asp:Parameter Name="WallFurnishing" Type="String" />
            <asp:Parameter Name="NoOfBathrooms" Type="Int16" />
            <asp:Parameter Name="BathroomTilesHeight" Type="Int32" />
            <asp:Parameter Name="NoOfToilets" Type="Int16" />
            <asp:Parameter Name="ToiletTilesHeight" Type="Int32" />
            <asp:Parameter Name="Parking" Type="Boolean" />
            <asp:Parameter Name="FeeDetails" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FeeId" Type="Object" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="AdjudicationId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:XmlDataSource ID="xdsPropertyType" runat="server"></asp:XmlDataSource>
    <br />
    <asp:HiddenField ID="fldValId" runat="server" />
    <asp:HiddenField ID="fldAdjId" runat="server" />
    <br />
    <asp:ObjectDataSource ID="odsAdjudicationRequest" runat="server" InsertMethod="AddAdjudicationDetails"
        SelectMethod="GetAdjudicationRequestById"
        TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest" UpdateMethod="UpdateAdjudicationDetailsById">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="Id" Type="Object" />
            <asp:Parameter Name="AdjId" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="Id" Type="Object" />
            <asp:Parameter Name="AdjId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="fldAdjId" Name="AdjudicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
