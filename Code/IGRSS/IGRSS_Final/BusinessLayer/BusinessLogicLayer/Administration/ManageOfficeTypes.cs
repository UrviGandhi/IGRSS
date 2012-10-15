using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data;
using IGRSS.BusinessObjects;
using OfficeTypes_LKPDataTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeTypes_LKPDataTable;
using System.ComponentModel;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer.Administration
{
	[DataObject]
	public class ManageOfficeTypes
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public OfficeTypes_LKPDataTable GetOfficeTypes()
		{
			return IgrssAdapters.OfficeTypeAdapter.GetOfficeTypes();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public OfficeTypes_LKPDataTable GetOfficeTypeById(Guid OfficeTypeId)
		{
			return IgrssAdapters.OfficeTypeAdapter.GetOfficeTypeById(OfficeTypeId);
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool CreateOfficeType(string OfficeTypeName, string Description, XmlDocument OfficeProcess)
		{
			Guid OfficeTypeId= Guid.NewGuid();
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int rowsAffected = IgrssAdapters.OfficeTypeAdapter.CreateOfficeType(OfficeTypeId, OfficeTypeName, Description, OfficeProcess, curUser, DateTime.Now);
				if (0 < rowsAffected)
					return true;
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateOfficeType(Guid OfficeTypeId, string OfficeTypeName, string Description, XmlDocument OfficeProcess)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int rowsAffected = IgrssAdapters.OfficeTypeAdapter.UpdateOfficeType(OfficeTypeName, Description, OfficeProcess, curUser, DateTime.Now, OfficeTypeId);
				if (0 < rowsAffected)
					return true;
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
		public bool DeleteOfficeType(Guid OfficeTypeId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int rowsAffected = IgrssAdapters.OfficeTypeAdapter.DeleteOfficeType(OfficeTypeId);
				if (0 < rowsAffected)
					return true;
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

	}
}
