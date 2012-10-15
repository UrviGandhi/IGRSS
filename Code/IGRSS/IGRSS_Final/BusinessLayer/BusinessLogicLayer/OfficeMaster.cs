using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using IGRSS.DataAccessLayer;
using System.Threading;
using System.Web;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using OfficeTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterDataTable;
using OfficeMasterRow = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow;


namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
public 	class OfficeMaster
	{

	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

	public OfficeTable GetOfficeDetails()
	{
		return IgrssAdapters.OfficesAdapter.GetOffices();
	}

	[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

	public bool AddNewOffices(FormViewParameter Parameter)
	{
	//        Guid OfficeId = Guid.NewGuid();
	//        string curUser = Thread.CurrentPrincipal.Identity.Name;
	//        IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow row = (IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow) Parameter.Values;


	//        IgrssAdapters.OfficesAdapter.AddNewOffice(OfficeId, row.OfficeName, row.OfficeTypeId, row.Description, curUser, DateTime.Now);
	        return true;

	}




	}
}
