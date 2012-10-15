using System;
using System.Collections.Generic;
using System.Text;

// Custom Namespaces

using IGRSS.DataAccessLayer.OfficesMasterTableAdapters;
using IGRSS.DataAccessLayer.AdjudicationTableAdapters;
using IGRSS.DataAccessLayer.RefundTableAdapters;
using IGRSS.DataAccessLayer.LicenseMasterTableAdapters;
using IGRSS.DataAccessLayer.RefundTypeMasterTableAdapters;
using IGRSS.DataAccessLayer.RevenueStampMasterTableAdapters;
using IGRSS.DataAccessLayer.ActMasterTableAdapters;
using IGRSS.DataAccessLayer.LicenseApplicationTableAdapters;
using IGRSS.DataAccessLayer.LicenseReNewalTableAdapters;
using IGRSS.DataAccessLayer.AppealTableAdapters;
using IGRSS.DataAccessLayer.AppealTypeMasterTableAdapters;
using IGRSS.DataAccessLayer.InspectionTableAdapters;
using IGRSS.DataAccessLayer;
using IGRSS.DataAccessLayer.ComplainTableAdapters;
using IGRSS.DataAccessLayer.TestTableAdapters;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using IGRSS.DataAccessLayer.EmployeeTableAdapters;
using IGRSS.DataAccessLayer.ComplainTableAdapters;
using IGRSS.DataAccessLayer.PurchaseTableAdapters;
//using  IGRSS.DataAccessLayer.EmployeeTableAdapters;
using IGRSS.DataAccessLayer.TelephoneTableAdapters;
using IGRSS.DataAccessLayer.LeaveTableAdapters;
using IGRSS.DataAccessLayer.ServiceTableAdapters;
using IGRSS.DataAccessLayer.AppealTableAdapters;
using IGRSS.DataAccessLayer.InwardOutwardTableAdapters;
using IGRSS.DataAccessLayer.InwardOutwardTableAdapters;
using IGRSS.DataAccessLayer.InspectionDetailsTableAdapters;
using IGRSS.DataAccessLayer.JantriTableAdapters;
using IGRSS.DataAccessLayer.CitizenTableAdapters;
using IGRSS.DataAccessLayer.RegistrationTableAdapters;
using IGRSS.DataAccessLayer.DocumentUploadTableAdapters;
using IGRSS.DataAccessLayer.FaqTableAdapters;
using IGRSS.DataAccessLayer.SRORatesTableAdapters;
using IGRSS.DataAccessLayer.VillageMasterAdministratorTableAdapters;
using IGRSS.DataAccessLayer.FileManagementTableAdapters;
using IGRSS.DataAccessLayer.VendorOffenceTableAdapters;
using  IGRSS.DataAccessLayer.VendorOffenceTableAdapters;
using IGRSS.DataAccessLayer.FileAttachmentsTableAdapters;
using  IGRSS.DataAccessLayer.AppealTypeMasterTableAdapters;
using IGRSS.DataAccessLayer.TestTableTableAdapters;
using IGRSS.DataAccessLayer.GovtDocTableAdapters;
using IGRSS.DataAccessLayer.OutwardTableAdapters;
//using IGRSS.DataAccessLayer.s

namespace IGRSS.BusinessObjects

{
	internal static class IgrssAdapters
	{
       
        public static AppealDecisionMasterTableAdapter AppealDecisionAdapter=new AppealDecisionMasterTableAdapter();
		public static AppealHearingTableAdapter AppealHearingAdapter = new AppealHearingTableAdapter();
		//public static ValuationRequestTableAdapter ValuationRequestAdapter = new ValuationRequestTableAdapter();
		
		public static CitizenTableAdapter CitizenAdapter = new CitizenTableAdapter();
		
		public static OfficeMasterTableAdapter OfficesAdapter = new OfficeMasterTableAdapter();

		public static OfficeTypes_LKPTableAdapter OfficeTypeAdapter = new OfficeTypes_LKPTableAdapter();

		public static AdjudicationRequestTableAdapter AdjudicationRequestAdapter = new AdjudicationRequestTableAdapter();

		public static RefundApplicationTableAdapter RefundApplicationAdapter = new RefundApplicationTableAdapter();

		public static LicenseMasterTableAdapter LicenseMasterAdapter = new LicenseMasterTableAdapter();

		public static RefundTypeMasterTableAdapter RefundTypeMasterAdapter = new RefundTypeMasterTableAdapter();

		public static RevenueStampMasterTableAdapter RevenueStampMasterAdapter = new RevenueStampMasterTableAdapter();

		public static ActMasterTableAdapter ActMasterAdapter = new ActMasterTableAdapter();

		public static LicenseApplicationTableAdapter LAppTableAdapter = new LicenseApplicationTableAdapter();

		public static RefundStampDetailsTableAdapter RefundStampDetailsAdapter = new RefundStampDetailsTableAdapter();

