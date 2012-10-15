using System;
using System.Data;
using System.Configuration;
using IGRSS.BusinessObjects;



namespace IGRSS.BusinessObjects
{
	[Serializable]
	public class ValuationReport
	{

		private Guid pDistCode;

		public Guid DistCode
		{
			get
			{
				return pDistCode;
			}
			set
			{
				pDistCode = value;
			}
		}

		private Guid pTalukaCode;

		public Guid TalukaCode
		{
			get
			{
				return pTalukaCode;
			}
			set
			{
				pTalukaCode = value;
			}
		}

		private Guid pVillageID;

		public Guid VillageID
		{
			get
			{
				return pVillageID;
			}
			set
			{
				pVillageID = value;
			}
		}

		private string pSurveyNo;

		public string SurveyNo
		{
			get
			{
				return pSurveyNo;
			}
			set
			{
				pSurveyNo = value;
			}
		}

		private double pDepreciation;

		public double Depreciation
		{
			get
			{
				return pDepreciation;
			}
			set
			{
				pDepreciation = value;
			}
		}

		private double pNetPrice;

		public double NetPrice
		{
			get
			{
				return pNetPrice;
			}
			set
			{
				pNetPrice = value;
			}
		}

		private double pPriceOfLand;

		public double PriceOfLand
		{
			get
			{
				return pPriceOfLand;
			}
			set
			{
				pPriceOfLand = value;
			}
		}

		private double pSpecialDeduction;

		public double SpecialDeduction
		{
			get
			{
				return pSpecialDeduction;
			}
			set
			{
				pSpecialDeduction = value;
			}
		}

		private double pValuationOfProperty;

		public double ValuationOfProperty
		{
			get
			{
				return pValuationOfProperty;
			}
			set
			{
				pValuationOfProperty = value;
			}
		}

		private double pStampDuty;

		public double StampDuty
		{
			get
			{
				return pStampDuty;
			}
			set
			{
				pStampDuty = value;
			}
		}

		private double pDevelopmentExpenses;

		public double DevelopmentExpenses
		{
			get
			{
				return pDevelopmentExpenses;
			}
			set
			{
				pDevelopmentExpenses = value;
			}
		}

		private double pOtherExpense;

		public double OtherExpense
		{
			get
			{
				return pOtherExpense;
			}
			set
			{
				pOtherExpense = value;
			}
		}

		private double pAreaOfLand;

		public double AreaOfLand
		{
			get
			{
				return pAreaOfLand;
			}
			set
			{
				pAreaOfLand = value;
			}
		}

		private double pPlinthAreaOfConstruction;

		public double PlinthAreaOfConstruction
		{
			get
			{
				return pPlinthAreaOfConstruction;
			}
			set
			{
				pPlinthAreaOfConstruction = value;
			}
		}

		private ConstructionTypes pTypeOfConstruction;

		public ConstructionTypes TypeOfConstruction
		{
			get
			{
				return pTypeOfConstruction;
			}
			set
			{
				pTypeOfConstruction = value;
			}
		}

		private double pSorExpenses;

		public double SorExpenses
		{
			get
			{
				return pSorExpenses;
			}
			set
			{
				pSorExpenses = value;
			}
		}

		private double pEstimatedPrice;

		public double EstimatedPrice
		{
			get
			{
				return pEstimatedPrice;
			}
			set
			{
				pEstimatedPrice = value;
			}
		}

		private double pCompoundWall;

		public double CompoundWall
		{
			get
			{
				return pCompoundWall;
			}
			set
			{
				pCompoundWall = value;
			}
		}

		private double pDerange;

		public double Derange
		{
			get
			{
				return pDerange;
			}
			set
			{
				pDerange = value;
			}
		}

		private double pInternalRoad;

		public double InternalRoad
		{
			get
			{
				return pInternalRoad;
			}
			set
			{
				pInternalRoad = value;
			}
		}

		private double pCompoundLight;

		public double CompoundLight
		{
			get
			{
				return pCompoundLight;
			}
			set
			{
				pCompoundLight = value;
			}
		}

		private double pSupervisionFees;

		public double SupervisionFees
		{
			get
			{
				return pSupervisionFees;
			}
			set
			{
				pSupervisionFees = value;
			}
		}

		private double pConnectionFees;

		public double ConnectionFees
		{
			get
			{
				return pConnectionFees;
			}
			set
			{
				pConnectionFees = value;
			}
		}

		private double pArchitectFees;

		public double ArchitectFees
		{
			get
			{
				return pArchitectFees;
			}
			set
			{
				pArchitectFees = value;
			}
		}

		private double pElectrificationExpenses;

		public double ElectrificationExpenses
		{
			get
			{
				return pElectrificationExpenses;
			}
			set
			{
				pElectrificationExpenses = value;
			}
		}

		private double pLiftExpenses;

		public double LiftExpenses
		{
			get
			{
				return pLiftExpenses;
			}
			set
			{
				pLiftExpenses = value;
			}
		}

		private double pLifeInYears;

		public double LifeInYears
		{
			get
			{
				return pLifeInYears;
			}
			set
			{
				pLifeInYears = value;
			}
		}

		public ValuationReport()
		{
		}

		private double pConstructionExpense;

		public double ConstructionExpense
		{
			get
			{
				return pConstructionExpense;
			}
			set
			{
				pConstructionExpense = value;
			}
		}

		private double pApproxPrice;

		public double ApproxPrice
		{
			get
			{
				return pApproxPrice;
			}
			set
			{
				pApproxPrice = value;
			}
		}

	}

}