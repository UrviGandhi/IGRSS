using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using OffenceTable = IGRSS.DataAccessLayer.VendorOffence.VendorOffenceDataTable;
using InvestigationTable = IGRSS.DataAccessLayer.VendorOffence.VendorInvestigationDataTable;
using HighCourtTable = IGRSS.DataAccessLayer.VendorOffence.HighCourtAppealDataTable;
using FileManagementTable = IGRSS.DataAccessLayer.FileManagement.FileManagementMasterDataTable;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System.Data;
namespace IGRSS.BusinessLogicLayer
{
    public class VendorOffence
    {
        public Guid FileidId;
        public static DataRow GetRow()
        {
            
            return new IGRSS.DataAccessLayer.VendorOffence.VendorOffenceDataTable().NewVendorOffenceRow();
        }
        public static DataRow GetInvestigationRow()
        {

            return new IGRSS.DataAccessLayer.VendorOffence.VendorInvestigationDataTable().NewVendorInvestigationRow();
        }
       
        public void AddVendorOffence(FormViewParameter Parameter, Guid LicenseId)
        {
            
            try
            {
                IGRSS.DataAccessLayer.VendorOffence.VendorOffenceRow Row = (IGRSS.DataAccessLayer.VendorOffence.VendorOffenceRow)Parameter.Values;
                FileidId = FileManager.OpenNewFile(Row.OfficeId, "LIC");
                IgrssAdapters.VOffenceAdapter.AddNewVendorOffence(FileidId, Row.OfficeId, Row.Name, Row.Summary, Row.Details, Row.OffenceDate, LicenseId);

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
        }
       
        public OffenceTable GetData()
        {
            OffenceTable RetData = new OffenceTable();
            try
            {
                RetData = IgrssAdapters.VOffenceAdapter.GetData();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public OffenceTable GetVendorInspectionDetailsByFileName(string FileDepartment, int FileNo, string Year)
        {

            OffenceTable RetData = new OffenceTable();
            try
            {
                RetData = IgrssAdapters.VOffenceAdapter.GetVendorInspectionDetailsByFileName(FileDepartment, FileNo, Year);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public bool AddNewvendorInvestigationDetails(FormViewParameter Parameter,Guid OffenceId,string InvestigationType,string Remarks)
        {
            
            try
            {
                IGRSS.DataAccessLayer.VendorOffence.VendorInvestigationRow Row = (IGRSS.DataAccessLayer.VendorOffence.VendorInvestigationRow)Parameter.Values;
              
                int i=IgrssAdapters.VInspectionAdapter.AddNewvendorInvestigationDetails(OffenceId, Guid.NewGuid(),InvestigationType,Row.Date, Row.Participants, Row.Summary, Row.Details,Row.IsJudgement,Remarks);
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
        public InvestigationTable GetInspectionData()
        {
            InvestigationTable RetData = new InvestigationTable();
            try
            {
                RetData = IgrssAdapters.VInspectionAdapter.GetInspectionData();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public InvestigationTable GetVendorInspectionDetailsByOffenceID(Guid VendorOffenceID)
        {
            InvestigationTable RetData = new InvestigationTable();
            try
            {
                RetData = IgrssAdapters.VInspectionAdapter.GetHearingDetailsByOffenceId(VendorOffenceID);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public OffenceTable GetVendorOffenceDetailsByLicenseAppId(Guid VendorLicenseId)
        {
            OffenceTable RetData = new OffenceTable();
            try
            {
                RetData = IgrssAdapters.VOffenceAdapter.GetVendorOffenceDetailsByLicenseAppId(VendorLicenseId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public OffenceTable GetVendorOffenceDetailsByOffenceId(Guid VendorOffenceId)
        {
            OffenceTable RetData = new OffenceTable();
            try
            {
                RetData = IgrssAdapters.VOffenceAdapter.GetVendorOffenceDetailsByOffenceId(VendorOffenceId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }
        public bool AddNewHighCourtDetails(string HighCourtFileNo, DateTime Date, string Details, Guid VendorOffenceId)
        {
            try
            {
                int i = IgrssAdapters.HighCourtAdapter.AddHighCourtAppealdetails(Guid.NewGuid(), VendorOffenceId, HighCourtFileNo, Date, Details);

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
        //}
        public HighCourtTable GetHighCourtAppealData(string HighCourtFileNo)
        {
            HighCourtTable RetData = new HighCourtTable();
            try
            {
                RetData = IgrssAdapters.HighCourtAdapter.GetOffenceDetailsByHighCourtFileNo(HighCourtFileNo);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return RetData;
        }


	}
   }
