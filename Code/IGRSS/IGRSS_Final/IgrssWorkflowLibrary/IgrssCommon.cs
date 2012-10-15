using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections.Generic;
using System.Collections;
using System.Xml.Serialization;
using System.IO;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Runtime.Hosting;
using System.Xml;
using System.Text;
using IGRSS.Workflows.Events;
using IGRSS.Workflows;
/// <summary>
/// Summary description for IgrssCommon
/// </summary>
public static class IgrssCommon
{
	public static WorkflowRuntime runtime;
	public static Dictionary<string, StateMachineWorkflowInstance> stateMachineInstances = new Dictionary<string, StateMachineWorkflowInstance>();
	public static ExternalDataExchangeService dataExchangeService = new ExternalDataExchangeService();
	public static Guid lastWf;
	//public static IgrssWorkflowLibrary.WorkflowEvents.ValuationEvent valuationEvents = new IgrssWorkflowLibrary.WorkflowEvents.Valuation.ValuationEvent();
	public static ValuationProcessEvents ValuationEvents = new ValuationProcessEvents();
	public static Guid StartWorkflow()
	{
		// Get a reference to the System.Type for the OrderWorkflows.Workflow1
		Type workflowType = typeof(IgrssWorkflowLibrary.ValuationProcess);

		if (workflowType == null)
			return Guid.Empty;

		WorkflowInstance instance = runtime.CreateWorkflow(workflowType);

		StateMachineWorkflowInstance stateMachineInstance = new StateMachineWorkflowInstance(runtime, instance.InstanceId);

		instance.Start();
		// Add the StateMachineInstance object for our Workflow to our dictionary
		stateMachineInstances.Add(instance.InstanceId.ToString(), stateMachineInstance);
		lastWf = instance.InstanceId;

		// Return the WorkflowInstanceId
		return lastWf;
	}

	public static void StartWorkflowRuntime()
	{
		// Create a new Workflow Runtime for this application
		runtime = new WorkflowRuntime();

		// Create EventHandlers for the WorkflowRuntime
		//runtime.WorkflowTerminated += new EventHandler<WorkflowTerminatedEventArgs>(Runtime_WorkflowTerminated);
		//runtime.WorkflowCompleted += new EventHandler<WorkflowCompletedEventArgs>(Runtime_WorkflowCompleted);
		//runtime.WorkflowIdled += new EventHandler<WorkflowEventArgs>(Runtime_WorkflowIdled);
		// Add the External Data Exchange Service
		ExternalDataExchangeService dataExchangeService = new ExternalDataExchangeService();
		runtime.AddService(dataExchangeService);

		// Add a new instance of the OrderService to the External Data Exchange Service
		ValuationEvents = new ValuationProcessEvents();
		dataExchangeService.AddService(ValuationEvents);
		// Add Persistance service to the runtime
		SqlWorkflowPersistenceService sqlPersistenceService = new SqlWorkflowPersistenceService("Data Source=blrserver\\sql2005;Initial Catalog=IGRSS_EF;User ID=sa;Password=trans");
		runtime.AddService(sqlPersistenceService);

		// Start the Workflow services
		runtime.StartRuntime();
	}

	public static void AddService(object serviceName)
	{
		dataExchangeService.AddService(serviceName);

	}

	//public static string SerializeObject(object obj)
	//{
	//    XmlSerializer ObjSerializer = new XmlSerializer(obj.GetType);
	//    MemoryStream ms = new MemoryStream();
	//    ObjSerializer.Serialize(ms, obj);
	//    ms.SetLength(0);
	//    XmlDocument doc = new XmlDocument();
	//    StringBuilder sb = new StringBuilder();
	//    string str = new String(ms.ToArray());
	//}

}
