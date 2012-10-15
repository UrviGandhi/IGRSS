//Inspection
//ClassName     - Inspection
//Purpose       - This business class contains a business logic for Recording Inspection details.
//Author        : Pradeep Sahoo
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Threading;
using IGRSS.BusinessObjects;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using System.Data;
using System.Xml;

using InspectionYearlyScheduleTable = IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleDataTable;
using InspectionYearlyScheduleDetailsTable = IGRSS.DataAccessLayer.Inspection.InspectionYearlyScheduleDetailDataTable;
using InspectionItenaryTable = IGRSS.DataAccessLayer.Inspection.InspectionItenaryDataTable;
using InspectionYearlyScheduleMonthwiseTable = IGRSS.DataAccessLayer.Inspection.InspectionYearlyScheduleMonthwiseDataTable;
using InspectionYearlyScheduleRow = IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleRow;
using InspectionYearlyScheduleDetailsRow = IGRSS.DataAccessLayer.Inspection.InspectionYearlyScheduleDetailRow;
using InspectionYearlyScheduleMonthwiseRow = IGRSS.DataAccessLayer.Inspection.InspectionYearlyScheduleMonthwiseRow;
using InspectionItenaryRow = IGRSS.DataAccessLayer.Inspection.InspectionItenaryRow;

using InspectionDetailsTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionDetailsDataTable;
using InspectionQueriesTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionQueriesDataTable;

using InspectionTypeMasterTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterDataTable;
using InspectionTypeMasterRow=IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterRow;

using InspectionCheckListMasterTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterDataTable;
using InspectionCheckListMasterRow = IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterRow;

using CheckListInspectionTable = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionDataTable;
using CheckListInspectionRow = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionRow;

using InspectionDetailsRow = IGRSS.DataAccessLayer.InspectionDetails.InspectionDetailsRow;

using InspectionMemoTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoDataTable;
using InspectionMemoRow = IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoRow;

using InspectionActionRow = IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoActionRow;

using InspectionActionTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoActionDataTable;

