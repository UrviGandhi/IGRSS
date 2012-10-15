//Vendor Master
//ClassName     - Vendor Master
//Purpose       - This class contains functions for adding new vendor,updating vendor info and deleting the vendor.
//Author        : Pradeep Sahoo
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      --
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using VendorTable= IGRSS.DataAccessLayer.VendorMaster.VendorMasterDataTable;
using IGRSS.DataAccessLayer.VendorMasterTableAdapters;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	class VendorMaster
	{
		VendorMasterTableAdapter VendorAdapter = new VendorMasterTableAdapter();
		/// <summary>
		/// This function returns the Row of the VendorMaster Table.Row contains all the columns of the VendorMaster Table.
		/// </summary>
		/// <returns>VendorMaster Data Row</returns>
		public static DataRow GetRow()
		{
			return new IGRSS.DataAccessLayer.VendorMaster.VendorMasterDataTable().NewVendorMasterRow();
		}
		/// <summary>
		/// This function insert new Vendor Details.
		/// </summary>
		/// <param name="Parameter">Contains all the fields of the formview</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public void AddVendorDetails(FormViewParameter Parameter)
		{	
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IGRSS.DataAccessLayer.VendorMaster.VendorMasterRow Row = (IGRSS.DataAccessLayer.VendorMaster.VendorMasterRow) Parameter.Values;
				VendorAdapter.AddNewVendorDetails(Guid.NewGuid(), Row.VendorType, Row.CompanyName, Row.VendorName, Row.Address, Row.Phone, Row.ContactPerson, curUser, DateTime.Now);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		/// <summary>
		/// This function update the vendor informaton.
		/// </summary>
		/// <param name="Parameter"></param>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public void UpdateVendorDetails(FormViewParameter Parameter)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IGRSS.DataAccessLayer.VendorMaster.VendorMasterRow Row = (IGRSS.DataAccessLayer.VendorMaster.VendorMasterRow) Parameter.Values;
				VendorAdapter.UpdateVendorDetailByVendorID(Row.VendorType, Row.CompanyName, Row.VendorName, Row.Address, Row.Phone, Row.ContactPerson, curUser, DateTime.Now, Row.VendorID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public void UpdateVendorDetails(string VendorType,string CompanyName,string VendorName,string Address,string Phone,string ContactPerson,Guid VendorID)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				VendorAdapter.UpdateVendorDetailByVendorID(VendorType, CompanyName, VendorName, Address, Phone, ContactPerson, curUser, DateTime.Now, VendorID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		/// <summary>
		/// This functions returns the Vendor information.
		/// </summary>
		/// <param name="VendorID">Guid of the vendor</param>
		/// <returns></returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public void GetVendorDetailsByvendorId(Guid VendorID)
		{
			try
			{
				VendorAdapter.GetVendorDetailByID(VendorID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public void GetVendorDetailsByvendorId(string VendorName)
		{
			try
			{
				VendorAdapter.GetVendorDetailByName(VendorName);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
		}
	}
}
