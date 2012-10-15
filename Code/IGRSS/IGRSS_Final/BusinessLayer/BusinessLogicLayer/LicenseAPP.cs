using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessLayer.DataAdapters;
using LicenseTable = IGRSS.BusinessLayer.DataAccessLayer.LicenseMaster.LicenseMasterDataTable;
namespace IGRSS.BusinessLayer.BusinessLogicLayer
{
	public class LicenseAPPBLL
	{
		public bool NewLicenseDetails(string LicenseNo, DateTime IssuedDate, DateTime EffectiveDate, DateTime ExpiryDate, bool IsCancelled)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.LicenseMasterAdapter.InsertNewLicenseDetails(Guid.NewGuid(), LicenseNo, DateTime.Now, DateTime.Now, DateTime.Now, IsCancelled, userName, DateTime.Now, userName, DateTime.Now);
			return true;
		}
		public LicenseTable GetLicenses()
		{
			return IgrssAdapters.LicenseMasterAdapter.GetLicenseDetail();

		}
	}

}
