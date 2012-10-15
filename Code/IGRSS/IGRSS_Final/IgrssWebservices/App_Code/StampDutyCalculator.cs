using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using JantriRatesTableAdapters;
using JantriTable = JantriRates.JantriRatesDataTable;
using JantriRow = JantriRates.JantriRatesRow;
/// <summary>
/// Summary description for StampDutyCalculator
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class StampDutyCalculator : System.Web.Services.WebService
{

	public StampDutyCalculator()
	{

		//Uncomment the following line if using designed components 
		//InitializeComponent(); 
	}

	[WebMethod]
	public ValuationResult GetStampDutyCalculation(ValuationRequest Request)
	{
		ValuationResult Result = new ValuationResult();

		Result.TalukaCode = Request.TalukaCode;
		Result.DistrictCode = Request.DistrictCode;
		Result.VillageCode = Request.VillageCode;
        #region Calculate Value of Land
        Result.AdjudicationId = Request.AdjudicationId;
		Result.ValuationId = Request.ValuationId;
		Result.ValuationDate = DateTime.Now;

		Result.SchemeNo = Request.SchemeNo;
		Result.PlotNo = Request.PlotNo;
		Result.AreaOfPlot = Request.AreaOfPlot;
		Result.LandRate = GetLandRate(Request.TypeOfLand,
												Request.DistrictCode,
												Request.TalukaCode,
												Request.VillageCode,
												Request.SchemeNo,
												Request.SchemeType);
		Result.ValueOfLand = Result.AreaOfPlot * Result.LandRate;

		#endregion

		Result.IsConstructedProperty = Request.IsConstructedProperty;

		#region Calculate Value of Construction

		if (Result.IsConstructedProperty)
		{
			Result.AreaOfConstruction = Request.AreaOfConstruction;
			Result.TypeOfLand = Request.TypeOfLand;

			Result.EstimatedPrice = Request.EstimatedPrice;

			Result.InternalElectrificationExpense = (Result.EstimatedPrice
													* Request.InternalElectrificationRate)
													/ 100;
			Result.DevelopmentExpense = (Result.EstimatedPrice
										* Request.DevelopmentRate)
										/ 100;
			Result.OtherFees = (Result.EstimatedPrice
								* Request.OtherFeeRate)
								/ 100;
			Result.LiftExpense = Request.LiftExpense;

			Result.ValuationOfConstruction = Result.InternalElectrificationExpense
											+ Result.DevelopmentExpense
											+ Result.OtherFees
											+ Result.LiftExpense;

			Result.EstimatedPriceOfConstruction = Result.EstimatedPrice
													+ Result.ValuationOfConstruction;

			Result.YearOfConstruction = Request.YearOfConstruction;
			Result.LifeOfConstruction = DateTime.Now.Year - Result.YearOfConstruction;

			Result.Depreciation = (Convert.ToDecimal(0.9) * Result.EstimatedPriceOfConstruction)
									/ Result.LifeOfConstruction;

			Result.NetPrice = Result.EstimatedPriceOfConstruction
								- Result.Depreciation;

			Result.SpecialDeduction = Result.NetPrice * (Request.SpecialDeductionRate / 100);

			Result.ValueOfConstruction = Result.NetPrice - Result.SpecialDeduction;

		}
		else
			Result.ValueOfConstruction = 0.00M;

		#endregion

		Result.ValuationOfConstruction = Result.ValueOfConstruction + Result.ValueOfLand;

		Result.StampDutyRate = GetStampDutyRate();

		Result.StampDuty = Result.StampDutyRate * Result.ValuationOfConstruction;

		Result.Remarks = "Valuation Complete";

		return Result;
	}

	private decimal GetLandRate(string landType, int DistrictCode, int TalukaCode, int VillageCode, string SchemeNo, string SchemeType)
	{
		decimal retValue = 0;
		JantriRatesTableAdapter JantriAdapter = new JantriRatesTableAdapter();
		JantriTable dt = JantriAdapter.GetLandRatesByTpNo(DistrictCode, TalukaCode, VillageCode, SchemeNo);
		if (dt.Rows.Count > 0)
		{
			retValue = Convert.ToDecimal(dt.Rows[0][landType]);
		}

		return retValue;
	}

	private decimal GetStampDutyRate()
	{
		return 0.20M;
	}
}