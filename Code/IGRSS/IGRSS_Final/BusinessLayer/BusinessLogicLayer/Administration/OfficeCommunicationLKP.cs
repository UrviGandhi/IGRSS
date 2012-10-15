using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using IGRSS.DataAccessLayer;
using OfficeCommunicationDataTable = IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPDataTable;
using OfficeCommunicationLKPRow =IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPRow;

namespace IGRSS.BusinessLogicLayer.Administration
{
	[DataObject]
public 	class OfficeCommunicationLKP
	{
	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

	public OfficeCommunicationDataTable GetOfficeCommunicationDetails()
	{
		return IgrssAdapters.OfficeCommunication_LKP.GetOfficeCommunicationProcessDetails();
	}

	[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

	public bool AddNewOfficeCommunication(FormViewParameter Parameter)
	{
		

		string curUser = Thread.CurrentPrincipal.Identity.Name;
		IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPRow  row= (IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPRow)Parameter.Values;

		IgrssAdapters.OfficeCommunication_LKP.AddNewOfficeCommunication(row.OfficeId, row.CommunicationKey, row.CommunicatingOffice, row.Description, row.IsActive, curUser, DateTime.Now);

		return true;
	}

	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

    public OfficeCommunicationDataTable GetOfficeCommunicationDetailsByOfficeId(Guid OfficeId, string CommunicationKey)
	{
        return IgrssAdapters.OfficeCommunication_LKP.GetCommunicationOfficeByKey(OfficeId,CommunicationKey);
	}
    [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]

    public bool DeleteOfficeCommunicationLKP(Guid OfficeId,string CommunicationKey)
    {
        string curUser = Thread.CurrentPrincipal.Identity.Name;
        IgrssAdapters.OfficeCommunication_LKP.DeleteOfficeCommunicationLKP(curUser, DateTime.Now,CommunicationKey, OfficeId);
        return true;
    }
	[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

	public bool UpdateOfficeCommunication(FormViewParameter Parameter, Guid OfficeId, Guid CommunicationKey)
	{
		string curUser = Thread.CurrentPrincipal.Identity.Name;
	
		IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPRow row = (IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPRow) Parameter.Values;

        IgrssAdapters.OfficeCommunication_LKP.UpdateOfficeCommunication(row.OfficeId, row.CommunicationKey, row.CommunicatingOffice, row.Description, row.IsActive, curUser, DateTime.Now);

		return true;
	
	}


	public static OfficeCommunicationLKPRow GetOfficeCommunicationRow()
	{
		return new OfficeCommunicationDataTable().NewOfficesCommunication_LKPRow();

	}





	}
}
