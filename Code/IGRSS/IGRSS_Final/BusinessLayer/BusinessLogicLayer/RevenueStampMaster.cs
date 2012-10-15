using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.ComponentModel;

using RevenueStampMasterTable = IGRSS.DataAccessLayer.RevenueStampMaster.RevenueStampMasterDataTable;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class RevenueStampMaster
	{
		
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RevenueStampMasterTable GetrevenueStampMasterDetails()
		{
			return IgrssAdapters.RevenueStampMasterAdapter.GetRevenueStampMasterDetails();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert,true)]
		public bool NewRevenueStampMaster(string Name, string Description,decimal Amount)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.RevenueStampMasterAdapter.NewInsertRevenueStampMaster(Guid.NewGuid(),Name, Description, Amount, curUser, DateTime.Now);
			return true;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public RevenueStampMasterTable GetRevenueStampDetailsById(Guid RevenueStampId)
		{
			return IgrssAdapters.RevenueStampMasterAdapter.GetRevenueStampDetailsById(RevenueStampId);
            
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete)]
		public bool DeleteRevenueStampMaster(Guid RevenueStampId)
		{
            IgrssAdapters.RevenueStampMasterAdapter.DeleteRevenueStampMaster(RevenueStampId);
            return true;
           
		}
		public bool UpdateRevenueStampMaster(string Name, string Description, decimal Amount,Guid RevenueStampId)
		{
			IgrssAdapters.RevenueStampMasterAdapter.UpdateRevenueStampMaster(Name, Description, Amount,RevenueStampId);
			return true;
		}
		



	}
}
