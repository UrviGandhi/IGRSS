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
using RefundApplicationRow = IGRSS.DataAccessLayer.Refund.RefundApplicationRow;
using IGRSS.Workflows.Refund.EventArgs;
using System.Transactions;

namespace IGRSS.Workflows.Refund
{
	public partial class RefundProcess: StateMachineWorkflowActivity
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

		public static DependencyProperty InitiatingOfficeProperty = DependencyProperty.Register("InitiatingOffice", typeof(Guid), typeof(RefundProcess));

		[Description("Office from where the instance is started")]
		[Category("Properties")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid InitiatingOffice
		{
			get
			{
				return ((Guid) (base.GetValue(RefundProcess.InitiatingOfficeProperty)));
			}
			set
			{
				base.SetValue(RefundProcess.InitiatingOfficeProperty, value);
			}
		}

		public static DependencyProperty RefundIdProperty = DependencyProperty.Register("RefundId", typeof(Guid), typeof(RefundProcess));

		[Description("Id of the Refund Application")]
		[Category("Refund")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid RefundId
		{
			get
			{
				return ((Guid) (base.GetValue(RefundProcess.RefundIdProperty)));
			}
			set
			{
				base.SetValue(RefundProcess.RefundIdProperty, value);
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
			string link = WorkflowLinks.Default.RefundVerification;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", RefundId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(RefundId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Refund Verification Pending for: " + FileNumber, InfoList,GroupId));
			}
		}

		private void ApprovalAlert_ExecuteCode(object sender, System.EventArgs e)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			FeedbackData CurFeedback = ApprovalList[approvalIndex];
			Guid OfficeId = CurFeedback.ForwardingOffice;
			Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			string link = WorkflowLinks.Default.RefundApproval;
			Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", RefundId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(RefundId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
			{
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Refund Approval Pending for: " + FileNumber, InfoList,GroupId));
			}
		}

		private void InitilizeFlow_ExecuteCode(object sender, System.EventArgs e)
		{
			// Update the Workflow details in RefundApplication Table
			XmlDocument WfInfo = new XmlDocument();
			IgrssAdapters.RefundApplicationAdapter.UpdateRefundWfDetails(this.WorkflowInstanceId, WfInfo.OuterXml,this.RefundId);
			
			VerificationList = new List<FeedbackData>();
			ApprovalList = new List<FeedbackData>();

			// Get the Process Flow for the current office
			OfficeProcess_LKPTableAdapter adapter = new OfficeProcess_LKPTableAdapter();
			XmlDocument process = new XmlDocument();
			DataRow dr = adapter.GetProcessDetails(InitiatingOffice, "REF").Rows[0];
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
			// Type cast the event args to the required type
			RefundApplicationUpdatedEventArgs args = (RefundApplicationUpdatedEventArgs) e;
			// Retrive the row to be updated (always the frist row i.e. Rows[0])
			RefundApplicationRow row = args.UpdatedRefundRows[0];
			//using (TransactionScope scope = new TransactionScope())
			{
				// Update the database row
                IgrssAdapters.RefundApplicationAdapter.UpdateRefundApplication1(this.RefundId, row.OfficeId, row.RegistrationNo,
                     row.TypeOfRefund, row.ApplicationDate, row.VendorLicenseId,
                    row.PurchasedDate, row.TotalValueOfStamps, row.ReasonForNotUsing, row.ApplicantName, row.ApplicantAddress,
                    row.City, row.District, row.PinCode, row.PhoneNo, row.Remarks, row.ActualStampValue);

				// Delete all the existing StampDetails for this Refund Application
				IgrssAdapters.RefundStampDetailsAdapter.DeleteRefundStampDetails(this.RefundId);
				// Re-Enter the Stamp Details
				foreach (DataRow StampDetail in args.StampDetails.Rows)
				{
					IgrssAdapters.RefundStampDetailsAdapter.InsertStampDetails(this.RefundId, (Guid) StampDetail["RevenueStampId"], (string) StampDetail["ReturnedQty"], (string) StampDetail["StampNumber"]);
				}

				// Delete all the existing Acts that were selected for this Refund Application
				IgrssAdapters.RefundActsApplicable.DeleteRefundOrders(this.RefundId);
				// Re-Enter the Acts that have been selected
				foreach (DataRow Act in args.ActsApplicable.Rows)
				{
					IgrssAdapters.RefundActsApplicable.InsertRefundActsApplicable(this.RefundId, (Guid) Act["ActId"], (bool) Act["Checked"], "");
				}
				//scope.Complete();
			}
			// The Application has been modified and will require verification  from all again
            FeedbackData CurFeedback = VerificationList[verificationIndex];
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
			this.verificationIndex = 0;
		}

		private void OnVerificationInvalid_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

		private void OnApproved_Invoked(object sender, ExternalDataEventArgs e)
		{
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

		private void OnRefundIssued_Invoked(object sender, ExternalDataEventArgs e)
		{

		}

		private void OnApplicationSaved_Invoked(object sender, ExternalDataEventArgs e)
		{

		}
	}

}