		public static RenewLicenseTableAdapter LicRenewAdapter = new RenewLicenseTableAdapter();

		public static RefundActsApplicableTableAdapter RefundActsApplicable = new RefundActsApplicableTableAdapter();

		public static RefundOrderTableAdapter RefundOrder = new RefundOrderTableAdapter();

		public static AppealApplicationTableAdapter AppealAdapter = new AppealApplicationTableAdapter();

		public static AppealTypeMasterTableAdapter AppealTypeAdapter = new AppealTypeMasterTableAdapter();

        public static InspectionYearlySheduleTableAdapter InspectionTableAdapter = new InspectionYearlySheduleTableAdapter();

        public static SaleRegisterTableAdapter SaleRegister = new SaleRegisterTableAdapter();
        public static GovtDocsTableAdapter GovtTableAdapter = new GovtDocsTableAdapter();

		//public static QueriesTableAdapter ComlainAdapter2 = new QueriesTableAdapter();

		public static ValuationSheetTableAdapter ValuationSheetAdapter = new ValuationSheetTableAdapter();
		public static AdjudicationRequestTableAdapter AdjudicationAdapter = new AdjudicationRequestTableAdapter();

		public static AdjudicationFeeDetailsTableAdapter AdjudicationFeeAdapter = new AdjudicationFeeDetailsTableAdapter();

		public static DocumentChecklistTableTableAdapter AdjudicationDocumentAdapter = new DocumentChecklistTableTableAdapter();

		public static ValuationFormTableAdapter ValuationAdapter = new ValuationFormTableAdapter();

		public static FeeMasterTableAdapter FeesAdapter = new FeeMasterTableAdapter();

		public static DocumentMasterTableAdapter DocumentAdapter = new DocumentMasterTableAdapter();

		public static RefundApprovalGridTableAdapter RefundApprovalGrid = new RefundApprovalGridTableAdapter();

		public static StudentTableAdapter studentAdapter = new StudentTableAdapter();

		public static OfficesCommunication_LKPTableAdapter OfficeCommunication_LKP = new OfficesCommunication_LKPTableAdapter();

		public static UsersInOfficeRolesTableAdapter UsersInOfficeRole = new UsersInOfficeRolesTableAdapter();

		#region Employee Module
		
		//Employee Module Adapters start  Here
		public static DesignationMasterTableAdapter DesignationMaster = new DesignationMasterTableAdapter();

		public static DepartmentMasterTableAdapter DepartmentMaster = new DepartmentMasterTableAdapter();

		public static QualificationMasterTableAdapter QualificationMaster = new QualificationMasterTableAdapter();

		public static EmployeeMasterTableAdapter EmployeeMaster = new EmployeeMasterTableAdapter();

		public static EmployeeQualificationsTableAdapter EmployeeQualifications = new EmployeeQualificationsTableAdapter();

		#endregion

		#region Purchase Module
		//Purchase Module Adapters Here 

		public static ItemMasterTableAdapter ItemMaster = new ItemMasterTableAdapter();

		public static UOMMasterTableAdapter UOMMaster = new UOMMasterTableAdapter();

		public static PurchaseRegHeaderTableAdapter PurchaseRegHeader = new PurchaseRegHeaderTableAdapter();

		public static VendorMasterTableAdapter VendorMaster = new VendorMasterTableAdapter();

		public static PurchaseRegDetailTableAdapter PurchaseRegDetail = new PurchaseRegDetailTableAdapter();
		#endregion

		#region Inspection Adapter
		//Inspection Adapter
		public static InspectionYearlySheduleTableAdapter InspYearlyShedule = new InspectionYearlySheduleTableAdapter();
		public static InspectionYearlyScheduleDetailTableAdapter InspYearlyScheduleDetail = new InspectionYearlyScheduleDetailTableAdapter();

		public static InspectionYearlyScheduleMonthwiseTableAdapter InspYearlyScheduleMonthwise = new InspectionYearlyScheduleMonthwiseTableAdapter();

		//public static InspectionItenaryTableAdapter InspItenary = new InspectionItenaryTableAdapter();

		public static InspectionItenaryTableAdapter InspItenary = new InspectionItenaryTableAdapter();
		// Added Latter
		public static CheckListInspectionTableAdapter InspChecklist = new CheckListInspectionTableAdapter();
		
		public static InspectionDetailsTableAdapter InspDetails = new InspectionDetailsTableAdapter();

		public static InspectionCheckListMasterTableAdapter InspChecklistMaster = new InspectionCheckListMasterTableAdapter();
		
		public static InspectionQueriesTableAdapter InspQueries = new InspectionQueriesTableAdapter();

		public static InspectionTypeMasterTableAdapter InspTypeMaster = new InspectionTypeMasterTableAdapter();

