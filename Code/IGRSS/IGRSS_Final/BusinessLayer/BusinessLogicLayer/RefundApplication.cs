
//Refund
//ClassName     - Refund 
//Purpose       - This business class contains a business logic for Refund Module 
//Author        : Pradeep Sahoo
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------

using System;
using System.Collections.Generic;

using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using RefundApplicationTable = IGRSS.DataAccessLayer.Refund.RefundApplicationDataTable;
using RefundStampDetailsTable=IGRSS.DataAccessLayer.Refund.RefundStampDetailsDataTable;
using RefundActsApplicable = IGRSS.DataAccessLayer.Refund.RefundActsApplicableDataTable;
using RefundOrderTable =IGRSS.DataAccessLayer.Refund.RefundOrderDataTable;
using RefundApprovalGridTable = IGRSS.DataAccessLayer.Refund.RefundApprovalGridDataTable;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using RefundApplicationRow = IGRSS.DataAccessLayer.Refund.RefundApplicationRow;
using IGRSS.BusinessObjects.WorkflowServices;
using IGRSS.Workflows.Refund;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Workflows.Refund.EventArgs;


namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class RefundApplication
	{  //DataTable StampDetails=new DataTable();

		#region Old Style Code

		#endregion

		//Session["StampDetails"] = StampDetails;

		/// <summary>
		/// This function Gets All the RefundApplication 
		/// </summary>
		/// <returns> Returns the Datatable i.e, RefundApplicationTable containing All the  Refund applications</returns>
		public RefundApplicationTable GetAllRefundApplications()
		{
			RefundApplicationTable Dt = new RefundApplicationTable();
			try
			{
				Dt = IgrssAdapters.RefundApplicationAdapter.GetAllRefundApplications();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}


		/// <summary>
		/// This function Gets all the Approved Refund
		/// </summary>
		/// <returns>returns  Datatable object i.e, RefundApplicationTable containing all the Approved Refund </returns>
        public RefundApplicationTable GetApprovedRefund()
        {
            RefundApplicationTable Dt = new RefundApplicationTable();
            try
            {
                Dt = IgrssAdapters.RefundApplicationAdapter.GetApproveRefund();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
		/// <summary>
		/// This function Gets all the RefundApplication on the particular Village
		/// </summary>
		/// <param name="VillageCode">Village code , which village Data we want</param>
		/// <returns>returns  Datatable object i.e, RefundApplicationTable containing all the Refund Application on that village</returns>
		public RefundApplicationTable GetRefundApplicationByVillage(string VillageCode)
		{
			RefundApplicationTable Dt = new RefundApplicationTable();
			try
			{
				Dt = IgrssAdapters.RefundApplicationAdapter.GetRefundDetailsByVillage(VillageCode);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
		/// <summary>
		/// This function  Gets all the RefundApplication Stamps
		/// </summary>
		/// <returns>A datatable object containing all the records present in the RefundApplication Table</returns>
		public RefundApplicationTable GetAllRefundApplication_Stamps_Acts()
		{
			RefundApplicationTable Dt = new RefundApplicationTable();
			try
			{
				return IgrssAdapters.RefundApplicationAdapter.SelectRefundApplication_Stampdetails_Act();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}

		/// <summary>
		/// This function Gets All the Stamps Details 
		/// </summary>
		/// <returns> Datatable object i.e,RefundStampDetailsTable which contains all the Refund Stamp Details</returns>
		public RefundStampDetailsTable GetAllStampDetails()
		{
			RefundStampDetailsTable Dt = new RefundStampDetailsTable();
			try
			{
				Dt = IgrssAdapters.RefundStampDetailsAdapter.GetRefundStampDetails();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}


		

		
		/// <summary>
		///This function  Gets all  stamp Details By RefundApplicationId

		/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId is the key on which the selection will be made</param>
		/// <returns>a Datatable object i.e, RefundStampDetailsTable</returns>
		public RefundStampDetailsTable SelectRefundStampDetailsByRefundId(Guid RefundApplicationId)
		{
			RefundStampDetailsTable Dt = new RefundStampDetailsTable();
			try
			{
				Dt = IgrssAdapters.RefundStampDetailsAdapter.SelectRefundStampDetailsByRefundId(RefundApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}


		/// <summary>
		///This function Updates the stamp Details 
		/// </summary>
		/// <param name="ReturnedQty">ReturnedQty</param>
		/// <param name="stampNumber">stampNumber</param>
		/// <param name="RevenueStampId">RevenueStampId</param>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <returns>true , indicating that the recordsis updated </returns>
		public bool UpdateStampDetails(string ReturnedQty, string stampNumber, Guid RevenueStampId, Guid RefundApplicationId)
		{
			try
			{
				IgrssAdapters.RefundStampDetailsAdapter.UpdateRefundStampDetails(ReturnedQty, stampNumber, RevenueStampId, RefundApplicationId);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;

		}

		/// <summary>
		/// Delete Refund stamp Details on RefundApplicationId
		/// </summary>
		/// <param name="RefundApplicationId"> RefundApplicationId</param>
		/// <returns>true, a record is deleted </returns>
		public bool DeleteRefundStampDetails(Guid RefundApplicationId)
		{
			try
			{
				IgrssAdapters.RefundStampDetailsAdapter.DeleteRefundStampDetails(RefundApplicationId);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;

		}


		
	/// <summary>
	/// Getting All the Refund Application By RefundApplicationId

	/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <returns> datatable object containing all the records i.e,RefundApplicationTable </returns>
		public RefundApplicationTable GetAllRefundApplicationsById(Guid RefundApplicationId)
		{
			RefundApplicationTable Dt = new RefundApplicationTable();
			try
			{
				Dt = IgrssAdapters.RefundApplicationAdapter.GetRefundDetailsByApplicationId(RefundApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
        public RefundApplicationTable GetRefundDetailsByRefundNo(string RefundNo)
        {
            RefundApplicationTable Dt = new RefundApplicationTable();
            try
            {
                Dt = IgrssAdapters.RefundApplicationAdapter.GetRefundDetailsByRefundNo(RefundNo);            
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }
		//Inserting New Refund Application on the formview Insert.
        //************* Commented by Akhilesh ***********
		
        //public bool NewRefundApplication(Guid OfficeId,
        //                string RegistrationNo,
        //                string RefundPrefix,
        //                decimal RefundSlNo,
        //                decimal RefundYear,
        //                string TypeOfRefund,
        //                DateTime ApplicationDate,

        //                Guid VendorLicenseId,
        //                DateTime PURCHASEDDATE,
        //                string TotalValueOfStamps,
        //                string ReasonForNotUsing,
        //                string ApplicantName,
        //                string ApplicantAddress,
        //                string City,
        //                string District,
        //                string PinCode,
        //                string PhoneNo,
        //                DataTable StampDetails,
        //                DataTable ActsApplicable,
        //                Remarks rem
        //                )
        //{       
        //    string userName = Thread.CurrentPrincipal.Identity.Name;
        //    int i = DateTime.Compare(ApplicationDate, PURCHASEDDATE);
        //    Guid RefundApplicationId = FileManager.OpenNewFile(OfficeId, "LIC");
        //    FileManager.AddRemarkToFile(RefundApplicationId,rem.Subject,rem.Body);
        //    IgrssAdapters.RefundApplicationAdapter.NewRefundApplication(RefundApplicationId,
        //            OfficeId,
        //            RegistrationNo,
        //            RefundPrefix,
        //            RefundSlNo,
        //            RefundYear,
        //            TypeOfRefund,
        //            ApplicationDate,
        //            VendorLicenseId,
        //            PURCHASEDDATE,
        //            TotalValueOfStamps,
        //            ReasonForNotUsing,
        //            ApplicantName,
        //            ApplicantAddress,
        //            City,
        //            District,
        //            PinCode,
        //            PhoneNo,
        //            DateTime.Now,
        //            userName);

        //    //Fetching The fields Of DataTable and inserting to the child Table RefundStampDetails
        //    foreach (DataRow StampDetail in StampDetails.Rows)
        //    {
        //        IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(RefundApplicationId, (Guid) StampDetail["StampTypeId"], (string) StampDetail["Qty"], (string) StampDetail["Nos"]);

        //    }

        //    foreach (DataRow Act in ActsApplicable.Rows)
        //    {
        //        IgrssAdapters.RefundActsApplicable.InsertRefundActsApplicable(RefundApplicationId, (Guid) Act["ActId"], (bool) Act["Checked"], "");
        //    }

        //    return true;
        //}


		public bool UpdateRefundApplication(Guid RefundApplicationId,
						 Guid OfficeId,
						string RegistrationNo,
						string TypeOfRefund,
						DateTime ApplicationDate,
						Guid VendorLicenseId,
						DateTime PURCHASEDDATE,
						string TotalValueOfStamps,
						string ReasonForNotUsing,
						string ApplicantName,
						string ApplicantAddress,
						string City,
						string District,
						string PinCode,
						string PhoneNo,
						string Remarks,
                        decimal ActualStampValue,
						DataTable StampDetails
						)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;

			IgrssAdapters.RefundApplicationAdapter.UpdateRefundApplication1(RefundApplicationId,
				OfficeId,
				RegistrationNo,
				TypeOfRefund,
				ApplicationDate,
				VendorLicenseId,
				PURCHASEDDATE,
				TotalValueOfStamps,
				ReasonForNotUsing,
				ApplicantName,
				ApplicantAddress,
				City,
				District,
				PinCode,
				PhoneNo,
				Remarks,
                ActualStampValue);

			IgrssAdapters.RefundStampDetailsAdapter.DeleteRefundStampDetails(RefundApplicationId);
			foreach (DataRow StampDetail in StampDetails.Rows)
			{
				IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(RefundApplicationId, (Guid) StampDetail[1], (string) StampDetail[2], (string) StampDetail[3]);
			}

			/*
			foreach (DataRow Act in ActsApplicable.Rows)
			{
				IgrssAdapters.RefundActsApplicable.UpdateRefundActsApplicable(RefundApplicationId, (Guid) Act["ActId"], (bool) Act["Checked"], (string) Act["Remarks"]);
			}*/


			return true;
		}
		public bool InsertNewRefund_Stamps_Acts(Guid OfficeId,
							Guid RegistrationNo,
							string RefundPrefix,
							decimal RefundSlNo,
							decimal RefundYear,
							string TypeOfRefund,
							DateTime ApplicationDate,
							Guid VendorLicenseId,
							DateTime PURCHASEDDATE,
							string TotalValueOfStamps,
							string ReasonForNotUsing,
							string ApplicantName,
							string ApplicantAddress,
							string City,
							string District,
							string PinCode,
							string PhoneNo,
							string Remarks,
							Guid RevenueStampId,
							string StampNumber,
							Guid ActId)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.RefundApplicationAdapter.RefundApplication_Stamps_Acts(Guid.NewGuid(), @OfficeId,
						@RegistrationNo,
						@RefundPrefix,
						@RefundSlNo,
						@RefundYear,
						@TypeOfRefund,
						@ApplicationDate,
						@VendorLicenseId,
						@PURCHASEDDATE,
						@TotalValueOfStamps,
						@ReasonForNotUsing,
						@ApplicantName,
						@ApplicantAddress,
						@City,
						@District,
						@PinCode,
						@PhoneNo,
						@Remarks,
						DateTime.Now,
						userName,
						@RevenueStampId,
						@StampNumber,
						@ActId);
			{
				return true;

			}
		}

		
 
		/// <summary>
		/// This function Gets all the Acts
		/// </summary>
		/// <returns>a datatble containg all the records i.e,RefundActsApplicable</returns>
		public RefundActsApplicable GetAllActsApplicable()
		{
			RefundActsApplicable Dt = new RefundActsApplicable();
			try
			{
				Dt = IgrssAdapters.RefundActsApplicable.GetAllRefundActsApplicable();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
	


		/// <summary>
		/// This functionSelect All the Act Details By RefundApplicationId

		/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <returns>A datatable  containing all the records i.e,RefundActsApplicable </returns>
		public RefundActsApplicable SelectActDetailsByRefundApplicationId(Guid RefundApplicationId)
		{
			RefundActsApplicable Dt = new RefundActsApplicable();
			try
			{
				Dt = IgrssAdapters.RefundActsApplicable.SelectActDetailsByRefundApplicationId(RefundApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}

		
		/// <summary>
		/// This function meant for Updating the Acts Applicable to RefundApplication.
		/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <param name="ActId">ActId</param>
		/// <param name="Checked">Checked</param>
		/// <param name="Remarks"><Remarks/param>
		/// <returns> true, a record is updated sucessfully</returns>


		public bool UpdateActApplicable(Guid RefundApplicationId, Guid ActId, bool Checked, string Remarks)
		{
			try
			{
				IgrssAdapters.RefundActsApplicable.UpdateRefundActsApplicable(RefundApplicationId, ActId, Checked, Remarks);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;

		}
	
		/// <summary>
		/// This functionality for Getting All the refund Orders 

		/// </summary>
		/// <returns>A datatable object containg all the records i.e,RefundOrderTable</returns>
		public RefundOrderTable GetAllRefundOrders()
		{
			RefundOrderTable Dt = new RefundOrderTable();
			try
			{
				Dt = IgrssAdapters.RefundOrder.GetRefundOrderDetails();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
	

		/// <summary>
		///This function is for  Inserting New Refund Orders
		/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <param name="PenaltyAmount">PenaltyAmount</param>
		/// <param name="RefundAmount">RefundAmount</param>
		/// <param name="RefundOrderId">RefundOrderId</param>
		/// <param name="DateOfOrder">DateOfOrder</param>
		/// <param name="CreatedBy">CreatedBy</param>
		/// <param name="CreatedAt">CreatedAt</param>
		/// <returns>true, a record is inserted</returns>
		public bool InsertNewRefundOrders(Guid RefundApplicationId, decimal PenaltyAmount, decimal RefundAmount, string RefundOrderId, DateTime DateOfOrder, string CreatedBy, DateTime CreatedAt)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.RefundOrder.InsertNewRefundOrders(RefundApplicationId, PenaltyAmount, RefundAmount, RefundOrderId, DateOfOrder, userName, DateTime.Now);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}
		


		/// <summary>
		///Inserting The Refund OrderId and Refund Order Date to The RefundApplication Table in the form of updating RefundApplication Table.
		/// </summary>
		/// <param name="RefundApplicationId">RefundApplicationId</param>
		/// <param name="PenaltyAmount">PenaltyAmount</param>
		/// <param name="RefundAmount">RefundAmount</param>
		/// <param name="RefundOrderId">RefundOrderId</param>
		/// <param name="DateOfOrder">DateOfOrder</param>
		/// <param name="CreatedBy">CreatedBy</param>
		/// <param name="CreatedAt">CreatedAt</param>
		/// <returns>true, a refund order  is inserted </returns>
		public bool UpdateRefundOrderDetails(Guid RefundApplicationId, decimal PenaltyAmount, decimal RefundAmount, string RefundOrderId, DateTime DateOfOrder, string CreatedBy, DateTime CreatedAt)
		{
			try
			{
				IgrssAdapters.RefundOrder.UpdateRefundOrderDetails(RefundApplicationId, PenaltyAmount, RefundAmount, RefundOrderId, DateOfOrder, CreatedBy, CreatedAt);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}


		// *******************************************After Modication According to Need 

		/// <summary>
		/// This function is for Gettting the  NewRefundApplicationRow 
		/// </summary>
		/// <returns>  an new row i.e,NewRefundApplicationRow  </returns>



		public static DataRow GetRow()
		{
			//return new IGRSS.DataAccessLayer.Complain.ComplainDatatableDataTable().NewComplainDatatableRow();

			return new IGRSS.DataAccessLayer.Refund.RefundApplicationDataTable().NewRefundApplicationRow();


		}
		/// <summary>
		/// Gettting the  NewRefundActsApplicableRow 
		/// </summary>
		/// <returns>a new row  i.e, NewRefundActsApplicableRow</returns>

		public static DataRow GetActRow()
		{

			return new IGRSS.DataAccessLayer.Refund.RefundActsApplicableDataTable().NewRefundActsApplicableRow();


		}

		/// <summary>
		/// Inserting the new RefundApplication
		/// </summary>
		/// <param name="Parameter"> formview parameter</param>
		/// <param name="StampDetails">stamps added by the user in the form of Datatable </param>
		/// <param name="ActsApplicable">Acts added by the user</param>
		/// <returns>true, a record is inserted</returns>

        public bool AddNewRefundApplication(FormViewParameter Parameter, DataTable StampDetails, DataTable ActsApplicable, Remarks rem)
		{
			// Initiate some of the fields required for the process
            RefundApplicationRow rowRef = (RefundApplicationRow)Parameter.Values;
            Guid RefundApplicationId = FileManager.OpenNewFile(rowRef.OfficeId, "REF");
            FileManager.AddRemarkToFile(RefundApplicationId, rem.Subject, rem.Body);
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			RefundApplicationRow row = (IGRSS.DataAccessLayer.Refund.RefundApplicationRow) Parameter.Values;
			try
			{
				
                TimeSpan ts = new TimeSpan(row.PurchasedDate.Ticks - row.ApplicationDate.Ticks);
				string DayDifference = ts.TotalDays.ToString();

				// Insert the Refiund Application data to database
                    decimal TotalValueOfStamps = Convert.ToDecimal(row.TotalValueOfStamps);
                    decimal pActualStampValue = 10 * TotalValueOfStamps / 100;
                    decimal ActualStampValue = TotalValueOfStamps - pActualStampValue;
				    IgrssAdapters.RefundApplicationAdapter.NewRefundApplication(RefundApplicationId, row.OfficeId,
					row.RegistrationNo, row.TypeOfRefund, row.ApplicationDate,
					row.VendorLicenseId, row.PurchasedDate, row.TotalValueOfStamps, row.ReasonForNotUsing, row.ApplicantName,
                    row.ApplicantAddress, row.City, row.District, row.PinCode, row.PhoneNo.ToString(), DateTime.Now, curUser, ActualStampValue);

				// For each Stamp Detail entered by user
				// Insert the Stamp Details for this Refund in to child table
				foreach (DataRow StampDetail in StampDetails.Rows)
				{
					IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(RefundApplicationId, (Guid) StampDetail["RevenueStampId"],
						(string) StampDetail["ReturnedQty"], (string) StampDetail["StampNumber"]);
				}
				// For each Act selected by the user
				// Insert the Applicable Acts to child table
				foreach (DataRow Act in ActsApplicable.Rows)
				{
					IgrssAdapters.RefundActsApplicable.InsertRefundActsApplicable(RefundApplicationId, (Guid) Act["ActId"], (bool) Act["Checked"], "");
				}

				// All database Inserts have been completed sucessfully initiate the Workflow
				// Create a Dioctionary to store Workflow Paramaters for Refund
				Dictionary<string, object> WfParams = new Dictionary<string, object>();
				// Add Refund Application  Id into the Workflow Parameter
				WfParams.Add("RefundId", RefundApplicationId);
				// Add Office Id in to Workflow Parameter 
				// (to identify the process flow for the Office)
				WfParams.Add("InitiatingOffice", row.OfficeId);

				// Initiate the Refund Workflow by passing the Wf Parameters Dictionary
				WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(RefundProcess), WfParams);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}


		/// <summary>
		/// Updating RefundApplication records
		/// </summary>
		/// <param name="Parameter">Formview parameter</param>
		/// <param name="StampDetails">Datatable of stampdetails</param>
		/// <param name="ActsApplicable">Datatable of ActsApplicable</param>
		/// <param name="RefundApplicationId">The Primary key of RefundApplication table</param>
		/// <param name="AlertId">AlertId</param>
		/// <param name="Verified">Verified</param>
		/// <returns>true, a record updated sucessfully</returns>



		public bool UpdateRefundApplicationNew(FormViewParameter Parameter, DataTable StampDetails, DataTable ActsApplicable, Guid RefundApplicationId, Guid AlertId, bool Verified)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				#region This functionality must be done in Workflow
				//IGRSS.DataAccessLayer.Refund.RefundApplicationRow row = (RefundApplicationRow) Parameter.Values;
				//IgrssAdapters.RefundApplicationAdapter.UpdateRefundApplication(RefundApplicationId, row.OfficeId, row.RegistrationNo,
				//    row.RefundPrefix, row.RefundSlNo, row.RefundYear, row.TypeOfRefund, row.ApplicationDate, row.VendorLicenseId,
				//    row.PurchasedDate, row.TotalValueOfStamps, row.ReasonForNotUsing, row.ApplicantName, row.ApplicantAddress,
				//    row.City, row.District, row.PinCode, row.PhoneNo, row.Remarks);

				//IgrssAdapters.RefundStampDetailsAdapter.DeleteRefundStampDetails(RefundApplicationId);
				//foreach (DataRow StampDetail in StampDetails.Rows)
				//{
				//    IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(RefundApplicationId, (Guid) StampDetail["RevenueStampId"], (string) StampDetail["ReturnedQty"], (string) StampDetail["StampNumber"]);
				//}

				//IgrssAdapters.RefundActsApplicable.DeleteRefundOrders(RefundApplicationId);
				//foreach (DataRow Act in ActsApplicable.Rows)
				//{
				//    IgrssAdapters.RefundActsApplicable.InsertRefundActsApplicable(RefundApplicationId, (Guid) Act["ActId"], (bool) Act["Checked"], "");
				//} 
				#endregion

				// Get the Workflow Instance Id from table
				Guid WfInstanceId = (Guid)IgrssAdapters.RefundApplicationAdapter.GetWorkflowInstanceById(RefundApplicationId);
				// Check if the user has verified the application or just updated
				if (Verified)
				{
					// Create the FeedbackEventArgs object
					FeedbackEventArgs args = new FeedbackEventArgs(WfInstanceId, AlertId, curUser);
					WorkflowMediator.RefundServices.ValidateRefundApplication(WfInstanceId, args);
				}
				else
				{
					// The record has not been verified just updated
					RefundApplicationUpdatedEventArgs args = new RefundApplicationUpdatedEventArgs(WfInstanceId, (RefundApplicationRow)Parameter.Values, StampDetails, ActsApplicable);
					WorkflowMediator.RefundServices.UpdateRefundApplication(WfInstanceId, args);
				}
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}


		/// <summary>
		/// This function Gets All the Refunds to be Approved.
		/// </summary>
		/// <returns>Datatable containing all the records of RefundApprovalGridTable</returns>


		public RefundApprovalGridTable GetAllRefundToApprove()
		{
			RefundApprovalGridTable Dt = new RefundApprovalGridTable();
			try
			{
				Dt = IgrssAdapters.RefundApprovalGrid.GetRefundApprovalGrid();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}

        public static bool ApproveRefund(Guid RefundApplicationId)
        {
            IgrssAdapters.RefundApplicationAdapter.ApproveRefund(RefundApplicationId);
            return true;
        }

        public static bool RejectRefund(Guid RefundApplicationId)
        {
            IgrssAdapters.RefundApplicationAdapter.RejectRefund(RefundApplicationId);
            return true;
        }

	}
}
