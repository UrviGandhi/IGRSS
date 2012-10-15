//Employee
//ClassName     - Employee
//Purpose       - This business class contains functions for all the functionality of Adjudication process
//Author        :  Pradeep sahoo
//Creation Date : 
//Modified By   :pradeep sahoo                       Date                     Description
//-----------                      -------------            ---------------- 
using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using IGRSS.DataAccessLayer;
using System.Threading;
using IGRSS.SdcService;
using System.Web;
using AdjudicationTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestDataTable;
using FeesTable = IGRSS.DataAccessLayer.Adjudication.FeeMasterDataTable;
using DocumentTable = IGRSS.DataAccessLayer.Adjudication.DocumentMasterDataTable;
using AdjudicationDocTable = IGRSS.DataAccessLayer.Adjudication.DocumentChecklistTableDataTable;
using AdjudicationFeeTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationFeeDetailsDataTable;
using ValuationSheetTable = IGRSS.DataAccessLayer.Adjudication.ValuationSheetDataTable;
using ValuationSheetRow = IGRSS.DataAccessLayer.Adjudication.ValuationSheetRow;
using AdjudicationRequestRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using ValuationFormTable = IGRSS.DataAccessLayer.Adjudication.ValuationFormDataTable;
using ValuationFormRow = IGRSS.DataAccessLayer.Adjudication.ValuationFormRow;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using IGRSS.BusinessObjects.WorkflowServices;
using IGRSS.Workflows.Adjudication;
using IGRSS.Workflows.Adjudication.EventArgs;
using IGRSS.Workflows.Common.Feedback;


namespace IGRSS.BusinessLogicLayer
{
    [DataObject]
    public class AdjudicationRequest
    {
		/// <summary>
		/// This function Gets all the records present in the DocumentMaster Table 
		/// </summary>
		/// <returns>A Datatable object named DocumentTable</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DocumentTable GetDocumentMaster()
        {
            return IgrssAdapters.DocumentAdapter.GetAllDocument();
        }

