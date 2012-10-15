using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Runtime.Hosting;
using System.Workflow.Runtime;
using System.Collections.ObjectModel;
using System.Workflow.Activities;
using IGRSS.BusinessObjects.WorkflowServices.Context;
using System.Threading;
using IGRSS.Workflows.Complain.Services;
using IGRSS.Workflows.License.Services;
using System.Configuration;
using IGRSS.Properties;
using IGRSS.Workflows.Refund.Services;
using IGRSS.Workflows.Appeal.Services;
using System.Workflow.Runtime.Tracking;
using IGRSS.Workflows.Adjudication.Services;

namespace IGRSS.BusinessObjects.WorkflowServices
{
	public static class WorkflowMediator
	{
		#region Properties
		private static ExternalDataExchangeService DataService = new ExternalDataExchangeService();

		#endregion
		private static WorkflowRuntime Runtime;
		private static void InitilizeRuntime()
		{
			if (null == Runtime)
			{
				Runtime = new WorkflowRuntime();
				Runtime.WorkflowAborted += new EventHandler<WorkflowEventArgs>(Runtime_WorkflowAborted);
				Runtime.WorkflowCompleted += new EventHandler<WorkflowCompletedEventArgs>(Runtime_WorkflowCompleted);
				Runtime.WorkflowTerminated += new EventHandler<WorkflowTerminatedEventArgs>(Runtime_WorkflowTerminated);
				Runtime.WorkflowIdled += new EventHandler<WorkflowEventArgs>(Runtime_WorkflowIdled);

				AddServices();

				Runtime.StartRuntime();
			}
		}

		static WorkflowMediator()
		{
			InitilizeRuntime();
		}

		#region Private Methods

		static void Runtime_WorkflowTerminated(object sender, WorkflowTerminatedEventArgs e)
		{
			//CurrentResultsInContext =
			//    WorkflowResults.CreateTerminatedWorkflowResults(e);
		}

		static void Runtime_WorkflowCompleted(object sender, WorkflowCompletedEventArgs e)
		{
			//CurrentResultsInContext =
			//    WorkflowResults.CreateCompletedWorkflowResults(e);
		}

		static void Runtime_WorkflowAborted(object sender, WorkflowEventArgs e)
		{
			//CurrentResultsInContext = WorkflowResults.CreateAbortedWorkflowResults(e);
		}

		static void Runtime_WorkflowIdled(object sender, WorkflowEventArgs e)
		{
			//CurrentResultsInContext = WorkflowResults.CreateRunningWorkflowResults(e);
		}

		#endregion

		public static WorkflowResults RunWorkflow(Type workflowType)
		{
			return RunWorkflow(workflowType, null);
		}

		public static WorkflowResults RunWorkflow(Type workflowType, Dictionary<string, object> workflowParameters)
		{
			//Check.ArgumentIsNotNull(workflowType, "workflowType");
			InitilizeRuntime();
			WorkflowInstance Instance;
			WorkflowResults Results = new WorkflowResults();
			try
			{
				Instance = Runtime.CreateWorkflow(workflowType, workflowParameters);
				Results.InstanceId = Instance.InstanceId;
				Instance.Start();
			}
			catch (Exception ex)
			{
				Results.Exception = ex;
			}

			return Results;
		}

		//public static Guid RunWorkflow(Guid instanceId)
		//{
		//    //Check.IsNotTrue(instanceId == Guid.Empty, "Invalid Workflow Instance ID");
		//    InitilizeRuntime();

		//    WorkflowInstance instance = Runtime.GetWorkflow(instanceId);
		//    //Check.IsNotNull(instance, "Could not retrieve workflow");

		//bool result = WorkflowScheduler.RunWorkflow(instance.InstanceId);
		//    //Check.IsTrue(result, "Could not run workflow "
		//    //                    + instance.InstanceId);

		//    return CurrentResultsInContext;
		//}

