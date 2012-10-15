using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data;
using IGRSS.BusinessObjects;
using System.Threading;
using System.ComponentModel;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using OfficeProcessDataTable = IGRSS.DataAccessLayer.WorkflowSupprot.OfficeProcess_LKPDataTable;
namespace IGRSS.BusinessLogicLayer.Administration
{
	[DataObject]
	public class ManageOfficeProcess
	{
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public XmlDocument GetProcessForModule(string moduleCode, Guid OfficeId)
		{
			XmlDocument RetProcess = new XmlDocument();
			// Get the Process Flow for the current office
			DataTable dt = IgrssAdapters.OfficeProcess.GetProcessDetails(OfficeId, moduleCode);
            DataRow dr = null;
            if (dt.Rows.Count>0)
            {
                RetProcess.LoadXml((string)dt.Rows[0]["Data"]);
            }
            else
            {
                RetProcess.LoadXml("<Process />");
            }
			return RetProcess;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool SetOfficeProcess(Guid OfficeId, string moduleCode, XmlDocument ProcessInfo)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.OfficeProcess.DeleteOfficeProcessDetails(OfficeId, moduleCode);
			IgrssAdapters.OfficeProcess.AddNewProcessDetails(OfficeId, moduleCode,ProcessInfo.OuterXml, curUser, DateTime.Now);
			return true;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
		public bool UpdateOfficeProcess(Guid OfficeId, string moduleCode, XmlDocument ProcessInfo)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.OfficeProcess.UpdateProceeDetails(OfficeId, moduleCode, ProcessInfo.OuterXml, curUser, DateTime.Now);
			return true;
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public OfficeProcessDataTable GetOfficeProcessByOfficeId(Guid OfficeId)
		{
			return IgrssAdapters.OfficeProcess.GetOfficeProcessByOfficeId(OfficeId);
		}
	}
}
