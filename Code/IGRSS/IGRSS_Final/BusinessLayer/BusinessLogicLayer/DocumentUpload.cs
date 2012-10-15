using System;
using System.Collections.Generic;
using System.Text;
using UploadDataTable = IGRSS.DataAccessLayer.DocumentUpload.Document_UploadDataTable;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	public class DocumentUpload
	{
        public UploadDataTable GetSuggestionsDetails()
        {
            UploadDataTable RetData = new UploadDataTable();
            try
            {
                RetData = IgrssAdapters.UploadAdapter.GetAllDownlableDocument();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public void UploadDocument(string Name,String Description,string Path)
        {

            IgrssAdapters.UploadAdapter.UploadNewDocument(Name, Description, Path);
           
        }
	}
}
