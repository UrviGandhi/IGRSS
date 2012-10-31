using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_HighCourtRegister : System.Web.UI.Page
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
        Multiview_HighCourtReg.SetActiveView(Multiview_HighCourtReg.Views[1]);
        FormView_HighCourtReg.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_HighCourtReg_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_parawisermrksent = FormView_HighCourtReg.FindControl("Radio_parawisermrksent") as RadioButtonList;
        e.Values["Parawiseremarks"] = Convert.ToBoolean(Radio_parawisermrksent.SelectedValue);

        RadioButtonList Radio_AffidavitSent = FormView_HighCourtReg.FindControl("Radio_affidavit") as RadioButtonList;
        e.Values["Affidavit"] = Convert.ToBoolean(Radio_AffidavitSent.SelectedValue);

        DropDownList dropdownofficename = FormView_HighCourtReg.FindControl("Drop_officename") as DropDownList;
        e.Values["DistrictOfficeName"] = dropdownofficename.SelectedValue;
    }
    protected void FormView_HighCourtReg_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_HighCourtReg.SetActiveView(ViewGrid);
                GridView_HighCourtReg.DataBind();
                break;      
        }
    }
    protected void ods_HighCourtReg_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_HighCourtReg.SelectMethod = "GetDataBy";
        
    }
}