using QueryTable = IGRSS.DataAccessLayer.InspectionDetails.InspectionQueriesDataTable;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Inspection
	{
		/// <summary>
		/// This function Gets all the Yearly Scheduled Inspection 
		/// </summary>
		/// <returns>Datatable object containing all the records from the InspectionYearlySchedule Table </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetYearlyScheduletoDisp()
		{
			return new DataTable(); //IgrssAdapters.InspYearlyShedule.GetYearlyScheduleDisp();
		}

		/// <summary>
		/// This function Get a new row i.e  YearlyInspectionRow from InspectionYearlySchedule Table
		/// </summary>
		/// <returns>a new row i.e,NewInspectionYearlySheduleRow</returns>
		public static InspectionYearlyScheduleRow GetYearlyInspectionRow()
		{
			return new InspectionYearlyScheduleTable().NewInspectionYearlySheduleRow();
		}
		/// <summary>
		/// This function Get all the offices where Inspections are  Schedulded
		/// </summary>
		/// <param name="ScheduleId">This is the parameter which Gets  all the records on this parameter</param>
		/// <returns>datattable object i.e,InspectionYearlyScheduleTable which contains all the fields </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InspectionYearlyScheduleTable GetOfficesByScheduleId(Guid ScheduleId)
		{
			return IgrssAdapters.InspYearlyShedule.GetOfficesByScheduleId(ScheduleId);

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
        public InspectionYearlyScheduleMonthwiseTable GetMonthlyInspectionScheduleByDetailScheduleId(Guid DetailScheduleId)
		{
            return IgrssAdapters.InspYearlyScheduleMonthwise.GetMonthlyInspectionScheduleByDetailScheduleId(DetailScheduleId);
		}

        /// <summary>
		/// This function Get all the Yearly Inspection Details
		/// </summary>
		/// <returns>Datatable containg all the records i.e,InspectionYearlyScheduleDetailsTable</returns>
		
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionYearlyScheduleDetailsTable GetYearlyInspectionDetails()
		{
			return IgrssAdapters.InspYearlyScheduleDetail.GetYearlyInspectionDetails();
		}
		

		/// <summary>
		/// This function gets all the records of Yearly Inspection Details By ScheduledId
		/// </summary>
		/// <param name="ScheduleId">Primary key on which the Records will be fetched</param>
		/// <returns>Datatable containing all the records</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetYearlyInspectionDetailsById(Guid ScheduleId)
		{
			return IgrssAdapters.InspYearlyScheduleDetail.GetYearlyInspectionDetailsById(ScheduleId);
		}
		/// <summary>
		/// This function gets all Inspection Checklist Details for a particular Inspection
		/// </summary>
		/// <param name="InspectionId">Primary key of InspectionDetails table on which the records will be fetched</param>
		/// <returns>Datable containing all the records from InspectionDetails table on particular InspectionId</returns>

		public DataTable GetInspectionCheckListById(Guid InspectionId)
		{
			return IgrssAdapters.InspChecklist.GetInspectionCheckListById(InspectionId);

		}
		/// <summary>
		/// This function gets all the Inspection queries  from InspectionQueries Table
		/// </summary>
		/// <param name="InspectionId">The parameter for InspectionQueries table on which the records will be fetched</param>
		/// <returns>Datatable which contains all the InspectionQueries on a particular InspectionId</returns>

		public DataTable GetInspectionQueriesByInspectionId(Guid InspectionId)
		{
			return IgrssAdapters.InspQueries.GetInspectionQueriesById(InspectionId);

		}


		/// <summary>
		/// This Function gets all the Get Yearly Inspection Details Row
		/// </summary>
		/// <returns>A new Inspection Yearly ScheduleDetails Row </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public static InspectionYearlyScheduleDetailsRow GetYearlyInspectionDetailsRow()
		{
			return new InspectionYearlyScheduleDetailsTable().NewInspectionYearlyScheduleDetailRow();
		}

		/// <summary>
		/// This function Add a new record to InspectionDetails table 
		/// </summary>
		/// <param name="Parameter">formviewparameter conatining all the fields of InspectionDetails.aspx page</param>
		/// <param name="ScheduleDetails">Datatable containg all the Details  one-Many relationship </param>
		/// <returns>true , indicating a record is inserted successfully</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddNewYearlyInspection(FormViewParameter Parameter, DataTable ScheduleDetails, DataTable SelectedOffices)
		{
			IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleRow row = (IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid ScheduleId = Guid.NewGuid();

            IgrssAdapters.InspYearlyShedule.AddYearlyInspectionSchedule(ScheduleId, row.OfficerId, Guid.Empty, row.Year, row.Remarks, curUser, DateTime.Now);
            foreach (DataRow ScheduleDetail in ScheduleDetails.Rows)
            {
                IgrssAdapters.InspYearlyScheduleDetail.AddYearlyInspectionScheduleDetails((Guid)ScheduleDetail["DetailScheduleId"], ScheduleId, (decimal)ScheduleDetail["Month"], (string)ScheduleDetail["Remarks"], curUser, DateTime.Now);
            }
            foreach (DataRow SelectedOffice in SelectedOffices.Rows)
            {
                IgrssAdapters.InspYearlyScheduleMonthwise.AddYearlyScheduleMonthwise((Guid)SelectedOffice["MonthlyScheduleId"], (Guid)SelectedOffice["DetailScheduleId"], (Guid)SelectedOffice["InspectingOfficeId"]);
            }
            return true;
		}

		
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateYearlyInspection(FormViewParameter Parameter, DataTable ScheduleDetails, DataTable SelectedOffices,Guid ScheduleId)
		{
			IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleRow row = (IGRSS.DataAccessLayer.Inspection.InspectionYearlySheduleRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;

            IgrssAdapters.InspYearlyScheduleDetail.DeleteYearlyInspectionDetailsById(ScheduleId);

            IgrssAdapters.InspYearlyShedule.UpdateYearlyInspectionSchedules(ScheduleId, row.OfficerId, Guid.Empty, row.Year, row.Remarks, curUser, DateTime.Now);
            foreach (DataRow ScheduleDetail in ScheduleDetails.Rows)
            {
                IgrssAdapters.InspYearlyScheduleDetail.AddYearlyInspectionScheduleDetails((Guid)ScheduleDetail["DetailScheduleId"], ScheduleId, (decimal)ScheduleDetail["Month"], (string)ScheduleDetail["Remarks"], curUser, DateTime.Now);
            }
            foreach (DataRow SelectedOffice in SelectedOffices.Rows)
            {
                IgrssAdapters.InspYearlyScheduleMonthwise.AddYearlyScheduleMonthwise((Guid)SelectedOffice["MonthlyScheduleId"], (Guid)SelectedOffice["DetailScheduleId"], (Guid)SelectedOffice["InspectingOfficeId"]);
            }
            return true;
		}


		//********************************************Codes for the Masters********************
		
		//***************************Inspection CheckList Master*******************************
		/// <summary>
		/// This function Gets all the records fromj the table InspectionCheckListMaster
		/// </summary>
		/// <returns>Datatable containg all the records from the table InspectionCheckListMaster</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InspectionCheckListMasterTable GetAllInspectionCheckListMaster()
		{
			return IgrssAdapters.InspChecklistMaster.GetAllInspectionCheckListMaster();

		}
        
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionCheckListMasterTable GetAllInspectionCheckListMasterByCheckListId(Guid CheckListId)
        {
            return IgrssAdapters.InspChecklistMaster.GetInspectionCheckListMasterByCheckListId(CheckListId);
        }
		/// <summary>
		/// This function gets a new row for the table InspectionCheckListMaster
		/// </summary>
		/// <returns>A new row i.e,InspectionCheckListMasterRow</returns>
		
		public static InspectionCheckListMasterRow GetInspectionCheckListMasterRow()
		{
			return new InspectionCheckListMasterTable().NewInspectionCheckListMasterRow();
		}
		/// <summary>
		/// This function adds a AddInspectionCheckList 
		/// </summary>
		/// <param name="InspectionId"></param>
		/// <param name="InspectionCheckListId"></param>
		/// <param name="Checked"></param>
		/// <param name="Remarks"></param>
		/// <param name="CreatedBy"></param>
		/// <param name="CreatedAt"></param>
		/// <returns>true , indicating a record is inserted</returns>

		public bool AddInspectionCheckList(Guid InspectionId,Guid InspectionCheckListId,bool Checked,string Remarks,string CreatedBy, DateTime CreatedAt)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			InspectionId = Guid.NewGuid();
			InspectionCheckListId = Guid.NewGuid();
			IgrssAdapters.InspChecklist.AddInspectionCheckList(InspectionId, InspectionCheckListId, Checked, Remarks, curUser, DateTime.Now);

			return true;
		}
		/// <summary>
		/// This function add a  new records to InspectionCheckListMaster
		/// </summary>
		/// <param name="Parameter">FormviewParameter all the parameters present in the InspectionCheckListMaster.aspx page</param>
		/// <returns>true , a record is inserted</returns>
		
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspectionCheckListMaster(FormViewParameter Parameter)
		{
			IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterRow row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid CheckListId = Guid.NewGuid();

			IgrssAdapters.InspChecklistMaster.AddNewInspectionCheckListMaster(CheckListId, row.InspectionTypeId,row.Description,row.IsActive,curUser,DateTime.Now);
			return true;

		}
        
        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateInspectionCheckListMaster(FormViewParameter Parameter, Guid CheckListId, Guid InspectionTypeId)
        {
            IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterRow row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionCheckListMasterRow)Parameter.Values;
            string curUser = Thread.CurrentPrincipal.Identity.Name;
           

            IgrssAdapters.InspChecklistMaster.UpdateInspectionCheckListMaster(CheckListId, row.InspectionTypeId, row.Description,curUser, DateTime.Now);
            return true;

        }
       
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteInspectionCheckListMaster(Guid CheckListId,Guid InspectionTypeId)
        {
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                IgrssAdapters.InspChecklistMaster.DeleteInspectionCheckListMaster(curUser, DateTime.Now, CheckListId, InspectionTypeId);
                return true;

        }

		//************************Inspection Type Master********************************

		/// <summary>
		/// This function gets all the type of Inspections from InspectionTypeMaster
		/// </summary>
		/// <returns>datatable containig all the records from InspectionTypeMaster</returns>
		
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InspectionTypeMasterTable GetAllInspectionTypeMaster()
		{
			return IgrssAdapters.InspTypeMaster.GetAllInspectionTypeMaster();
			
		}
		/// <summary>
		/// This function gets a new row for InspectionTypeMaster
		/// </summary>
		/// <returns>A new row named i.e,InspectionTypeMasterRow in the InspectionTypeMaster table</returns>
		public static InspectionTypeMasterRow GetInspectionTypeMasterRow()
		{
			return new InspectionTypeMasterTable().NewInspectionTypeMasterRow();
		}
		
        /// <summary>
		/// This function inserts a new record to the InspectionTypeMaster
		/// </summary>
		/// <param name="Parameter">formview parameter which contains all the fields in InspectionTypeMaster.aspx page</param>
		/// <returns>true , indicating a record is inserted</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionTypeMasterTable GetInspectionTypeMasterByInspectionTypeId(Guid InspectionTypeId)
		{
			return IgrssAdapters.InspTypeMaster.GetInspectionTypeMasterByInspectionTypeId(InspectionTypeId);
			
		}

      
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspectionTypeMaster(FormViewParameter Parameter)
		{
			IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterRow row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid InspectionTypeId = Guid.NewGuid();

			IgrssAdapters.InspTypeMaster.AddNewInspectionTypeMaster(InspectionTypeId,row.Name,row.Description,curUser, DateTime.Now);

			return true;

		}
        
        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateInspectionTypeMaster(FormViewParameter Parameter, Guid InspectionTypeId)
        {
            IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterRow row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionTypeMasterRow)Parameter.Values;
            string curUser = Thread.CurrentPrincipal.Identity.Name;
           
            IgrssAdapters.InspTypeMaster.UpdateInspectionTypeMaster(InspectionTypeId, row.Name, row.Description, curUser, DateTime.Now);

            return true;

        }
        
        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool DeleteInspectionTypeMaster(Guid InspectionTypeId)
		
		{
			  string curUser = Thread.CurrentPrincipal.Identity.Name;
              IgrssAdapters.InspTypeMaster.DeleteInspectionTypeMaster(curUser, DateTime.Now, InspectionTypeId);
			   return true;
          
		}

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionDetailsTable GetAllInspectionDetails()
        {
            return IgrssAdapters.InspDetails.GetAllInspectionDetails();
        }

		/// <summary>
		/// This function gets  a new row in CheckListInspection table
		/// </summary>
		/// <returns> true ,indicating that a  new record is inserted</returns>

		public static CheckListInspectionRow GetCheckListRow()
		{
			return new CheckListInspectionTable().NewCheckListInspectionRow();
		}
		
        /// <summary>
		/// This function gets a new row in InspectionDetails table 
		/// </summary>
		/// <returns>a new row  i.e,InspectionDetailsRow in the InspectionDetails table</returns>
		public static InspectionDetailsRow GetInspectionDetailsRow()
		{
			return new InspectionDetailsTable().NewInspectionDetailsRow();
		}
		
        /// <summary>
		/// This function gets all the records in InspectionDetails table
		/// </summary>
		/// <returns>Datatable containing all the records  from  InspectionDetails table</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable InspectionDetails()
		{
			return IgrssAdapters.InspDetails.GetAllInspectionDetails();
		}
		
        /// <summary>
		/// This function filters all the records from InspectionDetails table on Inspection Id
		/// </summary>
		/// <param name="InspectionId">Parameter based upon which the records will be fetched</param>
		/// <returns>Datatable containing all the records</returns>
		public DataTable GetAllInspectionDetailsById(Guid InspectionId)
		{
			return IgrssAdapters.InspDetails.GetAllInspectionDetailsById(InspectionId);
		}
		
        /// <summary>
		/// 
		/// </summary>
		/// <param name="InspectionId"></param>
		/// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionDetailsTable GetInspectionDetailsById(Guid InspectionId)
        {
            return IgrssAdapters.InspDetails.GetInspectionDetailsById(InspectionId);
        }
		
        /// <summary>
		/// This function deletes a record from InspectionCheckList table
		/// </summary>
		/// <param name="InspectionId">parameter based on which , the record will be deleted</param>
		/// <returns>true, i.e, the record is deleted</returns>
		public bool DeleteInspectionCheckListById(Guid InspectionId)
		
		{
			IgrssAdapters.InspChecklist.DeleteInspectionCheckListById(InspectionId);
			return true;
            
		}
		
        /// <summary>
		/// This function updates the records in InspectionCheckList table
		/// </summary>
		/// <param name="InspectionId">parameters based on which the updation will be done</param>
		/// <param name="InspectionCheckListId"></param>
		/// <param name="Checked"></param>
		/// <param name="Remarks"></param>
		/// <param name="ModifiedBy"></param>
		/// <param name="ModifiedAt"></param>
		/// <returns>true, records is updated</returns>
		public bool UpdateInspectionCheckList(Guid InspectionId, Guid InspectionCheckListId,bool Checked, string Remarks, string ModifiedBy, DateTime ModifiedAt)
		{

			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.InspChecklist.UpdateInspectionCheckList(InspectionId, InspectionCheckListId, Checked, Remarks,curUser, DateTime.Now);
			return true;
		}
		
        /// <summary>
		/// This function adds a new Inspection record to InspectionDetails table
		/// </summary>
		/// <param name="InspectionDetails">A instance  of InspectionDetailsRow </param>
		/// <param name="InspectionCheckListDetails"> A list onject of InspectionCheckListDetails  which will be passedc from presenetation layer
		/// how many checklists are selected for a particular Inspection Record</param>
		/// <param name="QueryList">The datattable object , which is added in one-many relationship </param>
		/// <returns>true i.e, a new record is inserted</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspection(InspectionDetailsRow InspectionDetails, List<CheckListInspectionRow> InspectionCheckListDetails, DataTable QueryList,DataTable InspectingOfficer)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
            Guid InspectionId = FileManager.OpenNewFile(InspectionDetails.InspectedOfficeId,"INS");

			IgrssAdapters.InspDetails.AddNewInspectionDetails(InspectionId, InspectionDetails.InspectionTypeId,InspectionDetails.InspectedOfficeId,InspectionDetails.LicenseId, InspectionDetails.InspectorOfficeName,InspectionDetails.IsDiscrepancyFound, InspectionDetails.Remarks, null, null,null,  curUser, DateTime.Now);
			foreach (CheckListInspectionRow row in InspectionCheckListDetails)
			{
				IgrssAdapters.InspChecklist.AddInspectionCheckList(InspectionId, row.InspectionCheckListId,row.Checked, row.Remarks, curUser, DateTime.Now);
			}
            foreach (DataRow dr in InspectingOfficer.Rows)
            {
              //  IgrssAdapters.InsPectingOfficeAdapter.AddInspectingOffice(InspectionId,(Guid)dr["InspectingOfficerId"]);

            }

			foreach (DataRow Query in QueryList.Rows)
			{
				IgrssAdapters.InspQueries.AddNewInspectionQueries(Guid.NewGuid(), InspectionId, (Guid) Query["CheckListId"], (string) Query["Query"],null,(string) Query["Remarks"], curUser, DateTime.Now);

			}
			return true;

		}

		/// <summary>
		/// This function updates a  Inspection record to InspectionDetails table
		/// </summary>
		/// <param name="InspectionDetails">A instance  of InspectionDetailsRow</param>
		/// <param name="InspectionCheckListDetails">A list onject of InspectionCheckListDetails  which will be passedc from presenetation layer
		/// how many checklists are selected for a particular Inspection Record</param>
		/// <param name="QueryList">The datattable object , which is added in one-many relationship </param>
		/// <param name="InspectionId">the key on which the particular record will be identified , The records which needs updation</param>
		/// <returns></returns>
		public bool UpdateInspection(InspectionDetailsRow InspectionDetails, List<CheckListInspectionRow> InspectionCheckListDetails, DataTable QueryList, Guid InspectionId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.InspDetails.UpdateInspectionDetails(InspectionId, InspectionDetails.InspectionTypeId, InspectionDetails.InspectingOfficerId, InspectionDetails.InspectedOfficeId, InspectionDetails.LicenseId, InspectionDetails.InspectorOfficeName, InspectionDetails.IsDiscrepancyFound, InspectionDetails.Remarks, null, null, null, curUser, DateTime.Now);

			foreach (CheckListInspectionRow row in InspectionCheckListDetails)
			{
				//IgrssAdapters.InspChecklist.DeleteInspectionCheckListById(InspectionId);
				IgrssAdapters.InspChecklist.UpdateInspectionCheckList(InspectionId, row.InspectionCheckListId, row.Checked, row.Remarks, curUser, DateTime.Now);
			}

			foreach (DataRow Query in QueryList.Rows)
			{

				IgrssAdapters.InspQueries.DeleteInspectionQueriesById(InspectionId);
				IgrssAdapters.InspQueries.AddNewInspectionQueries(Guid.NewGuid(), InspectionId, (Guid) Query["CheckListId"], (string) Query["Query"], null, (string) Query["Remarks"], curUser, DateTime.Now);

			}
			return true;

		}

		//Iternay Details Insert  & Update 
		/// <summary>
		/// This function gets all the records present in InspectionItenary table
		/// </summary>
		/// <returns>Datatable object conatining all the records present in  InspectionItenary table </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetAllInspectionIternary()
		{
			return IgrssAdapters.InspItenary.GetInspectionItenary();
		}
		
        /// <summary>
		/// This function gets a new row in InspectionItenary table
		/// </summary>
		/// <returns>Gets a new row , i.e,NewInspectionItenaryRow in InspectionItenary table </returns>
		public static InspectionItenaryRow GetInspectionItenaryRow()
		{
			return new InspectionItenaryTable().NewInspectionItenaryRow();
		}
		
        /// <summary>
		/// This function Gets a particular record in InspectionItenary table on ItenaryId
		/// </summary>
		/// <param name="IternaryId">The parameter on which the selection of the records will be done on 
		/// InspectionItenary table</param>
		/// <returns>a datatable object containinfg all the records </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionIternaryById(Guid IternaryId)
		{
			return IgrssAdapters.InspItenary.GetInspectionIternaryById(IternaryId);

		}

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetInspectionIternaryByScheduleId(Guid ScheduleId)
        {
            return IgrssAdapters.InspItenary.GetItenaryByScheduleID(ScheduleId);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetInspectionIternaryByScheduleItenId(Guid ScheduleId, Guid IternaryId)
        {
            return IgrssAdapters.InspItenary.GetItenarybyScheduleItenId(ScheduleId, IternaryId);
        }

		/// <summary>
		/// This function gets all the records from InspectionYearlySchedule table based on ScheduleId
		/// </summary>
		/// <param name="ScheduleId">The parameter on which the selection of records will be done</param>
		/// <returns>Datatable containg all the selected records fromInspYearlyScheduleDetail table </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionYearlyScheduleById(Guid ScheduleId)
		{
			return IgrssAdapters.InspYearlyScheduleDetail.GetYearlyInspectionDetailsById(ScheduleId);

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InspectionYearlyScheduleTable GetInspectionYearlySchedule(Guid ScheduleId)
		{
            // Calls the SP "GetInspectionYearlyScheduleById"
            return IgrssAdapters.InspYearlyShedule.GetInspectionYearlyScheduleById(ScheduleId);

		}

		/// <summary>
		/// This function adds a new record in InspectionItenary table
		/// </summary>
		/// <param name="Parameter">Formview parameter, all the fields present in the InspectionItenary.aspx page</param>
		/// <param name="ScheduleId">the foreign key on IspectionDetails and InspectionItenary table </param>
		/// <returns>true, indicating a record is inserted</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspectionIternary(FormViewParameter Parameter, Guid ScheduleId)
		{
			IGRSS.DataAccessLayer.Inspection.InspectionItenaryRow row= (IGRSS.DataAccessLayer.Inspection.InspectionItenaryRow)Parameter.Values;

			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid ItenaryId = Guid.NewGuid();
			
			IgrssAdapters.InspItenary.AddInspectionItenary(ItenaryId, ScheduleId ,row.Month, row.InspectingDate, row.InspectingOfficeId, row.EndDate, row.ItenaryDetails, curUser, DateTime.Now);
			return true;

		}

		/// <summary>
		/// This function updates the InspectionItenary table 
		/// </summary>
		/// <param name="Parameter">formview parameter , containing  all the fields  </param>
		/// <param name="ItenaryId">The primary key on which the updated record can be found</param>
		/// <param name="ScheduleId">he primary key on which the updated record can be found</param>
		/// <returns>true, i.e, the record is updated </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateInspectionItenary(FormViewParameter Parameter,Guid ItenaryId, Guid ScheduleId)
		{
			IGRSS.DataAccessLayer.Inspection.InspectionItenaryRow row = (IGRSS.DataAccessLayer.Inspection.InspectionItenaryRow) Parameter.Values;

			string curUser = Thread.CurrentPrincipal.Identity.Name;

            IgrssAdapters.InspItenary.RemoveItenary(ItenaryId);
			IgrssAdapters.InspItenary.AddInspectionItenary(ItenaryId, ScheduleId, row.Month, row.InspectingDate, row.InspectingOfficeId, row.EndDate, row.ItenaryDetails, curUser, DateTime.Now);
			return true;


		}

		/// <summary>
		/// This function seraches a the records from the  InspectionYearlyDetails table by passing the year 
		/// </summary>
		/// <param name="Year">year i.e, the parameter to search </param>
		/// <returns>Datatable containg all the records, the result of search </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionYearlyDetails(DateTime Year)
		{
			return IgrssAdapters.InspYearlyShedule.GetInspectionByDate(Year);
		}

		/// <summary>
		/// This function for finding  the records from InspectionYearlyShedule table on officeName
		/// </summary>
		/// <param name="OfficeName">Search condition , i.e , which officeName</param>
		/// <returns>Datatble containg all the records from the search condition </returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionYearlyDetailsByOfficeName(Guid OfficerId)
		{
            return IgrssAdapters.InspYearlyShedule.GetYearlyInspectionDetailsByOfficeName(OfficerId);
		}

		/// <summary>
		/// This Functionality for Getting Inspection Memo Details
		/// </summary>
		/// <returns>Data Table of Inspection demo</returns>
		/// 
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionMemo()
		{
			return IgrssAdapters.InspectionMemo.GetInspectionMemoDetails();
		}

		/// <summary>
		/// This function adds a new record to InspectionMemo table 
		/// </summary>
		/// <param name="Parameter">Formviewparameter , all the fields presnt in the formview , i.e, the .aspx page in presentation Layer</param>
		/// <param name="InspectionId">The field on which Inspection Memo is created</param>
		/// <returns>true, indicating a memo is created successfully</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspectionMemo(FormViewParameter Parameter, Guid InspectionId)
		{

			Guid InspectionMemoId=Guid.NewGuid();
			IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoRow row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoRow) Parameter.Values;
			InspectionId = row.InspectionId;
			
			IgrssAdapters.InspectionMemo.AddNewInspectionMemo(InspectionMemoId,InspectionId, row.Subject, row.MemoBody, row.MemoDate);
 

			return true;
	
		}


		/// <summary>
		/// This function gets  the record from InspectionMemo table on a particular InspectionId
		/// </summary>
		/// <param name="InspectionId">The primary key of InspectionDetails , based on which the records can be found</param>
		/// <returns>Datatble containg all the fields of the  record found from search condition</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionMemoById(Guid InspectionId)
		{
			return IgrssAdapters.InspectionMemo.GetInspectionMemoDetailsById(InspectionId);
		}


		/// <summary>
		/// This function gets all the records from the InspectionMemoaction table
		/// </summary>
		/// <returns>Datatable object , containg all the records from the InspectionMemoAction table</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetMemoAction()
		{
			return IgrssAdapters.InspectionMemoAction.GetMemoActionTaken();
		}

		/// <summary>
		/// This function gets all the records from InspectionMemoAction table 
		/// </summary>
		/// <param name="InspectionMemoId">The primary key based on which the selection will be done</param>
		/// <returns>A Datatable object ,containg all the records from search criteria</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetInspectionMemoActionByMemoId(Guid InspectionMemoId)
		{
			return IgrssAdapters.InspectionMemoAction.GetInspectionMemoActionByMemoId(InspectionMemoId);
		}

		/// <summary>
		/// This function creates a new  row in InspectionMemo table 
		/// </summary>
		/// <returns> a new row ,i.e,NewInspectionMemoRow</returns>
		public static IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoRow GetInspectionMemoRow()
		{


			return new InspectionMemoTable().NewInspectionMemoRow();
			
		}
		
        /// <summary>
		/// This function creates a new row in InspectionMemoAction table
		/// </summary>
		/// <returns>a new row, i.e,NewInspectionMemoActionRow</returns>
		public static IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoActionRow GetInspectionActionRow()
		{
			

			return new InspectionActionTable().NewInspectionMemoActionRow();
		}
		
        /// <summary>
		/// This function adds a new action to a particular Inspection
		/// </summary>
		/// <param name="Parameter">formviewparameter , from which all the value will be passed , i.e .aspx page from the presntation layer</param>
		/// <param name="InspectionMemoId">the key on which the particular memo is created , one inspection -->one or many  memo</param>
		/// <returns>true, a new action is inserted</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewInspectionAction(FormViewParameter Parameter, Guid InspectionMemoId)

		{
			
			IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoActionRow  row = (IGRSS.DataAccessLayer.InspectionDetails.InspectionMemoActionRow) Parameter.Values;

			InspectionMemoId = row.InspectionMemoId;

			IgrssAdapters.InspectionMemoAction.AddInspectionMemoAction(InspectionMemoId, row.ActionTaken, row.ActionTakenDate);
			return true;
	

		}

		/// <summary>
		/// This function gets  the record present in InspectionMemo table on the Particular InspectionMemoId
		/// </summary>
		/// <param name="InspectionMemoId">The parameter on which the selection will be done</param>
		/// <returns>Datatable object containg all the field </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetMemoActionByMemoId(Guid InspectionMemoId)
		{
			return IgrssAdapters.InspectionMemoAction.GetMemoActionbymemoId(InspectionMemoId);
		}

		/// <summary>
		/// This function search the  InspectionDetails records from the InspectionTable
		/// </summary>
		/// <param name="InspectorOfficeName">The parameter on which the search condition will be done</param>
		/// <returns>Datatable , containg the all the records which search condition</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public InspectionDetailsTable SearchInspectionDetails(string InspectorOfficeName)
		{
			return IgrssAdapters.InspDetails.SearchInspectionDetailsByName(InspectorOfficeName);

		}

        /// <summary>
        /// This Function Will Return the Replies for the qureies of inspection.
        /// </summary>
        /// <param name="QueryId"></param>
        /// <returns></returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
        public QueryTable GetQueriesByInspectionId(Guid InspectionId)
        {
            return IgrssAdapters.QueryReply.GetInspectionQueriesById(InspectionId);
        }
	
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InspectionYearlyScheduleMonthwiseTable GetInspectingOfficesByDetailScheduleId(Guid DetailScheduleId)
		{
            return IgrssAdapters.InspYearlyScheduleMonthwise.GetInspectingOfficesByDetailScheduleId(DetailScheduleId);
		}
    
    }


}
