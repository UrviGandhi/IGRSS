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
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using Resources;


public partial class Inward_Outward_Inward1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        { 
          
            
        }
    }

    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvInward.SetActiveView(mvInward.Views[1]);
        //FvInward.ChangeMode(FormViewMode.Insert);
        //((Label)FvInward.Row.FindControl("lblguid")).Text = "11111111-1111-1111-1111-111111112311";
        //((Label)FvInward.Row.FindControl("lblDocType")).Text = "11111111-1111-1111-1111-111111111111";
        // ((Label)FvInward.Row.FindControl("lblReceivingID")).Text = "11111111-1111-1111-1111-111111111111";
        
       
    
    }

    //protected void objectDataSource1_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    //{
    //    FormViewParameter Parameters = new FormViewParameter();
    //    Parameters.Values = (DataRow)e.InputParameters["Values"];
    //    e.InputParameters["Parameter"] = Parameters;
    //    e.InputParameters.Remove("Values");
    //}

   
}