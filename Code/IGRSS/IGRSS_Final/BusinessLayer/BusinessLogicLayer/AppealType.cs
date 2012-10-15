using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.DataAccessLayer.AppealTypeMasterTableAdapters;
using AppealTypetable =IGRSS.DataAccessLayer.AppealTypeMaster.AppealTypeMasterDataTable;
using AppealDecisionDatatable=IGRSS.DataAccessLayer.AppealTypeMaster.AppealDecisionMasterDataTable;
using System.ComponentModel;
using System.Threading;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class AppealType
	{
		
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public AppealTypetable GetAppealType()
		{
			AppealTypetable Dt = new AppealTypetable();

			try
			{
				Dt=IgrssAdapters.AppealTypeAdapter.GetAppealType();
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
			return Dt;
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public void AddNewAppealDecision(string AppealDecisionType,string Description)
        {
           

            try
            {
                IgrssAdapters.AppealDecisionAdapter.AddNewAppealDecision(Guid.NewGuid(), AppealDecisionType, Description);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
           
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public void UpdateAppealDecisionMaster(string AppealDecisionType, string Description,Guid AppealDecisionTypeId)
        {


            try
            {
                IgrssAdapters.AppealDecisionAdapter.UpdateAppealDecisionMaster(AppealDecisionType, Description, AppealDecisionTypeId);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
           
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public AppealDecisionDatatable GetAppealDecisionMaster()
        {
            AppealDecisionDatatable Dt = new AppealDecisionDatatable();

            try
            {
                Dt = IgrssAdapters.AppealDecisionAdapter.GetData();
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
