using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CCRALegal_SunavniRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_SunavniRegister.SetActiveView(Multiview_SunavniRegister.Views[1]);
        FormView_SunavniRegister.ChangeMode(FormViewMode.Insert);
    }

    protected void FormView_SunavniRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList_AppealNo = FormView_SunavniRegister.FindControl("DropDownList_AppealNo") as DropDownList;
        e.Values["AppealNo"] = DropDownList_AppealNo.SelectedValue;

        DropDownList DropDownList_Versus = FormView_SunavniRegister.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Versus"] = DropDownList_Versus.SelectedValue;
    }
    protected void FormView_SunavniRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_SunavniRegister.SetActiveView(ViewGrid);
                GridView_SunavniRegister.DataBind();
                break;
        }
    }
    protected void ods_SunavniRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_SunavniRegister.SelectMethod = "GetDataBy";
    }
}