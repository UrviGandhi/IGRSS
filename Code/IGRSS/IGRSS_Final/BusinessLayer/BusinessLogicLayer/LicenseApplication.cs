//License Application
//ClassName     - LicenseApplication
//Purpose       - This business class contains a business logic for saving Vendor details,Updating vendor details and Deleting.
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using LicenseAppTable = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationDataTable;
using LicenseAppRow = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow;
using IGRSS.DataAccessLayer;
using IGRSS.DataAccessLayer.LicenseApplicationTableAdapters;
using System.Data;
using IGRSS.BusinessObjects.WorkflowServices;
using IGRSS.Workflows.License;
using IGRSS.Workflows.License.EventArgs;
using IGRSS.Workflows.Common.Feedback;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using LicensePurposeTable = IGRSS.DataAccessLayer.LicenseApplication.LicensePurposeMasterDataTable;
using System.ComponentModel;
using LicenseApplicationRow = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow;
using SalseTable = IGRSS.DataAccessLayer.LicenseApplication.SaleRegisterDataTable;
using salesRow = IGRSS.DataAccessLayer.LicenseApplication.SaleRegisterRow;


namespace IGRSS.BusinessLogicLayer
{

    [DataObject]
    public class LicenseApplication
    {
        /// <summary>
        /// <returns>All the columns of the license application</returns>
        /// <sumary>
        public static DataRow GetRow()
        {

            return new IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationDataTable().NewLicenseApplicationRow();
        }
        /// <summary>
        /// This will save the new vendor application.
        /// </summary>
        /// <param name="Parameter">Contains all the fields of the formview</param>
        /// <returns>boolean</returns>

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]

        public bool NewLicenseApplication(FormViewParameter Parameter, Remarks rem)
        {
            LicenseAppRow rowLic = (LicenseAppRow)Parameter.Values;
            try
            {
                Guid LicenseId = FileManager.OpenNewFile(rowLic.SubmissionOfficeId, "LIC");
                if ((rem.Body != "") || (rem.Subject != ""))
                {
                    FileManager.AddRemarkToFile(LicenseId, rem.Subject, rem.Body);
                }

                string UserName = Thread.CurrentPrincipal.Identity.Name;
                IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow row = (IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow)Parameter.Values;
                int i = IgrssAdapters.LAppTableAdapter.AddNewLicenseAplication(LicenseId, row.NameOfApplicant, row.PresentAddress, row.PermanentAddress, row.DateOfBirth, DateTime.Now, row.Qualification, row.Experience, row.Caste, row.BusinessAddress, row.TotalInvestmentAmount, row.NameAndAddressOfReferer, row.SubmissionOfficeId, row.ApplnNumber, row.HomePhone, row.HoldingAnyOtherLicense, row.PurposeOfLicense);
                if (i == 1)
                {
                    Dictionary<string, object> WfParams = new Dictionary<string, object>();
                    WfParams.Add("LicenseId", LicenseId);
                    WfParams.Add("InitiatingOffice", row.SubmissionOfficeId);
                    WfParams.Add("IsRenew", false);

                    WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(LicenseIssueProcess), WfParams);
                    return true;
                }
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
        /// This Function will insert data For Franking MAchine.
        /// </summary>
        /// <param name="Parameter"></param>
        /// <param name="rem"></param>
        /// <returns></returns>
        ///
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool NewFrankingApplication(FormViewParameter Parameter, Remarks rem)
        {
            LicenseAppRow rowLic = (LicenseAppRow)Parameter.Values;
            try
            {
                Guid LicenseId = FileManager.OpenNewFile(rowLic.SubmissionOfficeId, "LIC");
                if ((rem.Body != "") || (rem.Subject != ""))
                {
                    FileManager.AddRemarkToFile(LicenseId, rem.Subject, rem.Body);
                }

                string UserName = Thread.CurrentPrincipal.Identity.Name;
                //IGRSS.DataAccessLayer.Complain.ComplainDatatableRow row = (IGRSS.DataAccessLayer.Complain.ComplainDatatableRow) parameter.Values;
                IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow row = (IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow)Parameter.Values;
                IgrssAdapters.LAppTableAdapter.AddFrankingMachineDetails(LicenseId, row.ApplnNumber, row.NameOfApplicant, row.PresentAddress, row.PermanentAddress, DateTime.Now, row.Qualification, row.Experience, row.BusinessAddress, row.TotalInvestmentAmount, row.NameAndAddressOfReferer, row.SubmissionOfficeId, row.HomePhone, row.HoldingAnyOtherLicense, row.PurposeOfLicense);

                Dictionary<string, object> WfParams = new Dictionary<string, object>();
                WfParams.Add("LicenseId", LicenseId);
                WfParams.Add("InitiatingOffice", row.SubmissionOfficeId);

                WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(LicenseIssueProcess), WfParams);
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }
        /// <summary>
        /// This function will update the vendor record
        /// </summary>
        /// <param name="Parameter">Contains all the fields of the formview</param>
        /// <returns>boolean</returns>


        public bool updateVendorsDetail(FormViewParameter Parameter, bool Verified, Guid AlertId, Guid LicenseApplicationId, Remarks rem)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                if ((rem.Body != "") || (rem.Subject != ""))
                {
                    FileManager.AddRemarkToFile(LicenseApplicationId, rem.Subject, rem.Body);
                }
                //IgrssAdapters.LAppTableAdapter.UpdateVendorDetails(row.ApplnNumber, row.NameOfApplicant, row.PresentAddress, row.PermanentAddress, row.DateOfBirth, DateTime.Now, row.Qualification, row.Experience, row.Caste, row.BusinessAddress, row.TotalInvestmentAmount, row.NameAndAddressOfReferer, row.SubmissionOfficeId, row.HomePhone, row.Remarks,LicenseApplicationId);
                Guid InstanceId = (Guid)IgrssAdapters.LAppTableAdapter.GetWfIdByLicenseApplicationId(LicenseApplicationId);
                if (Verified)
                {
                    FeedbackEventArgs args = new FeedbackEventArgs(InstanceId, AlertId, curUser);
                    WorkflowMediator.LicenseApplicationServices.ValidateLicenseApplication(InstanceId, args);
                }
                else
                {
                    ApplicationUpdatedEventArgs args = new ApplicationUpdatedEventArgs(InstanceId, (LicenseApplicationRow)Parameter.Values);
                    WorkflowMediator.LicenseApplicationServices.UpdateApplication(InstanceId, args);
                }


                //Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);
                //InvestigationRequiredEventArgs args = new InvestigationRequiredEventArgs(InstanceId);
                //args.InvestigatingOfficer = InvestigatingOfficer;
                //WorkflowMediator.ComplainServices.RequireInvestigation(InstanceId, args);
                return true;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }

