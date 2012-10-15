using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

using OfficesTable = IGRSS.BusinessLayer.DataAccessLayer.OfficesMaster.OfficeMasterDataTable;
using OfficeTypesTable = IGRSS.BusinessLayer.DataAccessLayer.OfficesMaster.OfficeTypes_LKPDataTable;
using IGRSS.BusinessLayer.DataAdapters;

namespace IGRSS.BusinessLogicLayer
{
	public class OfficeProvider
	{
		public OfficesTable GetOffices()
		{
			return IgrssAdapters.OfficesAdapter.GetOffices();
		}

		public bool CreateNewOffice(string OfficeName, Guid OfficeTypeId, string Description)
		{
			string username = Thread.CurrentPrincipal.Identity.Name;
			
				if (1 > IgrssAdapters.OfficesAdapter.AddNewOffice(Guid.NewGuid(), OfficeName, OfficeTypeId, Description, username, DateTime.Now))
				{
					return false;
				}
			
			return false;
		}

		public OfficeTypesTable GetOfficeTypes()
		{
			return IgrssAdapters.OfficeTypeAdapter.GetOfficeTypes();
		}

		public string GetOfficeNameById(Guid OfficeId)
		{
			return (string)IgrssAdapters.OfficesAdapter.GetOfficeNameById(OfficeId);
		}

		public OfficesTable SearchOfficeByName(string OfficeNameToMatch)
		{
			return IgrssAdapters.OfficesAdapter.FindOfficeByName(OfficeNameToMatch);
		}

		public OfficesTable GetOfficesInType(Guid OfficeTypeId)
		{
			return IgrssAdapters.OfficesAdapter.GetOfficesByType(OfficeTypeId);
		}

		public bool IsOfficeInType(Guid OfficeId, Guid OfficeTypeId)
		{
			throw new System.NotImplementedException();
		}

		public void DeActivateOffice(string OfficeId)
		{
			throw new System.NotImplementedException();
		}

		public bool IsOfficeActive()
		{
			throw new System.NotImplementedException();
		}

		public void GetAllOfficeTypes()
		{
			throw new System.NotImplementedException();
		}
	}
}