		/// <summary>
		/// This function roles in Adding a New Record to Document Master
		/// </summary>
		/// <param name="Parameter">formview parameter</param>
		/// <returns>Record is inserted and  returns true</returns>


        
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddNewDocumentMaster(FormViewParameter Parameter)
        {
            Guid DocumentTypeId = Guid.NewGuid();
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow row = (IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow)Parameter.Values;

            IgrssAdapters.DocumentAdapter.AddNewDocumentMaster(DocumentTypeId, row.Name, row.Description, curUser, DateTime.Now);           
            return true;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool Adddoc(FormViewParameter Parameter)
        {
            Guid DocumentTypeId = Guid.NewGuid();
            //string curUser = Thread.CurrentPrincipal.Identity.Name;
            IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow row = (IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow)Parameter.Values;
            IgrssAdapters.DocumentAdapter.Addnew(row.Name,row.Description);
            return true;       
        
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteDocumentMaster(Guid DocumentTypeId)
        {
           
            string curUser = Thread.CurrentPrincipal.Identity.Name;

            IgrssAdapters.DocumentAdapter.DeleteDocumentMaster(curUser, DateTime.Now, DocumentTypeId);

            return true;
        }


		/// <summary>
		/// This function Gets the FeeeDetails By FeeId 
		/// </summary>
		/// <param name="FeeId">Primary key of AdjudicationFeeDetails Table</param>
		/// <returns>A Datatable object FeesTable containing all the records in FeeDetails on the FeeId</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public FeesTable GetFeeDetailsById(Guid FeeId)
        {
            return IgrssAdapters.FeesAdapter.GetFeeDetailsById(FeeId);
        }

		/// <summary>
		/// Adding a new Records to FeeMaster
		/// </summary>
		/// <param name="Parameter">Formviewparameter , all the fields in the formview in terms of formviewparameters</param>
		/// <returns>true telling that A new record is inserted</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddNewFeeMaster(FormViewParameter Parameter)
        {
            Guid FeeId = Guid.NewGuid();
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IGRSS.DataAccessLayer.Adjudication.FeeMasterRow row = (IGRSS.DataAccessLayer.Adjudication.FeeMasterRow)Parameter.Values;

            IgrssAdapters.FeesAdapter.AddNewFeeMaster(FeeId, row.Name, row.Description, row.Amount, row.FeeType, curUser, DateTime.Now);
            return true;

        }
		/// <summary>
		/// This Function update  a particular record in Fee Master
		/// </summary>
		/// <param name="Parameter">Formview parameter the formview in the FeeMaster.aspx page</param>
		/// <param name="FeeId">primary key of FeeMaster Table</param>
		/// <returns>true indicating a new record is inserted to FeeMaster Table</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateFeeMaster(FormViewParameter Parameter, Guid FeeId)
        {

            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IGRSS.DataAccessLayer.Adjudication.FeeMasterRow row = (IGRSS.DataAccessLayer.Adjudication.FeeMasterRow)Parameter.Values;

            IgrssAdapters.FeesAdapter.UpdateFeeMaster(row.Name, row.Description, row.FeeType, row.Amount, curUser, DateTime.Now,FeeId);
            return true;

        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteFeeMaster(Guid FeeId)
        {

            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.FeesAdapter.DeleteFeesMaster(curUser, DateTime.Now, FeeId);
            return true;

        }

		/// <summary>
		/// This Function update a particular record in document  Master 
		/// </summary>
		/// <param name="Parameter">Formview Parameter i.e the formview in the DocumentMaster.aspx </param>
		/// <param name="DocumentTypeId">The primary key of the DocumentMaster Table indicating which record will be updated</param>
		/// <returns>true indicating that a record is updated</returns>
        
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateDocumentMaster(FormViewParameter Parameter, Guid DocumentTypeId)
        {

            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow row = (IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow)Parameter.Values;

            IgrssAdapters.DocumentAdapter.UpdateDocumentMaster(DocumentTypeId, row.Name, row.Description, curUser, DateTime.Now);

            return true;

        }

		/// <summary>
		/// This function Gets all the documents Details on the particular DocumentType Id
		/// </summary>
		/// <param name="DocumentTypeId"></param>
		/// <returns>Datatable object named DocumentTable which contains the record on that particular DocumentTypeId</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DocumentTable GetDocumentDetailsById(Guid DocumentTypeId)
        {
            return IgrssAdapters.DocumentAdapter.GetDocumentDetailsByDocumentId(DocumentTypeId);
        }

		/// <summary>
		///This function gets the   documentsdetails by ValuationFormId
		/// </summary>
		/// <param name="ValuationFormId">primary key of ValuationForm table</param>
		/// <returns>Datatable object named AdjudicationDocTable which contains the record on that particular ValuationFormId</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AdjudicationDocTable GetDocumentByValuationFormId(Guid ValuationFormId)
        {

            return IgrssAdapters.AdjudicationDocumentAdapter.GetDocumentDetailByValFormId(ValuationFormId);

        }
		/// <summary>
		/// This Function returns Adjudication Fee Details by passing AdjudicationId
		/// </summary>
		/// <param name="AdjudicationId">primary key of AdjudicationRequest table</param>
		/// <returns>Datatable object named AdjudicationFeeTable which contains the records </returns>
        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AdjudicationFeeTable GetAdjFeesDetailByAdjId(Guid AdjudicationId)
        {
			return IgrssAdapters.AdjudicationFeeAdapter.GetFeesDetailsByAdjudicationId(AdjudicationId);
        }

		/// <summary>
		/// This function returns all the records present in the AdjudicationRequest Table
		/// </summary>
		/// <returns>Datatable object named AdjudicationTable containing all the records</returns>
        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AdjudicationTable GetAdjudication()
        {
            return IgrssAdapters.AdjudicationAdapter.GetAllAdjRequests();
        }

		/// <summary>
		/// This function returns Get all the records present in the FeeMaster table
		/// </summary>
		/// <returns>Datatable object FeesTable containing all the records present in the FeeMaster table</returns>
        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public FeesTable GetFees()
        {
            return IgrssAdapters.FeesAdapter.GetAllFees();
        }
/// <summary>
/// Getting the Details of Adjudication Request by passing AdjudicationId
/// </summary>
/// <param name="AdjudicationId">primary key of the AdjudicationRequest table</param>
		/// <returns>Datatable objecti.e AdjudicationTable containing all the records in the AdjudicationRequest By AdjudicationId </returns>

        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AdjudicationTable GetAdjudicationRequestById(Guid AdjudicationId)
        {
			return IgrssAdapters.AdjudicationAdapter.GetAdjudicationRequestById(AdjudicationId);
        }

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AdjudicationTable GetPVRequests()
        {
            return IgrssAdapters.AdjudicationAdapter.GetPVRequests();
        }


		/// <summary>
		/// This function Gets the records ValuationFormTable
		/// </summary>
		/// <param name="AdjudicationId">AdjudicationId is the primary key , According to the AdjudicationId </param>
		/// <returns>Datatable object i.e, ValuationFormTable containing the record by AdjudicationId</returns>
        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public ValuationFormTable GetValuationFormByAdjudicationId(Guid AdjudicationId)
        {
			return IgrssAdapters.ValuationAdapter.GetValuationFormByAdjudicationId(AdjudicationId);
        }
		/// <summary>
		/// This function searches the AdjudicationRequest data by passing FileSlNo 
		/// </summary>
		/// <param name="FileSlNo">File sl No is the field which is the search parameter</param>
		/// <returns>Datattable object i.e, AdjudicationTable which contains all the records</returns>

        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AdjudicationTable GetAdJRequestByFileNo(string FileSlNo)
        {
            return IgrssAdapters.AdjudicationAdapter.GetAdjudicationRequestByFileNo(FileSlNo);

        }


        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public ValuationFormTable GetValuationFormDetails()
        //{
        //    return IgrssAdapters.ValuationAdapter.GetData();
        //}
        
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ValuationFormTable GetValuationFormDetailsByValuationFormId(Guid ValuationFormId)
        {
            return IgrssAdapters.ValuationAdapter.GetValuationFormByValFormId(ValuationFormId);
        }
        
		/// <summary>
        /// This Method Inserts Records to the Input Sheet 
        /// </summary>
        /// <param name="Parameter"> Formview Parameter in Registration Form </param>
        /// <returns>true indicating new  record is Inserted </returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewValuationFormForRegistration(FormViewParameter Parameter)
        {
                IGRSS.DataAccessLayer.Adjudication.ValuationFormRow row = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow)Parameter.Values;
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                Guid ValuationFormId = Guid.NewGuid();
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

        /// <summary>
        /// This function Insert a new record to AdjudicationRequest Table
        /// </summary>
        /// <param name="Parameter">Formview Parameter , which is the formview(fvAdjudication) present in the aspx page  </param>
		/// <param name="Id">ValuationFormId which is sent as a parameter from the code behind file</param>
		/// <param name="AdjId">AdjudicationId which is sent as a parameter from the code behind file</param>
        /// <returns>true ,indicating a record is inserted </returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddAdjudicationDetails(FormViewParameter Parameter, Guid Id, Guid AdjId)
        {

            AdjudicationRequestRow AdjReqRow = (IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow)Parameter.Values;
            Guid AdjudicationId = AdjId;
            Guid ValuationFormId = Id;
            IgrssAdapters.AdjudicationAdapter.AddAdjudicationRequest(AdjudicationId, ValuationFormId, null, AdjReqRow.OfficeId, AdjReqRow.ApplicationDate, AdjReqRow.ReceiptNumber, AdjReqRow.AdjudicationTotalFees);
            return true;
        }



		/// <summary>
		/// This function Update the records passing valuationFormId
		/// </summary>
		/// <param name="Parameter"></param>
		/// <param name="Id"></param>
		/// <param name="AdjId"></param>
		/// <returns>true</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateAdjudicationDetailsById(FormViewParameter Parameter, Guid Id, Guid AdjId)
        {

            AdjudicationRequestRow AdjReqRow = (IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow)Parameter.Values;
            Guid AdjudicationId = AdjId;
            Guid ValuationFormId = Id;
            IgrssAdapters.AdjudicationAdapter.UpdateAdjudicationRequest(AdjudicationId, ValuationFormId, null, AdjReqRow.OfficeId, AdjReqRow.ApplicationDate, AdjReqRow.ReceiptNumber, AdjReqRow.AdjudicationTotalFees);

            return true;
        }
		/// <summary>
		/// This function Insert a new record to the AdjudicationRequest Table implemented on Formview Parameter 
		/// //This function written After 1st implementaion at IGRSS , in order to workflow to work fine 
		/// </summary>
		/// <param name="ValFormParameter">All the Inputs present in the ValuationForm in the form of ValuationFormview</param>
		/// <param name="AdjReqRow">All the Inputs present in the form of AdjudicationFormView </param>
		/// <param name="FeeDetails">It's a Datatable which contains all the Fee Added by the User in the Grid</param>
		/// <param name="DocDetails">It's a Datatable which contains all the documents Added by the User in the Grid</param>
		/// <returns>true</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddAdjudicationRequest(FormViewParameter ValFormParameter, AdjudicationRequestRow AdjReqRow, DataTable FeeDetails, DataTable DocDetails)
        {

            string curUser = Thread.CurrentPrincipal.Identity.Name;
            Guid AdjudicationId = FileManager.OpenNewFile(AdjReqRow.OfficeId, "ADJ"); ;
            Guid ValuationFormId = Guid.NewGuid();
            ValuationFormRow ValFormrow = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow)ValFormParameter.Values;
            IgrssAdapters.ValuationAdapter.AddValuationDetail(ValuationFormId, ValFormrow.OfficeId, ValFormrow.DistrictCode,ValFormrow.TalukaCode,ValFormrow.VillageCode,
            null, ValFormrow.Village_CityName, ValFormrow.TPSchemeNo, ValFormrow.TPSchemeName, ValFormrow.FinalPlotNo, ValFormrow.CitySurveyNo, ValFormrow.RevenueSurveyNo,
            ValFormrow.Ward_SubWardNo, ValFormrow.NameOfOwner, ValFormrow.AddressOfOwner, ValFormrow.NameOfClaimingParty, ValFormrow.AddressOfClaimingParty,
            ValFormrow.AreaOfPlot, ValFormrow.AreaOfConstruction, ValFormrow.YearOfConstruction, ValFormrow.NoOfFloors, ValFormrow.TypeOfProperty,
            ValFormrow.DescOfProperty, ValFormrow.ShopsOnGroundFloor, ValFormrow.IsPropertyInCommercial, ValFormrow.TypeOfElectricfication,
            ValFormrow.CompoundWallType, ValFormrow.IsLightsOnCompoundWall, ValFormrow.WaterStorageFacility, ValFormrow.DrainageSystem, ValFormrow.NoOfLifts,
            ValFormrow.AreaOfEachLift, ValFormrow.InternalRoad, ValFormrow.ValuatedBefore, ValFormrow.HeightOfCeiling, ValFormrow.TypeOfTiles,
            ValFormrow.WallFurnishing, ValFormrow.NoOfBathrooms, ValFormrow.BathroomTilesHeight, ValFormrow.NoOfToilets, ValFormrow.ToiletTilesHeight, ValFormrow.Parking, curUser, DateTime.Now);

            IgrssAdapters.AdjudicationAdapter.AddAdjudicationRequest(AdjudicationId, ValuationFormId, null, AdjReqRow.OfficeId, AdjReqRow.ApplicationDate, AdjReqRow.ReceiptNumber, AdjReqRow.AdjudicationTotalFees);

            foreach (DataRow FeeDetail in FeeDetails.Rows)
            {
                IgrssAdapters.AdjudicationFeeAdapter.AddAdjudicationFees(AdjudicationId, (Guid)FeeDetail["FeeId"], Convert.ToDecimal(FeeDetail["Amount"]));
            }
            foreach (DataRow DocDetail in DocDetails.Rows)
            {
                IgrssAdapters.AdjudicationDocumentAdapter.AddAdjudicationDocument(ValuationFormId, (Guid)DocDetail["DocumentTypeId"], Convert.ToBoolean(DocDetail["Submitted"]), Convert.ToString(DocDetail["DocumentNumber"]), Convert.ToString(DocDetail["Remarks"]));
            }
            // All database Inserts have been completed sucessfully initiate the Workflow
            // Create a Dioctionary to store Workflow Paramaters for Adjudication
            Dictionary<string, object> WfParams = new Dictionary<string, object>();
            // Add Adjudication Application  Id into the Workflow Parameter
			WfParams.Add("AdjudicationId", AdjudicationId);
			WfParams.Add("ValuationFormId", ValuationFormId);
            // Add Office Id in to Workflow Parameter 
            // (to identify the process flow for the Office)
            WfParams.Add("InitiatingOffice", ValFormrow.OfficeId);
            // Initiate the Refund Workflow by passing the Wf Parameters Dictionary
            WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(AdjudicationProcess), WfParams);
            return true;

        }

        /// <summary>
        /// Update  UpdateAdjudicationRequestById Updates the Adjudication Form
        /// </summary>
        /// <param name="ValFormParameter"> AdjudicationRequest Formview,ValuationForm ,FeeDetails, DocumentDetails,ValuationFormId,AdjudicationId </param>
        /// <param name="AdjReqRow">Adjudication Form view Entry</param>
        /// <param name="FeeDetails">FeeDetails is the Gridview which getting added to the grid</param>
        /// <param name="DocDetails">Document Details grid </param>
        /// <param name="ValuationId">DataKey of Valuation Form </param>
        /// <param name="AdjudicationId">DataKey of Adjudication request Form </param>
        /// <returns> Records Updated or not </returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateAdjudicationRequestById(FormViewParameter ValFormParameter, AdjudicationRequestRow AdjReqRow, DataTable FeeDetails, DataTable DocDetails, Guid ValuationId, Guid AdjudicationId, Guid AlertId, bool Verified)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;

            // Get the Workflow Instance Id from table
            Guid WfInstanceId = (Guid)IgrssAdapters.ValuationAdapter.GetAdjudicationWorkFlowInstanceId(ValuationId);

            // Check if the user has verified the application or just updated
            if (Verified)
            {
                // Create the FeedbackEventArgs object
                FeedbackEventArgs args = new FeedbackEventArgs(WfInstanceId, AlertId, curUser);
                WorkflowMediator.AdjudicationServices.ValidateAdjudicationApplication(WfInstanceId, args);
            }
            else
            {
                // The record has not been verified just updated
				AdjudicationApplicationUpdatedEventArgs args = new AdjudicationApplicationUpdatedEventArgs(WfInstanceId, AdjReqRow, (ValuationFormRow) ValFormParameter.Values, FeeDetails, DocDetails);
                     //AppealApplicationUpdatedEventArgs args = new AppealApplicationUpdatedEventArgs(WfInstanceId, (AppealApplicationRow)parameter.Values, dtAct);
                 WorkflowMediator.AdjudicationServices.UpdateAdjudicationApplication(WfInstanceId, args);
            }

            return true;


        }