        public bool updateFrankingDetails(FormViewParameter Parameter, bool Verified, Guid AlertId, Guid LicenseApplicationId, Remarks rem)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                if ((rem.Body != "") || (rem.Subject != ""))
                {
                    FileManager.AddRemarkToFile(LicenseApplicationId, rem.Subject, rem.Body);
                }
                //IgrssAdapters.LAppTableAdapter.UpdateVendorDetails(row.ApplnNumber, row.NameOfApplicant, row.PresentAddress, row.PermanentAddress, row.DateOfBirth, DateTime.Now, row.Qualification, row.Experience, row.Caste, row.BusinessAddress, row.TotalInvestmentAmount, row.NameAndAddressOfReferer, row.SubmissionOfficeId, row.HomePhone, row.Remarks,LicenseApplicationId);
                Guid InstanceId = (Guid)IgrssAdapters.LAppTableAdapter.GetWfIdByLicenseApplicationId(LicenseApplicationId);
                if (Verified)
                {
                    FeedbackEventArgs args = new FeedbackEventArgs(InstanceId, AlertId, curUser);
                    WorkflowMediator.LicenseApplicationServices.ValidateLicenseApplication(InstanceId, args);
                }
                else
                {
                    ApplicationUpdatedEventArgs args = new ApplicationUpdatedEventArgs(InstanceId, (LicenseApplicationRow)Parameter.Values);
                    WorkflowMediator.LicenseApplicationServices.UpdateApplication(InstanceId, args);
                }


