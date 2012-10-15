using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using IGRSS.DataAccessLayer.AdjudicationTableAdapters;

using IGRSS.BusinessObjects;

namespace IGRSS.BusinessLogicLayer.Adjudication
{
	[System.ComponentModel.DataObject]
	public class AdjudicationBLL
	{
		public AdjudicationBLL()
		{
		}

		[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
		public bool GetDetails()
		{
			IgrssAdapters.AdjudicationRequestAdapter.GetData();
			return true;
		}

		//[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
		//public bool insertAdjudication(string Village_CityName,
		//        int TPSchemeNo,
		//        string TPSchemeName,
		//        int FinalPlotNo,
		//        int CitySurveyNo,
		//        int RevenueSurveyNo,
		//        int Ward_SubWardNo,
		//        string NameOfExecutingParty,
		//        string AddressOfExecutingParty,
		//        string NameOfClaimingParty,
		//        string AddressOfClaimingParty,
		//        float AreaOfPlot,
		//        float AreaOfConstruction,
		//        int YearOfConstruction,
		//        string TypeOfProperty,
		//        float HeightOfFloor,
		//        string TypeOfTiles,
		//        string WallFurnishing,
		//        int NoOfBathrooms,
		//        string DescriptionOfCommProperty,
		//        bool  ShopsOnGroundFloor,
		//        bool AnyOtherProperty,
		//        float HeightOfTheSlab,
		//        string TypeOfElectricfication,
		//        bool CompoundWall,
		//        bool WaterStorageFacility,
		//        bool DranageSystem,
		//        float AreaOfEachLift,
		//        bool InternalRoad,
		//        bool MadeValuationBefore,
		//        string NameOfApplicant)
		//{
		//    IgrssAdapters.AdjudicationRequestAdapter.AddAdjudicationRequest(Village_CityName,
		//    TPSchemeNo,
		//    TPSchemeName,
		//    FinalPlotNo,
		//    CitySurveyNo,
		//    RevenueSurveyNo,
		//    Ward_SubWardNo,
		//    NameOfExecutingParty,
		//    AddressOfExecutingParty,
		//    NameOfClaimingParty,
		//    AddressOfClaimingParty,
		//    AreaOfPlot,
		//    AreaOfConstruction,
		//    YearOfConstruction,
		//    TypeOfProperty,
		//    HeightOfFloor,
		//    TypeOfTiles,
		//    WallFurnishing,
		//    NoOfBathrooms,
		//    DescriptionOfCommProperty,
		//    ShopsOnGroundFloor,
		//    AnyOtherProperty,
		//    HeightOfTheSlab,
		//    TypeOfElectricfication,
		//    CompoundWall,
		//    WaterStorageFacility,
		//    DranageSystem,
		//    AreaOfEachLift,
		//    InternalRoad,
		//    MadeValuationBefore,
		//    NameOfApplicant);

		//    IgrssCommon.StartWorkflowRuntime();
		//    IgrssCommon.StartWorkflow();
		//    IgrssCommon.ValuationEvents.OnValuationRequest();
		//    return true;

		//}

		

	}




}
