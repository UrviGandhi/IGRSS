using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_MLAandMinisterRegister : System.Web.UI.Page
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
        MultiviewMLA.SetActiveView(MultiviewMLA.Views[1]);
        FormView_MLA.ChangeMode(FormViewMode.Insert);
    }



    protected void FormView_MLA_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList dropDownOffice = FormView_MLA.FindControl("Drop_departmentname") as DropDownList;
        e.Values["DepartmentName"] = dropDownOffice.SelectedValue;
    }
    protected void ods_MLA_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_MLA.SelectMethod = "GetDataBy";
    }
    protected void FormView_MLA_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                MultiviewMLA.SetActiveView(GridView);
                GridView_MLA.DataBind();
                break;
        }
    }
}