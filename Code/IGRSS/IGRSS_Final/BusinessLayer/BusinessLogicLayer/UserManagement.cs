//UserManagement
//ClassName     - UserManagement
//Purpose       - This class contains functions for adding new user,Updating user info and deleting the user.
//Author        : Pradeep Sahoo
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Web.Security;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

using MembershipsTable = IGRSS.DataAccessLayer.Memberships.MembershipsDataTable;
using MembershipsTableAdapter = IGRSS.DataAccessLayer.MembershipsTableAdapters.MembershipsTableAdapter;

namespace IGRSS.BusinessLogicLayer
{
	[DataObject()]
	public class UserManagement
	{
		
		MembershipsTableAdapter MembershipAdapter = new MembershipsTableAdapter();

		/// <summary>
		/// This function will create new user.
		/// </summary>
		/// <param name="username"></param>
		/// <param name="password"></param>
		/// <param name="email"></param>
		/// <param name="isApproved"></param>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public void CreateUser(string username, string password, string email, bool isApproved)
		{
			MembershipCreateStatus status;
			try
			{
				Provider.CreateUser(username, password, email, "", "", isApproved, Guid.NewGuid(), out status);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public void GetAllUsers()
		{
			
		}
		/// <summary>
		/// This function will return particular user information.
		/// </summary>
		/// <param name="username"></param>
		/// <param name="email"></param>
		/// <returns>MembershipsTable(Contains all the information of the Users. </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public MembershipsTable FindUsers(string username, string email)
		{
			MembershipsTable Dt = new MembershipsTable();
			try
			{
				Dt=MembershipAdapter.GetUsersByNameOrEmail("%" + username + "%", "%" + email + "%");
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
