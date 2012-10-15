using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.Reporting.WebForms;
using System.Collections.Generic;
public partial class Report_Report : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
/*		  // ReportViewer1.ServerReport.ReportPath =@"/IgrssReports/EmployeeMaster";
		  //ReportParameter[] rp = new ReportParameter[1];
		  //string s = (string) Session["Name"];
		  // rp[0] = new ReportParameter("OfficeName","SROGandhiNagar");
		  // ReportViewer1.ServerReport.SetParameters(rp);
		  // ReportViewer1.ServerReport.Refresh();
		  //"SROGandhiNagar");
		   ReportViewer1.ServerReport.ReportPath = @"/IgrssReports/AppealApplication";
          //ReportParameter[] rp = new ReportParameter[1];
          //string s = (string) Session["Name"];
          //rp[0] = new ReportParameter("VillageCode",(string)Session["as"]);
		  // rp[0] = new ReportParameter("VillageCode","1,15");
           //ReportParameter[] rp = new ReportParameter[2];
           //rp[0] =Session["Parameter"];
           // rp[1] =Session["Parameter"];
           ReportParameter rp = new ReportParameter();
           rp = (ReportParameter)Session["Parameter"];
             
           ReportViewer1.ServerReport.SetParameters(rp);
           ReportViewer1.ServerReport.Refresh();
        
		 //"SROGandhiNagar");
*/
        string ReportName = (string)Session["ReportName"];
        Dictionary<string, string> reportParams = (Dictionary<string, string>)Session["ReportParams"];
        List<ReportParameter> parameters = new List<ReportParameter>();

        foreach (KeyValuePair<string, string> parameter in reportParams)
        {
            parameters.Add(new ReportParameter((string)parameter.Key, (string)parameter.Value));
        }


        ReportViewer1.ServerReport.ReportPath = @"/Igrss Reports/" + ReportName;

        ReportViewer1.ServerReport.SetParameters(parameters);
        ReportViewer1.ServerReport.Refresh();
		
		
	}
}
