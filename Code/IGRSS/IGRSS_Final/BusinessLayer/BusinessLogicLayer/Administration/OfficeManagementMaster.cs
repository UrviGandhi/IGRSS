using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using OfficesTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterDataTable;
using OfficeTypesTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeTypes_LKPDataTable;
using OfficeMasterRow = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow;
using OfficeTypeTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeTypes_LKPDataTable;
using OfficeTypeRow = IGRSS.DataAccessLayer.OfficesMaster.OfficeTypes_LKPRow;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer.Administration
{

	[DataObject]
	public class OfficeManagementMaster
	{

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public OfficesTable GetOfficesDetails()
		{
			return IgrssAdapters.OfficesAdapter.GetOffices();

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewOfficeDetails(FormViewParameter Parameter)
		{
            try
            {
                Guid OfficeId = Guid.NewGuid();
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow row = (IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow)Parameter.Values;

                IgrssAdapters.OfficesAdapter.AddNewOffice(OfficeId, row.OfficeName, row.Description, row.DistrictCode, row.TalukaCode, row.VillageCode, curUser, DateTime.Now, row.Address, row.EmailID, row.PhoneNo);

                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool UpdateOfficeDetails(FormViewParameter Parameter, Guid OfficeId)
		{
            try
            {
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow row = (IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterRow)Parameter.Values;

                IgrssAdapters.OfficesAdapter.UpdateOfficeDetailsById(row.OfficeName, row.Description, curUser, row.DistrictCode, row.TalukaCode, row.VillageCode, DateTime.Now, OfficeId, row.Address, row.PhoneNo, row.EmailID);
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public OfficesTable GetOfficeDetailsById(Guid OfficeId)
		{
			return IgrssAdapters.OfficesAdapter.GetOfficeDetailsById(OfficeId);

		}

		public static OfficeMasterRow GetOfficeMasterRow()
		{
			return new OfficesTable().NewOfficeMasterRow();

		}


		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public OfficeTypeTable GetOfficeTypeDetails()
		{
			return IgrssAdapters.OfficeTypeAdapter.GetOfficeTypes();
		}



	}
}
