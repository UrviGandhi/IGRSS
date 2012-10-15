//Telephone
//ClassName     - Telephone
//Purpose       - This business class contains a business logic for Maintaing service details provided by different vendors.
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using TelephoneTable= IGRSS.DataAccessLayer.Telephone.TelephoneRegisterDataTable;
using IGRSS.BusinessObjects;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Telephone
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public void InsertTelephoneDetails(DateTime CallDate, Guid EmployeeID, Guid CalledEmpID, string DialledNo,string Remarks)
		{
		
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.TelephoneAdapter.InsertTelephoneDetails(Guid.NewGuid(), CallDate, EmployeeID, CalledEmpID, DialledNo, Remarks, curUser, DateTime.Today);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public void UpdateTelephoneDetails(DateTime CallDate, Guid EmployeeID, Guid CalledEmpID, string DialledNo, string Remarks, Guid TelephoneRegID)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.TelephoneAdapter.UpdateTelephoneDetails(CallDate, EmployeeID, CalledEmpID, DialledNo, Remarks, curUser, DateTime.Today, TelephoneRegID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetTelePhoneDetailsByEmpId(Guid EmployeeID)
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetPhoneDetailsByEmployeeId(EmployeeID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetTelephonedetailsByCallDate(DateTime CallDate)
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetTelephonedetailsByCallDate(CallDate);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetTelePhoneDetailsByTelephoneRegId(Guid TelephoneRegID)
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetTelephoneDetailsByTelephoneRegID(TelephoneRegID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetTelePhoneDetailsByEmpName(string EmployeeName)
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetPhoneCallDetailsByEmpName(EmployeeName);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetTelePhoneDetailsByEmpNo(string EmployeeNo)
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetPhoneDetailsByEmpNo(EmployeeNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
               
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public TelephoneTable GetAllTelePhoneDetails()
		{
			TelephoneTable Dt = new TelephoneTable();
			try
			{
				Dt=IgrssAdapters.TelephoneAdapter.GetData();
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
