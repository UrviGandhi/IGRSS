//Citizen
//ClassName     - Complain
//Purpose       - This business class contains a business logic for Adding new complain,Updating complain..etc 
//Author        : Pradeep Yadav
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using System.Threading;
using System.Data;
using IGRSS.BusinessObjects.WorkflowServices;
using IGRSS.Workflows.Complain.EventArgs;
using IGRSS.Workflows.Complain;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using CompalinTable = IGRSS.DataAccessLayer.Complain.ComplainDetailsDataTable;
using ComplainDetailsRow = IGRSS.DataAccessLayer.Complain.ComplainDetailsRow;
using InvestigationTable = IGRSS.DataAccessLayer.Complain.InvestigationDataTable;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Complain
	{
		/// <summary>
		/// This function will add the new Complain. 
		/// </summary>
		/// <returns>void</returns>
        public bool AddNewComplain(FormViewParameter Parameter, Remarks rem) //string ComplaintNo, Guid ComplaintType, Guid AgainstEmpID, Guid ComplainingEmpID, string ComplainantName, string ComplainantAddress, DateTime ComplaintDate, Guid ReceivingOfficeId, string Subject, string Detail)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            int i = 0;
            ComplainDetailsRow row = (ComplainDetailsRow)Parameter.Values;
            try
            {
                Guid ComplainId = FileManager.OpenNewFile(row.ReceivingOfficeId, "COM");
                // Commented By Akhilesh.
                //if (rem.Subject != "" && rem.Body != "")
                //{
                //    FileManager.AddRemarkToFile(ComplainId, rem.Subject, rem.Body);
                //}
                int rowsAffected=0;
                if(row.ComplaintType == new Guid("85aefd8d-6b7e-4ab8-b124-21b52073f7b3"))
                {
                    i=IgrssAdapters.ComplainAdapter.AddNewComplainDetails(ComplainId, row.ComplaintNo, row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, row.ReceivingOfficeId, row.Subject, row.Detail, curUser, DateTime.Now,row.Designation,row.CurrentOffice);
                }
                if (row.ComplaintType == new Guid("96369687-0450-42fc-ba41-ad35ade13b53"))
                {
                     i=IgrssAdapters.ComplainAdapter.AddNewComplainDetails(ComplainId, row.ComplaintNo, row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, null, row.Subject, row.Detail, curUser, DateTime.Now, row.Designation, null);
                }
                if (i > 0)
                {
                    Dictionary<string, object> WfParams = new Dictionary<string, object>();
                    WfParams.Add("ComplainId", ComplainId);
                    WfParams.Add("ComplainOffice", row.ReceivingOfficeId);

                    WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(ComplainProcess), WfParams);
                    
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

		/// <summary>
		/// This function will add the new Complain. 
		/// </summary>
		/// <returns>void</returns>
        public bool AddNewConfidentialreport(FormViewParameter Parameter, Remarks rem) //string ComplaintNo, Guid ComplaintType, Guid AgainstEmpID, Guid ComplainingEmpID, string ComplainantName, string ComplainantAddress, DateTime ComplaintDate, Guid ReceivingOfficeId, string Subject, string Detail)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            int i = 0;
            ComplainDetailsRow row = (ComplainDetailsRow)Parameter.Values;
            try
            {
                Guid ComplainId = FileManager.OpenNewFile(row.ReceivingOfficeId, "COM");
                int rowsAffected=0;
                if(row.ComplaintType == new Guid("85aefd8d-6b7e-4ab8-b124-21b52073f7b3"))
                {
                    i=IgrssAdapters.ComplainAdapter.AddNewComplainDetails(ComplainId, row.ComplaintNo, row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, row.ReceivingOfficeId, row.Subject, row.Detail, curUser, DateTime.Now,row.Designation,row.CurrentOffice);
                }
                if (row.ComplaintType == new Guid("96369687-0450-42fc-ba41-ad35ade13b53"))
                {
                     i=IgrssAdapters.ComplainAdapter.AddNewComplainDetails(ComplainId, row.ComplaintNo, row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, null, row.Subject, row.Detail, curUser, DateTime.Now, row.Designation, null);
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
		/// This function will Update the Complain details. 
		/// </summary>
		/// <returns>void</returns>
		public bool UpdateComplainDetails(FormViewParameter Parameter, Guid ComplainId)//Guid ComplaintType, Guid AgainstEmpID, Guid ComplainingEmpID, string ComplainantName, string ComplainantAddress, Guid ReceivingOfficeId, string Subject, string Detail, string ComplaintNo, DateTime ComplaintDate, Guid ComplainId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			ComplainDetailsRow row = (ComplainDetailsRow) Parameter.Values;

			try
			{
				Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);
				ComplainAcceptedEventArgs args = new ComplainAcceptedEventArgs(InstanceId, row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, row.ReceivingOfficeId, row.Subject, row.Detail, ComplainId, row.ComplaintNo);
                //WorkflowMediator.ComplainServices.AcceptComplain(InstanceId, args);
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
		/// This function will get the Complain Details.
		/// <param name="ComplaintNo"></param>
		/// </summary>
		/// <returns>CompalinTable</returns>
		public CompalinTable GetComplainDetailsByComplainNo(string ComplaintNo)
		{
			CompalinTable retData = new CompalinTable();
			try
			{
				retData = IgrssAdapters.ComplainAdapter.GetComplainDetail(ComplaintNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return retData;
		}
		/// <summary>
		/// This function will get the Complain Details.
		/// <param name="ComplainId"></param>
		/// </summary>
		/// <returns>DataTable</returns>
        public CompalinTable GetComplainDetailsByComplainId(Guid ComplainId)
		{
            CompalinTable dt = new CompalinTable();
			try
			{
				dt=IgrssAdapters.ComplainAdapter.GetComplainDetailByComplainId(ComplainId);
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
			return dt;
		}
		/// <summary>
		/// This function is used to save the name of the Enquiry Officer for investigating complain.
		/// <param name="ComplainId"></param>
		/// </summary>
		/// <returns>void</returns>
		public bool AssignEnquiryOfficer(string InvestigatingOfficer, Guid ComplainId)
		{
			try
			{
				Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);
				InvestigationRequiredEventArgs args = new InvestigationRequiredEventArgs(InstanceId);
				args.InvestigatingOfficer = InvestigatingOfficer;
				WorkflowMediator.ComplainServices.RequireInvestigation(InstanceId, args);
                return true;
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
            return false;
			}
		}
		/// <summary>
		/// This function is used to Get the Investigation details.
		/// <param name="ComplainId"></param>
		/// </summary>
		/// <returns>InvestigationTable</returns>
		public InvestigationTable GetInvestigationDetail(Guid ComplainId)
		{
			InvestigationTable InvTable = new InvestigationTable();
			try
			{
				InvTable=IgrssAdapters.InvestigationAdapter.GetInvestigationDetailsByComplainId(ComplainId);
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
			return InvTable;
		}
		/// <summary>
		/// <param name="ComplainId"></param>
		/// <param name="InvDetails"></param>
		/// <param name="InvDate"></param>
		/// <returns>InvestigationTable</returns>
		/// </summary>
		/// <remarks>This function is used to add the new Investigation details.</remarks>
		public bool AddInvestigatonDetail(Guid ComplainId, DateTime InvDate, string InvDetails)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				// Get the Workflow InstanceId
				Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);

				// Initilize argument parameters
				AddInvestigationDetailsEventArgs args = new AddInvestigationDetailsEventArgs(InstanceId);
				args.InvestigationDate = InvDate;
				args.InvestigationDetails = InvDetails;

				// Raise the event with the arguments
				WorkflowMediator.ComplainServices.SubmmitInvestigationDetails(InstanceId, args);
                return true;
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
                return false;
			}
		}
		/// <summary>
		/// <param name="ComplainId"></param>
		/// <param name="InvDetails"></param>
		/// <param name="InvDate"></param>
		/// <returns>InvestigationTable</returns>
		/// </summary>
		public void CompleteInvestigaton(Guid ComplainId, DateTime InvDate, string InvDetails)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				// Get the Workflow InstanceId
				Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);

				// Initilize argument parameters
				InvestigationDoneEventArgs args = new InvestigationDoneEventArgs(InstanceId);
				args.InvestigationDate = InvDate;
				args.InvestigationDetails = InvDetails;

				// Raise the event with the arguments
				WorkflowMediator.ComplainServices.CloseInvestigation(InstanceId, args);
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
		}

		public bool CloseComplainFile(Guid ComplainId)
		{
			try
			{
				Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);
				WorkflowMediator.ComplainServices.CloseComplainFile(InstanceId);
                return true;
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
            return false;
			}
		}
		/// <summary>
		/// <param name="InvestigationId"></param>
		/// <param name="InvDetails"></param>
		/// <param name="InvDate"></param>
		/// <returns>void</returns>
		/// </summary>
		/// <remarks>This function is used to update the Investigation details.</remarks>
		public bool UpdateInvestigationdetails(Guid InvestigationId, DateTime InvDate, string InvDetails)
		{
			try
			{
				string curUser = Thread.CurrentPrincipal.Identity.Name;
				IgrssAdapters.InvestigationAdapter.UpdateInvestigationdetails(InvestigationId, InvDate, InvDetails, curUser, DateTime.Now);
                return true;
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
            return false;
			}
		}
		/// <summary>
		/// <param name="InvestigationID"></param>
		/// <returns>void</returns>
		/// </summary>
		/// <remarks>This function is used to delete the  Investigation details.</remarks>
		public bool DeleteInvesTigationDetails(Guid InvestigationID)
		{
			try
			{
				IgrssAdapters.InvestigationAdapter.DeleteInvestigationdetailByInvestigationNo(InvestigationID);
                return true;
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
            return false;
			}
		}

		public static ComplainDetailsRow GetComplainRow()
		{
			return new CompalinTable().NewComplainDetailsRow();
		} 
	}
}