		public static ReadOnlyCollection<string> GetStateMachineTransitions(Guid instanceID)
		{
			//Check.ArgumentIsNotNull(instanceID, "instanceID");
			InitilizeRuntime();
			ReadOnlyCollection<string> result = null;
			StateMachineWorkflowInstance instance = null;

			try
			{
				instance = new StateMachineWorkflowInstance(Runtime, instanceID);
			}
			catch (InvalidOperationException)
			{
				// the workflow wasnt in the persistence store
				// so we can assume it isn't running
			}

			if (instance != null)
			{
				result = instance.PossibleStateTransitions;
			}
			else
			{
				result = new List<string>().AsReadOnly();
			}

			return result;
		}

		public static string GetWorkflowState(Guid instanceID)
		{
			//Check.ArgumentIsNotNull(instanceID, "instanceID");
			InitilizeRuntime();
			string result;
			StateMachineWorkflowInstance instance = null;

			try
			{
				instance = new StateMachineWorkflowInstance(Runtime, instanceID);
			}
			catch (InvalidOperationException)
			{
				// the workflow wasnt in the persistence store
				// so we can assume it isn't running
			}

			if (instance != null)
			{
				result = instance.CurrentStateName;
			}
			else
			{
				result = string.Empty;
			}

			return result;
		}

		private static void AddServices()
		{
			#region Basic Workflow Services

			// Add the SqlWorkflowPersistenceService to the runtime engine.
			SqlWorkflowPersistenceService PersistService = new SqlWorkflowPersistenceService(Settings.Default.AppConnectionString);
			Runtime.AddService(PersistService);

			//SqlTrackingService TrackingService = new SqlTrackingService(Settings.Default.AppConnectionString);
			//Runtime.AddService(TrackingService);

			// Add ExternalDataExchangeService to communicate with any running Workflow
			ExternalDataExchangeService DataExchangeService = new ExternalDataExchangeService();
			Runtime.AddService(DataExchangeService);

			#endregion


			#region Igrss Business Services
			
			ComplainServices = new ComplainService();
			DataExchangeService.AddService(ComplainServices);

			LicenseApplicationServices = new LicenseApplicationService();
			DataExchangeService.AddService(LicenseApplicationServices);

            AppealServices = new AppealService();
            DataExchangeService.AddService(AppealServices);

            RefundServices = new RefundService();
            DataExchangeService.AddService(RefundServices);

			AdjudicationServices = new AdjudicationService();
			DataExchangeService.AddService(AdjudicationServices);

            #endregion
			
			//ComplainService complainService = new ComplainService();
			//DataService.AddService(complainService);

			//OrderService orderService = OrderService.Instance;
			//dataService.AddService(orderService);

			//OrderTransactionService txnService = new OrderTransactionService();
			//Runtime.AddService(txnService);

			//ContextService = new HttpContextWrapper();
		}

		#region Available Services

		static private ComplainService m_ComplainServices;
		static public ComplainService ComplainServices
		{
			get
			{
				return m_ComplainServices;
			}
			private set
			{
				m_ComplainServices = value;
			}
		}

		static private LicenseApplicationService m_LicenseApplicationServices;
		static public LicenseApplicationService LicenseApplicationServices
		{
			get
			{
				return m_LicenseApplicationServices;
			}
			private set
			{
				m_LicenseApplicationServices = value;
			}
		}

		static private RefundService m_RefundServices;
		/// <summary>
		/// This property refers to the Refund Services
		/// </summary>
		static public RefundService RefundServices
		{
			get
			{
				return m_RefundServices;
			}
			private set
			{
				m_RefundServices = value;
			}
		}

		static private AppealService m_AppealServices;
		/// <summary>
		/// This property refers to the Appeal Service
		/// </summary>
		static public AppealService AppealServices
		{
			get
			{
				return m_AppealServices;
			}
			private set
			{
				m_AppealServices = value;
			}
		}
	 
		static private AdjudicationService m_AdjudicationServices;
		/// <summary>
		/// This property refers to the Adjudication Service
		/// </summary>
		static public AdjudicationService AdjudicationServices
		{
			get
			{
				return m_AdjudicationServices;
			}
			private set
			{
				m_AdjudicationServices = value;
			}
		}
	 

		#endregion
	}
}
