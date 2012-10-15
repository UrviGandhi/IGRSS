using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ValuationResult
/// </summary>
[Serializable]
public class ValuationResult
{
	#region Request Properties

	private Guid m_ValuationId;
	public Guid ValuationId
	{
		get
		{
			return m_ValuationId;
		}
		set
		{
			m_ValuationId = value;
		}
	}

	private Guid m_AdjudicationId;
	public Guid AdjudicationId
	{
		get
		{
			return m_AdjudicationId;
		}
		set
		{
			m_AdjudicationId = value;
		}
	}

	private int m_DistrictCode;
	public int DistrictCode
	{
		get
		{
			return m_DistrictCode;
		}
		set
		{
			m_DistrictCode = value;
		}
	}

	private int m_TalukaCode;
	public int TalukaCode
	{
		get
		{
			return m_TalukaCode;
		}
		set
		{
			m_TalukaCode = value;
		}
	}

	private int m_VillageCode;
	public int VillageCode
	{
		get
		{
			return m_VillageCode;
		}
		set
		{
			m_VillageCode = value;
		}
	}

	private string m_SchemeType;
	public string SchemeType
	{
		get
		{
			return m_SchemeType;
		}
		set
		{
			m_SchemeType = value;
		}
	}

	private decimal m_EstimatedPrice;
	public decimal EstimatedPrice
	{
		get
		{
			return m_EstimatedPrice;
		}
		set
		{
			m_EstimatedPrice = value;
		}
	}

	private bool m_IsConstructedProperty;
	public bool IsConstructedProperty
	{
		get
		{
			return m_IsConstructedProperty;
		}
		set
		{
			m_IsConstructedProperty = value;
		}
	}

	private string m_SchemeNo;
	public string SchemeNo
	{
		get
		{
			return m_SchemeNo;
		}
		set
		{
			m_SchemeNo = value;
		}
	}

	private string m_PlotNo;
	public string PlotNo
	{
		get
		{
			return m_PlotNo;
		}
		set
		{
			m_PlotNo = value;
		}
	}

	private decimal m_AreaOfPlot;
	public decimal AreaOfPlot
	{
		get
		{
			return m_AreaOfPlot;
		}
		set
		{
			m_AreaOfPlot = value;
		}
	}

	private decimal m_AreaOfConstruction;
	public decimal AreaOfConstruction
	{
		get
		{
			return m_AreaOfConstruction;
		}
		set
		{
			m_AreaOfConstruction = value;
		}
	}

	private string m_TypeOfLand;
	public string TypeOfLand
	{
		get
		{
			return m_TypeOfLand;
		}
		set
		{
			m_TypeOfLand = value;
		}
	}

	private decimal m_InternalElectrificationRate;
	public decimal InternalElectrificationRate
	{
		get
		{
			return m_InternalElectrificationRate;
		}
		set
		{
			m_InternalElectrificationRate = value;
		}
	}

	private decimal m_DevelopmentRate;
	public decimal DevelopmentRate
	{
		get
		{
			return m_DevelopmentRate;
		}
		set
		{
			m_DevelopmentRate = value;
		}
	}

	private decimal m_OtherFeeRate;
	public decimal OtherFeeRate
	{
		get
		{
			return m_OtherFeeRate;
		}
		set
		{
			m_OtherFeeRate = value;
		}
	}

	private int m_YearOfConstruction;
	public int YearOfConstruction
	{
		get
		{
			return m_YearOfConstruction;
		}
		set
		{
			m_YearOfConstruction = value;
		}
	}

	private decimal m_SpecialDeductionRate;
	public decimal SpecialDeductionRate
	{
		get
		{
			return m_SpecialDeductionRate;
		}
		set
		{
			m_SpecialDeductionRate = value;
		}
	}

	private decimal m_LiftExpense;
	public decimal LiftExpense
	{
		get
		{
			return m_LiftExpense;
		}
		set
		{
			m_LiftExpense = value;
		}
	}

	#endregion

	#region Result Properties

	private decimal m_LandRate;
	public decimal LandRate
	{
		get
		{
			return m_LandRate;
		}
		set
		{
			m_LandRate = value;
		}
	}

	private decimal m_ValueOfLand;
	public decimal ValueOfLand
	{
		get
		{
			return m_ValueOfLand;
		}
		set
		{
			m_ValueOfLand = value;
		}
	}

	private decimal m_InternalElectrificationExpense;
	public decimal InternalElectrificationExpense
	{
		get
		{
			return m_InternalElectrificationExpense;
		}
		set
		{
			m_InternalElectrificationExpense = value;
		}
	}

	private decimal m_DevelopmentExpense;
	public decimal DevelopmentExpense
	{
		get
		{
			return m_DevelopmentExpense;
		}
		set
		{
			m_DevelopmentExpense = value;
		}
	}

	private decimal m_OtherFees;
	public decimal OtherFees
	{
		get
		{
			return m_OtherFees;
		}
		set
		{
			m_OtherFees = value;
		}
	}

	private decimal m_SpecialDeduction;
	public decimal SpecialDeduction
	{
		get
		{
			return m_SpecialDeductionRate;
		}
		set
		{
			m_SpecialDeductionRate = value;
		}
	}

	public DateTime m_ValuationDate;
	public DateTime ValuationDate
	{
		get
		{
			return m_ValuationDate;
		}
		set
		{
			m_ValuationDate = value;
		}
	}

	private decimal m_EstimatedPriceOfConstruction;
	public decimal EstimatedPriceOfConstruction
	{
		get
		{
			return m_EstimatedPriceOfConstruction;
		}
		set
		{
			m_EstimatedPriceOfConstruction = value;
		}
	}

	private decimal m_LifeOfConstruction;
	public decimal LifeOfConstruction
	{
		get
		{
			return m_LifeOfConstruction;
		}
		set
		{
			m_LifeOfConstruction = value;
		}
	}

	private decimal m_Depreciation;
	public decimal Depreciation
	{
		get
		{
			return m_Depreciation;
		}
		set
		{
			m_Depreciation = value;
		}
	}

	private decimal m_NetPrice;
	public decimal NetPrice
	{
		get
		{
			return m_NetPrice;
		}
		set
		{
			m_NetPrice = value;
		}
	}

	private decimal m_ValueOfConstruction;
	public decimal ValueOfConstruction
	{
		get
		{
			return m_ValueOfConstruction;
		}
		set
		{
			m_ValueOfConstruction = value;
		}
	}

	private decimal m_ValuationOfConstruction;
	public decimal ValuationOfConstruction
	{
		get
		{
			return m_ValuationOfConstruction;
		}
		set
		{
			m_ValuationOfConstruction = value;
		}
	}

	private string m_Remarks;
	public string Remarks
	{
		get
		{
			return m_Remarks;
		}
		set
		{
			m_Remarks = value;
		}
	}

	private decimal m_StampDuty;
	public decimal StampDuty
	{
		get
		{
			return m_StampDuty;
		}
		set
		{
			m_StampDuty = value;
		}
	}

	private decimal m_StampDutyRate;
	public decimal StampDutyRate
	{
		get
		{
			return m_StampDutyRate;
		}
		set
		{
			m_StampDutyRate = value;
		}
	}

	#endregion
}