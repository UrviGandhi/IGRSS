using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System.Threading;
using FileRemarkTable = IGRSS.DataAccessLayer.FileManagement.FileRemarksDataTable;
using FileForwardTable = IGRSS.DataAccessLayer.FileManagement.FileForwardsDataTable;
using FileForwardsRow = IGRSS.DataAccessLayer.FileManagement.FileForwardsRow;
using IGRSS.BusinessLogicLayer;
using FileManagementMasterTable = IGRSS.DataAccessLayer.FileManagement.FileManagementMasterDataTable;
using FileManagementMasterRow = IGRSS.DataAccessLayer.FileManagement.FileManagementMasterRow;

using IGRSS.Properties;

namespace IGRSS.BusinessObjects
{
    /// <summary>
    /// Contains methods to manage Files
    /// </summary>
    public static class FileManager
    {
        /// <summary>
        /// Opens a new File for the Office Department for the specified Year
        /// </summary>
        /// <param name="OfficeId">Office where the file has to be opened</param>
        /// <param name="DepartmentCode">Department in which the file is opened</param>
        /// <param name="FileYear">Year in which the file has been opened</param>
        public static Guid OpenNewFile(Guid OfficeId, string DepartmentCode, string FileYear)
        {
            Guid FileId = Guid.NewGuid();
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                IgrssAdapters.FileManagementMasterTable.AddNewFile(FileId, DepartmentCode, FileYear, OfficeId, curUser, DateTime.Now);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return FileId;
        }

        /// <summary>
        /// Opens a new File for the Office Department
        /// </summary>
        /// <param name="OfficeId">Office where the file is created</param>
        /// <param name="DepartmentCode">Department where the File will be created</param>
        public static Guid OpenNewFile(Guid OfficeId, string DepartmentCode)
        {
            string fileYear = DateTime.Now.Year.ToString();
            return OpenNewFile(OfficeId, DepartmentCode, fileYear);
        }

        /// <summary>
        /// Closes the specified file
        /// </summary>
        /// <param name="FileId">File Id of the file that has to be closed</param>
        public static void CloseFile(Guid FileId)
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// Adds Remark to the specified File
        /// </summary>
        /// <param name="FileId">Id of the File to which Remarks has to be added</param>
        /// <param name="Subject">Subject of the Remark</param>
        /// <param name="Remark">Actual Remark or comment on the File</param>
        public static void AddRemarkToFile(Guid FileId, string Subject, string Remark)
        {
            Guid RemarkId = Guid.NewGuid();
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                IgrssAdapters.FileRemarkAdapter.AddFileRemark(RemarkId, FileId, 0, Subject, Remark, curUser, DateTime.Now);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
        }

        /// <summary>
        /// Forward the specified File to a particular Role in a Office
        /// </summary>
        /// <param name="FileId">Id of the file that has to be forwarded</param>
        /// <param name="Designation">Designation to whom the file has to be forwarded</param>
        /// <param name="OfficeId">Id of the Office where the file has to be forwarded</param>
        public static void ForwardFile(Guid FileId, Guid Designation, Guid OfficeId, Guid OriginalAlertId)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            string link = "";
            string Department = "";
            Dictionary<string, object> InfoList = new Dictionary<string, object>();
            string FileNumber = GetFileNo(FileId);
            if (FileNumber != "")
            {
                Department = FileNumber.Substring(0, 3);
            }
            switch (Department)
            {
                case "LIC":
                    link = "~/License/LicenseApplication.aspx?Mode=View";
                    break;
                case "APL":
                    link = "~/Appeal/AppealApplication.aspx?Mode=ReadOnly";
                    break;
                case "COM":
                    link = "~/Complain/Complaint.aspx?Mode=ReadOnly";
                    break;
                case "REF":
                    link = "~/Refund/RefundApplication.aspx?Mode=ReadOnly";
                    break;
                case "ADJ":
                    //InfoList.Add(ValuationFormId, FileId);
                    link = "~/Adjudication/AdjApplication.aspx?Mode=ReadOnly";
                    break;
            }

            InfoList.Add("FileId", FileId);
            string Message = "A File has been forwarded by:" + curUser;

            try
            {
                StringBuilder FwdUsers = new StringBuilder();
                Guid GroupId = Guid.NewGuid();
                foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, Designation))
                {
                    WorkflowSupport.SendAlert(curUser, AlertUser, link, Message, InfoList, GroupId);
                    FwdUsers.Append(AlertUser + ", ");
                }
                string forwardedTo = FwdUsers.ToString().Remove(FwdUsers.ToString().Length - 2);
                IgrssAdapters.FileForwardingAdapter.AddFileForwardDetails(FileId, curUser, forwardedTo, DateTime.Now, OriginalAlertId);
                WorkflowSupport.DisableAlert(OriginalAlertId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
        }

