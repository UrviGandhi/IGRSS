<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Adjudication_StampDutyCalculation, App_Web_ggratpvb" title="Stamp Duty Calculation Form" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Src="../FileManagement/FileForward.ascx" TagName="FileForward" TagPrefix="uc1" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvStampDutyCalculation" runat="server" ActiveViewIndex="0">
        <asp:View ID="View3" runat="server">
            <table width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblFileSlNo" runat="server" Text="Adjudication File Sl.No" meta:resourcekey="lblFileSlNoResource1"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtFileSlNoUpd" runat="server" meta:resourcekey="txtFileSlNoUpdResource1"></asp:TextBox>
                    </td>
                    <td class="validationColumn">
                    </td>
                    <td class="labelColumn">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" meta:resourcekey="btnSearchResource1" /></td>
                    <td class="textColumn">
                        &nbsp;</td>
                    <td class="validationColumn">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="GvAdjudicationRequest" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="AdjudicationId" DataSourceID="odsAdjudicationDetailsByFileSloNo"
                            OnSelectedIndexChanged="GvAdjudicationRequest_SelectedIndexChanged" meta:resourcekey="GvAdjudicationRequestResource1"
                            Width="736px">
                            <Columns>
                                <asp:BoundField DataField="AdjudicationId" HeaderText="AdjudicationId" SortExpression="FilePrefix"
                                    meta:resourcekey="BoundFieldResource1" Visible="False" />
                                <asp:BoundField DataField="FilePrefix" HeaderText="FilePrefix" SortExpression="FilePrefix"
                                    meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="FileSlNo" HeaderText="FileSlNo" SortExpression="FileSlNo"
                                    meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="FileYear" HeaderText="FileYear" SortExpression="FileYear"
                                    meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="ReceiptNumber" HeaderText="ReceiptNumber" SortExpression="ReceiptNumber"
                                    meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="AdjudicationTotalFees" HeaderText="AdjudicationTotalFees"
                                    SortExpression="AdjudicationTotalFees" meta:resourcekey="BoundFieldResource6" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="fvStampDutyCalculation" runat="server" DataSourceID="odsStampDutyValuation"
                DefaultMode="Edit" DataKeyNames="AdjudicationId" OnItemUpdated="fvStampDutyCalculation_ItemUpdated"
                OnDataBinding="fvStampDutyCalculation_DataBinding" meta:resourcekey="fvStampDutyCalculationResource1" OnPageIndexChanging="fvStampDutyCalculation_PageIndexChanging">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDutyCalculationItm" runat="server" SkinID="SubHeading" Text="Stamp Duty Calculation "
                                    meta:resourcekey="lblStampDutyCalculationItmResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistirctCode" runat="server" Text="Distirct Code" meta:resourcekey="lblDistirctCodeResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistirctCodeItm" runat="server" DataSourceID="odsDistirctMaster"
                                    DataTextField="distname" DataValueField="distcd" SelectedValue='<%# Bind("DistrictCode") %>'
                                    meta:resourcekey="ddlDistirctCodeItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTalukaCode" runat="server" Text="Taluka Code" meta:resourcekey="lblTalukaCodeResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTalukaCodeItm" runat="server" DataSourceID="odsTalukaMaster"
                                    DataTextField="talukaname" DataValueField="talcd" SelectedValue='<%# Bind("TalukaCode") %>'
                                    meta:resourcekey="ddlTalukaCodeItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVillageCode" runat="server" Text="village Code" meta:resourcekey="lblVillageCodeResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlVillageCodeItm" runat="server" DataSourceID="odsVillageMaster"
                                    DataTextField="villname" DataValueField="villcd" SelectedValue='<%# Bind("VillageCode") %>'
                                    meta:resourcekey="ddlVillageCodeItmResource1">
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
                                <asp:Label ID="lblTpSchemeNo" runat="server" Text="Tp Scheme No" meta:resourcekey="lblTpSchemeNoResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTpSchemeNoItm" runat="server" Text='<%# Bind("TpSchemeNo") %>'
                                    meta:resourcekey="txtTpSchemeNoItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPlotNo" runat="server" Text="Plot No" meta:resourcekey="lblPlotNoResource1"></asp:Label><strong>
                                    * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPlotNoItm" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="txtPlotNoItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlotNoItm"
                                    ErrorMessage="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAreaOfLand" runat="server" Text="Area Of Land" meta:resourcekey="lblAreaOfLandResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfLandItm" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                                    meta:resourcekey="txtAreaOfLandItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAreaOfConstruction" runat="server" Text="Area Of Constriction"
                                    meta:resourcekey="lblAreaOfConstructionResource1"></asp:Label><strong> * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfConstructionItm" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                                    meta:resourcekey="txtAreaOfConstructionItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTypeOfConstruction" runat="server" Text="Type Of Construction"
                                    meta:resourcekey="lblTypeOfConstructionResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTypeofConstruction" runat="server" SelectedValue='<%# Bind("TypeOfConstruction") %>'
                                    meta:resourcekey="ddlTypeofConstructionResource1">
                                    <asp:ListItem Value="b9d7bd22-a91c-4c81-83cf-9e63aed6ba4c" meta:resourcekey="ListItemResource1"
                                        Selected="True">Low</asp:ListItem>
                                    <asp:ListItem Value="625b5496-47ae-4606-8e81-6f0f8789da37" meta:resourcekey="ListItemResource2">Medium</asp:ListItem>
                                    <asp:ListItem Value="71ff2de3-a4a4-42f6-8d84-1e9a5a99c248" meta:resourcekey="ListItemResource3">High</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInternalElectricficationRate" runat="server" Text="Internal ElectricficationRate"
                                    meta:resourcekey="lblInternalElectricficationRateResource1"></asp:Label><strong> * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInternalElectrificationRateItm" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                                    meta:resourcekey="txtInternalElectrificationRateItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInternalElectrificationRateItm"
                                    ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDevelopmentFeeRate" runat="server" Text="Development Fee Rate"
                                    meta:resourcekey="lblDevelopmentFeeRateResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDevelopmentFeeRateItm" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                                    meta:resourcekey="txtDevelopmentFeeRateItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtDevelopmentFeeRateItm"
                                    ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator3Resource1"></asp:RangeValidator></td>
                            <td class="labelColumn">
                                <asp:Label ID="lblOtherFeeRate" runat="server" Text="Other Fee Rate" meta:resourcekey="lblOtherFeeRateResource1"></asp:Label><strong>
                                    * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOtherFeeRateItm" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                                    meta:resourcekey="txtOtherFeeRateItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtOtherFeeRateItm"
                                    ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator2Resource1"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblYearOfConstruction" runat="server" Text="YeaOf Construction" meta:resourcekey="lblYearOfConstructionResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtYearOfConstructionItm" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                                    meta:resourcekey="txtYearOfConstructionItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSpecialDeduction" runat="server" Text="Special Deduction" meta:resourcekey="lblSpecialDeductionResource1"></asp:Label><strong>
                                    * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSpecialDeductionItm" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                                    meta:resourcekey="txtSpecialDeductionItmResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblLiftExpense" runat="server" Text="LiftExpense" meta:resourcekey="lblLiftExpenseResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtLiftExpenseItm" runat="server" Text='<%# Bind("LiftExpense") %>'
                                    meta:resourcekey="txtLiftExpenseItmResource1"></asp:TextBox>
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
                            <td class="labelColumn" style="width: 77px; height: 28px">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="right" class="labelColumn">
                                <asp:Label ID="lblStampDuty" runat="server" meta:resourcekey="lblStampDutyResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" meta:resourcekey="btnCalculateResource1" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDutyCalculationIns" runat="server" SkinID="SubHeading" Text="Stamp Duty Calculation "
                                    meta:resourcekey="lblStampDutyCalculationInsResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistirctCode" runat="server" Text="Distirct Code" meta:resourcekey="lblDistirctCodeResource2"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistirctCodeIns" runat="server" DataSourceID="odsDistirctMaster"
                                    DataTextField="distname" DataValueField="distcd" SelectedValue='<%# Bind("DistrictCode") %>'
                                    meta:resourcekey="ddlDistirctCodeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTalukaCode" runat="server" Text="Taluka Code" meta:resourcekey="lblTalukaCodeResource2"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTalukaCodeIns" runat="server" DataSourceID="odsTalukaMaster"
                                    DataTextField="talukaname" DataValueField="talcd" SelectedValue='<%# Bind("TalukaCode") %>'
                                    meta:resourcekey="ddlTalukaCodeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVillageCode" runat="server" Text="village Code" meta:resourcekey="lblVillageCodeResource2"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlVillageCodeIns" runat="server" DataSourceID="odsVillageMaster"
                                    DataTextField="villname" DataValueField="villcd" SelectedValue='<%# Bind("VillageCode") %>'
                                    meta:resourcekey="ddlVillageCodeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPlotNo" runat="server" Text="Plot No" meta:resourcekey="lblPlotNoResource2"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPlotNoIns" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="txtPlotNoInsResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlotNoIns"
                                    ErrorMessage="*" meta:resourcekey="RequiredFieldValidator1Resource2"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                                <asp:Label ID="lblAreaOfLand" runat="server" Text="Area Of Land" meta:resourcekey="lblAreaOfLandResource2"></asp:Label></td>
                            <td class="textColumn">
                                &nbsp;<asp:TextBox ID="txtAreaOfLandIns" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                                    meta:resourcekey="txtAreaOfLandInsResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label3" runat="server" Text="Valuate Property" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlValuateProperty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlValuateProperty_SelectedIndexChanged"
                                    SelectedValue='<%# Bind("IsConstructedProperty") %>' OnDataBinding="ddlValuateProperty_DataBinding"
                                    meta:resourcekey="ddlValuatePropertyResource1">
                                    <asp:ListItem Text="No" Value="False" meta:resourcekey="ListItemResource4" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="True" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="Label2" runat="server" Text="Scheme Type" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td class="textColumn">
                                &nbsp;<asp:DropDownList ID="ddloSchemeType" runat="server" SelectedValue='<%# Bind("SchemeType") %>'
                                    meta:resourcekey="ddloSchemeTypeResource1">
                                    <asp:ListItem Text="TP Scheme" Value="TP Scheme" meta:resourcekey="ListItemResource6"
                                        Selected="True"></asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <strong>
                                    <asp:Label ID="lblTpSchemeNo" runat="server" Text="Tp Scheme No" meta:resourcekey="lblTpSchemeNoResource2"></asp:Label>
                                    *</strong></td>
                            <td class="textColumn">
                                &nbsp;<asp:TextBox ID="txtTpSchemeNoIns" runat="server" Text='<%# Bind("SchemeNo") %>'
                                    meta:resourcekey="txtTpSchemeNoInsResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCheckPhysicalVerification" runat="server" SkinID="SubHeading" Text="Check Physical Verification"
                                    meta:resourcekey="lblCheckPhysicalVerificationResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                                <asp:Label ID="lblPhysicalVerification" runat="server" Text="Physical Verification Required"
                                    meta:resourcekey="lblPhysicalVerificationResource1"></asp:Label></td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                                <asp:CheckBox ID="chkPhysicalVerification" runat="server" meta:resourcekey="chkPhysicalVerificationResource1" AutoPostBack="True" OnCheckedChanged="chkPhysicalVerification_CheckedChanged" /></td>
                            <td class="labelColumn">
                                <asp:Label ID="lblLandType" runat="server" Text="Land Type" meta:resourcekey="lblLandTypeResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("TypeOfLand") %>'
                                    meta:resourcekey="DropDownList2Resource1">
                                    <asp:ListItem Text="APrate" Value="APrate" meta:resourcekey="ListItemResource7" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="ANPrate" Value="ANPrate" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                    <asp:ListItem Text="NA_Res_Rate" Value="NA_Res_Rate" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                    <asp:ListItem Text="NA_Comm_Rate" Value="NA_Comm_Rate" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                    <asp:ListItem Text="NA_Ind_Rate" Value="NA_Ind_Rate" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                    <asp:ListItem Text="NA_Prate" Value="NA_Prate" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="right" class="labelColumn">
                                <asp:HiddenField ID="fldAdjId" runat="server" Value='<%# Bind("AdjudicationId") %>' />
                                <asp:HiddenField ID="fldValId" runat="server" Value='<%# Bind("ValuationId") %>' />
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="btnCalculate" runat="server" CommandName="Update" Text="Proceed"
                                    meta:resourcekey="btnCalculateResource2" OnClick="btnCalculate_Click1" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 15px" colspan="6">
                                &nbsp; &nbsp;<uc1:FileForward ID="ffcPVRequest" runat="server" Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:MultiView ID="mvValuateConstruction" runat="server">
                                    <asp:View ID="viewConstructionDetails" runat="server">
                                        <table width="100%">
                                        </table>
                                        <table width="100%">
                                            <tr>
                                                <td class="labelColumn">
                                                    &nbsp;<asp:Label ID="lblConstructionRate" runat="server" Text="Construction Cost"
                                                        meta:resourcekey="lblConstructionRateResource1"></asp:Label></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtConstructionRate" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                                                        meta:resourcekey="txtConstructionRateResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <asp:Label ID="lblAreaOfConstruction" runat="server" Text="Area Of Constriction"
                                                        meta:resourcekey="lblAreaOfConstructionResource2"></asp:Label><strong> * </strong>
                                                </td>
                                                <td class="textColumn">
                                                    <asp:TextBox ID="txtAreaOfConstructionIns" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                                                        meta:resourcekey="txtAreaOfConstructionInsResource1"></asp:TextBox>
                                                </td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    &nbsp;<asp:Label ID="lblInternalElectricficationRate" runat="server" Text="Internal ElectricficationRate"
                                                        meta:resourcekey="lblInternalElectricficationRateResource2"></asp:Label></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtInternalElectrificationRateIns" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                                                        meta:resourcekey="txtInternalElectrificationRateInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInternalElectrificationRateIns"
                                                        ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator1Resource2"></asp:RangeValidator></td>
                                                <td class="labelColumn">
                                                    <strong>*
                                                        <asp:Label ID="lblDevelopmentFeeRate" runat="server" Text="Development Fee Rate"
                                                            meta:resourcekey="lblDevelopmentFeeRateResource2"></asp:Label></strong></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtDevelopmentFeeRateIns" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                                                        meta:resourcekey="txtDevelopmentFeeRateInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtDevelopmentFeeRateIns"
                                                        ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator3Resource2"></asp:RangeValidator></td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    &nbsp;<asp:Label ID="lblOtherFeeRate" runat="server" Text="Other Fee Rate" meta:resourcekey="lblOtherFeeRateResource2"></asp:Label></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtOtherFeeRateIns" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                                                        meta:resourcekey="txtOtherFeeRateInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtOtherFeeRateIns"
                                                        ErrorMessage="Enter 10-15%" MaximumValue="15" MinimumValue="10" meta:resourcekey="RangeValidator2Resource2"></asp:RangeValidator></td>
                                                <td class="labelColumn">
                                                    <strong>
                                                        <asp:Label ID="lblSpecialDeduction" runat="server" Text="Special Deduction" meta:resourcekey="lblSpecialDeductionResource2"></asp:Label></strong></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtSpecialDeductionIns" runat="server" Text='<%# Bind("SpecialDeductionRate") %>'
                                                        meta:resourcekey="txtSpecialDeductionInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    &nbsp;<asp:Label ID="lblLiftExpense" runat="server" Text="LiftExpense" meta:resourcekey="lblLiftExpenseResource2"></asp:Label></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtLiftExpenseIns" runat="server" Text='<%# Bind("LiftExpense") %>'
                                                        meta:resourcekey="txtLiftExpenseInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                </td>
                                                <td class="labelColumn">
                                                    <strong>
                                                        <asp:Label ID="lblYearOfConstruction" runat="server" Text="YeaOf Construction" meta:resourcekey="lblYearOfConstructionResource2"></asp:Label></strong></td>
                                                <td class="textColumn">
                                                    &nbsp;<asp:TextBox ID="txtYearOfConstructionIns" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                                                        meta:resourcekey="txtYearOfConstructionInsResource1"></asp:TextBox></td>
                                                <td class="validationColumn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelColumn">
                                                    &nbsp;</td>
                                                <td class="textColumn">
                                                    &nbsp;</td>
                                                <td class="validationColumn">
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
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="ViewCertificate" runat="server">
            <asp:FormView ID="fvIssuecertificate" runat="server" OnModeChanged="fvIssuecertificate_ModeChanged"
                DefaultMode="Edit" DataSourceID="odsIssueCertificate" meta:resourcekey="fvIssuecertificateResource1"
                OnItemUpdated="fvIssuecertificate_ItemUpdated1">
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDutyCalculation" runat="server" SkinID="SubHeading" Text="Stamp Duty Calculation"
                                    meta:resourcekey="lblStampDutyCalculationResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictCode" runat="server" Text="District Code" meta:resourcekey="lblDistrictCodeResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistirctCode" runat="server" SelectedValue='<%# Bind("DistrictCode") %>'
                                    DataSourceID="odsDistirctMaster" DataTextField="distname" DataValueField="distcd"
                                    meta:resourcekey="ddlDistirctCodeResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTalukaCode" runat="server" Text="Taluka Code" meta:resourcekey="lblTalukaCodeResource3"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("TalukaCode") %>'
                                    DataSourceID="odsTalukaMaster" DataTextField="talukaname" DataValueField="talcd"
                                    meta:resourcekey="DropDownList3Resource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVillageCode" runat="server" Text="Village Code" meta:resourcekey="lblVillageCodeResource3"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlVillageCode" runat="server" SelectedValue='<%# Bind("VillageCode") %>'
                                    DataSourceID="odsVillageMaster" DataTextField="villname" DataValueField="villcd"
                                    meta:resourcekey="ddlVillageCodeResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" Text="Scheme Type" meta:resourcekey="lblAdjudicationTotalFeesInsResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SchemeType") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberIns" runat="server" Text="Estimated Price" meta:resourcekey="lblReceiptNumberInsResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EstimatedPrice") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" Text="IsConstructedProperty" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                                    meta:resourcekey="CheckBox1Resource1" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label4" runat="server" Text="Scheme No" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SchemeNo") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label5" runat="server" Text="Plot No" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label6" runat="server" Text="Area Of Plot" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AreaOfPlot") %>' meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label7" runat="server" Text="Area Of Construction" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                                    meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label8" runat="server" Text="Type Of Land" meta:resourcekey="Label8Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TypeOfLand") %>' meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label9" runat="server" Text="Internal Electrification Rate" meta:resourcekey="Label9Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                                    meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label10" runat="server" Text="Development Rate" meta:resourcekey="Label10Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("DevelopmentRate") %>' meta:resourcekey="TextBox9Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label11" runat="server" Text="OtherFeeRate" meta:resourcekey="Label11Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("OtherFeeRate") %>' meta:resourcekey="TextBox10Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label12" runat="server" Text="SpecialDeductionRate" meta:resourcekey="Label12Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("SpecialDeductionRate") %>'
                                    meta:resourcekey="TextBox11Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label13" runat="server" Text="Year Of Construction" meta:resourcekey="Label13Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                                    meta:resourcekey="TextBox12Resource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label14" runat="server" Text="Lift Expense" meta:resourcekey="Label14Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("LiftExpense") %>' meta:resourcekey="TextBox13Resource1"></asp:TextBox>
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
                                <asp:Label ID="lblConstructionRate" runat="server" Text="Land  Rate" meta:resourcekey="lblConstructionRateResource2"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptNumberIns" runat="server" Text='<%# Bind("LandRate") %>'
                                    meta:resourcekey="txtReceiptNumberInsResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblValuationDate" runat="server" Text="Value Of Land" meta:resourcekey="lblValuationDateResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtValuationDate" runat="server" Text='<%# Bind("ValueOfLand") %>'
                                    meta:resourcekey="txtValuationDateResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblIsConstructedProperty" runat="server" Text="Internal Electrification Expense"
                                    meta:resourcekey="lblIsConstructedPropertyResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtIsConstructedProperty" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                                    meta:resourcekey="txtIsConstructedPropertyResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAreaOfPlot" runat="server" Text="Development Expense" meta:resourcekey="lblAreaOfPlotResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfPlot" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                                    meta:resourcekey="txtAreaOfPlotResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblLandRate" runat="server" Text="Other Fees" meta:resourcekey="lblLandRateResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtLandRate" runat="server" Text='<%# Bind("OtherFees") %>' meta:resourcekey="txtLandRateResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblSchemeType" runat="server" Text="Special Deduction" meta:resourcekey="lblSchemeTypeResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSchemeType" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                                    meta:resourcekey="txtSchemeTypeResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblValueOfLand" runat="server" Text="Estimated Price Of Construction"
                                    meta:resourcekey="lblValueOfLandResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtValueOfLand" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                                    meta:resourcekey="txtValueOfLandResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPlinthAreaOfConstruction" runat="server" Text="Life Of construction"
                                    meta:resourcekey="lblPlinthAreaOfConstructionResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPlinthAreaOfConstruction" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                                    meta:resourcekey="txtPlinthAreaOfConstructionResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDevelopmentRate" runat="server" Text="Depriciation" meta:resourcekey="lblDevelopmentRateResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDevelopmentRate" runat="server" Text='<%# Bind("Depreciation") %>'
                                    meta:resourcekey="txtDevelopmentRateResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblConstructionRate1" runat="server" Text="Net Price" meta:resourcekey="lblConstructionRate1Resource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtConstructionRate" runat="server" Text='<%# Bind("NetPrice") %>'
                                    meta:resourcekey="txtConstructionRateResource2"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblConstructionExpense" runat="server" Text="Value Of Construction"
                                    meta:resourcekey="lblConstructionExpenseResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtConstructionExpense" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                                    meta:resourcekey="txtConstructionExpenseResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblInternalElectrificationExpense" runat="server" Text="Valuation Of Property"
                                    meta:resourcekey="lblInternalElectrificationExpenseResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtInternalElectrificationExpense" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                                    meta:resourcekey="txtInternalElectrificationExpenseResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                &nbsp;<asp:Label ID="Label16" runat="server" Text="Stamp Duty Rate" meta:resourcekey="Label16Resource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEstimatedPrice" runat="server" Text='<%# Bind("StampDutyRate") %>'
                                    meta:resourcekey="txtEstimatedPriceResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepreciation" runat="server" Text="StampDuty" meta:resourcekey="lblDepreciationResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDepreciation" runat="server" Text='<%# Bind("ValuationOfConstruction") %>'
                                    meta:resourcekey="txtDepreciationResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEstimatedPrice" runat="server" Text="Remarks" meta:resourcekey="lblEstimatedPriceResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="TextBox14Resource1"></asp:TextBox></td>
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
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Save" meta:resourcekey="btnUpdateResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDutyCalculationIns" runat="server" SkinID="SubHeading" Text="Certificate Details"
                                    meta:resourcekey="lblStampDutyCalculationInsResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="CertificateNumber" runat="server" Text="CertificateNumber" meta:resourcekey="CertificateNumberResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCertificateNumber" runat="server" meta:resourcekey="txtCertificateNumberResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCertificateIssuedOn" runat="server" Text="Certificate Issued On"
                                    meta:resourcekey="lblCertificateIssuedOnResource1"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCertificateIssuedOn" runat="server" SkinID="Calendar" meta:resourcekey="txtCertificateIssuedOnResource1"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" Control="txtCertificateIssuedOn"
                                    meta:resourcekey="PopCalendar3Resource1" />
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblCertificateRemarks" runat="server" Text="Remarks" meta:resourcekey="lblCertificateRemarksResource1"></asp:Label>
                            </td>
                            <td align="left" colspan="4">
                                <asp:TextBox ID="txtCertificateRemarks" runat="server" TextMode="MultiLine" meta:resourcekey="txtCertificateRemarksResource1"></asp:TextBox>
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:HiddenField ID="fldAdjId" runat="server" Value='<%# Bind("AdjudicationId") %>' />
                            </td>
                            <td align="right" colspan="4">
                            </td>
                            <td class="validationColumn" style="width: 2%">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:HiddenField ID="FldValId" runat="server" Value='<%# Bind("ValuationId") %>' />
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="btnStampDutyUpdate" runat="server" OnClick="btnIssueCertificate_Click1"
                                    Text="Issue" meta:resourcekey="btnStampDutyUpdateResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    DistrictCode:
                    <asp:TextBox ID="DistrictCodeTextBox" runat="server" Text='<%# Bind("DistrictCode") %>'
                        meta:resourcekey="DistrictCodeTextBoxResource1"></asp:TextBox><br />
                    OtherFees:
                    <asp:TextBox ID="OtherFeesTextBox" runat="server" Text='<%# Bind("OtherFees") %>'
                        meta:resourcekey="OtherFeesTextBoxResource1"></asp:TextBox><br />
                    ValueOfConstruction:
                    <asp:TextBox ID="ValueOfConstructionTextBox" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                        meta:resourcekey="ValueOfConstructionTextBoxResource1"></asp:TextBox><br />
                    InternalElectrificationRate:
                    <asp:TextBox ID="InternalElectrificationRateTextBox" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                        meta:resourcekey="InternalElectrificationRateTextBoxResource1"></asp:TextBox><br />
                    TpSchemeNo:
                    <asp:TextBox ID="TpSchemeNoTextBox" runat="server" Text='<%# Bind("TpSchemeNo") %>'
                        meta:resourcekey="TpSchemeNoTextBoxResource1"></asp:TextBox><br />
                    VillageCode:
                    <asp:TextBox ID="VillageCodeTextBox" runat="server" Text='<%# Bind("VillageCode") %>'
                        meta:resourcekey="VillageCodeTextBoxResource1"></asp:TextBox><br />
                    ConstructionRate:
                    <asp:TextBox ID="ConstructionRateTextBox" runat="server" Text='<%# Bind("ConstructionRate") %>'
                        meta:resourcekey="ConstructionRateTextBoxResource1"></asp:TextBox><br />
                    LiftExpense:
                    <asp:TextBox ID="LiftExpenseTextBox" runat="server" Text='<%# Bind("LiftExpense") %>'
                        meta:resourcekey="LiftExpenseTextBoxResource1"></asp:TextBox><br />
                    DevelopmentExpense:
                    <asp:TextBox ID="DevelopmentExpenseTextBox" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                        meta:resourcekey="DevelopmentExpenseTextBoxResource1"></asp:TextBox><br />
                    LifeOfConstruction:
                    <asp:TextBox ID="LifeOfConstructionTextBox" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                        meta:resourcekey="LifeOfConstructionTextBoxResource1"></asp:TextBox><br />
                    SchemeType:
                    <asp:TextBox ID="SchemeTypeTextBox" runat="server" Text='<%# Bind("SchemeType") %>'
                        meta:resourcekey="SchemeTypeTextBoxResource1"></asp:TextBox><br />
                    AdjudicationId:
                    <asp:TextBox ID="AdjudicationIdTextBox" runat="server" Text='<%# Bind("AdjudicationId") %>'
                        meta:resourcekey="AdjudicationIdTextBoxResource1"></asp:TextBox><br />
                    TypeOfLand:
                    <asp:TextBox ID="TypeOfLandTextBox" runat="server" Text='<%# Bind("TypeOfLand") %>'
                        meta:resourcekey="TypeOfLandTextBoxResource1"></asp:TextBox><br />
                    StampDutyRate:
                    <asp:TextBox ID="StampDutyRateTextBox" runat="server" Text='<%# Bind("StampDutyRate") %>'
                        meta:resourcekey="StampDutyRateTextBoxResource1"></asp:TextBox><br />
                    ValuationId:
                    <asp:TextBox ID="ValuationIdTextBox" runat="server" Text='<%# Bind("ValuationId") %>'
                        meta:resourcekey="ValuationIdTextBoxResource1"></asp:TextBox><br />
                    YearOfConstruction:
                    <asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                        meta:resourcekey="YearOfConstructionTextBoxResource1"></asp:TextBox><br />
                    ValueOfLand:
                    <asp:TextBox ID="ValueOfLandTextBox" runat="server" Text='<%# Bind("ValueOfLand") %>'
                        meta:resourcekey="ValueOfLandTextBoxResource1"></asp:TextBox><br />
                    TalukaCode:
                    <asp:TextBox ID="TalukaCodeTextBox" runat="server" Text='<%# Bind("TalukaCode") %>'
                        meta:resourcekey="TalukaCodeTextBoxResource1"></asp:TextBox><br />
                    m_ValuationDate:
                    <asp:TextBox ID="m_ValuationDateTextBox" runat="server" Text='<%# Bind("m_ValuationDate") %>'
                        meta:resourcekey="m_ValuationDateTextBoxResource1"></asp:TextBox><br />
                    OtherFeeRate:
                    <asp:TextBox ID="OtherFeeRateTextBox" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                        meta:resourcekey="OtherFeeRateTextBoxResource1"></asp:TextBox><br />
                    AreaOfPlot:
                    <asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                        meta:resourcekey="AreaOfPlotTextBoxResource1"></asp:TextBox><br />
                    NetPrice:
                    <asp:TextBox ID="NetPriceTextBox" runat="server" Text='<%# Bind("NetPrice") %>' meta:resourcekey="NetPriceTextBoxResource1"></asp:TextBox><br />
                    StampDuty:
                    <asp:TextBox ID="StampDutyTextBox" runat="server" Text='<%# Bind("StampDuty") %>'
                        meta:resourcekey="StampDutyTextBoxResource1"></asp:TextBox><br />
                    ValuationOfProperty:
                    <asp:TextBox ID="ValuationOfPropertyTextBox" runat="server" Text='<%# Bind("ValuationOfProperty") %>'
                        meta:resourcekey="ValuationOfPropertyTextBoxResource1"></asp:TextBox><br />
                    IsConstructedProperty:
                    <asp:CheckBox ID="IsConstructedPropertyCheckBox" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                        meta:resourcekey="IsConstructedPropertyCheckBoxResource1" /><br />
                    SpecialDeduction:
                    <asp:TextBox ID="SpecialDeductionTextBox" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                        meta:resourcekey="SpecialDeductionTextBoxResource1"></asp:TextBox><br />
                    ValuationDate:
                    <asp:TextBox ID="ValuationDateTextBox" runat="server" Text='<%# Bind("ValuationDate") %>'
                        meta:resourcekey="ValuationDateTextBoxResource2"></asp:TextBox><br />
                    PlinthAreaOfConstruction:
                    <asp:TextBox ID="PlinthAreaOfConstructionTextBox" runat="server" Text='<%# Bind("PlinthAreaOfConstruction") %>'
                        meta:resourcekey="PlinthAreaOfConstructionTextBoxResource1"></asp:TextBox><br />
                    PlotNo:
                    <asp:TextBox ID="PlotNoTextBox" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="PlotNoTextBoxResource1"></asp:TextBox><br />
                    EstimatedPriceOfConstruction:
                    <asp:TextBox ID="EstimatedPriceOfConstructionTextBox" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                        meta:resourcekey="EstimatedPriceOfConstructionTextBoxResource1"></asp:TextBox><br />
                    Depreciation:
                    <asp:TextBox ID="DepreciationTextBox" runat="server" Text='<%# Bind("Depreciation") %>'
                        meta:resourcekey="DepreciationTextBoxResource1"></asp:TextBox><br />
                    ConstructionExpense:
                    <asp:TextBox ID="ConstructionExpenseTextBox" runat="server" Text='<%# Bind("ConstructionExpense") %>'
                        meta:resourcekey="ConstructionExpenseTextBoxResource1"></asp:TextBox><br />
                    LandRate:
                    <asp:TextBox ID="LandRateTextBox" runat="server" Text='<%# Bind("LandRate") %>' meta:resourcekey="LandRateTextBoxResource1"></asp:TextBox><br />
                    EstimatedPrice:
                    <asp:TextBox ID="EstimatedPriceTextBox" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                        meta:resourcekey="EstimatedPriceTextBoxResource1"></asp:TextBox><br />
                    m_ReceivedDate:
                    <asp:TextBox ID="m_ReceivedDateTextBox" runat="server" Text='<%# Bind("m_ReceivedDate") %>'
                        meta:resourcekey="m_ReceivedDateTextBoxResource1"></asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksTextBoxResource1"></asp:TextBox><br />
                    InternalElectrificationExpense:
                    <asp:TextBox ID="InternalElectrificationExpenseTextBox" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                        meta:resourcekey="InternalElectrificationExpenseTextBoxResource1"></asp:TextBox><br />
                    DevelopmentRate:
                    <asp:TextBox ID="DevelopmentRateTextBox" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                        meta:resourcekey="DevelopmentRateTextBoxResource1"></asp:TextBox><br />
                    ReceivedDate:
                    <asp:TextBox ID="ReceivedDateTextBox" runat="server" Text='<%# Bind("ReceivedDate") %>'
                        meta:resourcekey="ReceivedDateTextBoxResource2"></asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"
                        meta:resourcekey="InsertButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="InsertCancelButtonResource1"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    DistrictCode:
                    <asp:Label ID="DistrictCodeLabel" runat="server" Text='<%# Bind("DistrictCode") %>'
                        meta:resourcekey="DistrictCodeLabelResource1"></asp:Label><br />
                    OtherFees:
                    <asp:Label ID="OtherFeesLabel" runat="server" Text='<%# Bind("OtherFees") %>' meta:resourcekey="OtherFeesLabelResource1"></asp:Label><br />
                    ValueOfConstruction:
                    <asp:Label ID="ValueOfConstructionLabel" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                        meta:resourcekey="ValueOfConstructionLabelResource1"></asp:Label><br />
                    InternalElectrificationRate:
                    <asp:Label ID="InternalElectrificationRateLabel" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                        meta:resourcekey="InternalElectrificationRateLabelResource1"></asp:Label><br />
                    TpSchemeNo:
                    <asp:Label ID="TpSchemeNoLabel" runat="server" Text='<%# Bind("TpSchemeNo") %>' meta:resourcekey="TpSchemeNoLabelResource1"></asp:Label><br />
                    VillageCode:
                    <asp:Label ID="VillageCodeLabel" runat="server" Text='<%# Bind("VillageCode") %>'
                        meta:resourcekey="VillageCodeLabelResource1"></asp:Label><br />
                    ConstructionRate:
                    <asp:Label ID="ConstructionRateLabel" runat="server" Text='<%# Bind("ConstructionRate") %>'
                        meta:resourcekey="ConstructionRateLabelResource1"></asp:Label><br />
                    LiftExpense:
                    <asp:Label ID="LiftExpenseLabel" runat="server" Text='<%# Bind("LiftExpense") %>'
                        meta:resourcekey="LiftExpenseLabelResource1"></asp:Label><br />
                    DevelopmentExpense:
                    <asp:Label ID="DevelopmentExpenseLabel" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                        meta:resourcekey="DevelopmentExpenseLabelResource1"></asp:Label><br />
                    LifeOfConstruction:
                    <asp:Label ID="LifeOfConstructionLabel" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                        meta:resourcekey="LifeOfConstructionLabelResource1"></asp:Label><br />
                    SchemeType:
                    <asp:Label ID="SchemeTypeLabel" runat="server" Text='<%# Bind("SchemeType") %>' meta:resourcekey="SchemeTypeLabelResource1"></asp:Label><br />
                    AdjudicationId:
                    <asp:Label ID="AdjudicationIdLabel" runat="server" Text='<%# Bind("AdjudicationId") %>'
                        meta:resourcekey="AdjudicationIdLabelResource1"></asp:Label><br />
                    TypeOfLand:
                    <asp:Label ID="TypeOfLandLabel" runat="server" Text='<%# Bind("TypeOfLand") %>' meta:resourcekey="TypeOfLandLabelResource1"></asp:Label><br />
                    StampDutyRate:
                    <asp:Label ID="StampDutyRateLabel" runat="server" Text='<%# Bind("StampDutyRate") %>'
                        meta:resourcekey="StampDutyRateLabelResource1"></asp:Label><br />
                    ValuationId:
                    <asp:Label ID="ValuationIdLabel" runat="server" Text='<%# Bind("ValuationId") %>'
                        meta:resourcekey="ValuationIdLabelResource1"></asp:Label><br />
                    YearOfConstruction:
                    <asp:Label ID="YearOfConstructionLabel" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                        meta:resourcekey="YearOfConstructionLabelResource1"></asp:Label><br />
                    ValueOfLand:
                    <asp:Label ID="ValueOfLandLabel" runat="server" Text='<%# Bind("ValueOfLand") %>'
                        meta:resourcekey="ValueOfLandLabelResource1"></asp:Label><br />
                    TalukaCode:
                    <asp:Label ID="TalukaCodeLabel" runat="server" Text='<%# Bind("TalukaCode") %>' meta:resourcekey="TalukaCodeLabelResource1"></asp:Label><br />
                    m_ValuationDate:
                    <asp:Label ID="m_ValuationDateLabel" runat="server" Text='<%# Bind("m_ValuationDate") %>'
                        meta:resourcekey="m_ValuationDateLabelResource1"></asp:Label><br />
                    OtherFeeRate:
                    <asp:Label ID="OtherFeeRateLabel" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                        meta:resourcekey="OtherFeeRateLabelResource1"></asp:Label><br />
                    AreaOfPlot:
                    <asp:Label ID="AreaOfPlotLabel" runat="server" Text='<%# Bind("AreaOfPlot") %>' meta:resourcekey="AreaOfPlotLabelResource1"></asp:Label><br />
                    NetPrice:
                    <asp:Label ID="NetPriceLabel" runat="server" Text='<%# Bind("NetPrice") %>' meta:resourcekey="NetPriceLabelResource1"></asp:Label><br />
                    StampDuty:
                    <asp:Label ID="StampDutyLabel" runat="server" Text='<%# Bind("StampDuty") %>' meta:resourcekey="StampDutyLabelResource1"></asp:Label><br />
                    ValuationOfProperty:
                    <asp:Label ID="ValuationOfPropertyLabel" runat="server" Text='<%# Bind("ValuationOfProperty") %>'
                        meta:resourcekey="ValuationOfPropertyLabelResource1"></asp:Label><br />
                    IsConstructedProperty:
                    <asp:CheckBox ID="IsConstructedPropertyCheckBox" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                        Enabled="False" meta:resourcekey="IsConstructedPropertyCheckBoxResource2" /><br />
                    SpecialDeduction:
                    <asp:Label ID="SpecialDeductionLabel" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                        meta:resourcekey="SpecialDeductionLabelResource1"></asp:Label><br />
                    ValuationDate:
                    <asp:Label ID="ValuationDateLabel" runat="server" Text='<%# Bind("ValuationDate") %>'
                        meta:resourcekey="ValuationDateLabelResource2"></asp:Label><br />
                    PlinthAreaOfConstruction:
                    <asp:Label ID="PlinthAreaOfConstructionLabel" runat="server" Text='<%# Bind("PlinthAreaOfConstruction") %>'
                        meta:resourcekey="PlinthAreaOfConstructionLabelResource1"></asp:Label><br />
                    PlotNo:
                    <asp:Label ID="PlotNoLabel" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="PlotNoLabelResource1"></asp:Label><br />
                    EstimatedPriceOfConstruction:
                    <asp:Label ID="EstimatedPriceOfConstructionLabel" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                        meta:resourcekey="EstimatedPriceOfConstructionLabelResource1"></asp:Label><br />
                    Depreciation:
                    <asp:Label ID="DepreciationLabel" runat="server" Text='<%# Bind("Depreciation") %>'
                        meta:resourcekey="DepreciationLabelResource1"></asp:Label><br />
                    ConstructionExpense:
                    <asp:Label ID="ConstructionExpenseLabel" runat="server" Text='<%# Bind("ConstructionExpense") %>'
                        meta:resourcekey="ConstructionExpenseLabelResource1"></asp:Label><br />
                    LandRate:
                    <asp:Label ID="LandRateLabel" runat="server" Text='<%# Bind("LandRate") %>' meta:resourcekey="LandRateLabelResource1"></asp:Label><br />
                    EstimatedPrice:
                    <asp:Label ID="EstimatedPriceLabel" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                        meta:resourcekey="EstimatedPriceLabelResource1"></asp:Label><br />
                    m_ReceivedDate:
                    <asp:Label ID="m_ReceivedDateLabel" runat="server" Text='<%# Bind("m_ReceivedDate") %>'
                        meta:resourcekey="m_ReceivedDateLabelResource1"></asp:Label><br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksLabelResource1"></asp:Label><br />
                    InternalElectrificationExpense:
                    <asp:Label ID="InternalElectrificationExpenseLabel" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                        meta:resourcekey="InternalElectrificationExpenseLabelResource1"></asp:Label><br />
                    DevelopmentRate:
                    <asp:Label ID="DevelopmentRateLabel" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                        meta:resourcekey="DevelopmentRateLabelResource1"></asp:Label><br />
                    ReceivedDate:
                    <asp:Label ID="ReceivedDateLabel" runat="server" Text='<%# Bind("ReceivedDate") %>'
                        meta:resourcekey="ReceivedDateLabelResource2"></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit" meta:resourcekey="EditButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New" meta:resourcekey="NewButtonResource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            <asp:HiddenField ID="fldAdjudicationId" runat="server" />
        </asp:View>
        <asp:View ID="viewLandValuation" runat="server">
            <asp:FormView ID="fvlandValuation" runat="server" DataSourceID="odsStampDutyValuation"
                DefaultMode="Edit" meta:resourcekey="fvlandValuationResource1">
                <InsertItemTemplate>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblStampDutyCalculationIns" runat="server" SkinID="SubHeading" Text="Stamp Duty Calculation For Land"
                                    meta:resourcekey="lblStampDutyCalculationInsResource3"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistirctCode" runat="server" Text="Distirct Code" meta:resourcekey="lblDistirctCodeResource3"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistirctCodeIns" runat="server" DataSourceID="odsDistirctMaster"
                                    DataTextField="distname" DataValueField="distcd" SelectedIndex='<%# Bind("DistrictCode") %>'
                                    meta:resourcekey="ddlDistirctCodeInsResource2">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblTalukaCode" runat="server" Text="Taluka Code" meta:resourcekey="lblTalukaCodeResource4"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlTalukaCodeIns" runat="server" DataSourceID="odsTalukaMaster"
                                    DataTextField="talukaname" DataValueField="talcd" SelectedIndex='<%# Bind("TalukaCode") %>'
                                    meta:resourcekey="ddlTalukaCodeInsResource2">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblVillageCode" runat="server" Text="village Code" meta:resourcekey="lblVillageCodeResource4"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlVillageCodeIns" runat="server" DataSourceID="odsVillageMaster"
                                    DataTextField="villname" DataValueField="villcd" SelectedIndex='<%# Bind("VillageCode") %>'
                                    meta:resourcekey="ddlVillageCodeInsResource2">
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
                            <td class="labelColumn" style="width: 77px; height: 28px">
                                <asp:Label ID="lbllandType" runat="server" Text="Land Type" meta:resourcekey="lbllandTypeResource2"></asp:Label></td>
                            <td class="textColumn">
                                <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource13">Agricultral</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource14">Residential</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource15">Industrial</asp:ListItem>
                                </asp:DropDownList></td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAreaOfLand" runat="server" Text="Area Of Land" meta:resourcekey="lblAreaOfLandResource3"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAreaOfLandIns" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                                    meta:resourcekey="txtAreaOfLandInsResource2"></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTpSchemeNo" runat="server" Text="Tp Scheme No" meta:resourcekey="lblTpSchemeNoResource3"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtTpSchemeNoIns" runat="server" Text='<%# Bind("TpSchemeNo") %>'
                                    meta:resourcekey="txtTpSchemeNoInsResource2"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPlotNo" runat="server" Text="Plot No" meta:resourcekey="lblPlotNoResource3"></asp:Label><strong>
                                    * </strong>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPlotNoIns" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="txtPlotNoInsResource2"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlotNoIns"
                                    ErrorMessage="*" meta:resourcekey="RequiredFieldValidator1Resource3"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblCheckPhysicalVerification" runat="server" SkinID="SubHeading" Text="Check Physical Verification"
                                    meta:resourcekey="lblCheckPhysicalVerificationResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px">
                            </td>
                            <td class="textColumn">
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
                            <td class="labelColumn" style="width: 77px; height: 28px">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td align="right" class="labelColumn">
                                &nbsp;
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="btnCalculate" runat="server" CommandName="Update" Text="Proceed"
                                    meta:resourcekey="btnCalculateResource3" /></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
            <asp:FormView ID="FormView1" runat="server" OnModeChanged="fvIssuecertificate_ModeChanged"
                DataSourceID="odsIssueCertificate" Enabled="False" Visible="False" meta:resourcekey="FormView1Resource1">
                <EditItemTemplate>
                    DistrictCode:
                    <asp:TextBox ID="DistrictCodeTextBox" runat="server" Text='<%# Bind("DistrictCode") %>'
                        meta:resourcekey="DistrictCodeTextBoxResource3"></asp:TextBox><br />
                    OtherFees:
                    <asp:TextBox ID="OtherFeesTextBox" runat="server" Text='<%# Bind("OtherFees") %>'
                        meta:resourcekey="OtherFeesTextBoxResource3"></asp:TextBox><br />
                    StampDuty:
                    <asp:TextBox ID="StampDutyTextBox" runat="server" Text='<%# Bind("StampDuty") %>'
                        meta:resourcekey="StampDutyTextBoxResource3"></asp:TextBox><br />
                    InternalElectrificationRate:
                    <asp:TextBox ID="InternalElectrificationRateTextBox" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                        meta:resourcekey="InternalElectrificationRateTextBoxResource3"></asp:TextBox><br />
                    VillageCode:
                    <asp:TextBox ID="VillageCodeTextBox" runat="server" Text='<%# Bind("VillageCode") %>'
                        meta:resourcekey="VillageCodeTextBoxResource3"></asp:TextBox><br />
                    LiftExpense:
                    <asp:TextBox ID="LiftExpenseTextBox" runat="server" Text='<%# Bind("LiftExpense") %>'
                        meta:resourcekey="LiftExpenseTextBoxResource3"></asp:TextBox><br />
                    DevelopmentExpense:
                    <asp:TextBox ID="DevelopmentExpenseTextBox" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                        meta:resourcekey="DevelopmentExpenseTextBoxResource3"></asp:TextBox><br />
                    LifeOfConstruction:
                    <asp:TextBox ID="LifeOfConstructionTextBox" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                        meta:resourcekey="LifeOfConstructionTextBoxResource3"></asp:TextBox><br />
                    SchemeType:
                    <asp:TextBox ID="SchemeTypeTextBox" runat="server" Text='<%# Bind("SchemeType") %>'
                        meta:resourcekey="SchemeTypeTextBoxResource3"></asp:TextBox><br />
                    AdjudicationId:
                    <asp:TextBox ID="AdjudicationIdTextBox" runat="server" Text='<%# Bind("AdjudicationId") %>'
                        meta:resourcekey="AdjudicationIdTextBoxResource3"></asp:TextBox><br />
                    TypeOfLand:
                    <asp:TextBox ID="TypeOfLandTextBox" runat="server" Text='<%# Bind("TypeOfLand") %>'
                        meta:resourcekey="TypeOfLandTextBoxResource3"></asp:TextBox><br />
                    StampDutyRate:
                    <asp:TextBox ID="StampDutyRateTextBox" runat="server" Text='<%# Bind("StampDutyRate") %>'
                        meta:resourcekey="StampDutyRateTextBoxResource3"></asp:TextBox><br />
                    ValuationId:
                    <asp:TextBox ID="ValuationIdTextBox" runat="server" Text='<%# Bind("ValuationId") %>'
                        meta:resourcekey="ValuationIdTextBoxResource3"></asp:TextBox><br />
                    YearOfConstruction:
                    <asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                        meta:resourcekey="YearOfConstructionTextBoxResource3"></asp:TextBox><br />
                    SpecialDeduction:
                    <asp:TextBox ID="SpecialDeductionTextBox" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                        meta:resourcekey="SpecialDeductionTextBoxResource3"></asp:TextBox><br />
                    TalukaCode:
                    <asp:TextBox ID="TalukaCodeTextBox" runat="server" Text='<%# Bind("TalukaCode") %>'
                        meta:resourcekey="TalukaCodeTextBoxResource3"></asp:TextBox><br />
                    SchemeNo:
                    <asp:TextBox ID="SchemeNoTextBox" runat="server" Text='<%# Bind("SchemeNo") %>' meta:resourcekey="SchemeNoTextBoxResource3"></asp:TextBox><br />
                    m_ValuationDate:
                    <asp:TextBox ID="m_ValuationDateTextBox" runat="server" Text='<%# Bind("m_ValuationDate") %>'
                        meta:resourcekey="m_ValuationDateTextBoxResource3"></asp:TextBox><br />
                    OtherFeeRate:
                    <asp:TextBox ID="OtherFeeRateTextBox" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                        meta:resourcekey="OtherFeeRateTextBoxResource3"></asp:TextBox><br />
                    AreaOfPlot:
                    <asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                        meta:resourcekey="AreaOfPlotTextBoxResource3"></asp:TextBox><br />
                    NetPrice:
                    <asp:TextBox ID="NetPriceTextBox" runat="server" Text='<%# Bind("NetPrice") %>' meta:resourcekey="NetPriceTextBoxResource3"></asp:TextBox><br />
                    IsConstructedProperty:
                    <asp:CheckBox ID="IsConstructedPropertyCheckBox" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                        meta:resourcekey="IsConstructedPropertyCheckBoxResource5" /><br />
                    SpecialDeductionRate:
                    <asp:TextBox ID="SpecialDeductionRateTextBox" runat="server" Text='<%# Bind("SpecialDeductionRate") %>'
                        meta:resourcekey="SpecialDeductionRateTextBoxResource2"></asp:TextBox><br />
                    ValueOfConstruction:
                    <asp:TextBox ID="ValueOfConstructionTextBox" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                        meta:resourcekey="ValueOfConstructionTextBoxResource3"></asp:TextBox><br />
                    ValuationDate:
                    <asp:TextBox ID="ValuationDateTextBox" runat="server" Text='<%# Bind("ValuationDate") %>'
                        meta:resourcekey="ValuationDateTextBoxResource4"></asp:TextBox><br />
                    ValueOfLand:
                    <asp:TextBox ID="ValueOfLandTextBox" runat="server" Text='<%# Bind("ValueOfLand") %>'
                        meta:resourcekey="ValueOfLandTextBoxResource3"></asp:TextBox><br />
                    PlotNo:
                    <asp:TextBox ID="PlotNoTextBox" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="PlotNoTextBoxResource3"></asp:TextBox><br />
                    EstimatedPriceOfConstruction:
                    <asp:TextBox ID="EstimatedPriceOfConstructionTextBox" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                        meta:resourcekey="EstimatedPriceOfConstructionTextBoxResource3"></asp:TextBox><br />
                    Depreciation:
                    <asp:TextBox ID="DepreciationTextBox" runat="server" Text='<%# Bind("Depreciation") %>'
                        meta:resourcekey="DepreciationTextBoxResource3"></asp:TextBox><br />
                    LandRate:
                    <asp:TextBox ID="LandRateTextBox" runat="server" Text='<%# Bind("LandRate") %>' meta:resourcekey="LandRateTextBoxResource3"></asp:TextBox><br />
                    EstimatedPrice:
                    <asp:TextBox ID="EstimatedPriceTextBox" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                        meta:resourcekey="EstimatedPriceTextBoxResource3"></asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksTextBoxResource3"></asp:TextBox><br />
                    ValuationOfConstruction:
                    <asp:TextBox ID="ValuationOfConstructionTextBox" runat="server" Text='<%# Bind("ValuationOfConstruction") %>'
                        meta:resourcekey="ValuationOfConstructionTextBoxResource2"></asp:TextBox><br />
                    InternalElectrificationExpense:
                    <asp:TextBox ID="InternalElectrificationExpenseTextBox" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                        meta:resourcekey="InternalElectrificationExpenseTextBoxResource3"></asp:TextBox><br />
                    DevelopmentRate:
                    <asp:TextBox ID="DevelopmentRateTextBox" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                        meta:resourcekey="DevelopmentRateTextBoxResource3"></asp:TextBox><br />
                    AreaOfConstruction:
                    <asp:TextBox ID="AreaOfConstructionTextBox" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                        meta:resourcekey="AreaOfConstructionTextBoxResource3"></asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                        meta:resourcekey="UpdateButtonResource1"></asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="UpdateCancelButtonResource1"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    DistrictCode:
                    <asp:TextBox ID="DistrictCodeTextBox" runat="server" Text='<%# Bind("DistrictCode") %>'
                        meta:resourcekey="DistrictCodeTextBoxResource2"></asp:TextBox><br />
                    OtherFees:
                    <asp:TextBox ID="OtherFeesTextBox" runat="server" Text='<%# Bind("OtherFees") %>'
                        meta:resourcekey="OtherFeesTextBoxResource2"></asp:TextBox><br />
                    StampDuty:
                    <asp:TextBox ID="StampDutyTextBox" runat="server" Text='<%# Bind("StampDuty") %>'
                        meta:resourcekey="StampDutyTextBoxResource2"></asp:TextBox><br />
                    InternalElectrificationRate:
                    <asp:TextBox ID="InternalElectrificationRateTextBox" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                        meta:resourcekey="InternalElectrificationRateTextBoxResource2"></asp:TextBox><br />
                    VillageCode:
                    <asp:TextBox ID="VillageCodeTextBox" runat="server" Text='<%# Bind("VillageCode") %>'
                        meta:resourcekey="VillageCodeTextBoxResource2"></asp:TextBox><br />
                    LiftExpense:
                    <asp:TextBox ID="LiftExpenseTextBox" runat="server" Text='<%# Bind("LiftExpense") %>'
                        meta:resourcekey="LiftExpenseTextBoxResource2"></asp:TextBox><br />
                    DevelopmentExpense:
                    <asp:TextBox ID="DevelopmentExpenseTextBox" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                        meta:resourcekey="DevelopmentExpenseTextBoxResource2"></asp:TextBox><br />
                    LifeOfConstruction:
                    <asp:TextBox ID="LifeOfConstructionTextBox" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                        meta:resourcekey="LifeOfConstructionTextBoxResource2"></asp:TextBox><br />
                    SchemeType:
                    <asp:TextBox ID="SchemeTypeTextBox" runat="server" Text='<%# Bind("SchemeType") %>'
                        meta:resourcekey="SchemeTypeTextBoxResource2"></asp:TextBox><br />
                    AdjudicationId:
                    <asp:TextBox ID="AdjudicationIdTextBox" runat="server" Text='<%# Bind("AdjudicationId") %>'
                        meta:resourcekey="AdjudicationIdTextBoxResource2"></asp:TextBox><br />
                    TypeOfLand:
                    <asp:TextBox ID="TypeOfLandTextBox" runat="server" Text='<%# Bind("TypeOfLand") %>'
                        meta:resourcekey="TypeOfLandTextBoxResource2"></asp:TextBox><br />
                    StampDutyRate:
                    <asp:TextBox ID="StampDutyRateTextBox" runat="server" Text='<%# Bind("StampDutyRate") %>'
                        meta:resourcekey="StampDutyRateTextBoxResource2"></asp:TextBox><br />
                    ValuationId:
                    <asp:TextBox ID="ValuationIdTextBox" runat="server" Text='<%# Bind("ValuationId") %>'
                        meta:resourcekey="ValuationIdTextBoxResource2"></asp:TextBox><br />
                    YearOfConstruction:
                    <asp:TextBox ID="YearOfConstructionTextBox" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                        meta:resourcekey="YearOfConstructionTextBoxResource2"></asp:TextBox><br />
                    SpecialDeduction:
                    <asp:TextBox ID="SpecialDeductionTextBox" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                        meta:resourcekey="SpecialDeductionTextBoxResource2"></asp:TextBox><br />
                    TalukaCode:
                    <asp:TextBox ID="TalukaCodeTextBox" runat="server" Text='<%# Bind("TalukaCode") %>'
                        meta:resourcekey="TalukaCodeTextBoxResource2"></asp:TextBox><br />
                    SchemeNo:
                    <asp:TextBox ID="SchemeNoTextBox" runat="server" Text='<%# Bind("SchemeNo") %>' meta:resourcekey="SchemeNoTextBoxResource2"></asp:TextBox><br />
                    m_ValuationDate:
                    <asp:TextBox ID="m_ValuationDateTextBox" runat="server" Text='<%# Bind("m_ValuationDate") %>'
                        meta:resourcekey="m_ValuationDateTextBoxResource2"></asp:TextBox><br />
                    OtherFeeRate:
                    <asp:TextBox ID="OtherFeeRateTextBox" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                        meta:resourcekey="OtherFeeRateTextBoxResource2"></asp:TextBox><br />
                    AreaOfPlot:
                    <asp:TextBox ID="AreaOfPlotTextBox" runat="server" Text='<%# Bind("AreaOfPlot") %>'
                        meta:resourcekey="AreaOfPlotTextBoxResource2"></asp:TextBox><br />
                    NetPrice:
                    <asp:TextBox ID="NetPriceTextBox" runat="server" Text='<%# Bind("NetPrice") %>' meta:resourcekey="NetPriceTextBoxResource2"></asp:TextBox><br />
                    IsConstructedProperty:
                    <asp:CheckBox ID="IsConstructedPropertyCheckBox" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                        meta:resourcekey="IsConstructedPropertyCheckBoxResource3" /><br />
                    SpecialDeductionRate:
                    <asp:TextBox ID="SpecialDeductionRateTextBox" runat="server" Text='<%# Bind("SpecialDeductionRate") %>'
                        meta:resourcekey="SpecialDeductionRateTextBoxResource1"></asp:TextBox><br />
                    ValueOfConstruction:
                    <asp:TextBox ID="ValueOfConstructionTextBox" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                        meta:resourcekey="ValueOfConstructionTextBoxResource2"></asp:TextBox><br />
                    ValuationDate:
                    <asp:TextBox ID="ValuationDateTextBox" runat="server" Text='<%# Bind("ValuationDate") %>'
                        meta:resourcekey="ValuationDateTextBoxResource3"></asp:TextBox><br />
                    ValueOfLand:
                    <asp:TextBox ID="ValueOfLandTextBox" runat="server" Text='<%# Bind("ValueOfLand") %>'
                        meta:resourcekey="ValueOfLandTextBoxResource2"></asp:TextBox><br />
                    PlotNo:
                    <asp:TextBox ID="PlotNoTextBox" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="PlotNoTextBoxResource2"></asp:TextBox><br />
                    EstimatedPriceOfConstruction:
                    <asp:TextBox ID="EstimatedPriceOfConstructionTextBox" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                        meta:resourcekey="EstimatedPriceOfConstructionTextBoxResource2"></asp:TextBox><br />
                    Depreciation:
                    <asp:TextBox ID="DepreciationTextBox" runat="server" Text='<%# Bind("Depreciation") %>'
                        meta:resourcekey="DepreciationTextBoxResource2"></asp:TextBox><br />
                    LandRate:
                    <asp:TextBox ID="LandRateTextBox" runat="server" Text='<%# Bind("LandRate") %>' meta:resourcekey="LandRateTextBoxResource2"></asp:TextBox><br />
                    EstimatedPrice:
                    <asp:TextBox ID="EstimatedPriceTextBox" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                        meta:resourcekey="EstimatedPriceTextBoxResource2"></asp:TextBox><br />
                    Remarks:
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksTextBoxResource2"></asp:TextBox><br />
                    ValuationOfConstruction:
                    <asp:TextBox ID="ValuationOfConstructionTextBox" runat="server" Text='<%# Bind("ValuationOfConstruction") %>'
                        meta:resourcekey="ValuationOfConstructionTextBoxResource1"></asp:TextBox><br />
                    InternalElectrificationExpense:
                    <asp:TextBox ID="InternalElectrificationExpenseTextBox" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                        meta:resourcekey="InternalElectrificationExpenseTextBoxResource2"></asp:TextBox><br />
                    DevelopmentRate:
                    <asp:TextBox ID="DevelopmentRateTextBox" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                        meta:resourcekey="DevelopmentRateTextBoxResource2"></asp:TextBox><br />
                    AreaOfConstruction:
                    <asp:TextBox ID="AreaOfConstructionTextBox" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                        meta:resourcekey="AreaOfConstructionTextBoxResource2"></asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"
                        meta:resourcekey="InsertButtonResource2"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" meta:resourcekey="InsertCancelButtonResource2"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    DistrictCode:
                    <asp:Label ID="DistrictCodeLabel" runat="server" Text='<%# Bind("DistrictCode") %>'
                        meta:resourcekey="DistrictCodeLabelResource2"></asp:Label><br />
                    OtherFees:
                    <asp:Label ID="OtherFeesLabel" runat="server" Text='<%# Bind("OtherFees") %>' meta:resourcekey="OtherFeesLabelResource2"></asp:Label><br />
                    StampDuty:
                    <asp:Label ID="StampDutyLabel" runat="server" Text='<%# Bind("StampDuty") %>' meta:resourcekey="StampDutyLabelResource2"></asp:Label><br />
                    InternalElectrificationRate:
                    <asp:Label ID="InternalElectrificationRateLabel" runat="server" Text='<%# Bind("InternalElectrificationRate") %>'
                        meta:resourcekey="InternalElectrificationRateLabelResource2"></asp:Label><br />
                    VillageCode:
                    <asp:Label ID="VillageCodeLabel" runat="server" Text='<%# Bind("VillageCode") %>'
                        meta:resourcekey="VillageCodeLabelResource2"></asp:Label><br />
                    LiftExpense:
                    <asp:Label ID="LiftExpenseLabel" runat="server" Text='<%# Bind("LiftExpense") %>'
                        meta:resourcekey="LiftExpenseLabelResource2"></asp:Label><br />
                    DevelopmentExpense:
                    <asp:Label ID="DevelopmentExpenseLabel" runat="server" Text='<%# Bind("DevelopmentExpense") %>'
                        meta:resourcekey="DevelopmentExpenseLabelResource2"></asp:Label><br />
                    LifeOfConstruction:
                    <asp:Label ID="LifeOfConstructionLabel" runat="server" Text='<%# Bind("LifeOfConstruction") %>'
                        meta:resourcekey="LifeOfConstructionLabelResource2"></asp:Label><br />
                    SchemeType:
                    <asp:Label ID="SchemeTypeLabel" runat="server" Text='<%# Bind("SchemeType") %>' meta:resourcekey="SchemeTypeLabelResource2"></asp:Label><br />
                    AdjudicationId:
                    <asp:Label ID="AdjudicationIdLabel" runat="server" Text='<%# Bind("AdjudicationId") %>'
                        meta:resourcekey="AdjudicationIdLabelResource2"></asp:Label><br />
                    TypeOfLand:
                    <asp:Label ID="TypeOfLandLabel" runat="server" Text='<%# Bind("TypeOfLand") %>' meta:resourcekey="TypeOfLandLabelResource2"></asp:Label><br />
                    StampDutyRate:
                    <asp:Label ID="StampDutyRateLabel" runat="server" Text='<%# Bind("StampDutyRate") %>'
                        meta:resourcekey="StampDutyRateLabelResource2"></asp:Label><br />
                    ValuationId:
                    <asp:Label ID="ValuationIdLabel" runat="server" Text='<%# Bind("ValuationId") %>'
                        meta:resourcekey="ValuationIdLabelResource2"></asp:Label><br />
                    YearOfConstruction:
                    <asp:Label ID="YearOfConstructionLabel" runat="server" Text='<%# Bind("YearOfConstruction") %>'
                        meta:resourcekey="YearOfConstructionLabelResource2"></asp:Label><br />
                    SpecialDeduction:
                    <asp:Label ID="SpecialDeductionLabel" runat="server" Text='<%# Bind("SpecialDeduction") %>'
                        meta:resourcekey="SpecialDeductionLabelResource2"></asp:Label><br />
                    TalukaCode:
                    <asp:Label ID="TalukaCodeLabel" runat="server" Text='<%# Bind("TalukaCode") %>' meta:resourcekey="TalukaCodeLabelResource2"></asp:Label><br />
                    SchemeNo:
                    <asp:Label ID="SchemeNoLabel" runat="server" Text='<%# Bind("SchemeNo") %>' meta:resourcekey="SchemeNoLabelResource2"></asp:Label><br />
                    m_ValuationDate:
                    <asp:Label ID="m_ValuationDateLabel" runat="server" Text='<%# Bind("m_ValuationDate") %>'
                        meta:resourcekey="m_ValuationDateLabelResource2"></asp:Label><br />
                    OtherFeeRate:
                    <asp:Label ID="OtherFeeRateLabel" runat="server" Text='<%# Bind("OtherFeeRate") %>'
                        meta:resourcekey="OtherFeeRateLabelResource2"></asp:Label><br />
                    AreaOfPlot:
                    <asp:Label ID="AreaOfPlotLabel" runat="server" Text='<%# Bind("AreaOfPlot") %>' meta:resourcekey="AreaOfPlotLabelResource2"></asp:Label><br />
                    NetPrice:
                    <asp:Label ID="NetPriceLabel" runat="server" Text='<%# Bind("NetPrice") %>' meta:resourcekey="NetPriceLabelResource2"></asp:Label><br />
                    IsConstructedProperty:
                    <asp:CheckBox ID="IsConstructedPropertyCheckBox" runat="server" Checked='<%# Bind("IsConstructedProperty") %>'
                        Enabled="False" meta:resourcekey="IsConstructedPropertyCheckBoxResource4" /><br />
                    SpecialDeductionRate:
                    <asp:Label ID="SpecialDeductionRateLabel" runat="server" Text='<%# Bind("SpecialDeductionRate") %>'
                        meta:resourcekey="SpecialDeductionRateLabelResource1"></asp:Label><br />
                    ValueOfConstruction:
                    <asp:Label ID="ValueOfConstructionLabel" runat="server" Text='<%# Bind("ValueOfConstruction") %>'
                        meta:resourcekey="ValueOfConstructionLabelResource2"></asp:Label><br />
                    ValuationDate:
                    <asp:Label ID="ValuationDateLabel" runat="server" Text='<%# Bind("ValuationDate") %>'
                        meta:resourcekey="ValuationDateLabelResource3"></asp:Label><br />
                    ValueOfLand:
                    <asp:Label ID="ValueOfLandLabel" runat="server" Text='<%# Bind("ValueOfLand") %>'
                        meta:resourcekey="ValueOfLandLabelResource2"></asp:Label><br />
                    PlotNo:
                    <asp:Label ID="PlotNoLabel" runat="server" Text='<%# Bind("PlotNo") %>' meta:resourcekey="PlotNoLabelResource2"></asp:Label><br />
                    EstimatedPriceOfConstruction:
                    <asp:Label ID="EstimatedPriceOfConstructionLabel" runat="server" Text='<%# Bind("EstimatedPriceOfConstruction") %>'
                        meta:resourcekey="EstimatedPriceOfConstructionLabelResource2"></asp:Label><br />
                    Depreciation:
                    <asp:Label ID="DepreciationLabel" runat="server" Text='<%# Bind("Depreciation") %>'
                        meta:resourcekey="DepreciationLabelResource2"></asp:Label><br />
                    LandRate:
                    <asp:Label ID="LandRateLabel" runat="server" Text='<%# Bind("LandRate") %>' meta:resourcekey="LandRateLabelResource2"></asp:Label><br />
                    EstimatedPrice:
                    <asp:Label ID="EstimatedPriceLabel" runat="server" Text='<%# Bind("EstimatedPrice") %>'
                        meta:resourcekey="EstimatedPriceLabelResource2"></asp:Label><br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' meta:resourcekey="RemarksLabelResource2"></asp:Label><br />
                    ValuationOfConstruction:
                    <asp:Label ID="ValuationOfConstructionLabel" runat="server" Text='<%# Bind("ValuationOfConstruction") %>'
                        meta:resourcekey="ValuationOfConstructionLabelResource1"></asp:Label><br />
                    InternalElectrificationExpense:
                    <asp:Label ID="InternalElectrificationExpenseLabel" runat="server" Text='<%# Bind("InternalElectrificationExpense") %>'
                        meta:resourcekey="InternalElectrificationExpenseLabelResource2"></asp:Label><br />
                    DevelopmentRate:
                    <asp:Label ID="DevelopmentRateLabel" runat="server" Text='<%# Bind("DevelopmentRate") %>'
                        meta:resourcekey="DevelopmentRateLabelResource2"></asp:Label><br />
                    AreaOfConstruction:
                    <asp:Label ID="AreaOfConstructionLabel" runat="server" Text='<%# Bind("AreaOfConstruction") %>'
                        meta:resourcekey="AreaOfConstructionLabelResource2"></asp:Label><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit" meta:resourcekey="EditButtonResource2"></asp:LinkButton>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New" meta:resourcekey="NewButtonResource2"></asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsDistirctMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDistirctMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsTalukaMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetTalukaMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsVillageMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetVillageMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="odsAdjudicationRequest" runat="server" InsertMethod="IssueCertificate"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAdjudication"
        TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest" UpdateMethod="UpdateValuationFormByValFormId">
        <UpdateParameters>
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
            <asp:Parameter Name="HeightOfCeiling" Type="Decimal" />
            <asp:Parameter Name="TypeOfTiles" Type="Object" />
            <asp:Parameter Name="WallFurnishing" Type="String" />
            <asp:Parameter Name="NoOfBathrooms" Type="Int16" />
            <asp:Parameter Name="BathroomTilesHeight" Type="Decimal" />
            <asp:Parameter Name="NoOfToilets" Type="Int16" />
            <asp:Parameter Name="ToiletTilesHeight" Type="Decimal" />
            <asp:Parameter Name="Parking" Type="Boolean" />
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
            <asp:Parameter Name="ValuationFormId" Type="Object" />
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="FeeDetails" Type="Object" />
            <asp:Parameter Name="DocDetails" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="odsStampDutyValuation" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetValuationFormDetails" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateValuationRequestDetails" InsertMethod="IssueCertificate"
        DataObjectTypeName="IGRSS.SdcService.ValuationRequest">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldAdjudicationId" Name="AdjudicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;<br />
    <asp:ObjectDataSource ID="odsIssueCertificate" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetValuationSheetDetailsByAdjId" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateValuationSheetDetails" InsertMethod="IssueCertificate" DataObjectTypeName="IGRSS.SdcService.ValuationResult"
        OnUpdating="odsIssueCertificate_Updating">
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="fldAdjudicationId" Name="AdjudicationId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsAdjudicationDetailsByFileSloNo" runat="server" DataObjectTypeName="System.Guid"
        InsertMethod="IssueCertificate" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAdJRequestByFileNo" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdatePhysicalVerification">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileSlNoUpd" Name="FileSlNo" PropertyName="Text"
                Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="AdjudicationId" Type="Object" />
            <asp:Parameter Name="CertificateNumber" Type="String" />
            <asp:Parameter Name="CertificateIssuedOn" Type="DateTime" />
            <asp:Parameter Name="CertificateDescription" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <br />
</asp:Content>
