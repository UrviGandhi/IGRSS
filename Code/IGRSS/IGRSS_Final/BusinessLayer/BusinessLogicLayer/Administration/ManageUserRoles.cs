using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using System.Data;
using UserInOfficeRolesTable = IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesDataTable;
using UserInOfficeRoleRow = IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class ManageUserRoles
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public UserInOfficeRolesTable GetUserInRoles()
		{
			return IgrssAdapters.UsersInOfficeRole.GetUserDetailsInOfficeRoles();
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public UserInOfficeRolesTable GetUserInRolesByUserName(string userName)
		{
			return IgrssAdapters.UsersInOfficeRole.GetUserDetailsInOfficeRolesByUserName(userName);
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool AddNewUserInOfficeRoles(FormViewParameter Parameter)
		{
			IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow row = (IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			
			IgrssAdapters.UsersInOfficeRole.AddNewUserInOfficeRoles(row.Username,row.DesignationID,row.OfficeId,row.Comments,row.IsActive,curUser,DateTime.Now);

			return true;

		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool AddNewUserInOfficeRoles(FormViewParameter Parameter,string UserName)
		{
			IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow row = (IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;

			IgrssAdapters.UsersInOfficeRole.UpdateUserInOfficeRoles(UserName, row.DesignationID, row.OfficeId, row.Comments, row.IsActive, curUser, DateTime.Now);

			return true;
		}


		[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
		public bool DeleteUserInRolesbyUserName(string userName,Guid DesignationID)
		{

            IgrssAdapters.UsersInOfficeRole.DeleteUsersInOfficeRolesByDesignationId(userName, DesignationID);

			return true;
		}

        public bool UpdateUserRoles(FormViewParameter Parameter,string UserName)
        {
            return true;
        }

		public static UserInOfficeRoleRow GetUserInOfficeRow()
		{
			return new UserInOfficeRolesTable().NewUsersInOfficeRolesRow();

		}


	}
}
