using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Threading;
using IGRSS.BusinessObjects;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using System.Data;

using JantriTable = IGRSS.DataAccessLayer.Jantri.JantriDataTable;
using distmasTable = IGRSS.DataAccessLayer.Jantri.distmasDataTable;
using talukamasTable = IGRSS.DataAccessLayer.Jantri.talukamasDataTable;
using villagemasTable = IGRSS.DataAccessLayer.Jantri.villagemasDataTable;
                 

namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Jantri
	{

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public JantriTable GetJantriDetails()
		{
			return IgrssAdapters.JantriAdapter.GetJantriDetails();

		}

		//[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		//public DataTable GetJantriRatesById(int  distcd,int talcd,int villcd)
		//{
		//    return IgrssAdapters.JantriAdapter.GetJantriRatesById(distcd, talcd, villcd);

		//}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public distmasTable GetDistirctMasterDetails()
		{
			return IgrssAdapters.districtMasterAdapter.GetDistirctMasterDetails();
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public talukamasTable GetTalukaMasterDetails()
		{
			return IgrssAdapters.talukaMasterAdapter.GetTalukaMasterDetails();
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public villagemasTable GetVillageMasterDetails()
		{
			return IgrssAdapters.villageMasterAdapter.GetVillageMasterDetails();
		}





	}
}