        //**************************** Added By P.Sahoo on June 8th 2007**************
        //Valuation of the Property Starts here 

        //****************************************************************************

        /// <summary>
		/// Getting the valuation sheet row by adding new row on ValuationSheetTable
        /// </summary>
		/// <returns>ValuationSheetRow</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static ValuationSheetRow GetRow()
        {
            return new ValuationSheetTable().NewValuationSheetRow();

        }


        //Inserting a new record to Valuation Request as valuation Request Object


        //public bool AddNewValuationRequest(ValuationRequest Request)
        //{
        //        IgrssAdapters.ValuationSheetAdapter.AddNewValuationRequestDetails(Request.AdjudicationId, Request.ValuationId,
        //            Request.AreaOfPlot, Request.AreaOfConstruction,Request.InternalElectrificationRate, Request.DevelopmentRate, Request.LiftExpense, Request.SpecialDeduction,
        //            Convert.ToDecimal(Request.PlotNo), Request.SchemeNo, Convert.ToString(Request.YearOfConstruction));
        //    return true;
        //}


        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateValuationRequestDetails(ValuationRequest Request)
        {
            try
            {
                IgrssAdapters.ValuationSheetAdapter.AddNewValuationRequest(Request.AdjudicationId, Request.ValuationId,
                Request.DistrictCode, Request.TalukaCode, Request.VillageCode, Request.SchemeType, Request.EstimatedPrice, Request.IsConstructedProperty,
                Request.SchemeNo,
                Request.PlotNo,
                Request.AreaOfPlot, Request.TypeOfLand, Convert.ToDecimal("12.00"),
                Request.DevelopmentRate, Request.OtherFeeRate, Request.YearOfConstruction, Request.SpecialDeductionRate, Request.LiftExpense);

            }
            catch (Exception ex)
            {

                throw;
            }

            return true;

        }
		/// <summary>
		/// This function gets all the details information on Valuationsheet table as per the AdjudicationId
		/// </summary>
		/// <param name="AdjudicationId">parameter based on which the record will be selected</param>
		/// <returns>ValuationResult object Returned from the stamp duty calculation webservice</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ValuationResult GetValuationSheetDetailsByAdjId(Guid AdjudicationId)
        {
            ValuationRequest Request = new ValuationRequest();
            ValuationSheetRow row = (ValuationSheetRow)IgrssAdapters.ValuationSheetAdapter.GetValuationSheetDetailsByAdjId(AdjudicationId).Rows[0];

            Request.AdjudicationId = AdjudicationId;
            Request.ValuationId = row.ValuationFormId;
            Request.IsConstructedProperty = row.IsConstructedProperty;
            Request.EstimatedPrice = Convert.ToDecimal(row.EstimatedPrice);
            Request.TalukaCode = row.TalukaCode;
            Request.VillageCode = row.VillageCode;
            Request.DistrictCode = row.DistrictCode;
            Request.SchemeNo = row.SchemeNo;
            Request.AreaOfPlot = row.AreaOfPlot;
            Request.SchemeType = row.SchemeType;
            Request.TypeOfLand = row.TypeOfLand;
            Request.InternalElectrificationRate = row.InternalElectrificationRate;
            Request.DevelopmentRate = row.DevelopmentRate;
            Request.OtherFeeRate = row.OtherFeeRate;
            Request.SpecialDeductionRate = row.SpecialDeductionRate;
            Request.YearOfConstruction = row.YearOfConstruction;

           StampDutyCalculator calc = new StampDutyCalculator();
            ValuationResult Result = calc.GetStampDutyCalculation(Request);

            return Result;

        }
		/// <summary>
		/// This function Issue a certificate to the applicant 
		/// </summary>
		/// <param name="AdjudicationId"></param>
		/// <param name="CertificateNumber">Certificate No which will be entered by user </param>
		/// <param name="CertificateIssuedOn">CertificateIssuedOn i.e,Date  which will be entered by user </param>
		/// <param name="CertificateDescription">CertificateDescription i.e,Description  which will be entered by user </param>
		/// <returns>true, indicating that a certificate is issued </returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool IssueCertificate(Guid AdjudicationId, string CertificateNumber, DateTime CertificateIssuedOn, string CertificateDescription)
        {
            IgrssAdapters.AdjudicationAdapter.IssueCertificateById(AdjudicationId, CertificateNumber, CertificateIssuedOn, CertificateDescription);
            return true;
        }

