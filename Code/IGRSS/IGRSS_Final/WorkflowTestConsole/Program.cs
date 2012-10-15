#region Using directives

using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Workflow.Runtime;
using System.Workflow.Runtime.Hosting;
using System.Collections;
using System.Workflow.Activities;
using IGRSS.Workflows.License;
using IGRSS.Workflows.Complain;
using IGRSS.Workflows.Complain.Services;
using IGRSS.BusinessLogicLayer;
using IGRSS.Workflows.Common;
using System.Xml;

#endregion

namespace WorkflowTestConsole
{
	class Program
	{
		static void Main(string[] args)
		{
			#region Comments
			//Console.WriteLine("Starting Runtime....");

			Complain com = new Complain();

			//Guid OfficeId = new Guid("c53112ee-5868-43aa-bcf5-52454f589daa");
			//Guid ComType = new Guid("c53112ee-5868-43aa-bcf5-52454f589daa");
			//Guid AgnstId = new Guid("ebc55557-0de8-4209-a561-04aa622cdf00");
			//Guid EmpId = new Guid("ebc55557-0de8-4209-a561-04aa622cdf00");

			//com.AddNewComplain("123", ComType, AgnstId, EmpId, "anand", "address", DateTime.Now, OfficeId, "Sub", "test");
			//Guid Id = new Guid(Console.ReadLine());
			//com.AssignEnquiryOfficer(EmpId, Id);
			//Console.ReadLine();
			//int i = 0;
			//while ("y" == Console.ReadLine())
			//{
			//    com.AddInvestigatonDetail(Id, DateTime.Now, "Detailed Report" + i++);
			//}
			//com.CompleteInvestigaton(Id, DateTime.Now, "Investigation Done!!!");
			//Console.WriteLine("Close File??");
			//if ("y"==Console.ReadLine())
			//{
			//    com.CloseComplainFile(Id);
			//}
			////using (WorkflowRuntime workflowRuntime = new WorkflowRuntime())
			////{
			////    AutoResetEvent waitHandle = new AutoResetEvent(false);
			////    workflowRuntime.WorkflowCompleted += delegate(object sender, WorkflowCompletedEventArgs e)
			////    {
			////        Console.WriteLine("Wf Complete.");
			////        waitHandle.Set();
			////    };
			////    workflowRuntime.WorkflowTerminated += delegate(object sender, WorkflowTerminatedEventArgs e)
			////    {
			////        Console.WriteLine("Wf Terminated!!!");
			////        Console.WriteLine(e.Exception.Message);
			////        waitHandle.Set();
			////    };

			////    Console.WriteLine("Adding Services...");
			////    ExternalDataExchangeService dataExchange;
			////    dataExchange = new ExternalDataExchangeService();
			////    workflowRuntime.AddService(dataExchange);

			////        ComplainService Service = new ComplainService();
			////    dataExchange.AddService(Service);

			////    Console.WriteLine("Services Added!");

			////    Dictionary<string, object> wfParams = new Dictionary<string, object>();

			////    wfParams.Add("InitiatingOffice", new Guid("916fd082-061a-45fb-91a4-33967243b4cf"));

			////    Console.WriteLine("Parameters Added..");
			////    ComplainProcess pro = new ComplainProcess();
			////    WorkflowInstance instance = workflowRuntime.CreateWorkflow(typeof(ComplainProcess));
			////    instance.Start();

			////    Console.WriteLine("Wf Started.");
			////    if ("Y" == Console.ReadLine())
			////    {
			////        Service.AcceptComplain(instance.InstanceId);
			////        //feedbackService.ApproveRequest(instance.InstanceId, new FeedbackEventArgs(instance.InstanceId, Guid.NewGuid(), Guid.NewGuid()));
			////    }

			////    if ("N" == Console.ReadLine())
			////    {
			////        //feedbackService.RejectRequest(instance.InstanceId, new FeedbackEventArgs(instance.InstanceId, Guid.NewGuid(), Guid.NewGuid()));
			////    }
			////    waitHandle.WaitOne();
			////}

			#endregion
			Console.ReadLine();
		}

		static void SendAlert()
		{
			Guid OfficeId = new Guid("c53112ee-5868-43aa-bcf5-52454f589daa");
			Guid RoleId = new Guid("7c83e591-a861-4b4f-bd1d-12f99cc32123");
			string[] usersToAlert = WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId);

			Dictionary<string, object> InfoList = new Dictionary<string, object>();
			InfoList.Add("item1", Guid.NewGuid());
			InfoList.Add("item2", Convert.ToInt32("568"));
			XmlDocument doc = new XmlDocument();
			doc = WorkflowSupport.SerilizeDictionary(InfoList);
			foreach (string user in usersToAlert)
			{
				WorkflowSupport.SendAlert("admin", user,"link", "Test Message", doc);
			}
			Dictionary<string, object> AlertsInfo = new Dictionary<string, object>();
			AlertsInfo = WorkflowSupport.DeSerilizeDictionary(doc);


		}
	}
}
