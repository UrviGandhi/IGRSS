//InwardOutward 
//ClassName     - InwardOutward
//Purpose       - This business class contains a business logic for Adding Updating or deleting Inward details.
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using InwardTable = IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterDataTable;
using DeliveryTable = IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPDataTable;
using PostalDenomTable = IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterDataTable;
using PostalRequestTable = IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqDataTable;
using PostaldeliveryLKPDataTable = IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPDataTable;

using System.Data;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
    [DataObject]
    public class InwardOutward
    {
        #region Inward Outward Methods
        /// <summary>
        /// <returns>Inward Data Row</returns>
        /// </summary>
        /// <remarks>This function is used to get all the row of the Inward Data Table.Row will contain all the columns of the Inward Table. </remarks>
        public static DataRow GetRow()
        {
            return new IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterDataTable().NewInward_OutwardRegisterRow();
        }
        /// <summary>
        /// <returns>vois</returns>
        /// <param name="Parameter">Contains all the fields of the formview</param>
        /// </summary>
        /// <remarks>This function is used to add the new record in to table. 
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddInwardDetails(FormViewParameter Parameter)
        {
            //, Row.DeliveryBranch, Row.DocumentSender, Row.ReceiversName
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow)Parameter.Values;
                int i = IgrssAdapters.InwardAdapter.AddInwardOutwardDetails(Guid.NewGuid(), "", Row.DocumentNo, Row.InOutDate, Row.DocType, Row.SentOfficeID, Row.ReceivingOfficeID, Row.DocumentSentFrom, Row.DocumentSentTo, Row.Description, Row.StampValueAffixed, Row.DeliveryType, Row.Remarks, curUser, DateTime.Now,Row.InwardNo,  Row.ApplicantName, Row.ApplicantAddress, DateTime.Now );
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
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddOutWardDetails(FormViewParameter Parameter)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                
                IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow)Parameter.Values;
                //int i = IgrssAdapters.InwardAdapter.AddOutwardDetails(Guid.NewGuid(), "", Row.DocumentNo, Row.InOutDate, Row.DocType, Row.SentOfficeID, Row.ReceivingOfficeID, Row.DocumentSentFrom, Row.DocumentSentTo, Row.Description, Row.StampValueAffixed, Row.DeliveryType, Row.Remarks, curUser, DateTime.Now, Row.DeliveryBranch, Row.DocumentSender, Row.ReceiversName);
                //if (i == 1)
                //    return true;
                //else
                return false;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }


        }

        //[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        //public bool AddBranchToBranchInwardDetails(FormViewParameter Parameter)
        //{
        //    string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    try
        //    {
        //        IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow)Parameter.Values;
        //        int i=IgrssAdapters.InwardAdapter.AddBranchToBranchInwardDetails(Guid.NewGuid(), Row.DocumentNo, Row.InOutDate, Row.DocType, Row.SentOfficeID,Row.Description, Row.Remarks, curUser, DateTime.Now);
        //        if (i == 1)
        //            return true;
        //        else
        //            return false;

        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //        return false;
        //    }


        //}
        ///// <summary>
        ///// <param name="Parameter">Contains all the fields of the formview</param>
        ///// <param name="Inward_OutwardId"></param>
        /////  <returns>Void</returns>
        ///// </summary>
        ///// <remarks>This function is used to update the record in to table. 
        //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        //public bool  UpdateInwardDetails(FormViewParameter Parameter, Guid Inward_OutwardId)
        //{
        //    //string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    //try
        //    //{
        //    //    IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow) Parameter.Values;
        //    //    int i=IgrssAdapters.InwardAdapter.UpdateInwardDetails(Inward_OutwardId,  Row.DocumentNo,  Row.InOutDate,  Row.DocType,  Row.SentOfficeID,  Row.ReceivingOfficeID,  Row.DocumentSentFrom,  Row.DocumentSentTo,  Row.Description,  Row.StampValueAffixed,  Row.DeliveryType,  Row.Remarks,  curUser,  DateTime.Now,Row.InwardNo,"","",DateTime.Now ,Row.DeliveryBranch, Row.DocumentSender, Row.ReceiversName);
        //    //    if (i == 1)
        //    //        return true;
        //    //    else
        //    //        return false;

        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    if (ExceptionPolicy.HandleException(ex, "DAL"))
        //    //        throw;
        //        return false;
        //    //}



        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        //public bool UpdateOutwardDetails(FormViewParameter Parameter, Guid Inward_OutwardId)
        //{
        //    //string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    //try
        //    //{
        //    //    IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow)Parameter.Values;
        //    //    IgrssAdapters.InwardAdapter.UpdateOutWardDetails(Row.DocumentNo, Row.InOutDate, Row.DocType, Row.SentOfficeID, Row.ReceivingOfficeID, Row.DocumentSentFrom, Row.DocumentSentTo, Row.Description, Row.StampValueAffixed, Row.DeliveryType, Row.Remarks, curUser, DateTime.Now, Row.DeliveryBranch,Row.DocumentSender,Inward_OutwardId);
        //    //    return true;
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    if (ExceptionPolicy.HandleException(ex, "DAL"))
        //    //        throw;
        //    //    return false;
        //    //}

        //    return false;



        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        //public bool UpdateBranchToBranchInwardDetails(FormViewParameter Parameter, Guid Inward_OutwardId)
        //{
        //    //string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    //try
        //    //{
        //    //    IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow Row = (IGRSS.DataAccessLayer.InwardOutward.Inward_OutwardRegisterRow)Parameter.Values;
        //    //    IgrssAdapters.InwardAdapter.UpdateBranchToBranchInwardDetails(Inward_OutwardId,Row.InOutDate, Row.DocType, Row.SentOfficeID,Row.Description,Row.Remarks,Row.DeliveryBranch,Row.SenderBranch);
        //    //    return true;
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    if (ExceptionPolicy.HandleException(ex, "DAL"))
        //    //        throw;
        //        return false;
        //    //}



        //}
        ///// <summary>
        ///// <param name="Inward_OutwardId"></param>
        /////  <returns>InwardTable</returns>
        ///// </summary>
        ///// <remarks>This function will get the Inward Outward details.
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public InwardTable GetInwardDetailsByInwardId(Guid Inward_outwardId)
        //{
        //    InwardTable InvDt = new InwardTable();
        //    try
        //    {
        //        InvDt=IgrssAdapters.InwardAdapter.GetInwarddetailsByInwardId(Inward_outwardId);
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //    return InvDt;
        //}
        ///// <summary>
        /////  <returns>DeliveryTable</returns>
        ///// </summary>
        ///// <remarks>This function will get the Delivery type(i.e,By courier,hand,post)
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public DeliveryTable GetDeliveryType()
        //{
        //    DeliveryTable DeliDt = new DeliveryTable();
        //    try
        //    {
        //        DeliDt=IgrssAdapters.DeliveryAdapter.GetData();
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //    return DeliDt;
        //}
        ///// <summary>
        /////  <returns>InwardTable</returns>
        ///// </summary>
        ///// <remarks>This function will get all the Inward Outward details.
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public InwardTable GetAllInwardDetails(Guid Inward_outwardId)
        {
            InwardTable InvDt = new InwardTable();
            try
            {
                InvDt = IgrssAdapters.InwardAdapter.GetAllInwardOutwardDetails();

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return InvDt;
        }
    }


    //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
    //public InwardTable GetAllOutwardDetails()
    //{
    //    InwardTable InvDt = new InwardTable();
    //    try
    //    {
    //        InvDt = IgrssAdapters.InwardAdapter.GetAllOutwardDetails();

    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //    return InvDt;
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
    //public InwardTable GetAllOutwardDetailsById(Guid OutwardId)
    //{
    //    InwardTable InvDt = new InwardTable();
    //    try
    //    {
    //        InvDt = IgrssAdapters.InwardAdapter.GetOutwardDetailsByOutwardId(OutwardId);

    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //    return InvDt;
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

    //public InwardTable GetAllBranchInwardDetails()
    //{
    //    InwardTable InvDt = new InwardTable();
    //    try
    //    {
    //        InvDt = IgrssAdapters.InwardAdapter.GetAllBranchInwardDetails();

    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //    return InvDt;
    //}
    //#endregion

    //#region Postal Stamp Denom Master
    //public static DataRow GetPostalStampRow()
    //{


    //        return new  IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterDataTable().NewPostalStampDenomMasterRow();



    //}
    //public static DataRow GetPostalDeliveryRow()
    //{
    //        return new IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPDataTable().NewPostalDeliveryType_LKPRow();

    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
    //public void AddPostalStampDenomDetails(FormViewParameter Parameter)
    //{
    //    string curUser = Thread.CurrentPrincipal.Identity.Name;
    //    try
    //    {
    //        IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterRow Row = (IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterRow) Parameter.Values;
    //        IgrssAdapters.PostalDenomAdapter.AddPostalStampDenomDetails(Guid.NewGuid(), Row.Name, Row.Description, Row.Amount, Row.IsActive, curUser, DateTime.Now);
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
    //public void UpdatePostalStampDenomDetails(FormViewParameter Parameter, Guid StampDenomId)
    //{
    //    string curUser = Thread.CurrentPrincipal.Identity.Name;
    //    try
    //    {
    //        IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterRow Row = (IGRSS.DataAccessLayer.InwardOutward.PostalStampDenomMasterRow) Parameter.Values;
    //        IgrssAdapters.PostalDenomAdapter.AddPostalStampDenomDetails(StampDenomId, Row.Name, Row.Description, Row.Amount, Row.IsActive, curUser, DateTime.Now);
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
    //public PostalDenomTable GetAllPostalStampDenomDetails()
    //{
    //    PostalDenomTable PsDt = new PostalDenomTable();
    //    try
    //    {
    //        PsDt=IgrssAdapters.PostalDenomAdapter.GetAllPostalStampDenomDetails();
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //    return PsDt;
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
    //public PostalDenomTable GetPostalStampDenomByStampDenomId(Guid StampDenomId)
    //{
    //    PostalDenomTable Dt = new PostalDenomTable();
    //    try
    //    {
    //        Dt=IgrssAdapters.PostalDenomAdapter.GetPostalStampDenomByStampDenomId(StampDenomId);
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //    }
    //    return Dt;
    //}
    //[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
    //public bool DeleteStampDenomByStampDenomId(Guid StampDenomId)
    //{
    //    try
    //    {
    //        IgrssAdapters.PostalDenomAdapter.DeleteStampDenomByStampDenomId(StampDenomId);
    //        return true;
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ExceptionPolicy.HandleException(ex, "DAL"))
    //            throw;
    //        return false;
    //    }
    //}

        #endregion
}

        //#region Postal Stamp Request Methods
        //public static DataRow GetPostalStampRequestRow()
        //{
			
        //        return new IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqDataTable().NewPostalStampPurchaseReqRow();
			
		
        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        //public void AddPostalStampRequestDetails(FormViewParameter Parameter)
        //{
        //    string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    try
        //    {
        //        IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqRow Row = (IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqRow) Parameter.Values;
        //        IgrssAdapters.PostalrequestAdapter.AddPostalRequestPurchaseDetails(Guid.NewGuid(), Row.OfficeId, Row.RequestDate, Row.TotalValue, curUser, DateTime.Now);
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        //public void UpdatePostalStampRequestDetails(FormViewParameter Parameter, Guid PurRequestId)
        //{
        //    string curUser = Thread.CurrentPrincipal.Identity.Name;
        //    try
        //    {
        //        IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqRow Row = (IGRSS.DataAccessLayer.InwardOutward.PostalStampPurchaseReqRow) Parameter.Values;
        //        IgrssAdapters.PostalrequestAdapter.UpdatePostalRequestPurchaseDetails(Row.OfficeId, Row.RequestDate, Row.TotalValue, curUser, DateTime.Now, PurRequestId);
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public PostalRequestTable GetAllPostalStampRequestDetails()
        //{
        //    PostalRequestTable PsrDt = new PostalRequestTable();
        //    try
        //    {
        //        PsrDt=IgrssAdapters.PostalrequestAdapter.GetAllPostalStampRequestDetails();
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //    return PsrDt;
        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public PostalRequestTable GetPostalRequestdetailsById(Guid PurRequestId)
        //{
        //    PostalRequestTable Dt = new PostalRequestTable();
        //    try
        //    {
        //        Dt=IgrssAdapters.PostalrequestAdapter.GetPostalRequestdetailsById(PurRequestId);
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //    return Dt;
        //}
        //#endregion
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        //public PostaldeliveryLKPDataTable GetPostalDeliveryLkp()
        //{
        //    return IgrssAdapters.DeliveryAdapter.GetPostalDeliveryLookUpDetails();
        //}

        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        //public PostaldeliveryLKPDataTable GetPostalDeliveryLkpById(Guid PostalDeliveryType_Id)
        //{
        //    return IgrssAdapters.DeliveryAdapter.GetPostalDeliveryTypeById(PostalDeliveryType_Id);
        //}

        //[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        //public bool AddNewPostalDeliveryType(FormViewParameter Parameter)
        //{
        //        IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPRow   row= (IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPRow )Parameter.Values;
        //         Guid PostalDeliveryType_Id=Guid.NewGuid();

        //         IgrssAdapters.DeliveryAdapter.AddNewPostalDeliveryType(PostalDeliveryType_Id, row.Name, row.Description);
        //         return true;
        //}

        //[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        //public bool UpdatePostalDeliveryType(FormViewParameter Parameter,Guid PostalDeliveryType_Id )
        //{
        //    IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPRow row = (IGRSS.DataAccessLayer.InwardOutward.PostalDeliveryType_LKPRow) Parameter.Values;
	
        //    IgrssAdapters.DeliveryAdapter.UpdatePostalDeliveryType(PostalDeliveryType_Id, row.Name, row.Description);
        //    return true;
        //}
        //[DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        //public bool DeletePostalDeliveryType(Guid PostalDeliveryType_Id)
        //{
        //    IgrssAdapters.DeliveryAdapter.DeletePostalDeliveryType(PostalDeliveryType_Id);
        //    return true;
        //}




	

	












