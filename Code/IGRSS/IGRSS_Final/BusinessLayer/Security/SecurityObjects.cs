using System;
using System.Collections.Generic;
using System.Text;

using IGRSS.DataAccessLayer.MembershipsTableAdapters;

namespace IGRSS.Security
{
	internal static class SecurityAdapters
	{
		public static MembershipsTableAdapter MembershipAdapter = new MembershipsTableAdapter();

		public static UsersInOfficeRolesTableAdapter UsersInRoleAdapter = new UsersInOfficeRolesTableAdapter();

		public static RolesTableAdapter RolesAdapter = new RolesTableAdapter();

		public static OfficesTableAdapter OfficesAdapter = new OfficesTableAdapter();

	}
}
