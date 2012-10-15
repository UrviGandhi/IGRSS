using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using LicenseTable = IGRSS.DataAccessLayer.LicenseMaster.LicenseMasterDataTable;
using System.ComponentModel;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	
	public class LicenseMasterBLL
	{
		#region License Masters
		//[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		//public bool NewLicenseDetails(Guid LicenseApplicationId,string LicenseNo, bool IsCancelled, DateTime IssuedDate, DateTime EffectiveDate, DateTime ExpiryDate)
		//{
		//    string userName = Thread.CurrentPrincipal.Identity.Name;
		//    IgrssAdapters.LicenseMasterAdapter.InsertNewLicenseDetails(LicenseApplicationId, LicenseNo, DateTime.Now, DateTime.Now, DateTime.Now, IsCancelled, userName, DateTime.Now, userName, DateTime.Now);
		//    return true;
		//}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable   RenewHistry(string LicenseNo)
		{
			DataTable Dt = new DataTable();
			try
			{
				Dt=IgrssAdapters.LicenseMasterAdapter.GetRenewalHistry(LicenseNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LicenseTable GetLicenses()
		{
			LicenseTable Dt = new LicenseTable();
			try
			{
				Dt=IgrssAdapters.LicenseMasterAdapter.GetLicenseDetail();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public LicenseTable GetLicensedetailByLicenseAppID(Guid LicenseApplicationId)
		{
			LicenseTable Dt = new LicenseTable();
			try
			{
				Dt=IgrssAdapters.LicenseMasterAdapter.GetLicenseDetailByLicenseAppID(LicenseApplicationId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
		//[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		//public bool UpdateLicenseDetails(Guid LicenseApplicationId,string LicenseNo,DateTime IssuedDate,DateTime EffectiveDate,DateTime ExpiryDate,bool IsCancelled)
		//{
		//    string curUser = Thread.CurrentPrincipal.Identity.Name;
		//    IgrssAdapters.LicenseMasterAdapter.UpdateLicenseDetail(LicenseApplicationId, IssuedDate, EffectiveDate, ExpiryDate, IsCancelled, curUser, DateTime.Now);
		//    return true;
		//}
		[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
		public bool DeleteLicenseDetails(Guid LicenseApplicationId)
		{
			try
			{
				IgrssAdapters.LicenseMasterAdapter.DeleteLicenseDetail(LicenseApplicationId);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public void IssueLicense(Guid LicenseApplicationId, string LicenseNo, DateTime IssuedDate, DateTime EffectiveDate, DateTime ExpiryDate, string Status)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.LicenseMasterAdapter.IssueLicense(LicenseApplicationId, LicenseNo, IssuedDate, EffectiveDate, ExpiryDate, Status, curUser, DateTime.Now);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DataTable GetDataByLicenseNo(string LicenseNo,string NameOfApplicant)
		{
			DataTable Dt = new DataTable();
			try
			{
                Dt = IgrssAdapters.LicenseMasterAdapter.GetDataByLicenseNoCancelation(LicenseNo, NameOfApplicant);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
			
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetVendorLicenseDetails(string NameOfApplicant,string LicenseNo)
        {
            DataTable Dt = new DataTable();
            try
            {
                Dt = IgrssAdapters.LicenseMasterAdapter.GetVendorLicenseDetails(NameOfApplicant,LicenseNo);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool RenewVendorLicenses(DateTime RenewedDate, DateTime EffectiveDate, DateTime ExpiryDate,Guid LicenseApplicationId)
		{
			try
			{
				IgrssAdapters.LicenseMasterAdapter.RenewVendorLicense(LicenseApplicationId, DateTime.Now, EffectiveDate, ExpiryDate);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;

		}
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool CancelVendorLicenses(string LicenseNo)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.LicenseMasterAdapter.CancelVendorLicense(curUser, LicenseNo);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}

		
		#endregion
	}

}
