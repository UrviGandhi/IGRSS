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

namespace IgrssWorkflowLibrary
{
	public partial class ValuationProcess : StateMachineWorkflowActivity
	{
		private void AlertValuation_ExecuteCode(object sender, EventArgs e)
		{
			System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
			conn.ConnectionString = @"Data Source=blrserver\sql2005;Initial Catalog=IGRSS_DEV;Persist Security Info=True;User ID=sa;Password=trans";

			System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("INSERT INTO [IGRSS_DEV].[dbo].[Alerts] ([Message] ,[SentOn] ,[SentBy] ,[SentTo]) VALUES ('ઊાેૂ!', '" + DateTime.Now + "', '" + System.Threading.Thread.CurrentPrincipal.Identity.Name  + "', '" + System.Threading.Thread.CurrentPrincipal.Identity.Name + "')", conn);

			int rowCount;

			try
			{
				if (conn.State == System.Data.ConnectionState.Closed)
				{
					conn.Open();
				}

				rowCount = cmd.ExecuteNonQuery();
			}
			finally
			{
				conn.Close();
			}
		}
	}

}
