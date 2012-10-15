//License Renewal
//ClassName     - LicenseRenewal
//Purpose       - This business class contains functions for selecting renewal history. 
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using RenewTable	= IGRSS.DataAccessLayer.LicenseReNewal.RenewLicenseDataTable;
using IGRSS.DataAccessLayer.LicenseReNewalTableAdapters;
using IGRSS.DataAccessLayer;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	public class LicenseRenewal
	{
		/// <summary>
		/// This function will return the Renewal History of the vendor license.
		/// </summary>
		/// <param name="LicenseNo"></param>
		/// <returns>RenewTable</returns>
		public RenewTable GetRenewalHistry(string LicenseNo)
		{
			RenewTable Dt = new RenewTable();
			try
			{
				Dt=IgrssAdapters.LicRenewAdapter.GetRenewalHistry(LicenseNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
			
		}
		/// <summary>
		/// This function will return the Renewal History of the vendor license.
		/// </summary>
		/// <param name="LicenseApplicationId"></param>
		/// <returns>RenewTable</returns>
		public RenewTable GetRenewalHistryByLICID(Guid LicenseApplicationId)
		{
			RenewTable Dt = new RenewTable();
			try
			{
				Dt=IgrssAdapters.LicRenewAdapter.GetRenewalHistryByLicenseApplicationId(LicenseApplicationId);
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