        /// <summary>
        /// This function gets the ValuationForm Details on the particular adjudicationId
        /// </summary>
        /// <param name="AdjudicationId">Parameter on which the record will be selected </param>
        /// <returns>Datatable object containing all the fields of ValuationForm</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetValuationFormDetailsById(Guid AdjudicationId)
        {
            //ValuationRequest objvaluationRequest = new ValuationRequest();
            //AdjudicationRequest objAdjudicationrequest = new AdjudicationRequest();
            //DataTable dtValuationForm = new DataTable();
            //dtValuationForm = objAdjudicationrequest.GetValuationFormRowByAdjudicationId(AdjudicationId);
            //DataRow drValuationForm = dtValuationForm.Rows[0];
            //objvaluationRequest.TpSchemeNo = (string) drValuationForm["TPSchemeNo"];
            //objvaluationRequest.AreaOfLand = (decimal) drValuationForm["AreaOfPlot"];
            //objvaluationRequest.PlotNo = (string) drValuationForm["FinalPlotNo"];
            //objvaluationRequest.AreaOfConstruction = (decimal) drValuationForm["AreaOfConstruction"];
            //objvaluationRequest.YearOfConstruction = (int) drValuationForm["YearOfConstruction"];


            return IgrssAdapters.AdjudicationAdapter.GetValuationFormDetailsById(AdjudicationId);
        }

        
		//Setting the Formview1(fvValuationResult) Taking AdjudicationId as Parameter.
        /// <summary>
        /// Get the Valuation Form Details 
        /// </summary>
        /// <param name="AdjudicationId">Primary Key of AdjudicationRequest Table </param>
        /// <returns>Valuation Request Object which Needs to be Passed to the SdcCal WebService</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ValuationRequest GetValuationFormDetails(Guid AdjudicationId)
        {
            ValuationRequest RetRequest = new ValuationRequest();
            ValuationFormRow row = (ValuationFormRow)new AdjudicationRequest().GetValuationFormRowByAdjudicationId(AdjudicationId).Rows[0];
            RetRequest.AdjudicationId = AdjudicationId;
            RetRequest.ValuationId = row.ValuationFormId;
            RetRequest.TalukaCode = 1;
            RetRequest.VillageCode = 1;
            RetRequest.DistrictCode = 1;
            RetRequest.SchemeNo = row.TPSchemeNo;
            RetRequest.SchemeType = "TP Scheme";
            RetRequest.PlotNo = row.FinalPlotNo;
            RetRequest.AreaOfPlot = row.AreaOfPlot;
            RetRequest.AreaOfConstruction = row.AreaOfConstruction;
            RetRequest.TypeOfLand = "APrate";
            RetRequest.YearOfConstruction = row.YearOfConstruction;
            return RetRequest;
        }
        
