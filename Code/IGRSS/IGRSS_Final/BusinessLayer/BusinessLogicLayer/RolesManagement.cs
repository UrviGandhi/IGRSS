using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

using IGRSS.BusinessObjects;
using RolesTable = IGRSS.DataAccessLayer.Memberships.RolesDataTable;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject()]
	public class RolesManagement
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public RolesTable GetRoles()
		{
			RolesTable Dt = new RolesTable();
			try
			{
				Dt=IgrssAdapters.RolesAdapter.GetRoles();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public RolesTable GetRolesInOfficeType(Guid OfficeTypeId)
		{
			RolesTable Dt = new RolesTable();
			try
			{
				Dt=IgrssAdapters.RolesAdapter.GetRolesByOfficeType(OfficeTypeId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public RolesTable GetRolesInOffice(Guid OfficeId)
		{
			RolesTable Dt = new RolesTable();
			try
			{
				Guid OfficeTypeId = (Guid) IgrssAdapters.OfficesAdapter.GetOfficeInfoById(OfficeId).Rows[0]["OfficeTypeId"];
				return GetRolesInOfficeType(OfficeTypeId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewRole(string RoleName, Guid OfficeTypeId, string Description, bool IsActive)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				if (0 < IgrssAdapters.RolesAdapter.AddRole(Guid.NewGuid(), RoleName, OfficeTypeId, IsActive, Description, curUser, DateTime.Now))
				{
					return true;
				}
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
		public bool DeleteRole(Guid RoleId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				if (0 < IgrssAdapters.RolesAdapter.DeleteRole(RoleId, curUser, DateTime.Now))
				{
					return true;
				}
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
				return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update)]
		public bool DeActivateRole(Guid RoleId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				if (0 < IgrssAdapters.RolesAdapter.DeactivateRoleById(RoleId, curUser, DateTime.Now))
				{
					return true;
				}
			
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateRoleInformation(Guid RoleId, string RoleName, Guid OfficeTypeId, string Description, bool IsActive)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				if (0 < IgrssAdapters.RolesAdapter.UpdateRole(RoleId, RoleName, OfficeTypeId, IsActive, Description, curUser, DateTime.Now))
				{
					return true;
				}
			
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return false;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public RolesTable GetRoleDetails(Guid RoleId)
		{
			RolesTable Dt = new RolesTable();
			try
			{
				Dt=IgrssAdapters.RolesAdapter.GetRole(RoleId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public RolesTable GetRoleDetails(string RoleName)
		{
			RolesTable Dt = new RolesTable();
			try
			{
				Guid RoleId = (Guid) IgrssAdapters.RolesAdapter.GetRoleIdByName(RoleName);
				Dt= GetRoleDetails(RoleId);
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
