//Service
//ClassName     - Service
//Purpose       - This business class contains a business logic for Maintaing service details provided by different vendors.
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.DataAccessLayer;
using ServiceTable=IGRSS.DataAccessLayer.Service.ServiceRegisterDataTable;
using System.ComponentModel;
using System.Data;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Service
	{
			/// <summary>
			///  <returns>Service Table Data Row(contains all the row of the leave table)</returns>
			/// </summary>
			/// <remarks>This function will return the Row of the Service table.
			public static DataRow GetRow()
			{
				return new IGRSS.DataAccessLayer.Service.ServiceRegisterDataTable().NewServiceRegisterRow();
			}
			/// <summary>
			/// <param name="Parameter"></param>
			///  <returns>void</returns>
			/// </summary>
			/// <remarks>This function will add the new service details to the service table.
			[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
			public bool AddServiceDetails(FormViewParameter Parameter)
			{
				string curUser = Thread.CurrentPrincipal.Identity.Name;
				try
				{
					IGRSS.DataAccessLayer.Service.ServiceRegisterRow Row = (IGRSS.DataAccessLayer.Service.ServiceRegisterRow) Parameter.Values;
					int i=IgrssAdapters.ServiceAdapter.AddNewServiceDetails(Guid.NewGuid(), Row.ServiceNo, Row.VendorID, Row.ServiceDate, Row.InChargeEmpID, Row.InstrumentRepaired, Row.Remarks, curUser, DateTime.Now);
                    if (i == 1)
                        return true;
                    else
                        return false;

                }
                catch (Exception ex)
                {
                    if (ExceptionPolicy.HandleException(ex, "DAL"))
                        throw;
                    return false;
                }
			
			}
			/// <summary>
			/// <param name="Parameter"></param>
			/// <param name="ServiceID"></param>
			///  <returns>void</returns>
			/// </summary>
			/// <remarks>This function will update the new service details to the service table.
			[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
			public bool UpdateServiceDetails(FormViewParameter Parameter,Guid ServiceID)
			{
				string curUser = Thread.CurrentPrincipal.Identity.Name;
				try
				{
					IGRSS.DataAccessLayer.Service.ServiceRegisterRow Row = (IGRSS.DataAccessLayer.Service.ServiceRegisterRow) Parameter.Values;
					int i=IgrssAdapters.ServiceAdapter.UpdateServiceDetailsByServiceID(Row.ServiceNo, Row.VendorID, Row.ServiceDate, Row.InChargeEmpID, Row.InstrumentRepaired, Row.Remarks, curUser, DateTime.Now, ServiceID);
                    if (i == 1)
                        return true;
                    else
                        return false;

                }
                catch (Exception ex)
                {
                    if (ExceptionPolicy.HandleException(ex, "DAL"))
                        throw;
                    return false;
                }
			
			}
			[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
			public ServiceTable GetServiceDetailsByServiceNo(string ServiceNo)
			{
				ServiceTable Dt = new ServiceTable();
				try
				{
					Dt=IgrssAdapters.ServiceAdapter.GetServiceDetailsByServiceNo(ServiceNo);
				}
				catch (Exception ex)
				{
					if (ExceptionPolicy.HandleException(ex, "DAL"))
						throw;
				}
				return Dt;
			}
			[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]	
			public ServiceTable GetServiceDetailsByServiceID(Guid ServiceID)
			{
				ServiceTable Dt = new ServiceTable();
				try
				{
					Dt=IgrssAdapters.ServiceAdapter.GetServiceDetailsByServiceID(ServiceID);
				}
				catch (Exception ex)
				{
					if (ExceptionPolicy.HandleException(ex, "DAL"))
						throw;
				}
				return Dt;
			}
			[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
			public ServiceTable GetServiceDetailsByVendorName(string VendorName)
			{
				ServiceTable Dt = new ServiceTable();
				try
				{
					Dt=IgrssAdapters.ServiceAdapter.GetServicedetailsByVendor(VendorName);
				}
				catch (Exception ex)
				{
					if (ExceptionPolicy.HandleException(ex, "DAL"))
						throw;
				}
				return Dt;
			}
			/// <summary>
			///  <returns>ServiceTable</returns>
			/// </summary>
			/// <remarks>This function will returns all the service details.
			[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
			public ServiceTable GetAllServiceDetails()
			{
				ServiceTable Dt = new ServiceTable();
				try
				{
					Dt=IgrssAdapters.ServiceAdapter.GetData();
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