		/// <summary>
        /// Getting the Adjudication Request Row from AdjudicationRequest table 
        /// </summary>
        /// <returns> A new row i.e,AdjudicationRequest Row</returns>
        public static AdjudicationRequestRow GetAdjudicationRow()
        {
            return new AdjudicationTable().NewAdjudicationRequestRow();
        }

		/// <summary>
		/// This function gets all the records present in the ValuationForm Table
		/// </summary>
		/// <returns>A Datatble which contains all the records in the ValuationForm Table</returns>
        public DataTable ValuationFormDetails()
        {
            return IgrssAdapters.ValuationAdapter.GetData();
        }

        /// <summary>
        /// This function Gets a new  the ValuationForm Row 
        /// </summary>
		/// <returns>  A new row i.e,ValuationFormRow on the valuationForm Table </returns>
        public static ValuationFormRow GetValuationFormRow()
        {
            return new ValuationFormTable().NewValuationFormRow();
        }

        /// <summary>
        /// This function Gets the valuation Sheet  row
        /// </summary>
		/// <returns>  A new row i.e,valuation Sheet Row on valuationsheet table</returns>
        public static ValuationSheetRow GetValuationSheetRow()
        {
            return new ValuationSheetTable().NewValuationSheetRow();

        }
		/// <summary>
		/// This function selects all the records present in the ValuationForm Table on particular AdjudicationId
		/// </summary>
		/// <param name="AdjudicationId">AdjudicationId is the parameter on which the particular record will be selected</param>
		/// <returns>Datatble returning the particular record on AdjudicationId</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ValuationFormTable GetValuationFormRowByAdjudicationId(Guid AdjudicationId)
        {
            //ValuationRequest objvaluationRequest = new ValuationRequest();
            //AdjudicationRequest objAdjudicationrequest = new AdjudicationRequest();
            //DataTable dtValuationForm = new DataTable();
            //dtValuationForm = objAdjudicationrequest.GetValuationFormRowByAdjudicationId(AdjudicationId);
            //DataRow drValuationForm = dtValuationForm.Rows[0];
            //objvaluationRequest.TpSchemeNo = (string) drValuationForm["TPSchemeNo"];
            //objvaluationRequest.AreaOfLand = (decimal) drValuationForm["AreaOfPlot"];
            //objvaluationRequest.PlotNo = (string) drValuationForm["FinalPlotNo"];
            //objvaluationRequest.AreaOfConstruction = (decimal) drValuationForm["AreaOfConstruction"];
            //objvaluationRequest.YearOfConstruction = (int) drValuationForm["YearOfConstruction"];

            return IgrssAdapters.ValuationAdapter.SelectValuationFormDetailsByAdjId(AdjudicationId);
        }

        
		/// <summary>
        /// // Updating the Valuation Sheet getting all the properties from valuationResult.
        /// </summary>
        /// <param name="Result">Valuation Result object whuich is Obtained from the Web service and updates in the Valuation Sheet table</param>
        /// <returns>Wheather the ValuationSheet is updated or not</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateValuationSheetDetails(ValuationResult Result)
        {

            try
            {
                IgrssAdapters.ValuationSheetAdapter.UpdateQuery(Result.AdjudicationId,
                    Result.ValuationId,
                    Result.DistrictCode,
                    Result.TalukaCode,
                    Result.VillageCode,
                    Result.SchemeType,
                    Result.EstimatedPrice,
                    Result.IsConstructedProperty,
                    Result.SchemeNo,
                    Result.PlotNo,
                    Result.AreaOfPlot,
                    Result.AreaOfConstruction,
                    Result.TypeOfLand,
                    Result.InternalElectrificationRate,
                    Result.DevelopmentRate,
                    Result.OtherFeeRate,
                    Result.SpecialDeductionRate,
                    Result.YearOfConstruction,
                    Result.LiftExpense,
                    Result.LandRate,
                    Result.ValueOfLand,
                    Result.InternalElectrificationExpense,
                    Result.DevelopmentExpense,
                    Result.OtherFees,
                    Result.SpecialDeduction,
                    DateTime.Now,
                    Result.EstimatedPriceOfConstruction,
                    Result.LifeOfConstruction,
                    Result.Depreciation,
                    Result.NetPrice,
                    Result.ValueOfConstruction,
                    Result.ValuationOfConstruction,
                    Result.StampDuty,
                    Result.StampDutyRate,
                    Result.Remarks);
            }
            catch (Exception e)
            {
                throw;
            }

            return true;

            //IgrssAdapters.ValuationSheetAdapter.UpdateValuationSheetDetails(Result.AdjudicationId,
            //    Result.ValuationId, Result.ReceivedDate, Result.ValuationDate, Result.AreaOfPlot,
            //    Result.PlinthAreaOfConstruction, Result.ConstructionRate, Result.EstimatedPriceOfConstruction,
            //    Result.DevelopmentRate, Result.LiftExpense, Result.ConstructionExpense,
            //    Result.LifeOfConstruction, Result.Depreciation, Result.NetPrice, Result.SpecialDeduction,
            //    Result.ValuationOfProperty, Result.StampDuty, Result.Remarks, Result.DistrictCode,
            //    Result.TalukaCode, Result.VillageCode, Result.PlotNo, Result.TpSchemeNo, Result.YearOfConstruction,
            //    Result.DevelopmentExpense, Result.InternalElectrificationExpense, Result.IsConstructedProperty, Result.SchemeType,
            //    Result.YearOfConstruction, Result.TypeOfLand, Result.DevelopmentRate, Result.OtherFeeRate);

            //IgrssAdapters.ValuationSheetAdapter.UpdateValuationSheetDetails(Result.AdjudicationId,
            // Result.ValuationId,
            // Result.ReceivedDate,Result.ValuationDate, 
            // Convert.ToDecimal(Result.AreaOfPlot), Result.PlinthAreaOfConstruction, Result.ConstructionRate,
            // Result.EstimatedPriceOfConstruction,Convert.ToDecimal(Result.InternalElectrificationRate),
            // Result.DevelopmentExpense,null, Convert.ToDecimal(Result.LiftExpense), Convert.ToDecimal(Result.ConstructionExpense), Convert.ToInt16(Result.LifeOfConstruction),
            // Convert.ToDecimal(Result.Depreciation),
            // Result.NetPrice, Result.SpecialDeduction, Result.ValuationOfProperty, Result.StampDuty,
            // Result.Remarks, Convert.ToInt32(Result.DistrictCode), Convert.ToInt32(Result.TalukaCode),
            // Convert.ToInt32(Result.VillageCode),
            // Convert.ToDecimal(Result.PlotNo), Convert.ToString(Result.TpSchemeNo), Convert.ToString(Result.YearOfConstruction));

            //return true;
        }
        
	
        /// <summary>
        /// This function Updates the physical verification Required value 
        /// </summary>
        /// <param name="AdjudicationId">The parameter on which the updation will be carried out</param>
        /// <returns> Wheather the Physical verification is Checked or not </returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdatePhysicalVerification(Guid AdjudicationId)
        {
            IgrssAdapters.AdjudicationAdapter.UpdatePhysicalVerification(AdjudicationId, true);
            
            return true;

        }
		/// <summary>
		/// This function gets a new document Master row 
		/// </summary>
		/// <returns> A new row i.e,DocumentMasterRow</returns>

        public static IGRSS.DataAccessLayer.Adjudication.DocumentMasterRow GetDocumentMasterRow()
        {
            return new DocumentTable().NewDocumentMasterRow();
        }

		/// <summary>
		/// This function gets a new GetFeeMasterRow 
		/// </summary>
		/// <returns> A new row i.e,FeeMaster Row</returns>

        public static IGRSS.DataAccessLayer.Adjudication.FeeMasterRow GetFeeMasterRow()
        {
            return new FeesTable().NewFeeMasterRow();
        }


        
    }
}