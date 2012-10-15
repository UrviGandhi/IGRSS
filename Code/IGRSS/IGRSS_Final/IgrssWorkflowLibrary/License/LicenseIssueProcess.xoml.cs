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
using IGRSS.Workflows.Activites.Feedback;
using System.Collections.Generic;

namespace IGRSS.Workflows.License
{
	public partial class LicenseIssueProcess: StateMachineWorkflowActivity
	{
		#region Workflow Properties

		public static DependencyProperty VerificationListProperty = System.Workflow.ComponentModel.DependencyProperty.Register("VerificationList", typeof(IList<FeedbackData>), typeof(LicenseIssueProcess));

		[Description("List for Verification")]
		[Category("Properties")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public IList<FeedbackData> VerificationList
		{
			get
			{
				return ((IList<FeedbackData>) (base.GetValue(LicenseIssueProcess.VerificationListProperty)));
			}
			set
			{
				base.SetValue(LicenseIssueProcess.VerificationListProperty, value);
			}
		}

		public static DependencyProperty ApprovalListProperty = System.Workflow.ComponentModel.DependencyProperty.Register("ApprovalList", typeof(IList<FeedbackData>), typeof(LicenseIssueProcess));

		[Description("List for Approval")]
		[Category("Properties")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public IList<FeedbackData> ApprovalList
		{
			get
			{
				return ((IList<FeedbackData>) (base.GetValue(LicenseIssueProcess.ApprovalListProperty)));
			}
			set
			{
				base.SetValue(LicenseIssueProcess.ApprovalListProperty, value);
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

		private int verificationIndex = -1;

		private int approvalIndex = -1;

		#endregion

		private void IsVerificationComplete(object sender, ConditionalEventArgs e)
		{
			if (verificationIndex <= VerificationList.Count)
				e.Result = true;
			else
				e.Result = false;
		}
		
		private void IsApprovalComplete(object sender, ConditionalEventArgs e)
		{
			if (approvalIndex <= ApprovalList.Count)
				e.Result = true;
			else
				e.Result = false;
		}

		private void VerificationAlert_ExecuteCode(object sender, EventArgs e)
		{
			//Guid OfficeId = VerificationList[verificationIndex].ForwardingOffice;
			//Guid RoleId = new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			//foreach (Guid AlertUser in new OfficeManagement().GetUsersAtOfficeRole(OfficeId, RoleId))
			//{
			//    WorkflowSupport.SendAlert(AlertUser, "Verification Pending...");
			//}
		}

		private void ApprovalAlert_ExecuteCode(object sender, EventArgs e)
		{
			//Guid OfficeId = VerificationList[verificationIndex].ForwardingOffice;
			//Guid RoleId = new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
			//foreach (Guid AlertUser in new OfficeManagement().GetUsersAtOfficeRole(OfficeId, RoleId))
			//{
			//    WorkflowSupport.SendAlert(AlertUser, "Approval Pending...");
			//}
		}

		private void InitilizeFlow_ExecuteCode(object sender, EventArgs e)
		{

		}
	}

}