        public static InspectionQueriesTableAdapter QueryReply = new InspectionQueriesTableAdapter();

        public static TestTableAdapter TestTableAdapter = new TestTableAdapter();

		#endregion

		public static ComplainDetailsTableAdapter ComplainAdapter = new ComplainDetailsTableAdapter();
		public static InvestigationTableAdapter InvestigationAdapter = new InvestigationTableAdapter();
		public static TelephoneRegisterTableAdapter TelephoneAdapter = new TelephoneRegisterTableAdapter();
		public static LeaveRegisterTableAdapter LeaveAdapter = new LeaveRegisterTableAdapter();
		public static ServiceRegisterTableAdapter ServiceAdapter = new ServiceRegisterTableAdapter();
		public static AppealActsApplicableTableAdapter AppealActAdapter = new AppealActsApplicableTableAdapter();
		public static Inward_OutwardRegisterTableAdapter InwardAdapter = new Inward_OutwardRegisterTableAdapter();
		public static PostalDeliveryType_LKPTableAdapter DeliveryAdapter = new PostalDeliveryType_LKPTableAdapter();
		public static PostalStampDenomMasterTableAdapter PostalDenomAdapter = new PostalStampDenomMasterTableAdapter();
		public static PostalStampPurchaseReqTableAdapter PostalrequestAdapter = new PostalStampPurchaseReqTableAdapter();

		public static InspectionMemoTableAdapter InspectionMemo = new InspectionMemoTableAdapter();

		public static InspectionMemoActionTableAdapter InspectionMemoAction = new InspectionMemoActionTableAdapter();

		//Jantri  Table Adapters

		public static JantriTableAdapter JantriAdapter = new JantriTableAdapter();

		public static distmasTableAdapter districtMasterAdapter = new distmasTableAdapter();

		public static talukamasTableAdapter talukaMasterAdapter = new talukamasTableAdapter();
		
		public static villagemasTableAdapter villageMasterAdapter = new villagemasTableAdapter();

        public static Document_UploadTableAdapter UploadAdapter = new Document_UploadTableAdapter();

        public static FAQTableAdapter FaqAdapter = new FAQTableAdapter();

		#region Workflow Support

		public static AlertsTableAdapter Alerts = new AlertsTableAdapter();

		public static UsersInOfficeRolesTableAdapter UsersInOfficeRoles = new UsersInOfficeRolesTableAdapter();

		public static OfficeProcess_LKPTableAdapter OfficeProcess = new OfficeProcess_LKPTableAdapter();

		





		#endregion

		#region Registration Module
		//Registration Module Adapters here.

		public static InputSheetTableAdapter InputSheet = new InputSheetTableAdapter();
		public static RegistrationPartyDetailsTableAdapter RegistrationPartyDetails = new RegistrationPartyDetailsTableAdapter();
		public static RegistrationFeeDetailsTableAdapter RegistrationFeeDetails = new RegistrationFeeDetailsTableAdapter();

		public static RegistrationDocumentCheckListTableAdapter RegistrationDocumentCheckList = new RegistrationDocumentCheckListTableAdapter();

        public static RegistrationHearingTableAdapter RegistrationHearing = new RegistrationHearingTableAdapter();

       // public static SaleRegisterTableAdapter SaleRegister = new SaleRegisterTableAdapter();
		#endregion

        // SRO Rate Adapter for demo 
        public static SRORatesTableAdapter SroRateAdapter = new SRORatesTableAdapter();
        // Village Master Adapter
        public static villagemasterAdministratorTableAdapter VillageMasterAdmin = new villagemasterAdministratorTableAdapter();

        // File Management Adapters

        public static Applicant_DetailsTableAdapter ApplicantDetails = new Applicant_DetailsTableAdapter();
        public static FileRemarksTableAdapter FileRemarkAdapter = new FileRemarksTableAdapter();
        public static FileManagementMasterTableAdapter FileManagementMasterTable = new FileManagementMasterTableAdapter();
		public static DepartmentMasterForFileTableAdapter FileDepartmentAdapter = new DepartmentMasterForFileTableAdapter();
        public static FileForwardsTableAdapter FileForwardingAdapter = new FileForwardsTableAdapter();
        public static DocumentRepositoryTableAdapter docResporicity = new DocumentRepositoryTableAdapter();
        public static LicAuthorisedTableAdapter LAothroisedAdapter = new LicAuthorisedTableAdapter();
        public static LicensePurposeMasterTableAdapter LPurposeAdapter = new LicensePurposeMasterTableAdapter();
        public static VendorOffenceTableAdapter VOffenceAdapter = new VendorOffenceTableAdapter();
        public static VendorInvestigationTableAdapter VInspectionAdapter = new VendorInvestigationTableAdapter();
        public static HighCourtAppealTableAdapter HighCourtAdapter = new HighCourtAppealTableAdapter();


	}
}
