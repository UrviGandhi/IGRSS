//Leave
//ClassName     - Leave
//Purpose       - This business class contains a business logic for Recording leave details.
//Author        : Pradeep Yadav
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using LeaveTable=IGRSS.DataAccessLayer.Leave.LeaveRegisterDataTable;
using System.Data;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Leave
	{
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static DataRow GetRow()
		{
			return new IGRSS.DataAccessLayer.Leave.LeaveRegisterDataTable().NewLeaveRegisterRow();
		}
		
        /// <summary>
        /// This function will add the new leave details.
        /// </summary>
        /// <param name="Parameter">Contains all the Fields of the form view</param>
        /// <returns></returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddLeaveDetails(FormViewParameter Parameter)
		    {
            
		         string curUser = Thread.CurrentPrincipal.Identity.Name;
				 try
				 {
					 IGRSS.DataAccessLayer.Leave.LeaveRegisterRow Row = (IGRSS.DataAccessLayer.Leave.LeaveRegisterRow) Parameter.Values;
					 IgrssAdapters.LeaveAdapter.AddLeaveDetails(Guid.NewGuid(), Row.EmployeeID, Row.ApplnDate, Row.ApplicableRules, Row.LeaveType, Row.LeaveFrom, Row.LeaveTo, Row.WorkingDays, Row.Reason, Row.ResumedDutyOn, curUser, DateTime.Now);
				 }
				 catch (Exception ex)
				 {
					 if (ExceptionPolicy.HandleException(ex, "DAL"))
						 throw;
				 }
                 return true;
		    }
		/// <summary>
		/// This function retuns Leave details of the employee.
		/// </summary>
		/// <param name="EmployeeID"></param>
		/// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LeaveTable GetLeavedetailsByEmpId(Guid EmployeeID)
		{
			LeaveTable LeaveDt = new LeaveTable();
			try
			{
				LeaveDt=IgrssAdapters.LeaveAdapter.GetLeaveDetailsByEmpId(EmployeeID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return LeaveDt;

		}
		/// <summary>
		/// <param name="EmployeeID"></param>
		///  <returns>LeaveTable</returns>
		/// </summary>
		/// <remarks>This function retuns all the Leave details.
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LeaveTable GetLeavedetails()
		{
			LeaveTable LeaveDt = new LeaveTable();
			try
			{
				LeaveDt=IgrssAdapters.LeaveAdapter.GetData();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return LeaveDt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LeaveTable GetLeavedetailsByLeaveRegID(Guid LeaveRegID)
		{
			LeaveTable LeaveDt = new LeaveTable();
			try
			{
				LeaveDt=IgrssAdapters.LeaveAdapter.LeaveDetailsByLeaveRegID(LeaveRegID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return LeaveDt;

		}
		/// <summary>
		/// <param name="Parameter"></param>
		/// <param name="LeaveRegID"></param>
		///  <returns>void</returns>
		/// </summary>
		/// <remarks>This function update the leave details.
		public bool UpdateLeaveDetails(FormViewParameter Parameter, Guid LeaveRegID)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IGRSS.DataAccessLayer.Leave.LeaveRegisterRow Row = (IGRSS.DataAccessLayer.Leave.LeaveRegisterRow) Parameter.Values;
				IgrssAdapters.LeaveAdapter.UpdateLeaveDetails(LeaveRegID, Row.EmployeeID, Row.ApplnDate, Row.ApplicableRules, Row.LeaveType, Row.LeaveFrom, Row.LeaveTo, Row.WorkingDays, Row.Reason, Row.ResumedDutyOn, curUser, DateTime.Now);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
            return true;
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LeaveTable GetLeavedetailsByEmployeeName(string EmployeeName)
		{
			LeaveTable Dt = new LeaveTable();
			try
			{
				Dt=IgrssAdapters.LeaveAdapter.LeaveDetailsByEmployeeName(EmployeeName);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LeaveTable GetLeavedetailsByEmployeeNo(string EmployeeNo)
		{
			LeaveTable Dt = new LeaveTable();
			try
			{
				Dt=IgrssAdapters.LeaveAdapter.LeaveDetailsByEmployeeNo(EmployeeNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
	}
}