        /// <summary>
        /// Returns a DataSet containing the Forwarding History of the particular File
        /// </summary>
        /// <param name="FileId">Id of the file for which the history will be returned</param>
        /// <returns>DataSet containing all the Forwarding details of this File till now</returns>
        public static FileForwardTable GetFileForwardingHistory(Guid FileId)
        {
            FileForwardTable dtFileForward = new FileForwardTable();
            try
            {
                dtFileForward = IgrssAdapters.FileForwardingAdapter.GetFileForwardDetails(FileId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return dtFileForward;
        }

        /// <summary>
        /// Gets the current status of the file
        /// </summary>
        public static void GetStatus()
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// Gets all the Remarks that have been added till now for the specified File
        /// </summary>
        /// <param name="FileId">Id of the file for which Remarks will be returned</param>
        /// <returns>DataSet containing all the Remarks made on this File till now</returns>
        public static FileRemarkTable GetFileRemarks(Guid FileId)
        {
            FileRemarkTable ds = new FileRemarkTable();
            if (FileId != Guid.Empty)
            {
                try
                {
                    ds = IgrssAdapters.FileRemarkAdapter.GetFileRemarksByFileId(FileId);
                }
                catch (Exception ex)
                {
                    if (ExceptionPolicy.HandleException(ex, "DAL"))
                        throw;
                }
            }
            return ds;
        }

        /// <summary>
        /// Get File number for a File
        /// </summary>
        /// <param name="FileId">Id of the file to get File number</param>
        /// <returns>A string representing the full file number in the IGRSS File numbering Format (OFFICE/DEPT/FILENO/YEAR)</returns>
        public static string GetFileNo(Guid FileId)
        {
            string fileNumber = string.Empty; ;
            try
            {
                FileManagementMasterTable FileDetails = new FileManagementMasterTable();
                FileDetails = IgrssAdapters.FileManagementMasterTable.GetFileDetails(FileId);
                if (FileDetails.Rows.Count > 0)
                {
                    FileManagementMasterRow File = (FileManagementMasterRow)FileDetails.Rows[0];
                    fileNumber = File.FileDepartment + "/" +
                                    File.FileNo.ToString() + "/" +
                                    File.FileYear;
                }
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return fileNumber;
        }

        public static Guid GetFileIdByFileNo(Guid OfficeId, string fileDept, decimal fileNo, decimal fileYear)
        {
            Guid FileId = new Guid();
            try
            {
                IgrssAdapters.FileManagementMasterTable.GetFileIdByFileNo(OfficeId, fileNo, fileDept, fileYear);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return FileId;
        }

        public static DataTable GetApplicantDetails(string filePrefix, int FileNo, String FileYear, string ApplicantName, Guid officeId)
        {
            DataTable dtfm = new DataTable();
            try
            {
                dtfm = IgrssAdapters.FileManagementMasterTable.GetApplicantDetails(filePrefix, FileNo, FileYear, ApplicantName, officeId);
            }
            catch (Exception ex)
            {
            }
            return dtfm;
        }
        public static DataTable getDocuments(Guid DocumentId)
        {
            DataTable dt = new DataTable();
            dt = IgrssAdapters.docResporicity.GetDocumentsByFileId(DocumentId);
            return dt;
        }

        public static bool GetLicenseType(Guid LicenseApplicationId)
        {
            bool franking = Convert.ToBoolean(IgrssAdapters.LAppTableAdapter.GetLicenseType(LicenseApplicationId));
            return franking;
        }

        public static bool ReturnFile(Guid FileId)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            string message = "File has been returned to you";

            int fileForwardLevel = Convert.ToInt32(IgrssAdapters.FileForwardingAdapter.GetFileForwardLevel(FileId));

            try
            {
                FileForwardTable ForwardDetail = IgrssAdapters.FileForwardingAdapter.GetFileForwardDetailsByLevel(FileId, fileForwardLevel);
                if (ForwardDetail.Rows.Count > 0)
                {
                    FileForwardsRow row = ForwardDetail[0];
                    IgrssAlert Alert = WorkflowSupport.GetAlertById(row.FordwardedAlertId);
                    if (fileForwardLevel > 1)
                    {
                        Guid GroupId = Guid.NewGuid();
                        WorkflowSupport.SendAlert(curUser, Alert.SentBy, Alert.Link, message, Alert.SessionData, GroupId);
                    }
                    else if (fileForwardLevel == 1)
                    {
                        WorkflowSupport.EnableAlert(Alert.AlertId);
                    }
                    WorkflowSupport.DeleteAlert(Alert.AlertId);
                    IgrssAdapters.FileForwardingAdapter.SetFileReturned(FileId, fileForwardLevel);
                }
                return true;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return false;
        }

    }
}
