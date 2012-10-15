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
using IGRSS.Workflows.Activites.Feedback.Events;

namespace IGRSS.Workflows.Activites.Feedback
{
	public partial class FeedbackActivity : SequenceActivity
	{
		public FeedbackEventArgs VerificationEventArgs = default(FeedbackEventArgs);

		#region VerificationPassedEvent
		public static DependencyProperty VerificationPassedEvent = DependencyProperty.Register("VerificationPassed", typeof(EventHandler), typeof(FeedbackActivity));

		[Description("Verification has Passed")]
		[Category("Verification")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public event EventHandler VerificationPassed
		{
			add
			{
				base.AddHandler(FeedbackActivity.VerificationPassedEvent, value);
			}
			remove
			{
				base.RemoveHandler(FeedbackActivity.VerificationPassedEvent, value);
			}
		}

		#endregion

		#region VerificationFailedEvent
		public static DependencyProperty VerificationFailedEvent = DependencyProperty.Register("VerificationFailed", typeof(EventHandler), typeof(FeedbackActivity));

		[Description("The Verification has failed")]
		[Category("Verification")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public event EventHandler VerificationFailed
		{
			add
			{
				base.AddHandler(FeedbackActivity.VerificationFailedEvent, value);
			}
			remove
			{
				base.RemoveHandler(FeedbackActivity.VerificationFailedEvent, value);
			}
		}

		#endregion

		#region VerifiedProperty
		public static DependencyProperty VerifiedProperty = System.Workflow.ComponentModel.DependencyProperty.Register("Verified", typeof(bool), typeof(FeedbackActivity));

		[Description("Indicates if the Verification has passed or not")]
		[Category("Verification")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public bool Verified
		{
			get
			{
				return ((bool) (base.GetValue(FeedbackActivity.VerifiedProperty)));
			}
			set
			{
				base.SetValue(FeedbackActivity.VerifiedProperty, value);
			}
		}

		#endregion

		#region AssignedToProperty
		public static DependencyProperty AssignedToProperty = System.Workflow.ComponentModel.DependencyProperty.Register("AssignedTo", typeof(Guid), typeof(FeedbackActivity));

		[Description("Indicates to whome the verification task is assigned to.")]
		[Category("Verification")]
		[Browsable(true)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public Guid AssignedTo
		{
			get
			{
				return ((Guid) (base.GetValue(FeedbackActivity.AssignedToProperty)));
			}
			set
			{
				base.SetValue(FeedbackActivity.AssignedToProperty, value);
			}
		}

		#endregion

		private void AlertUser_ExecuteCode(object sender, EventArgs e)
		{
			Console.WriteLine(e.GetType().ToString());
			Console.WriteLine("Sending Alert to " + this.AssignedTo);

		}

		private void TimeoutActivity_ExecuteCode(object sender, EventArgs e)
		{
			this.Verified = false;
			Console.WriteLine("Verification Timeout!");
		}

	}
}
