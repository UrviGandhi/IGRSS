//File Management
//ClassName     - FileManagement
//Purpose       - This business class contains functions for Saving new FileManagement information,updating FileManagement information and so on. 
//Author        : Akhilesh Pathak
//Creation Date : 19-9-2007
//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using System.ComponentModel;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using FileRemarkTable= IGRSS.DataAccessLayer.FileManagement.FileRemarksDataTable;
using FileManagementTable = IGRSS.DataAccessLayer.FileManagement.FileManagementMasterDataTable;
using DepartmentTable = IGRSS.DataAccessLayer.FileManagement.DepartmentMasterForFileDataTable;
using DesiginationTable = IGRSS.DataAccessLayer.Employee.DesignationMasterDataTable;
using OfficeTable = IGRSS.DataAccessLayer.OfficesMaster.OfficeMasterDataTable;
using System.Threading;
using DocumentTable= IGRSS.DataAccessLayer.FileAttachments.DocumentRepositoryDataTable;
using ApplicantTable = IGRSS.DataAccessLayer.FileManagement.Applicant_DetailsDataTable;


namespace IGRSS.BusinessLogicLayer
{
    [DataObject] 
    public class FileManagement
    {
		/// <summary>
		/// This Function Inserts a new record to the FileRemarks Table.
		/// </summary>
		/// <param name="FieldId">This is the Parameter</param>
		/// <param name="Subject">it is the remark subject</param>
		/// <param name="Body">Detailed content of Remark</param>
		/// <returns>true, i.e, a record is inserted successfully
		//</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool InsertFileRemarks(Guid FileId, string Subject, string Body)
        {
            try
            {
                FileManager.AddRemarkToFile(FileId, Subject, Body);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return true;
        }
		
        /// <summary>
		/// This Function gets teh FileId by file Number.
		/// </summary>
		/// <param name="FileSlNo">This is File Number Parameter</param>
		/// <param name="OfficeId">This is Office ID Paramete</param>
		/// <param name="Department">This is Department Paramete</param>
		/// <param name="year">This is Year Paramete</param>
		/// <returns>Guid as FileId</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public Guid GetFileIdByFileNo(Guid FielId)
        {
            try
            {
                FileManager.GetFileNo( FielId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return FielId;

        }
		
        /// <summary>
		/// This function returns the values in table FileRemarks.
		/// </summary>
		/// <returns>Multiple rows of Data</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public FileRemarkTable GetFileMasterDetails()
        {
            FileRemarkTable dtFileremark = new FileRemarkTable();
            try
            {
               dtFileremark = IgrssAdapters.FileRemarkAdapter.GetData();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            
            return dtFileremark;
        }
		
        /// <summary>
		/// This function returns values by FileId
		/// </summary>
		/// <param name="FileId">This is File Id Parameter</param>
		/// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public FileRemarkTable GetFileRemarksByFileId(Guid FileId)
		{
			FileRemarkTable dtfileRemarks = new FileRemarkTable();
			try
			{
                dtfileRemarks = FileManager.GetFileRemarks(FileId);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
			return dtfileRemarks;
		}
		
        /// <summary>
		/// This function gets data from Department Master.
		/// </summary>
		/// <returns>returns the data from Department master</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DepartmentTable GetDepartmentNames()
		{
			DepartmentTable dtDepartment = new DepartmentTable();
			try
			{
				dtDepartment = IgrssAdapters.FileDepartmentAdapter.GetDepartmentMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return dtDepartment;
		}
        
        /// <summary>
        /// This Method gets the Desigination Details.
        /// </summary>
        /// <returns>DataRow</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public DesiginationTable GetDesignationDetails()
		{
			DesiginationTable dtDesignation = new DesiginationTable();
			try
			{
				dtDesignation = IgrssAdapters.DesignationMaster.GetDesignationMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return dtDesignation;
		}
        
        /// <summary>
        /// This Method Inserts data into FileManagementMasterTable.
        /// </summary>
        /// <param name="FileId">This is File ID Parameter</param>
        /// <param name="FileSerilaNo">This is FileSerialNumber Parameter</param>
        /// <param name="ModuleCode">This is ModuleCode parameter</param>
        /// <param name="FileDepartment">This is FileDepartment parameter</param>
        /// <param name="FileNo">This is FileNumber parameter</param>
        /// <param name="FileYear">This is FileYear parameter</param>
        /// <param name="OfficeId">This is OfficeId parameter</param>
        /// <param name="CreatedBy">This is CreatedBy parameter</param>
        /// <param name="CreatedAt">This is CreatedAt parameter</param>
        /// <returns>true, i.e, a record is inserted successfully</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool InsertNewFile(Guid OfficeId,string FileDepartment)
        {
            try
            {
                FileManager.OpenNewFile(OfficeId, FileDepartment);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return true;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public OfficeTable GetOffices()
        {
            OfficeMaster Office = new OfficeMaster();
            OfficeTable Offices = new OfficeTable();
            Offices=Office.GetOfficeDetails();
            return Offices;
        }
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public Guid GetFileIDByFileNoAndOffice(Guid OfficeId,decimal FileNo,string FilePreFix ,decimal FileYear )
        {
            Guid fileId = Guid.Empty;
            string fileidstring=IgrssAdapters.FileManagementMasterTable.GetFileIdByFileNo(OfficeId, FileNo, FilePreFix, FileYear).ToString();
            if (fileidstring != "")
            {
                fileId = new Guid(fileidstring);
            }
           
            return fileId;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public DocumentTable GetAttachedDocuments(Guid fileId)
        {
            DocumentTable docDt = new DocumentTable();
            docDt = IgrssAdapters.docResporicity.GetDocumentsByFileId(fileId);
            return docDt;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public string GetFileNumberByFileId(Guid FileId)
        {
           string FileNumber = (IgrssAdapters.FileManagementMasterTable.GetFileNumberByFileId(FileId)).ToString();
           return FileNumber;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ApplicantTable GetApplicantDetails()
        {
            ApplicantTable dtappdetails = new ApplicantTable();
            dtappdetails = IgrssAdapters.ApplicantDetails.GetData();
            return dtappdetails;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public  ApplicantTable GetApplicantDetailsByValues(string filePrefix,Nullable<int> FileNo, String FileYear, string ApplicantName, Guid officeId)
        {
            ApplicantTable dtfm = new ApplicantTable();
            try
            {
                dtfm = IgrssAdapters.ApplicantDetails.GetApplicantDetails(filePrefix, FileNo, FileYear, ApplicantName, officeId);
            }
            catch (Exception ex)
            {
            }
            return dtfm;
        }
   }
}
