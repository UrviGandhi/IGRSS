using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;
using IGRSS.BusinessObjects;
using IGRSS.Workflows.Common;
using IGRSS.BusinessLogicLayer;
using System.Diagnostics;
using System.Xml;
using IGRSS.Workflows.Complain.EventArgs;
using System.Threading;
using IGRSS.DataAccessLayer.OfficesMasterTableAdapters;
using System.Data;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using System.Collections.Generic;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.Properties;
using CompalinTable = IGRSS.DataAccessLayer.Complain.ComplainDetailsDataTable;
using ComplainDetailsRow = IGRSS.DataAccessLayer.Complain.ComplainDetailsRow;

namespace IGRSS.Workflows.Complain
{
	public partial class ComplainProcess : StateMachineWorkflowActivity
	{
		private Guid m_ComplainOffice;
		public Guid ComplainOffice
		{
			get
			{
				return m_ComplainOffice;
			}
			set
			{
				m_ComplainOffice = value;
			}
		}

		private Guid m_ComplainType;
		public Guid ComplainType
		{
			get
			{
				return m_ComplainType;
			}
			set
			{
				m_ComplainType = value;
			}
		}

		private Guid m_ComplainId;
		public Guid ComplainId
		{
			get
			{
				return m_ComplainId;
			}
			set
			{
				m_ComplainId = value;
			}
		}

		private List<FeedbackData> m_AcceptanceList;
		/// <summary>
		/// List of Users who will accept the complain
		/// </summary>
		public List<FeedbackData> AcceptanceList
		{
			get
			{
				return m_AcceptanceList;
			}
			set
			{
				m_AcceptanceList = value;
			}
		}

        private void IsExternalComplain(object sender, ConditionalEventArgs e)
        {
            if (this.ComplainType.Equals(new Guid("96369687-0450-42fc-ba41-ad35ade13b53")))
                e.Result = false;
            else
                e.Result = true;
        }

        private void OnComplainAccepted_Invoked(object sender, ExternalDataEventArgs e)
		{
			ComplainAcceptedEventArgs args = (ComplainAcceptedEventArgs) e;
			ComplainDetailsRow row = (ComplainDetailsRow) args.UpdatedRows.Rows[0];
			IgrssAdapters.ComplainAdapter.UpdateComplainDetails(row.ComplaintType, row.AgainstEmpID, row.ComplainingEmpID, row.ComplainantName, row.ComplainantAddress, row.ComplaintDate, row.ReceivingOfficeId, row.Subject, row.Detail, row.ComplainId, row.ComplaintNo);
		}

		private void OnInvestigationRequired_Invoked(object sender, ExternalDataEventArgs e)
		{
            FeedbackData CurFeedback = AcceptanceList[0];

			InvestigationRequiredEventArgs args = (InvestigationRequiredEventArgs) e;
            Guid EmployeeId = (Guid) IgrssAdapters.EmployeeMaster.GetEmployeeIdByUsername(args.InvestigatingOfficer);
            IgrssAdapters.ComplainAdapter.AssignEnquiryOfficer(EmployeeId, DateTime.Now, ComplainId);
			string curUser = Thread.CurrentPrincipal.Identity.Name;

			string link = WorkflowLinks.Default.ComplainInvestigationResult;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", ComplainId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(ComplainId);
            Guid GroupId = Guid.NewGuid();
            WorkflowSupport.SendAlert(curUser, args.InvestigatingOfficer, link, "Complain Investigation Required for: " + FileNumber, InfoList,GroupId);

            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
		}

		private void OnNoInvestigationRequired_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

		private void OnAddInvestigationDetails_Invoked(object sender, ExternalDataEventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			AddInvestigationDetailsEventArgs args = (AddInvestigationDetailsEventArgs) e;
			IgrssAdapters.InvestigationAdapter.AddInvestigationDetail(Guid.NewGuid(), ComplainId, args.InvestigationDate, args.InvestigationDetails, curUser, DateTime.Now);
		}

		private void OnInvestigationDone_Invoked(object sender, ExternalDataEventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			InvestigationDoneEventArgs args = (InvestigationDoneEventArgs) e;
			IgrssAdapters.InvestigationAdapter.AddInvestigationDetail(Guid.NewGuid(), ComplainId, args.InvestigationDate, args.InvestigationDetails, curUser, DateTime.Now);

			// Investigation is Completed so alert the Officer who assigned the Investigation
			FeedbackData CurFeedback = AcceptanceList[0];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.ComplainInvestigationResult;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", ComplainId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
				CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Complain Investigation Complete...", InfoList,GroupId));
			}
		}

		private void OnReAssignInvestigation_Invoked(object sender, ExternalDataEventArgs e)
		{
			InvestigationRequiredEventArgs args = (InvestigationRequiredEventArgs) e;
            Guid EmployeeId = (Guid)IgrssAdapters.EmployeeMaster.GetEmployeeIdByUsername(args.InvestigatingOfficer);
            IgrssAdapters.ComplainAdapter.AssignEnquiryOfficer(EmployeeId, DateTime.Now, ComplainId);
            string curUser = Thread.CurrentPrincipal.Identity.Name;

			string link = WorkflowLinks.Default.ComplainInvestigationResult;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", ComplainId);
            Guid GroupId = Guid.NewGuid();
            WorkflowSupport.SendAlert(curUser, args.InvestigatingOfficer, link, "Complain Investigation Required!", InfoList,GroupId);
		}

		private void OnFileClosed_Invoked(object sender, ExternalDataEventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			// Complain File has been closed alert the Officer who accepted the Complain
			FeedbackData CurFeedback = AcceptanceList[0];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.ComplainInvestigationResult;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", ComplainId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
				CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Complain Investigation Complete...", InfoList,GroupId));
			}
		}

		private void AlertUser_ExecuteCode(object sender, System.EventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = AcceptanceList[0];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.AssignComplainInvestigator;
			    Dictionary<string, object> InfoList = new Dictionary<string, object>();
                InfoList.Add("FileId", ComplainId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(ComplainId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Complain Pending for: " + FileNumber, InfoList,GroupId));
			}
		}

		private void InitilizeInstance_ExecuteCode(object sender, System.EventArgs e)
		{
			XmlDocument WfInfo = new XmlDocument();
			IgrssAdapters.ComplainAdapter.UpdateWorkflowDetails(this.WorkflowInstanceId, WfInfo.OuterXml, ComplainId);

			// Load the Complain ProcessFlow for the current Office
			OfficeProcess_LKPTableAdapter adapter = new OfficeProcess_LKPTableAdapter();
			XmlDocument process = new XmlDocument();
			DataRow dr = adapter.GetProcessDetails(ComplainOffice, "COM").Rows[0];
			process.LoadXml((string) dr["Data"]);

			// Read and Assign the list of users who will accept the complain
            string filter = "Process/VerificationList/Item";
			XmlNodeList AcceptenceNodes = process.SelectNodes(filter);
			AcceptanceList = new List<FeedbackData>();
			foreach (XmlElement item in AcceptenceNodes)
			{
				OfficesCommunication_LKPTableAdapter comAdapter = new OfficesCommunication_LKPTableAdapter();
				DataTable dt = comAdapter.GetCommunicationOfficeByKey(ComplainOffice, item.Attributes["ForwardingOffice"].Value);
				if (dt.Rows.Count > 0)
				{
					AcceptanceList.Add(new FeedbackData(ComplainOffice, (Guid) dt.Rows[0]["CommunicatingOffice"], new Guid(item.Attributes["Role"].Value)));
				}
			}
        }
	}
}
