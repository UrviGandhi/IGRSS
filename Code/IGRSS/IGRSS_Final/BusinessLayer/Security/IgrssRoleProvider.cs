using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Security;
using System.Threading;
using System.Data;
using System.Collections;
using System.Configuration.Provider;
using System.ComponentModel;
using IGRSS.BusinessObjects;

namespace IGRSS.Security
{
	public class IgrssRoleProvider : RoleProvider
	{
		public override void AddUsersToRoles(string[] usernames, string[] roleNames)
		{
			throw new Exception("The method or operation is not implemented.");
		}

		public void AddUserToOfficeRole(Guid userId, Guid roleId, Guid officeId, string comments, bool isActive, Guid reportingUserId)
		{
			SecurityAdapters.UsersInRoleAdapter.AddUserToOfficeRole(userId, roleId, officeId, comments, isActive, Thread.CurrentPrincipal.Identity.Name, DateTime.Now, reportingUserId);
		}

		public override string ApplicationName
		{
			get
			{
				throw new Exception("The method or operation is not implemented.");
			}
			set
			{
				throw new Exception("The method or operation is not implemented.");
			}
		}

		public override void CreateRole(string roleName)
		{
			throw new Exception("The method or operation is not implemented.");
		}

		public void CreateRole(string roleName, Guid OfficeTypeId, string description)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			SecurityAdapters.RolesAdapter.AddRole(Guid.NewGuid(), roleName, OfficeTypeId, true, description, curUser, DateTime.Now);
		}

		public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
		{
			throw new Exception("The method or operation is not implemented.");
		}

		public bool DeleteRole(Guid RoleId, Guid OfficeTypeId, bool throwOnPopulatedRole)
		{
			try
			{
				string curUser = Thread.CurrentPrincipal.Identity.Name;
				DataTable OfficeDetails = SecurityAdapters.OfficesAdapter.GetOfficesByType(OfficeTypeId);
				if (throwOnPopulatedRole && (0 < OfficeDetails.Rows.Count))
				{
					throw new ProviderException("Cannot delete a populated role.");
				}

				object[] OfficeIds = IgrssCommon.GetColumnValues(OfficeDetails, "OfficeId");
				foreach (object OfficeId in OfficeIds)
				{
					SecurityAdapters.UsersInRoleAdapter.DeactivateUsersInOfficeRole(RoleId, (Guid) OfficeId, curUser, DateTime.Now);
				}

				if (0 < SecurityAdapters.RolesAdapter.DeactivateRoleById(RoleId, curUser, DateTime.Now))
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return true;
		}

		public override string[] FindUsersInRole(string roleName, string usernameToMatch)
		{
			throw new Exception("The method or operation is not implemented.");
		}

		public string[] FindUsersInRole(Guid roleId, string usernameToMatch)
		{
			DataTable UsersInOfficeRole = SecurityAdapters.MembershipAdapter.GetUsersInOfficeRole(usernameToMatch, roleId);

			return (string[]) IgrssCommon.GetColumnValues(UsersInOfficeRole, "Username");
		}

		public override string[] GetAllRoles()
		{
			DataTable UserRoles = SecurityAdapters.RolesAdapter.GetRoleNames();
			return Array.ConvertAll(IgrssCommon.GetColumnValues(UserRoles, "RoleName"),
									new Converter<object, string>(Convert.ToString));
		}

		public string[] GetAllRolesByOfficeType(Guid OfficeTypeId)
		{
			DataTable UserRoles = SecurityAdapters.RolesAdapter.GetRolesByOfficeType(OfficeTypeId);
			return Array.ConvertAll(IgrssCommon.GetColumnValues(UserRoles, "RoleNAme"),
									new Converter<object, string>(Convert.ToString));
		}

		public override string[] GetRolesForUser(string username)
		{
			Guid UserId = (Guid) SecurityAdapters.MembershipAdapter.GetUserId(username);
			DataTable UserRoles = SecurityAdapters.RolesAdapter.GetRolesByUserId(UserId);
			return Array.ConvertAll(IgrssCommon.GetColumnValues(UserRoles, "RoleName"),
									new Converter<object, string>(Convert.ToString));
		}

		public override string[] GetUsersInRole(string roleName)
		{
			Guid RoleId = (Guid) SecurityAdapters.RolesAdapter.GetRoleIdByName(roleName);
			DataTable UsersInRole = SecurityAdapters.MembershipAdapter.GetUsersInRoleById(RoleId);
			return Array.ConvertAll(IgrssCommon.GetColumnValues(UsersInRole, "Username"),
									new Converter<object, string>(Convert.ToString));
		}

		public override bool IsUserInRole(string username, string roleName)
		{
			bool userIsInRole = false;

			Guid RoleId = (Guid) SecurityAdapters.RolesAdapter.GetRoleIdByName(roleName);
			Guid UserId = (Guid) SecurityAdapters.MembershipAdapter.GetUserId(username);

			int numRecs = (int) SecurityAdapters.UsersInRoleAdapter.GetUserInRoleInstances(UserId, RoleId);

			if (numRecs > 0)
			{
				userIsInRole = true;
			}

			return userIsInRole;
		}

		public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
		{
			throw new Exception("The method or operation is not implemented.");
		}

		public void RemoveUsersFromRoles(Guid userId, Guid roleId, Guid OfficeId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			SecurityAdapters.UsersInRoleAdapter.DeActivateUserOfficeRole(curUser, DateTime.Now, userId, roleId, OfficeId);
		}

		public override bool RoleExists(string roleName)
		{
			bool retVal = false;
			if (null != SecurityAdapters.RolesAdapter.GetRoleIdByName(roleName))
				retVal = true;
			return retVal;
		}

	}
}
