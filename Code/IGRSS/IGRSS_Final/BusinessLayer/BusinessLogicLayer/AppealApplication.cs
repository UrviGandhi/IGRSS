#region Class Summary
//Appeal
//ClassName     - Appeal Application
//Purpose       - This business class contains a business logic for Saving application,Updating appeal application and Approval and Rejection.
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
                                                  
#endregion
using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using IGRSS.DataAccessLayer;
using System.Data;
using IGRSS.DataAccessLayer.AppealTableAdapters;
using AppealTable = IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable;
using HearingTable =IGRSS.DataAccessLayer.Appeal.AppealHearingDataTable;
using ActTable= IGRSS.DataAccessLayer.Appeal.AppealActsApplicableDataTable;
using System.ComponentModel;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using IGRSS.BusinessObjects.WorkflowServices;
using IGRSS.Workflows.Appeal;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Appeal.EventArgs;
using AppealApplicationRow = IGRSS.DataAccessLayer.Appeal.AppealApplicationRow;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class AppealApplication
	{

		/// <summary>
		/// This function will get the Row of the Appeal Application Table.Row will contain all the Fields of the table. 
		/// </summary>
		/// <returns>Columns of the Appeal Application Table</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public static DataRow GetRow()
		{
			return new IGRSS.DataAccessLayer.Appeal.AppealApplicationDataTable().NewAppealApplicationRow();
		}
		
		/// <summary>
		/// This function is used to save the new appeal application. 
		/// </summary>
		/// <param name="parameter">Contains all the field value of formview.
		/// <param name="dtAct">Contains the Act applicable for Appeal.
		/// <returns>Boolean Value</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddAppealAplication(FormViewParameter parameter, DataTable dtAct,Remarks rem)
		{
			//Initiate some of the fields required for the process
            AppealApplicationRow rowApl = (AppealApplicationRow)parameter.Values;
            Guid AppealId = FileManager.OpenNewFile(rowApl.OfficeId, "APL");
            FileManager.AddRemarkToFile(AppealId, rem.Subject, rem.Body);
			string curUser = Thread.CurrentPrincipal.Identity.Name;
            int i = 0;
			try
			{
               
				IGRSS.DataAccessLayer.Appeal.AppealApplicationRow row = (AppealApplicationRow) parameter.Values;
                i=IgrssAdapters.AppealAdapter.AddAppealApplication(AppealId, row.OfficeId, row.RegistrationNo, row.ApplicantName, row.Address, row.TypeOfAppeal, row.CalculatedAmount, row.DepositAmount, row.FeeReceiptNo, row.Amount, row.InwardDate, row.IsPaidAppealFee, row.AppealInTime, row.PaperFromTo, row.CourtFeeTicket, curUser, DateTime.Now, row.DocumentNo, row.OriginalSRO, row.DocumentDate, row.DaTeOffOrderFromCollector, row.DficitAmount,row.ReceiptNo,row.ReceiptDate);
                if (i > 0)
                {
                    foreach (DataRow dr in dtAct.Rows)
                    {
                        IgrssAdapters.AppealActAdapter.AddAppealAct(AppealId, (Guid)dr["ActId"], (bool)dr["Checked"]);
                    }

                    // All database Inserts have been completed sucessfully initiate the Workflow
                    // Create a Dioctionary to store Workflow Paramaters for Appeal
                    Dictionary<string, object> WfParams = new Dictionary<string, object>();
                    // Add Refund Application  Id into the Workflow Parameter
                    WfParams.Add("AppealId", AppealId);
                    // Add Office Id in to Workflow Parameter 
                    // (to identify the process flow for the Office)
                    WfParams.Add("InitiatingOffice", row.OfficeId);

                    // Initiate the Refund Workflow by passing the Wf Parameters Dictionary
                    WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(AppealProcess), WfParams);
                    return true;
                }
                else
                {
                    return false;
                }
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;
			}
            
           
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public void AddAppealIntoHighCourt(FormViewParameter parameter, Guid AppealApplicationId)
        {
                IGRSS.DataAccessLayer.Appeal.AppealApplicationRow row = (AppealApplicationRow)parameter.Values;
                IgrssAdapters.AppealAdapter.AddApealIntoHighCourt(row.CaseNo, row.AffidavitDate, AppealApplicationId);
        }

		/// <summary>
		/// This function is used to Edit the appeal application. 
		/// </summary>
		/// <param name="parameter">Contains all the field value of formview,Which can be edit.
		/// <param name="dtAct">Contains the Updated Act applicable for Appeal.
		/// <returns>Boolean Value</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateAppealAplication(FormViewParameter parameter, DataTable dtAct, Guid AppealApplicationId, Guid AlertId, bool Verified)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
                IGRSS.DataAccessLayer.Appeal.AppealApplicationRow row = (IGRSS.DataAccessLayer.Appeal.AppealApplicationRow)parameter.Values;
                IgrssAdapters.AppealAdapter.UpdateAppealApplication(AppealApplicationId, row.RegistrationNo, row.ApplicantName, row.Address, row.CalculatedAmount, row.DepositAmount, row.FeeReceiptNo, row.Amount, row.InwardDate, row.IsPaidAppealFee, row.AppealInTime, row.PaperFromTo, row.OfficeId, row.CourtFeeTicket, row.TypeOfAppeal, curUser, DateTime.Now, row.DocumentNo, row.OriginalSRO, row.DocumentDate, row.DaTeOffOrderFromCollector, row.DficitAmount, row.ReceiptNo, row.ReceiptDate);
                IgrssAdapters.AppealActAdapter.DeleteAppealActsByAppealApplicationId(AppealApplicationId);
                foreach (DataRow dr in dtAct.Rows)
                {
                    IgrssAdapters.AppealActAdapter.AddAppealAct(AppealApplicationId, (Guid)dr["ActId"], (bool)dr["Checked"]);
                }

				// Get the Workflow Instance Id from table
				Guid WfInstanceId = (Guid)IgrssAdapters.AppealAdapter.GetWorkflowInstanceById(AppealApplicationId);


				// Check if the user has verified the application or just updated
				if (Verified)
				{
					// Create the FeedbackEventArgs object
					FeedbackEventArgs args = new FeedbackEventArgs(WfInstanceId, AlertId, curUser);
					WorkflowMediator.AppealServices.ValidateAppealApplication(WfInstanceId, args);
				}
				else
				{
					// The record has not been verified just updated
					AppealApplicationUpdatedEventArgs args = new AppealApplicationUpdatedEventArgs(WfInstanceId, (AppealApplicationRow) parameter.Values, dtAct);
					WorkflowMediator.AppealServices.UpdateAppealApplication(WfInstanceId, args);
				}
                return true;

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;

			}
		}

		/// <summary>
		/// This function will get the appeal details. 
		/// <param name="AppealSlNo">
		/// <returns>AppealTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AppealTable GetAppealApplicationByAppealNo(string ApplicantName, string FileNo)
		{
			AppealTable dt = new AppealTable();
			try
			{

                dt = IgrssAdapters.AppealAdapter.GetAppealApplicationByAppealNo(ApplicantName, FileNo);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return dt;
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AppealTable GetAppealApplicationForHighCourt(string ApplicantName, string FileNo)
        {
            AppealTable dt = new AppealTable();
            try
            {

                dt = IgrssAdapters.AppealAdapter.GetAppealApplicationForHighCourt(ApplicantName, FileNo);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return dt;
        }

		/// <summary>
		/// This function will get the appeal details. 
		/// <param name="AppealSlNo">
		/// <returns>AppealTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AppealTable GetAppealStatusByAppealNo(decimal AppealSlNo)
		{
			AppealTable Dt = new AppealTable();
			try
			{
				Dt = IgrssAdapters.AppealAdapter.GetAppealStatusByAppealNo(AppealSlNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		/// <summary>
		/// This function will get the appeal details. 
		/// <param name="AppealApplicationId">
		/// <returns>AppealTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AppealTable GetAppealApplicationByAppealID(Guid AppealApplicationId)
		{
			AppealTable Dt = new AppealTable();
			try
			{
				Dt = IgrssAdapters.AppealAdapter.GetAppealApplicationByAppealApplicationID(AppealApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		/// <summary>
		/// This function will get all the appeal recods. 
		/// <returns>AppealTable</returns>
		public AppealTable GetAllAppealApplication()
		{
			AppealTable Dt = new AppealTable();
			try
			{
				Dt = IgrssAdapters.AppealAdapter.GetData();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		/// <summary>
		/// This function will get the appeal details. 
		/// <param name="ApplicantName">
		/// <returns>AppealTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AppealTable GetAppealApplicationByApplicantName(string ApplicantName)
		{
			AppealTable Dt = new AppealTable();
			try
			{
				Dt = IgrssAdapters.AppealAdapter.GetAppealApplicationByApplicantName(ApplicantName);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		/// <summary>
		/// This function will Approve the appeal application. 
		/// <param name="AppealApplicationId">
		/// <returns>Void</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool ApproveAppealApplication(Guid AppealApplicationId,Guid AlertId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				// Get the Workflow Instance Id for the Appeal Application
				Guid WfInstanceId = (Guid)IgrssAdapters.AppealAdapter.GetWorkflowInstanceById(AppealApplicationId);
				// Create Feedback Event Args object for the current feedback
				FeedbackEventArgs args = new FeedbackEventArgs(WfInstanceId, AlertId, curUser);
				// Fire the Application Approved event
				WorkflowMediator.AppealServices.ApproveAppealApplication(WfInstanceId, args);
                return true;

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;
			}
		}

		/// <summary>
		/// This function will Reject the appeal application. 
		/// <param name="AppealApplicationId">
		/// <returns>Void</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool RejectAppealApplication(Guid AppealApplicationId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.AppealAdapter.RejectAppealApplication(AppealApplicationId, curUser, DateTime.Now);
                return true;
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;
			}
		}

		/// <summary>
		/// This function will return the appeal act applied for appeal. 
		/// <param name="AppealApplicationId">
		/// <returns>DataTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetActDetailByApppealId(Guid AppealApplicationId)
		{
			DataTable Dt = new DataTable();
			try
			{
				Dt = IgrssAdapters.AppealActAdapter.GetAppealActsByAppealApplicationId(AppealApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddAppealHearing(Guid AppealApplicationId, DateTime HearingDate, string Remarks, Boolean IsJudgement, Guid AppealDecisionType)
		{
            try
            {
                 Guid id = Guid.NewGuid();
                 DataTable Dt = new DataTable();
                bool i=true ;
                 Dt = IgrssAdapters.AppealHearingAdapter.GetHearingDetailsByAppealApplicationId(AppealApplicationId);
                 foreach (DataRow dr in Dt.Rows)
                 {
                    if ((bool)dr["IsJudgement"] == true)
                    
                        i = false;
                  }
                    if(i==true)
                  {
                   
                        string curUser = Thread.CurrentPrincipal.Identity.Name;
                        IgrssAdapters.AppealHearingAdapter.AddAppealHearing(id, AppealApplicationId, HearingDate, Remarks, IsJudgement, curUser, DateTime.Now, AppealDecisionType);
                        i = true;
                   }
                   return i;
                  }
                catch (Exception ex)
			    {
				 if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                 return false;
			    }
            
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public HearingTable GetHearingDetailsByAppealID(Guid AppealApplicationId)
		{
            HearingTable Dt = new HearingTable();
			try
			{

                Dt = IgrssAdapters.AppealHearingAdapter.GetHearingDetailsByAppealApplicationId(AppealApplicationId);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public HearingTable GetInterHearingDetails(Guid AppealApplicationId)
        {
            HearingTable Dt = new HearingTable();
            try
            {

                Dt = IgrssAdapters.AppealHearingAdapter.GetInternalHearing(AppealApplicationId);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public HearingTable GetHighCourtHearingDetails(Guid AppealApplicationId)
        {
            HearingTable Dt = new HearingTable();
            try
            {

                Dt = IgrssAdapters.AppealHearingAdapter.GetHighCourtHearing(AppealApplicationId);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetAllHearingDetails()
		{
			DataTable Dt = new DataTable();
			try
			{

				Dt = IgrssAdapters.AppealHearingAdapter.GetData();

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AppealTable GetHighCourtDetails(string FileNo, string CaseNo, string ApplicantName)
        {
            AppealTable Dt = new AppealTable();
            try
            {

                Dt = IgrssAdapters.AppealAdapter.GetHighCourtDetails(FileNo, CaseNo, ApplicantName);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetHighCourtJudgeMentDetails(Guid AppealApplicationId)
        {
            DataTable Dt = new DataTable();
            try
            {

                Dt = IgrssAdapters.AppealHearingAdapter.GetHighCourtJudgementDetails(AppealApplicationId);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetHighCourtDetailsByAppealApplicationId(Guid AppealApplicationId)
        {
            DataTable Dt = new DataTable();
            try
            {

                Dt = IgrssAdapters.AppealAdapter.GetHighCourtDetailsByAppealApplicationId(AppealApplicationId);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddHighCourtJudgementDetails(Guid AppealApplicationId, DateTime HearingDate, string Remarks, Boolean IsJudgement)
        {
             try
            { 
              Guid id = Guid.NewGuid();
              DataTable Dt=new DataTable();
              bool i=true ;
              Dt = IgrssAdapters.AppealHearingAdapter.GetHighCourtJudgementDetails(AppealApplicationId);
              foreach (DataRow dr in Dt.Rows)
                 {
                    if ((bool)dr["IsJudgement"] == true)
                    
                        i = false;
                  }
                    if(i==true)
                  {
                   
                        string curUser = Thread.CurrentPrincipal.Identity.Name;
                        IgrssAdapters.AppealHearingAdapter.AddHighCourtJudgementDetails(id, AppealApplicationId, HearingDate, Remarks, IsJudgement);
                        i = true;
                   }
                   return i;
              }
                catch (Exception ex)
                {
                        if (ExceptionPolicy.HandleException(ex, "DAL"))
                        throw;
                    return false;
                 }
        }
	}

}
