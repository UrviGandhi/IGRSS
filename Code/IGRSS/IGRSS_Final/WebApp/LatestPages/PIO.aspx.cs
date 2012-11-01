using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_PIO : System.Web.UI.Page
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
        Multiview_PIO.SetActiveView(Multiview_PIO.Views[1]);
        FormView_PIO.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_PIO_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_BPL = FormView_PIO.FindControl("Radio_applbpl") as RadioButtonList;
        e.Values["Appl_BPL"] = Convert.ToBoolean(Radio_BPL.SelectedValue);

        RadioButtonList Radio_information = FormView_PIO.FindControl("Radio_information") as RadioButtonList;
        e.Values["Information"] = Radio_information.SelectedValue;

        DropDownList Drop_FeeMode = FormView_PIO.FindControl("Drop_recvdfessmode") as DropDownList;
        e.Values["Recvd_Fees_Mode"] = Drop_FeeMode.SelectedValue;

        RadioButtonList Radio_InfoSend = FormView_PIO.FindControl("Radio_informationsend") as RadioButtonList ;
        e.Values["Info_Send"] = Convert.ToBoolean(Radio_InfoSend.SelectedValue);
    }
    protected void FormView_PIO_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_PIO.SetActiveView(ViewGrid);
                GridView_PIO.DataBind();
                break;            
        }
    }
    protected void ods_PIO_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_PIO.SelectMethod = "GetDataBy";
    }
}