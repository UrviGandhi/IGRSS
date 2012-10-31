using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_VidhansabhaTarankitQuestionRegister : System.Web.UI.Page
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
        MultiviewTarankit.SetActiveView(MultiviewTarankit.Views[1]);
        FormView_Tarankit.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Tarankit_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_Tarankit = FormView_Tarankit.FindControl("Radio_tarankit") as RadioButtonList;
        e.Values["Tarankit_Atarnkit"] = Radio_Tarankit.SelectedValue;

        DropDownList Drop_mlaname = FormView_Tarankit.FindControl("Drop_mlaname") as DropDownList;
        e.Values["mlaName"] = Drop_mlaname.SelectedValue;
    }
    protected void FormView_Tarankit_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                MultiviewTarankit.SetActiveView(ViewGrid);
                GridView_Tarankit.DataBind();
               break;
        }
    }
    protected void ods_Tarankit_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Tarankit.SelectMethod = "GetDataBy";
        
    }
}