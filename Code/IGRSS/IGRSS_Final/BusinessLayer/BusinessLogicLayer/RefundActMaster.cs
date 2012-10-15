
//Refund
//ClassName     - Refund Act Master
//Purpose       - This business class contains a business logic for Refund Act Master
//Author        : Pradeep Sahoo
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------

using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using ActMasterTable = IGRSS.DataAccessLayer.ActMaster.ActMasterDataTable;
using ActMasterRow = IGRSS.DataAccessLayer.ActMaster.ActMasterRow;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{ 
	[DataObject]

	public class RefundActMaster
	{


		/// <summary>
		/// This function Gets All the Records of ActMaster
		/// </summary>
		/// <returns>Datatable object i.e, ActMasterTable containing all the records in Actmaster Data table</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public ActMasterTable GetActMasterDetails()
		{
			ActMasterTable Dt = new ActMasterTable();
			try
			{
				Dt=IgrssAdapters.ActMasterAdapter.GetActMasterDetails();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

		/// <summary>
		/// Getting the Act Details by ActId 
		/// </summary>
		/// <param name="ActId">ActId ,the primary key of ActMaster table</param>
		/// <returns>a Datatable object i.e,ActMasterTable, All the Records per ActId </returns>
		
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public ActMasterTable GetActDetailsById(Guid ActId)
		{
			ActMasterTable Dt = new ActMasterTable();
			try
			{
				Dt=IgrssAdapters.ActMasterAdapter.GetActMasterDetailsById(ActId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete)]
        public bool DeleteActMaster(Guid ActId)
        {
           string curUser = Thread.CurrentPrincipal.Identity.Name;
           IgrssAdapters.ActMasterAdapter.DeleteActMaster(curUser, DateTime.Now, ActId);
           return true;
          
        }

		/// <summary>
		/// Inserting a New Records to Act Master Table 
		/// </summary>
		/// <param name="DescriptionOfAct">DescriptionOfAct</param>
		/// <param name="NameOfAct">NameOfAct</param>
		/// <returns>true , a new record is inserted </returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool InsertNewActMaster(string DescriptionOfAct,string NameOfAct)

		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			try
			{

                int i = IgrssAdapters.ActMasterAdapter.InsertNewActMaster(Guid.NewGuid(), DescriptionOfAct, NameOfAct, "REF", curUser, DateTime.Now);
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
		///This function updates  the Act Master  table
		/// </summary>
		/// <param name="ActId">The Primary key based on which the record can be found</param>
		/// <param name="DescriptionOfAct">description of act</param>
		/// <param name="NameOfAct">Name of act</param>
		/// <returns>true, i.e, a record is updated </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateActMaster( Guid  ActId,string DescriptionOfAct,string NameOfAct )
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
			{
                int i=IgrssAdapters.ActMasterAdapter.UpdateActMasterDetails(ActId, DescriptionOfAct, NameOfAct, curUser, DateTime.Now);
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
		///This function gets  all the records of ActMaster
		/// </summary>
		/// <returns>Datatable object containg all the records , i.e,ActMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public ActMasterTable GetActMaster()
		{
			ActMasterTable Dt = new ActMasterTable();
			try
			{
				Dt=IgrssAdapters.ActMasterAdapter.GetActMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;

		}
		/// <summary>
		/// This function Adds a new record to Act Master 
		/// </summary>
		/// <param name="Parameter">formview which contains all the controls</param>
		/// <returns>true, a record is inserted successfully </returns>


		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool AddNewActMaster(FormViewParameter Parameter)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid ActId=Guid.NewGuid();
			IGRSS.DataAccessLayer.ActMaster.ActMasterRow row = (IGRSS.DataAccessLayer.ActMaster.ActMasterRow) Parameter.Values;
			IgrssAdapters.ActMasterAdapter.AddNewActMaster(ActId, row.DescriptionOfAct, row.NameOfAct, curUser, DateTime.Now);
			return true;

		}
	}
}
