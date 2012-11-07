using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_VigilanceRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Vigilance.SetActiveView(Multiview_Vigilance.Views[1]);
        FormView_Vigilance.ChangeMode(FormViewMode.Insert);
    }
    protected void applsummaryTextBox_TextChanged(object sender, EventArgs e)
    {

    }
}