                //Guid InstanceId = (Guid) IgrssAdapters.ComplainAdapter.GetWfIdByComplainId(ComplainId);
                //InvestigationRequiredEventArgs args = new InvestigationRequiredEventArgs(InstanceId);
                //args.InvestigatingOfficer = InvestigatingOfficer;
                //WorkflowMediator.ComplainServices.RequireInvestigation(InstanceId, args);
                return true;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }

        public LicenseAppTable GetLicenseApplications()
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetLicensApplication();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }
        //public DataTable  GetLicenseAuthrorised()
        //{
        //    DataTable Dt = new DataTable();
        //    try
        //    {
        //        Dt = IgrssAdapters.LAothroisedAdapter.GgetLicenseAuthodetails();
        //    }
        //    catch (Exception ex)
        //    {
        //        if (ExceptionPolicy.HandleException(ex, "DAL"))
        //            throw;
        //    }
        //    return Dt;

        //}
        public LicenseAppTable GetVendorSalesDetails()
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetVendorSalesDetails();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }
        public DataTable GetCompleteLicenseDetails(Guid LicenseApplicationId)
        {
            DataTable Dt = new DataTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetCompleteLicenseDetails(LicenseApplicationId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }

        public LicenseAppTable GetlicenseAppBylicenseAppID(Guid LicenseApplicationId)
        {
            LicenseAppTable Dt = new LicenseAppTable();
            string UserName = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetLiceseApplnById(LicenseApplicationId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }

        public LicenseAppTable GetvendordetailByAppNumber(string ApplnNumber)
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                if (ApplnNumber != "")
                {
                    return IgrssAdapters.LAppTableAdapter.GetVendorDetailByAppNumber(ApplnNumber);
                }
                else
                {

                    Dt = IgrssAdapters.LAppTableAdapter.GetAllLicenseDetails();
                }
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;
        }

        public bool DeleteVendordetail(Guid LicenseApplicationId)
        {
            try
            {
                IgrssAdapters.LAppTableAdapter.DeleteVendorDetails(LicenseApplicationId);
                return true;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }

        //public bool UpdateVendrDtlByAppNo(string NameOfApplicant, string PresentAddress, string PermanentAddress, DateTime DateOfBirth, string Qualification, decimal Experience, string Caste, string BusinessAddress, decimal TotalInvestmentAmount, object NameAndAddressOfReferer, string Remarks, string HomePhone, string ApplnNumber)
        //{
        //    IgrssAdapters.LAppTableAdapter.UpdateVendorDetlByAppNo(NameOfApplicant, PresentAddress, PermanentAddress, DateOfBirth, Qualification, Experience, Caste, BusinessAddress, TotalInvestmentAmount, NameAndAddressOfReferer, Remarks, HomePhone, ApplnNumber);
        //    return true;
        //}

        public LicenseAppTable GetVendordtlByLicenseNo(string LicenseNo)
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetVendorDetailsByLicenseNo(LicenseNo);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }
        public LicenseAppTable GetVendordetailByVendorName(string NameOfApplicant)
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetVendorDetailsByVendorName(NameOfApplicant);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }
        public LicenseAppTable GetData()
        {
            LicenseAppTable Dt = new LicenseAppTable();
            try
            {
                Dt = IgrssAdapters.LAppTableAdapter.GetAllLicenseDetails();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return Dt;

        }

        // public bool Renewvendorlicense(DateTime EffectiveDate,DateTime ExpiryDate,Guid LicenseApplicationId)
        //{
        //  string UserName=Thread.CurrentPrincipal.Identity.Name;
        //  IgrssAdapters.LicRenewAdapter.RenewVendorLicense(Guid.NewGuid(), LicenseApplicationId, DateTime.Now, DateTime.Now, EffectiveDate, ExpiryDate);
        //  return true;
        //}
        /// <summary>
        /// This function will approve the vendor application and issue the new License
        /// </summary>
        /// <param name="EffectiveDate"></param>
        /// <param name="IssueDate"></param>
        /// <param name="LicenseNo"></param>
        /// <param name="ExpiryDate"></param>
        /// <param name="LicenseApplicationID"></param>
        /// <returns>boolean</returns>

        public bool ApprovedVendorLicense(Guid LicenseApplicationID, string LicenseNo, DateTime IssueDate, DateTime EffectiveDate, DateTime ExpiryDate, Guid AlertId)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                Guid InstanceId = (Guid)IgrssAdapters.LAppTableAdapter.GetWfIdByLicenseApplicationId(LicenseApplicationID);
                FeedbackEventArgs args = new FeedbackEventArgs(InstanceId, AlertId, curUser);

                WorkflowMediator.LicenseApplicationServices.ApproveLicenseApplication(InstanceId, args);

                IgrssAdapters.LAppTableAdapter.ApproveVendorLicense(LicenseApplicationID, LicenseNo, IssueDate, EffectiveDate, ExpiryDate);
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
            return true;
        }
        /// <summary>
        /// This function will cancel the vendor application
        /// </summary>
        /// <param name="LicenseApplicationID"></param>
        /// <returns>boolean</returns>

        public bool RejectVenorLicense(Guid LicenseApplicationID)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                Guid InstanceId = (Guid)IgrssAdapters.LAppTableAdapter.GetWfIdByLicenseApplicationId(LicenseApplicationID);
                FeedbackEventArgs args = new FeedbackEventArgs(InstanceId, Guid.Empty, curUser);

                WorkflowMediator.LicenseApplicationServices.RejectLicenseApplication(InstanceId, args);

                IgrssAdapters.LAppTableAdapter.RejectVendorLicense(LicenseApplicationID);
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }
        /// <summary>
        /// This function will Renew the vendor License.
        /// </summary>
        /// <param name="LicenseApplicationID"></param>
        /// <param name="RenewApplicationDate"></param>
        /// <returns>boolean</returns>

        public bool RenewAppDate(Guid LicenseApplicationID, DateTime RenewApplicationDate)
        {
            try
            {
                IgrssAdapters.LAppTableAdapter.UpdateRenewAppDate(Guid.NewGuid(), RenewApplicationDate, LicenseApplicationID);
                Dictionary<string, object> WfParams = new Dictionary<string, object>();
                WfParams.Add("LicenseId", LicenseApplicationID);
                //WfParams.Add("InitiatingOffice", row.SubmissionOfficeId);
                WorkflowResults WfResult = WorkflowMediator.RunWorkflow(typeof(LicenseIssueProcess), WfParams);
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

        }

        public LicensePurposeTable GetPuropseById(Guid PurposeId)
        {
            LicensePurposeTable licDt = new LicensePurposeTable();
            licDt = IgrssAdapters.LPurposeAdapter.GetPurposeById(PurposeId);
            return licDt;
        }

        public LicensePurposeTable GetLicensePurpose()
        {
            LicensePurposeTable licDt = new LicensePurposeTable();
            licDt = IgrssAdapters.LPurposeAdapter.GetLicensePurpose();
            return licDt;
        }






        public SalseTable getSalseDataByLicenseId(Guid LicenseId)
        {
            SalseTable dtSalse = new SalseTable();
            try
            {
                dtSalse = IgrssAdapters.SaleRegister.GetSalseDetailsByLicenseId(LicenseId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return dtSalse;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddNewSalseDetails(FormViewParameter Parameters)
        {
            salesRow rowSale=(salesRow)Parameters.Values;
            IgrssAdapters.SaleRegister.AddNewSalseDetails(rowSale.licenseId, rowSale.SoldTo, rowSale.Denomination, rowSale.Quantity, rowSale.StartSerialNo, rowSale.EndSerialNo, rowSale.Date);
            return true;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddSpicemenDetails(Guid LicenseAplicationId, DataTable FullName, string Designation)
        {
             string UserName = Thread.CurrentPrincipal.Identity.Name;
             //foreach (DataRow dr in FullName.Rows)
             //{
             //    IgrssAdapters.SpiceSigAdapter.AddSpicemanDetails(Guid.NewGuid(), LicenseAplicationId, (string)dr[0], UserName, DateTime.Now,Designation);
         
             //    //IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(RefundApplicationId, (Guid)StampDetail[1], (string)StampDetail[2], (string)StampDetail[3]);
             //}
             //IgrssAdapters.SpiceSigAdapter.AddSpicemanDetails(Guid.NewGuid(), LicenseAplicationId, FullName, UserName, DateTime.Now);
             return true;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DataTable GetSpicemendetailsByLicenseId(Guid LicenseApplicationId)
        {
            DataTable Dt = new DataTable();
            //try
            //{
            //    Dt = IgrssAdapters.SpiceSigAdapter.GetSpicemenDetailsByLicenseId(LicenseApplicationId);
            //}
            //catch (Exception ex)
            //{
            //    if (ExceptionPolicy.HandleException(ex, "DAL"))
            //        throw;
            //}
            return Dt;

        }
        public  SalseTable getSalseTable()
        {
            SalseTable dt = new SalseTable();
            dt = IgrssAdapters.SaleRegister.GetData();
            return dt;
        }
        public static DataRow GetSaleRow()
        {
            return new IGRSS.DataAccessLayer.LicenseApplication.SaleRegisterDataTable().NewSaleRegisterRow();
        }
    }
}