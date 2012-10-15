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
using System.Collections.Generic;
using System.Xml;
using System.Data;
using IGRSS.Workflows.Common;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using IGRSS.DataAccessLayer.OfficesMasterTableAdapters;
using IGRSS.Workflows.Common.Feedback;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using IGRSS.Properties;
using System.Threading;
using IGRSS.Workflows.License.EventArgs;
using LicenseApplicationRow = IGRSS.DataAccessLayer.LicenseApplication.LicenseApplicationRow;

namespace IGRSS.Workflows.License
{
	public partial class LicenseIssueProcess : StateMachineWorkflowActivity
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

		public static DependencyProperty InitiatingOfficeProperty = System.Workflow.ComponentModel.DependencyProperty.Register("InitiatingOffice", typeof(Guid), typeof(LicenseIssueProcess));

		[Description("Office from where the instance is started")]
		[Category("Properties")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid InitiatingOffice
		{
			get
			{
				return ((Guid) (base.GetValue(LicenseIssueProcess.InitiatingOfficeProperty)));
			}
			set
			{
				base.SetValue(LicenseIssueProcess.InitiatingOfficeProperty, value);
			}
		}

		public static DependencyProperty LicenseIdProperty = System.Workflow.ComponentModel.DependencyProperty.Register("LicenseId", typeof(Guid), typeof(LicenseIssueProcess));

		[Description("Id of the License Application")]
		[Category("License")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid LicenseId
		{
			get
			{
				return ((Guid) (base.GetValue(LicenseIssueProcess.LicenseIdProperty)));
			}
			set
			{
				base.SetValue(LicenseIssueProcess.LicenseIdProperty, value);
			}
		}

        public static DependencyProperty IsRenewProperty = System.Workflow.ComponentModel.DependencyProperty.Register("IsRenew", typeof(bool), typeof(LicenseIssueProcess));

        [Description("Indicate if the application is a renew application of not")]
        [Category("License")]
        [Browsable(true)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        public bool IsRenew
        {
            get
            {
                return ((bool)(base.GetValue(LicenseIssueProcess.IsRenewProperty)));
            }
            set
            {
                base.SetValue(LicenseIssueProcess.IsRenewProperty, value);
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
            
            if (IsRenew)
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
            string link = "";
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = VerificationList[verificationIndex];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
            bool IsFranking = FileManager.GetLicenseType(LicenseId);
            if (IsFranking == true)
            {
                link = WorkflowLinks.Default.FrankingMachineVerification;
            }
            else
            {
                link = WorkflowLinks.Default.LicenseVerification;

            }
			
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", LicenseId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(LicenseId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                if (IsFranking == true)
                {
                    CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Franking License Verification Pending for: " + FileNumber, InfoList,GroupId));
                }
                else
                {
                    CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "License Verification Pending for: " + FileNumber, InfoList,GroupId));
                }
                
			}
		}

		private void ApprovalAlert_ExecuteCode(object sender, System.EventArgs e)
		{
            string link = "";
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = ApprovalList[approvalIndex];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
            bool IsFranking = FileManager.GetLicenseType(LicenseId);
            if (IsFranking == true)
            {
                link = WorkflowLinks.Default.FrankingMachineApproval;
            }
            else
            {
                link = WorkflowLinks.Default.LicenseApproval;

            }
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", LicenseId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(LicenseId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                if (IsFranking == true)
                {
                    CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Franking License Approval Pending for: " + FileNumber, InfoList,GroupId));
                }
                else
                {
                    CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "License Approval Pending for: " + FileNumber, InfoList,GroupId));

                }
                
			}
		}

		private void InitilizeFlow_ExecuteCode(object sender, System.EventArgs e)
		{
			// Update the Workflow details in LicenseApplication Table
			XmlDocument WfInfo = new XmlDocument();
			IgrssAdapters.LAppTableAdapter.UpdateLicenseWfDetails(this.WorkflowInstanceId, WfInfo.OuterXml, LicenseId);

			VerificationList = new List<FeedbackData>();
			ApprovalList = new List<FeedbackData>();

			// Get the Process Flow for the current office
			OfficeProcess_LKPTableAdapter adapter = new OfficeProcess_LKPTableAdapter();
			XmlDocument process = new XmlDocument();
			DataRow dr = adapter.GetProcessDetails(InitiatingOffice, "LIC").Rows[0];
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

		private void OnApplicationUpdated_Invoked(object sender, ExternalDataEventArgs e)
		{
			ApplicationUpdatedEventArgs args = (ApplicationUpdatedEventArgs) e;
			LicenseApplicationRow row = args.UpdatedLicenseRows[0];
			IgrssAdapters.LAppTableAdapter.UpdateVendorDetails(row.ApplnNumber, row.NameOfApplicant, row.PresentAddress, row.PermanentAddress, row.DateOfBirth, DateTime.Now, row.Qualification, row.Experience, row.Caste, row.BusinessAddress, row.TotalInvestmentAmount, row.NameAndAddressOfReferer, row.SubmissionOfficeId, row.HomePhone, row.Remarks,row.HoldingAnyOtherLicense,row.PurposeOfLicense, this.LicenseId);
            FeedbackData CurFeedback = VerificationList[verificationIndex];
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
			this.verificationIndex = 0;
		}

		private void OnVerificationInvalid_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

        private void OnApproved_Invoked(object sender, ExternalDataEventArgs e)
        {
            FeedbackEventArgs args = (FeedbackEventArgs)e;
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
	}

}
