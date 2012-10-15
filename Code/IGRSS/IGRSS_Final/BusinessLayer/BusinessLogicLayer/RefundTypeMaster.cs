using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.ComponentModel;

using RefundTypeTable = IGRSS.DataAccessLayer.RefundTypeMaster.RefundTypeMasterDataTable;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class RefundTypeMaster
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RefundTypeTable GetRefundTypeMasterDetails()
		{
			RefundTypeTable Dt = new RefundTypeTable();
			try
			{
				Dt=IgrssAdapters.RefundTypeMasterAdapter.GetRefundTypeMasterDetails();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool NewRefunType(string Name, string Description)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.RefundTypeMasterAdapter.InsertNewRefundTypeMaster(Name, Description, Guid.NewGuid(), curUser, DateTime.Now);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}
	}
}
