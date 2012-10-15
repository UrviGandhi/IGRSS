//UserManagement
//ClassName     - UserManagement
//Purpose       - This class contains functions for adding new user,Updating user info and deleting the user.
//Author        : Pradeep Sahoo
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      --
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using OfficesTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterDataTable;
using OfficeTypesTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeTypes_LKPDataTable;
//using OfficeProcess_LKP = IGRSS.DataAccessLayer.OfficesMaster.OfficeProcess_LKPDataTable;
using System.ComponentModel;

using IGRSS.BusinessObjects;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using OfficesCommunication_LKPDataTable = IGRSS.DataAccessLayer.OfficesMaster.OfficesCommunication_LKPDataTable;
namespace IGRSS.BusinessLogicLayer.Administration
{
	[DataObject]
	public class ManageOffices
	{
		#region OfficesMaster
		/// <summary>
		/// This function will return all the Offices details.Details Contains all the information related to the Office,i.e..OfficeName,Location,Address,Phone No.
		/// </summary>
		/// <returns>OfficesTable(Contauns all the records of the Office Table)</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public OfficesTable GetOffices()
		{
			OfficesTable Dt = new OfficesTable();
			try
			{
				Dt=IgrssAdapters.OfficesAdapter.GetOffices();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
		/// <summary>
		/// This function will add new office to the Offices table.
		/// </summary>
		/// <param name="OfficeName">Name of the Office(i.e,SRO Gandhinagar,Sro Ahemadabad)</param>
		/// <param name="OfficeTypeId"></param>
		/// <param name="Description"></param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool CreateNewOffice(string OfficeName, Guid OfficeTypeId, string Description,int DistrictCode,int TalukaCode,int VillageCode)
		{
			string username = Thread.CurrentPrincipal.Identity.Name;
			try
			{
                //if (1 > IgrssAdapters.OfficesAdapter.AddNewOffice(Guid.NewGuid(), OfficeName,  Description, DistrictCode, TalukaCode, VillageCode, username, DateTime.Now))
                //{
                //    return false;
                //}

				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}
		/// <summary>
		/// This function will update the existing Office details.
		/// </summary>
		/// <param name="OfficeId"></param>
		/// <param name="OfficeName"></param>
		/// <param name="OfficeTypeId"></param>
		/// <param name="Description"></param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool UpdateOfficeDetailsById(Guid OfficeId, string OfficeName, Guid OfficeTypeId, string Description)
		{
			string username = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				//if (1 > IgrssAdapters.OfficesAdapter.UpdateOfficeDetailsById(OfficeId, OfficeName, OfficeTypeId, Description, username, DateTime.Now))
				//{
				//    return false;
				//}

			
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}
		/// <summary>
		/// This function will return Particular Office Details.
		/// </summary>
		/// <param name="OfficeId">Guid of the Office for which details has to be return.</param>
		/// <returns>OfficesTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public OfficesTable GetOfficeDetailsById(Guid OfficeId)
		{
			OfficesTable Dt = new OfficesTable();
			try
			{
				Dt=IgrssAdapters.OfficesAdapter.GetOfficeInfoById(OfficeId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
		/// <summary>
		/// 
		/// This function will return the Office Name.It will take Guid as a parameter.
		/// </summary>
		/// <param name="OfficeId">Guid of the Office,for which name has to be return.</param>
		/// <returns>String(Contains OfficeName)</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public string GetOfficeNameById(Guid OfficeId)
		{
			string st = null;
			try
			{
				st=IgrssAdapters.OfficesAdapter.GetOfficeNameById(OfficeId).ToString();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return st;
		}
		/// <summary>
		/// Seraching Office details by OfficeName.
		/// </summary>
		/// <param name="OfficeNameToMatch"></param>
		/// <returns></returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public OfficesTable SearchOfficeByName(string OfficeNameToMatch)
		{
			OfficesTable Dt = new OfficesTable();
			try
			{
				Dt=IgrssAdapters.OfficesAdapter.FindOfficeByName(OfficeNameToMatch);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		/// <summary>
		/// This function is used to DeActivate the particular Office.If the office is deactivate,Means not in use currently.
		/// </summary>
		/// <param name="OfficeId"></param>
		[DataObjectMethodAttribute(DataObjectMethodType.Delete,true)]
		public void DeActivateOffice(Guid OfficeId)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.OfficesAdapter.DeActivateOffice(curUser, DateTime.Now, OfficeId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}

		public bool IsOfficeActive()
		{
			throw new System.NotImplementedException();
		}
		#endregion

		#region Workflow Support

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public OfficesCommunication_LKPDataTable GetCommunicatingOfficesByOfficeId(Guid OfficeId)
		{
			return IgrssAdapters.OfficeCommunication_LKP.GetCommunicatingOfficesByOfficeId(OfficeId);
		}

		#endregion
	}
}
