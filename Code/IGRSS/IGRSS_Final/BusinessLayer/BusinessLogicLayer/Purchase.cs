//Purchase
//ClassName     - Purchase
//Purpose       - This business class contains a business logic for Maintaing Purchase details provided by different vendors.
//Author        : Pradeep Sahoo
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------

using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;

using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using System.Data;
using ItemMasterTable = IGRSS.DataAccessLayer.Purchase.ItemMasterDataTable;
using UOMMasterTable = IGRSS.DataAccessLayer.Purchase.UOMMasterDataTable;
using PurchaseRegDetailTable = IGRSS.DataAccessLayer.Purchase.PurchaseRegDetailDataTable;
using PurchaseRegHeaderTable = IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderDataTable;
using VendorMasterTable = IGRSS.DataAccessLayer.Purchase.VendorMasterDataTable;
using EmployeeMasterTable = IGRSS.DataAccessLayer.Purchase.VendorMasterDataTable;
using UOMMasterRow=IGRSS.DataAccessLayer.Purchase.UOMMasterRow;
using ItemMasterRow = IGRSS.DataAccessLayer.Purchase.ItemMasterRow;
using VendorMasterRow = IGRSS.DataAccessLayer.Purchase.VendorMasterRow;
using PurchaseRegDetailRow = IGRSS.DataAccessLayer.Purchase.PurchaseRegDetailRow;
using PurchaseRegHeaderRow = IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderRow;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Purchase
	{
		
		/// <summary>
		/// This function Gets a row of UOM Master , UOM-Unit Of Management 
		/// </summary>
		/// <returns>a new row i.e,UOMMasterRow</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public static UOMMasterRow GetRow()
		{
			return new UOMMasterTable().NewUOMMasterRow();

		}
		/// <summary>
		/// This functionn Gets all the records present in UOMMasterTable
		/// </summary>
		/// <returns>a Datatable object i.e,UOMMasterTable containg all the records </returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public UOMMasterTable GetUOMMasterTableDetails()
		{
			return IgrssAdapters.UOMMaster.GetData();

		}
		/// <summary>
		/// This function Inserts a new record in UOMMaster Table 
		/// </summary>
		/// <param name="Parameter">FormviewParameter</param>
		/// <returns>true, a record is inserted successfully</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool InsertUomMaster(FormViewParameter Parameter)
		{
			Guid UomID = Guid.NewGuid();
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Purchase.UOMMasterRow row = (IGRSS.DataAccessLayer.Purchase.UOMMasterRow) Parameter.Values;
			IgrssAdapters.UOMMaster.InsertUOMMaster(UomID, row.Name, row.Description, curUser, DateTime.Now);
			return true;
             
		}

		/// <summary>
		/// This function Updates the records in UOMMaster 
		/// </summary>
		/// <param name="Parameter">Formviewparameter</param>
		/// <param name="UomID">Primary key of UOMMaster Table </param>
		/// <returns>true,a record is inserted successfully</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool UpdateUomMaster(FormViewParameter Parameter,Guid UomID)
		{
			//Guid UomID = Guid.NewGuid();
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Purchase.UOMMasterRow row = (IGRSS.DataAccessLayer.Purchase.UOMMasterRow) Parameter.Values;
			IgrssAdapters.UOMMaster.UpdateUOMMaster(UomID, row.Name, row.Description, curUser, DateTime.Now);
			return true;

		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]


        public bool DeleteUomMaster(Guid UomID)
        {
            //Guid UomID = Guid.NewGuid();
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.UOMMaster.DeleteUOMMaster(curUser, DateTime.Now, UomID);
            return true;

        }
		/// <summary>
		/// This function Updates the record in the UOMMaster
		/// </summary>
		/// <param name="UomID">UomID</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>true,a record is updated successfully</returns>

	[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		
		public bool UpdateUOMMaster(Guid UomID, string Name, string Description)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.UOMMaster.UpdateUOMMaster(UomID, Name, Description, UserName, DateTime.Now);
			return true;

		}
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public UOMMasterTable GetUOMMasterByUOMID(Guid UomID)
        {

            return IgrssAdapters.UOMMaster.GetUOMMasterByUOMID(UomID);
            

        }
		
	/// <summary>
	/// This function aims for getting a new row of ItemMasterRow
	/// </summary>
	/// <returns>a new row,ItemMasterRow</returns>


		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public static ItemMasterRow GetItemMasterRow()
		{
			return new ItemMasterTable().NewItemMasterRow();

		}

		/// <summary>
		/// This function Inserts a new record in ItemMaster table
		/// </summary>
		/// <param name="Parameter">FormviewParameter</param>
		/// <returns>true,a record is updated successfully</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool InsertItemMaster(FormViewParameter Parameter)
		{
			Guid ItemID = Guid.NewGuid();
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Purchase.ItemMasterRow row = (IGRSS.DataAccessLayer.Purchase.ItemMasterRow) Parameter.Values;
            try
            {
			int i=IgrssAdapters.ItemMaster.InsertItemMaster(ItemID, row.Name, row.Description,row.UomID, curUser, DateTime.Now);
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
		/// This function selects the ItemMaster Details table 
		/// </summary>
		/// <returns>a datatable i.e,ItemMasterTable conating all the records </returns>
		
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public ItemMasterTable GetItemMasterTableDetails()
		{
			return IgrssAdapters.ItemMaster.SelectItemDetails();

		}
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public ItemMasterTable GetItemMasterTableDetailsByItemID(Guid ItemID)
        {
            return IgrssAdapters.ItemMaster.GetItemDetailsByItemId(ItemID);

        }
		/// <summary>
		/// This function inserts a new record in ItemMaster Table
		/// </summary>
		/// <param name="ItemID">ItemID</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="UomID">UomID</param>
		/// <param name="CreatedBy">CreatedBy</param>
		/// <param name="CreatedAt">CreatedAt</param>
		/// <returns>true, a record is inserted</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		
		public bool InsertItemMaster(string Name, string Description,Guid UomID)
		{
             string userName = Thread.CurrentPrincipal.Identity.Name;
			try
            {
			int i=IgrssAdapters.ItemMaster.InsertItemMaster(Guid.NewGuid(), Name, Description,UomID, userName, DateTime.Now);
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
		/// This function Update records in the ItemMaster
		/// </summary>
		/// <param name="ItemID">ItemID</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="UomID">UomID</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>true, a record is updated</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateItemMaster(Guid ItemID, string Name, string Description,Guid UomID)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;
            try
            {
			int i=IgrssAdapters.ItemMaster.UpdateItemMaster(ItemID, Name, Description,UomID, UserName, DateTime.Now);
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
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteItemMaster(Guid ItemID)
        {
            string UserName = Thread.CurrentPrincipal.Identity.Name;
            
            IgrssAdapters.ItemMaster.DeleteItemMaster(UserName, DateTime.Now, ItemID);

            return true;

        }

		//Operation On Vendor Master

		//[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		//public static VendorMasterRow GetVendorMasterRow()
		//{
		//    return new VendorMasterTable().NewVendorMasterRow();

		//}


		/// <summary>
		/// This function aims for creating a new row of VendorMaster
		/// </summary>
		/// <returns>a new row, NewVendorMasterRow</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]


		public static VendorMasterRow GetVendorMasterRow()
		{
			return new VendorMasterTable().NewVendorMasterRow();

		}

		/// <summary>
		/// This function inserts a new record in  VendorMaster Table
		/// </summary>
		/// <param name="Parameter">formviewParameter</param>
		/// <returns>true, a new record is inserted</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

		public bool InsertVendorMaster(FormViewParameter Parameter)
		{
			Guid VendorID = Guid.NewGuid();
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Purchase.VendorMasterRow row = (IGRSS.DataAccessLayer.Purchase.VendorMasterRow) Parameter.Values;
			IgrssAdapters.VendorMaster.InsertVendorMaster(VendorID, row.VendorType, row.CompanyName, row.VendorName,row.Address,row.Phone,row.ContactPerson, curUser, DateTime.Now);

			return true;

		}

		/// <summary>
		///This function returns all the records present in the VendorMaster Table
		/// </summary>
		/// <returns> a datatable object containg all the records,i.e,vendorMasterTable</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public VendorMasterTable GetVendorMasterTableDetails()
		{
			return IgrssAdapters.VendorMaster.SelectVendorDetails();

		}

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public VendorMasterTable GetVendorMasterByVendorId(Guid VendorID)
        {
            return IgrssAdapters.VendorMaster.GetVendorMasterByVendorId(VendorID);

        }
		/// <summary>
		/// This Function insert a new record in VendorMaster Table
		/// </summary>
		/// <param name="VendorID">VendorID</param>
		/// <param name="VendorType">VendorType</param>
		/// <param name="CompanyName">CompanyName</param>
		/// <param name="VendorName">VendorName</param>
		/// <param name="Address">Address</param>
		/// <param name="Phone">Phone</param>
		/// <param name="ContactPerson">ContactPerson</param>
		/// <param name="CreatedBy">CreatedBy</param>
		/// <param name="CreatedAt">CreatedAt</param>
		/// <returns>true, a record is inserted</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool InsertVendorMaster(Guid VendorID, string VendorType, string  CompanyName, string VendorName, string Address, string Phone, string ContactPerson, string CreatedBy, DateTime CreatedAt)
		{
            string userName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.VendorMaster.InsertVendorMaster(VendorID, VendorType, CompanyName, VendorName, Address, Phone, ContactPerson, userName, DateTime.Now);
			return true;

		}
		/// <summary>
		/// This function updates a record in VendorMaster Table
		/// </summary>
		/// <param name="VendorID"></param>
		/// <param name="VendorType"></param>
		/// <param name="CompanyName"></param>
		/// <param name="VendorName"></param>
		/// <param name="Address"></param>
		/// <param name="Phone"></param>
		/// <param name="ContactPerson"></param>
		/// <param name="CreatedBy"></param>
		/// <param name="CreatedAt"></param>
		/// <returns>true</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateVendorMaster(Guid VendorID, string VendorType, string CompanyName, string VendorName, string Address, string Phone, string ContactPerson)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;

			IgrssAdapters.VendorMaster.UpdateVendorMaster(VendorID, VendorType, CompanyName, VendorName, Address, Phone, ContactPerson, UserName, DateTime.Now);
			return true;

		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteVendorMaster(Guid VendorID, string VendorType, string CompanyName, string VendorName, string Address, string Phone, string ContactPerson, string CreatedBy, DateTime CreatedAt)
        {
            string UserName = Thread.CurrentPrincipal.Identity.Name;

            IgrssAdapters.VendorMaster.DeleteVendorMaster(UserName, DateTime.Now, VendorID);
            return true;

        }
       
		/// <summary>
		/// This function creates a new PurchaseRegDetails table row
		/// </summary>
		/// <returns>PurchaseRegDetailRow</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public static PurchaseRegDetailRow GetPurchaseRegDetailsRow()
		{
			return new PurchaseRegDetailTable().NewPurchaseRegDetailRow();

		}

		/// <summary>
		/// This function returns all the purchaseRegdetails by purchaseId 
		/// </summary>
		/// <param name="PurchaseID">The primary key </param>
		/// <returns>datatable,i.e, PurchaseRegDetailTable containg all the selected records </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public PurchaseRegDetailTable SelectPurchaseRegDetailsByID(Guid PurchaseID)
		{
			return IgrssAdapters.PurchaseRegDetail.SelectPurchaseRegDetailsByID(PurchaseID);

		}
		/// <summary>
		/// This function Insert purchaseRegister details i.e PurchaseRegDetails table
		/// </summary>
		/// <param name="DetailID">DetailID</param>
		/// <param name="PurchaseID">PurchaseID</param>
		/// <param name="ItemID">ItemID</param>
		/// <param name="PackType">PackType</param>
		/// <param name="Quantity">Quantity</param>
		/// <param name="Price">Price</param>
		/// <param name="Value">Value</param>
		/// <param name="CreatedBy">CreatedBy</param>
		/// <param name="CreatedAt">CreatedAt</param>
		/// <returns>true, a record is inserted</returns>


		public bool InsertPurchaseRegDetails(Guid DetailID, Guid PurchaseID, Guid ItemID, string PackType, decimal Quantity , decimal Price, decimal Value, string CreatedBy,DateTime CreatedAt)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.PurchaseRegDetail.InsertPurchaseRegDetails(Guid.NewGuid(), PurchaseID,ItemID, PackType, Quantity, Price, Value, curUser, DateTime.Now);
			return true;

		}

		/// <summary>
		/// This function selects all the records in purchaseRegHeader Table
		/// </summary>
		/// <returns>PurchaseRegHeaderTable</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public PurchaseRegHeaderTable GetPurchaseRequestDetails()
		{
			return IgrssAdapters.PurchaseRegHeader.GetPurchaseRequestDetails();

		}
		/// <summary>
		/// This function selects all the records in purchaseRegHeader Table by passing PurchaseId
		/// </summary>
		/// <param name="PurchaseID">primary key of  purchaseRegHeader Table</param>
		/// <returns>PurchaseRegHeaderTable</returns>

	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public PurchaseRegHeaderTable GetPurchaseDetailsByID(Guid PurchaseID)
		{
			return IgrssAdapters.PurchaseRegHeader.SelectPurchaseHeaderByID(PurchaseID);


		}

		/// <summary>
		/// This function delete a record on the purchaseRegHeader Table by passing purchaseId
		/// </summary>
		/// <param name="PurchaseID">primary key of  purchaseRegHeader Table</param>
		/// <returns>true</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]


		public bool DeletePurchaseRegDetailsByID(Guid PurchaseID)
		{
			IgrssAdapters.PurchaseRegDetail.DeletePurchaseRegDetailsBYID(PurchaseID);
			return true;

		}

		/// <summary>
		/// This function aims for approving purchase order 
		/// </summary>
		/// <param name="PurchaseID">PurchaseID</param>
		/// <param name="PurchaseDate">PurchaseDate</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>true, a record is approved and successfully inserted to database</returns>

		public bool ApprovePurchaseOrder(Guid PurchaseID,DateTime PurchaseDate,string ModifiedBy,DateTime ModifiedAt)

		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.PurchaseRegHeader.ApprovePurchaseOrder(PurchaseID, PurchaseDate, curUser, DateTime.Now);
			return true;

		}

		/// <summary>
		/// This function creates a  new row of PurchaseRegHeaderTable
		/// </summary>
		/// <returns>a new row on PurchaseRegHeaderTable i.e, PurchaseRegHeaderRow</returns>
	[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public static PurchaseRegHeaderRow GetPurchaseRegHeaderRow()
		{
			return new PurchaseRegHeaderTable().NewPurchaseRegHeaderRow();

		}

		/// <summary>
		/// This function Inserts a new records to the purchaseRegHeader Table ,i.e Requesting a purchase order
		/// </summary>
		/// <param name="Parameter">FormviewParameter all the controls on the formview</param>
		/// <param name="PurchaseRegDetails">Datatable object which will be added to the grid , implementing one-Many Relationship</param>
		/// <returns>true, a record is inserted</returns>
		
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool InsertPurchaseRegHeader(FormViewParameter Parameter, DataTable PurchaseRegDetails)
		{
			IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderRow row = (IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderRow) Parameter.Values;
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			Guid PurchaseID= Guid.NewGuid();
		
			IgrssAdapters.PurchaseRegHeader.InsertPurchaseRegHeader(PurchaseID,row.PurRequsitionNo,
				row.VendorID,row.ReqByEmpID,
				row.RequestDate, curUser, DateTime.Now);
			foreach (DataRow PurchaseRegDetail in PurchaseRegDetails.Rows)
			{
				
				IgrssAdapters.PurchaseRegDetail.InsertPurchaseRegDetails(Guid.NewGuid(), PurchaseID, (Guid) PurchaseRegDetail["ItemID"], (string) PurchaseRegDetail["PackType"], (decimal) PurchaseRegDetail["Quantity"], (decimal) PurchaseRegDetail["Price"], (decimal) PurchaseRegDetail["Value"],curUser,DateTime.Now);

			}
			return true;

		}
 /// <summary>
 ///This function  Updates a purchaseRequest 
 /// </summary>
 /// <param name="Parameter">FormviewParameter</param>
		/// <param name="PurchaseRegDetails">Datatable object which will be added to the grid , implementing one-Many Relationship</param>
 /// <param name="PurchaseID">primary key of PurchaseRequest Table</param>
 /// <returns>true, a record is updated</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool UpdatePurchaseRegHeader(FormViewParameter Parameter, DataTable PurchaseRegDetails,Guid PurchaseID)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;

          IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderRow row = (IGRSS.DataAccessLayer.Purchase.PurchaseRegHeaderRow) Parameter.Values;
		  IgrssAdapters.PurchaseRegHeader.UpdatePurchaseRegHeader(PurchaseID, row.PurRequsitionNo,
							   row.VendorID, row.ReqByEmpID, row.RequestDate, curUser, DateTime.Now);

		  
		  IgrssAdapters.PurchaseRegDetail.DeletePurchaseRegDetailsBYID(PurchaseID);


		  foreach (DataRow PurchaseRegDetail in PurchaseRegDetails.Rows)
		  {

			  IgrssAdapters.PurchaseRegDetail.InsertPurchaseRegDetails(Guid.NewGuid(), PurchaseID, (Guid) PurchaseRegDetail["ItemID"], (string) PurchaseRegDetail["PackType"], (decimal) PurchaseRegDetail["Quantity"], (decimal) PurchaseRegDetail["Price"], (decimal) PurchaseRegDetail["Value"], curUser, DateTime.Now);

		  }

	     return true;

		}



		
	}
}
