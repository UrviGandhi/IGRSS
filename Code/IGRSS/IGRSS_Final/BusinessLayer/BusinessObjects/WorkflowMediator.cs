using System;
using System.Collections.Generic;
using System.Text;
using System.Workflow.Runtime.Hosting;
using System.Workflow.Runtime;
using System.Collections.ObjectModel;
using System.Workflow.Activities;

namespace IGRSS.BusinessObjects.WorkflowServices
{
	public class WorkflowMediator
	{
		#region Constructors

		public WorkflowMediator()
		{
			Runtime = new WorkflowRuntime();
			Runtime.WorkflowAborted += new EventHandler<WorkflowEventArgs>(Runtime_WorkflowAborted);
			Runtime.WorkflowCompleted += new EventHandler<WorkflowCompletedEventArgs>(Runtime_WorkflowCompleted);
			Runtime.WorkflowTerminated += new EventHandler<WorkflowTerminatedEventArgs>(Runtime_WorkflowTerminated);
			Runtime.WorkflowIdled += new EventHandler<WorkflowEventArgs>(Runtime_WorkflowIdled);

			AddServices();

			Runtime.StartRuntime();
		}

		#endregion

		#region Private Methods

		void Runtime_WorkflowTerminated(object sender, WorkflowTerminatedEventArgs e)
		{
			CurrentResultsInContext =
				WorkflowResults.CreateTerminatedWorkflowResults(e);
		}

		void Runtime_WorkflowCompleted(object sender, WorkflowCompletedEventArgs e)
		{
			CurrentResultsInContext =
				WorkflowResults.CreateCompletedWorkflowResults(e);
		}

		void Runtime_WorkflowAborted(object sender, WorkflowEventArgs e)
		{
			//CurrentResultsInContext = WorkflowResults.CreateAbortedWorkflowResults(e);
		}

		void Runtime_WorkflowIdled(object sender, WorkflowEventArgs e)
		{
			CurrentResultsInContext = WorkflowResults.CreateRunningWorkflowResults(e);
		}

		#endregion

		#region Methods
		public WorkflowResults RunWorkflow(Type workflowType)
		{
			Check.ArgumentIsNotNull(workflowType, "workflowType");

			WorkflowInstance instance =
				Runtime.CreateWorkflow(workflowType);
			instance.Start();

			bool result = WorkflowScheduler.RunWorkflow(instance.InstanceId);
			Check.IsTrue(result, "Could not run workflow "
								+ instance.InstanceId);

			return CurrentResultsInContext;
		}

		public WorkflowResults RunWorkflow(Guid instanceId)
		{
			Check.IsNotTrue(instanceId == Guid.Empty, "Invalid Workflow Instance ID");

			WorkflowInstance instance = Runtime.GetWorkflow(instanceId);
			Check.IsNotNull(instance, "Could not retrieve workflow");

			bool result = WorkflowScheduler.RunWorkflow(instance.InstanceId);
			Check.IsTrue(result, "Could not run workflow "
								+ instance.InstanceId);

			return CurrentResultsInContext;
		}

		private ManualWorkflowSchedulerService m_WorkflowScheduler;
		public ManualWorkflowSchedulerService WorkflowScheduler
		{
			get
			{
				return Runtime.GetService
							<ManualWorkflowSchedulerService>();
			}
		}

		public ReadOnlyCollection<string> GetStateMachineTransitions(Guid instanceID)
		{
			Check.ArgumentIsNotNull(instanceID, "instanceID");
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

		protected virtual void AddServices()
		{
			ExternalDataExchangeService dataService = new ExternalDataExchangeService();
			Runtime.AddService(dataService);

			//OrderService orderService = OrderService.Instance;
			//dataService.AddService(orderService);

			//OrderTransactionService txnService = new OrderTransactionService();
			//Runtime.AddService(txnService);

			//ContextService = new HttpContextWrapper();
		}

		#endregion

		#region Properties

		private WorkflowRuntime m_Runtime;
		protected WorkflowRuntime Runtime
		{
			get
			{
				return m_Runtime;
			}
			set
			{
				m_Runtime = value;
			}
		}

		private WorkflowMediator m_Instance;
		public WorkflowMediator Instance
		{
			get
			{
				return m_Instance;
			}
		}

		//private IContextService m_ContextService;
		//public IContextService ContextService
		//{
		//    get
		//    {
		//        return m_ContextService;
		//    }
		//    set
		//    {
		//        m_ContextService = value;
		//    }
		//}

		private WorkflowResults m_CurrentResultsInContext;
		public WorkflowResults CurrentResultsInContext
		{
			get
			{
				return ContextService.Items[_contextKey] as WorkflowResults;
			}
			set
			{
				if (ContextService.Items.Contains(_contextKey))
				{
					ContextService.Items[_contextKey] = value;
				}
				else
				{
					ContextService.Items.Add(_contextKey, value);
				}
			}
		}


		#endregion

		private readonly string contextKey = "__WorkflowMediatorResults__";

	}
}
