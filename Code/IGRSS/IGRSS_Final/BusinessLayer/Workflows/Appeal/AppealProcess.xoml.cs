using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Drawing;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;
using IGRSS.Workflows.Common.Feedback;
using System.Collections.Generic;
using IGRSS.BusinessLogicLayer;
using IGRSS.Workflows.Common;
using System.Xml;
using IGRSS.BusinessObjects;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using System.Data;
using IGRSS.DataAccessLayer.OfficesMasterTableAdapters;
using IGRSS.Properties;
using System.Threading;

namespace IGRSS.Workflows.Appeal
{
	public partial class AppealProcess: StateMachineWorkflowActivity
	{
		#region Workflow Properties

		private List<FeedbackData> m_VerificationList;
		public List<FeedbackData> VerificationList
		{
			get
			{
				return m_VerificationList;
			}
			set
			{
				m_VerificationList = value;
			}
		}

		private List<FeedbackData> m_ApprovalList;
		public List<FeedbackData> ApprovalList
		{
			get
			{
				return m_ApprovalList;
			}
			set
			{
				m_ApprovalList = value;
			}
		}

		public static DependencyProperty InitiatingOfficeProperty = DependencyProperty.Register("InitiatingOffice", typeof(Guid), typeof(AppealProcess));

		[Description("Office from where the instance is started")]
		[Category("Properties")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid InitiatingOffice
		{
			get
			{
				return ((Guid) (base.GetValue(AppealProcess.InitiatingOfficeProperty)));
			}
			set
			{
				base.SetValue(AppealProcess.InitiatingOfficeProperty, value);
			}
		}

		public static DependencyProperty AppealIdProperty = DependencyProperty.Register("AppealId", typeof(Guid), typeof(AppealProcess));

		[Description("Id of the Appeal Application")]
		[Category("Appeal")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid AppealId
		{
			get
			{
				return ((Guid) (base.GetValue(AppealProcess.AppealIdProperty)));
			}
			set
			{
				base.SetValue(AppealProcess.AppealIdProperty, value);
			}
		}

		private int verificationIndex = 0;

		private int approvalIndex = 0;

		#endregion

		private void IsVerificationComplete(object sender, ConditionalEventArgs e)
		{
			if (verificationIndex < VerificationList.Count)
				e.Result = false;
			else
				e.Result = true;
		}

		private void IsApprovalComplete(object sender, ConditionalEventArgs e)
		{
			if (approvalIndex < ApprovalList.Count)
				e.Result = false;
			else
				e.Result = true;
		}

		private void VerificationAlert_ExecuteCode(object sender, System.EventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = VerificationList[verificationIndex];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.AppealVerification;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", AppealId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(AppealId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Appeal Verification Pending for: " + FileNumber, InfoList,GroupId));
			}
		}

		private void ApprovalAlert_ExecuteCode(object sender, System.EventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = ApprovalList[approvalIndex];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.AppealApproval;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", AppealId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(AppealId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Appeal Approval Pending for: " + FileNumber, InfoList,GroupId));
			}
		}

		private void InitilizeFlow_ExecuteCode(object sender, System.EventArgs e)
		{
			// Update the Workflow details in LicenseApplication Table
			XmlDocument WfInfo = new XmlDocument();
			//TODO: Update the Wf Info of Appeal Application
            IgrssAdapters.AppealAdapter.UpdateWfDetails(this.WorkflowInstanceId, WfInfo.OuterXml, AppealId);

			VerificationList = new List<FeedbackData>();
			ApprovalList = new List<FeedbackData>();

			// Get the Process Flow for the current office
			OfficeProcess_LKPTableAdapter adapter = new OfficeProcess_LKPTableAdapter();
			XmlDocument process = new XmlDocument();
			DataRow dr = adapter.GetProcessDetails(InitiatingOffice, "APL").Rows[0];
			process.LoadXml((string) dr["Data"]);

			// Read and Assign the verification process data to lists
			XmlNodeList VerificationItems = process.SelectNodes("Process/VerificationList/Item");
			foreach (XmlElement item in VerificationItems)
			{
				OfficesCommunication_LKPTableAdapter comAdapter = new OfficesCommunication_LKPTableAdapter();
				DataTable dt = comAdapter.GetCommunicationOfficeByKey(InitiatingOffice, item.Attributes["ForwardingOffice"].Value);
				if (dt.Rows.Count > 0)
				{
					VerificationList.Add(new FeedbackData(InitiatingOffice, (Guid) dt.Rows[0]["CommunicatingOffice"], new Guid(item.Attributes["Role"].Value)));
				}
			}

			// Read and Assign the approval process data to lists
			XmlNodeList ApprovalItems = process.SelectNodes("Process/ApprovalList/Item");
			foreach (XmlElement item in ApprovalItems)
			{
				OfficesCommunication_LKPTableAdapter comAdapter = new OfficesCommunication_LKPTableAdapter();
				DataTable dt = comAdapter.GetCommunicationOfficeByKey(InitiatingOffice, item.Attributes["ForwardingOffice"].Value);
				if (dt.Rows.Count > 0)
				{
					ApprovalList.Add(new FeedbackData(InitiatingOffice, (Guid) dt.Rows[0]["CommunicatingOffice"], new Guid(item.Attributes["Role"].Value)));
				}
			}
		}

		private void OnVerificationValid_Invoked(object sender, ExternalDataEventArgs e)
		{
			FeedbackEventArgs args = (FeedbackEventArgs) e;
			FeedbackData CurFeedback = VerificationList[verificationIndex];
			if (!CurFeedback.Alerts.Contains(args.AlertId))
			{
				throw new Exception("Alert " + args.AlertId + " is not expected at this state of Workflow");
			}
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
			this.verificationIndex++;
        }

		private void OnVerificationInvalid_Invoked(object sender, ExternalDataEventArgs e)
		{
			FeedbackEventArgs args = (FeedbackEventArgs) e;
			FeedbackData CurFeedback = VerificationList[verificationIndex];
			if (!CurFeedback.Alerts.Contains(args.AlertId))
			{
				throw new Exception("Alert " + args.AlertId + " is not expected at this state of Workflow");
			}
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
            this.verificationIndex = 0;
		}

		private void OnApproved_Invoked(object sender, ExternalDataEventArgs e)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.AppealAdapter.ApproveAppealApplication(this.AppealId, curUser, DateTime.Now);

			FeedbackEventArgs args = (FeedbackEventArgs) e;
			FeedbackData CurFeedback = ApprovalList[approvalIndex];
			if (!CurFeedback.Alerts.Contains(args.AlertId))
			{
				throw new Exception("Alert " + args.AlertId + " is not expected at this state of Workflow");
			}
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
			this.approvalIndex++;
		}

		private void OnRejected_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

		private void OnLicenseIssued_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

		private void OnApplicationSaved_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

        private void OnApplicationUpdated_Invoked(object sender, ExternalDataEventArgs e)
        {
            FeedbackData CurFeedback = VerificationList[verificationIndex];
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
            this.verificationIndex = 0;
        }
	}

}
