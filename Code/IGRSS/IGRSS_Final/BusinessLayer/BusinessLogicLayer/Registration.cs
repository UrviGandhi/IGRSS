using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;

using System.Data;

using InputSheetTable = IGRSS.DataAccessLayer.Registration.InputSheetDataTable;
using RegistrationPartyDetailsTable = IGRSS.DataAccessLayer.Registration.RegistrationPartyDetailsDataTable;
using InputSheetRow = IGRSS.DataAccessLayer.Registration.InputSheetRow;
using RegistrationDocumentCheckListTable = IGRSS.DataAccessLayer.Registration.RegistrationDocumentCheckListDataTable;
using RegistrationFeeDetailsTable = IGRSS.DataAccessLayer.Registration.RegistrationFeeDetailsDataTable;
using ValuationFormTable = IGRSS.DataAccessLayer.Adjudication.ValuationFormDataTable;

using RegistrationHearingTable = IGRSS.DataAccessLayer.Registration.RegistrationHearingDataTable;

using RegistrationHearingRow = IGRSS.DataAccessLayer.Registration.RegistrationHearingRow;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Registration

	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public InputSheetTable GetInputSheetDetails()
		{
			return IgrssAdapters.InputSheet.GetInputSheetDetails();

		}

		
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public InputSheetTable GetInputSheetDetailsByFileSlNo(int FileSlNo)
		{
			return IgrssAdapters.InputSheet.GetInputSheetDetailsByFileSlNo(FileSlNo);
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RegistrationPartyDetailsTable GetRegistrationPartyDetails()
		{
			return IgrssAdapters.RegistrationPartyDetails.GetRegistrationPartyDetails();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RegistrationPartyDetailsTable GetRegistrationPartyDetailsById(Guid RegistrationId)
		{

			return IgrssAdapters.RegistrationPartyDetails.GetRegistrationDetailsById(RegistrationId);

		}


		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewRegistrationPartydetails(Guid PartyID, Guid RegistrationId, string PartyType, string Name, string Address, decimal Age, string Gender, Guid Religion, string Occupation, string PAN, string UserName, DateTime CreatedAt)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.RegistrationPartyDetails.AddNewPartyDetails(PartyID, RegistrationId, PartyType, Name, Address, Age, Gender, Religion, Occupation, PAN, UserName, CreatedAt);

			return true;

		}


		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool UpdateRegistrationPartyDetails(Guid PartyID, Guid RegistrationId, string PartyType, string Name, string Address, decimal Age, string Gender, Guid Religion, string Occupation, string PAN, string UserName, DateTime ModifiedAt)
		{

			string userName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.RegistrationPartyDetails.UpdatePartyDetails(PartyID, RegistrationId, PartyType, Name, Address, Age, Gender, Religion, Occupation, PAN, UserName, ModifiedAt);

			return true;

		}


		// Inserting New  Registration Record into InputSheet and Registration Party Details

		public static InputSheetRow GetInputSheetRow()
		{
			return new InputSheetTable().NewInputSheetRow();

		}


		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewRegistration(FormViewParameter Parameter, DataTable PartyDetails, Guid Id, DataTable FeeDetails,DataTable DocDetails,Remarks rem)
		{
			IGRSS.DataAccessLayer.Registration.InputSheetRow row = (IGRSS.DataAccessLayer.Registration.InputSheetRow) Parameter.Values;
		   Guid  ValuationFormId = Id;

			string curUser = Thread.CurrentPrincipal.Identity.Name;
            Guid RegistrationId = FileManager.OpenNewFile(row.OfficeId, "REG");
            FileManager.AddRemarkToFile(RegistrationId,rem.Subject,rem.Body);
			//ViewState["ValuationFormId"] = ValuationFormId;
			IgrssAdapters.InputSheet.AddNewInputSheet(RegistrationId, row.OfficeId, row.RegistrationTypeId,ValuationFormId, row.FilePrefix, row.FileSlNo, row.FileYear,
			row.ApplnDate, row.ApplicantName, row.ApplnAddress, row.PropertyValue, row.IsRented, row.LeasePeriodFrom, row.LeasePeriodTo,
			row.DepositAmount, row.Tax, row.YearlyRent, row.StampDutyUsed,  curUser, DateTime.Now);

			foreach (DataRow PartyDetail in PartyDetails.Rows)
			{
				IgrssAdapters.RegistrationPartyDetails.AddNewPartyDetails(Guid.NewGuid(), RegistrationId,

				(string) PartyDetail["PartyType"], (string) PartyDetail["Name"], (string) PartyDetail["Address"], (decimal) PartyDetail["Age"],
				(string) PartyDetail["Gender"], (Guid) PartyDetail["Religion"], (string) PartyDetail["Occupation"],
				(string) PartyDetail["Occupation"], curUser, DateTime.Now);

			}

			foreach (DataRow FeeDetail in FeeDetails.Rows)
			{
				IgrssAdapters.RegistrationFeeDetails.AddNewRegistrationFee(RegistrationId, (Guid) FeeDetail["FeeId"], Convert.ToDecimal(FeeDetail["Amount"]));
			}
			foreach (DataRow DocDetail in DocDetails.Rows)
			{

				IgrssAdapters.RegistrationDocumentCheckList.AddNewRegistrationDocuments(RegistrationId, (Guid) DocDetail["DocumentTypeId"], Convert.ToBoolean(DocDetail["Submitted"]), Convert.ToString(DocDetail["DocumentNumber"]), Convert.ToString(DocDetail["Remarks"]));
			}

         	return true;

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public ValuationFormTable GetValuationFormDetails()
		{
			return IgrssAdapters.ValuationAdapter.GetData();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewValuationFormForRegistration(FormViewParameter Parameter,Guid Id)
		{			IGRSS.DataAccessLayer.Adjudication.ValuationFormRow row = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow) Parameter.Values;


			Guid ValuationFormId = Id;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			
			//Guid ValuationFormId=ViewState["ValuationFormId"];
			IgrssAdapters.ValuationAdapter.AddNewValuationFormForRegistration(ValuationFormId,
				row.Village_CityName, row.TPSchemeNo, row.TPSchemeName, row.FinalPlotNo, row.CitySurveyNo,
				row.RevenueSurveyNo, row.Ward_SubWardNo, row.NameOfOwner, row.AddressOfOwner, row.NameOfClaimingParty,
				row.AddressOfClaimingParty, row.AreaOfPlot, row.AreaOfConstruction, row.YearOfConstruction,
				row.NoOfFloors, row.TypeOfProperty,
				row.HeightOfCeiling, row.TypeOfTiles,

				row.WallFurnishing, row.NoOfBathrooms, row.BathroomTilesHeight,
				row.NoOfToilets, row.ToiletTilesHeight, row.Parking, row.DescOfProperty,
				row.ShopsOnGroundFloor, row.IsPropertyInCommercial,
				row.TypeOfElectricfication,
				row.CompoundWallType, row.IsLightsOnCompoundWall,
				row.WaterStorageFacility, row.DrainageSystem, row.NoOfLifts,
				row.AreaOfEachLift, row.InternalRoad, row.ValuatedBefore, curUser, DateTime.Now);

			return true;

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateRegistration(FormViewParameter Parameter, DataTable PartyDetails, Guid RegistrationId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Registration.InputSheetRow row = (IGRSS.DataAccessLayer.Registration.InputSheetRow) Parameter.Values;
			IgrssAdapters.InputSheet.UpdateInputSheet(RegistrationId, row.OfficeId, row.RegistrationTypeId, row.FilePrefix, row.FileSlNo, row.FileYear,
			row.ApplnDate, row.ApplicantName, row.ApplnAddress, row.PropertyValue, row.IsRented, row.LeasePeriodFrom, row.LeasePeriodTo,
			row.DepositAmount, row.Tax, row.YearlyRent, row.StampDutyUsed, curUser, DateTime.Now);

			IgrssAdapters.RegistrationPartyDetails.DeletePartyDetailsById(RegistrationId);

			foreach (DataRow PartyDetail in PartyDetails.Rows)
			{
				IgrssAdapters.RegistrationPartyDetails.AddNewPartyDetails(Guid.NewGuid(), RegistrationId,

				(string) PartyDetail["PartyType"], (string) PartyDetail["Name"], (string) PartyDetail["Address"], (decimal) PartyDetail["Age"],
				(string) PartyDetail["Gender"], (Guid) PartyDetail["Religion"], (string) PartyDetail["Occupation"],
				(string) PartyDetail["Occupation"], curUser, DateTime.Now);

			}

			return true;


		}


		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateValuationFormDetails(FormViewParameter Parameter, Guid ValuationFormId)
		{
			IGRSS.DataAccessLayer.Adjudication.ValuationFormRow row = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;

			
			IgrssAdapters.ValuationAdapter.UpdateValuationFormByValFormId(
				row.Village_CityName, row.TPSchemeNo, row.TPSchemeName, row.FinalPlotNo,
				row.CitySurveyNo, row.RevenueSurveyNo, row.Ward_SubWardNo, row.NameOfOwner,
				row.AddressOfOwner, row.NameOfClaimingParty, row.AddressOfClaimingParty,
				row.AreaOfPlot, row.AreaOfConstruction, row.YearOfConstruction, row.NoOfFloors, 
				row.TypeOfProperty,row.HeightOfCeiling, row.TypeOfTiles,
				row.WallFurnishing, row.NoOfBathrooms,row.BathroomTilesHeight, 
				row.NoOfToilets, row.ToiletTilesHeight, row.Parking,
				row.DescOfProperty, row.ShopsOnGroundFloor, row.IsPropertyInCommercial,
				row.TypeOfElectricfication, row.CompoundWallType,
				row.IsLightsOnCompoundWall, row.WaterStorageFacility, 
				row.DrainageSystem, row.NoOfLifts,row.AreaOfEachLift, 
				row.InternalRoad, row.ValuatedBefore, ValuationFormId,curUser,DateTime.Now);


			   return true;


		}


		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InputSheetTable GetInputsheetDetailsById(Guid RegistrationId)
		{
			return IgrssAdapters.InputSheet.GetInputSheetDetailsByRegistrationId(RegistrationId);

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public ValuationFormTable GetValuationFormDetailsByRegistrationId(Guid RegistrationId)
		{
			return IgrssAdapters.ValuationAdapter.GetValuationFormDetailsByRegistrationId(RegistrationId);
		}


		// Fee Details and Document Details Methods

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RegistrationDocumentCheckListTable GetDocumentDetails()
		{
			return IgrssAdapters.RegistrationDocumentCheckList.GetRegistrtaionDocuments();
		}


		
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public RegistrationDocumentCheckListTable GetDocumentDetailsById(Guid RegistrationId)
		{
			return IgrssAdapters.RegistrationDocumentCheckList.GetRegistrationDocumentsByRegistrationId(RegistrationId);

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public RegistrationFeeDetailsTable GetRegistrationFeeDetails()
		{
			return IgrssAdapters.RegistrationFeeDetails.GetRegistrationFeeDetails();
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public RegistrationFeeDetailsTable GetRegistrationFeeDetailsById(Guid RegistrationId)
		{
			return IgrssAdapters.RegistrationFeeDetails.GetRegistrationFeeDetailsById(RegistrationId);

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewRegistrationFeeDetails(Guid RegistrationId,Guid FeeId,decimal Amount)
		{
			IgrssAdapters.RegistrationFeeDetails.AddNewRegistrationFee(RegistrationId, FeeId, Amount);

			return true;

		}


[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewRegistrationDocumentDetails(Guid RegistrationId,Guid DocumentTypeId,bool Submitted,string DocumentNumber, string Remarks)
		{
	        IgrssAdapters.RegistrationDocumentCheckList.AddNewRegistrationDocuments(RegistrationId, DocumentTypeId, Submitted, DocumentNumber, Remarks);

			return true;

		}

/// <summary>
/// Codes for adding Registration Hearing process
/// </summary>
/// <returns></returns>



	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public RegistrationHearingTable GetRegistrationHearingDetails()
		{
			return IgrssAdapters.RegistrationHearing.GetRegistrationHearingProcess();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public RegistrationHearingTable GetRegistrationHearingProcessById(Guid RegistrationId)

			
		{  
			return IgrssAdapters.RegistrationHearing.GetRegistrationHearingProcessById(RegistrationId);

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewRegistrationHearing(FormViewParameter Parameter,Guid RegistrationId)

		{
			 
			IGRSS.DataAccessLayer.Registration.RegistrationHearingRow row = (IGRSS.DataAccessLayer.Registration.RegistrationHearingRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid HearingId = Guid.NewGuid();
			RegistrationId = row.RegistrationId;
			IgrssAdapters.RegistrationHearing.AddNewHearingProcess(RegistrationId,HearingId, row.HearingDate, row.HearingSummary, curUser, DateTime.Now);

			return true;

			
		}


		public static RegistrationHearingRow GetRegistrationHearingRow()
		{
			return new RegistrationHearingTable().NewRegistrationHearingRow();

		}


	}
}
