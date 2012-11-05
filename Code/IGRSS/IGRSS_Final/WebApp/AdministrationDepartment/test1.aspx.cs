using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_test1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_clickme_Click(object sender, EventArgs e)
    {
        Multiview_table1.SetActiveView(Multiview_table1.Views[1]);
        formt1.ChangeMode(FormViewMode.Insert);
        
    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void formt1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}